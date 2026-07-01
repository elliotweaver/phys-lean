# THE GATE ARCHITECTURE — two gates, one guarantee

*Read with docs/STANDARD.md (what a node must satisfy) and docs/RUNBOOK.md (how a node is
built). This file explains HOW verification is run so it scales without sacrificing correctness.
The scripts are the source of truth; this doc explains their intent.*

---

## The problem this solves

The original single gate (`scripts/gate.sh`) re-verifies the ENTIRE frozen history every node:
D5 runs every costume (`lake env lean` on each `Counterexamples/*.lean`), D6 `#print axioms` on
every banked theorem. Both grow linearly with the chain. By ~260 nodes the costume battery alone
was ~15 min and the worker was **block-waiting** on it against `--max-runtime`, causing
requeue storms. The cost re-checks immutable, already-banked modules on every single node.

## The insight that makes it safe to split

The chain is a **strict append-only DAG**. A normal node ADDS one new `Phys/**.lean` leaf module
+ one new `Counterexamples/*WrongValueCostume.lean`, and APPENDS to `Phys.lean`,
`Audits/AxiomAudit.lean`, and `scripts/costume_manifest.tsv`. **It never MODIFIES a banked
module.** Therefore, for a normal leaf commit, the ONLY things that can NEWLY fail are the new
module's own decls and its own costume — everything else is *provably unchanged*.

That proof rests on ONE assumption: **everything that could affect verification is visible in the
git diff.** The two-gate design is built entirely around that assumption and its residual.

---

## The two gates

### FAST GATE — `scripts/gate-fast.sh` (blocking; banks the node; ~1 min)
The worker runs this to bank a node. For an append-only leaf it is **provably equivalent to the
full battery for that commit**:

- **D0–D3** — the FULL greps (zero-axiom / no-sorry / no-native_decide / **NO-BRIDGE**). Instant.
  **Never trimmed** — these are the exact checks whose absence let the predecessor repo
  accumulate ~38 invisible bridges. They always run over the whole tree.
- **D4** — `lake build Phys` (native-incremental; only the new leaf actually compiles).
- **D5-fast** — runs ONLY the costume(s) newly ADDED in the diff (looked up in the manifest by
  exact path). A new costume with no manifest row is a FAILURE.
- **D6-fast** — runs EXACTLY the `#print axioms` lines this commit APPENDED to
  `Audits/AxiomAudit.lean` (the import + the new decls, `def`s AND theorems). This is drift-free:
  it audits precisely what the full D6 audits for the new module, because those appended lines ARE
  the canonical audit. A new module with no appended audit lines is a FAILURE (unaudited bank).

**Diff base** = parent of the most-recent `Phys/**.lean`-touching commit (auto-detected, so it
spans the production commit no matter how many docs/child commits follow). Override:
`GATE_DIFF_BASE`.

### FROZEN-TOUCH ESCALATION (inside the fast gate; mechanical, git-driven)
The fast path is equivalent to full ONLY for pure append-only commits. If the diff:
- **MODIFIES/DELETES/RENAMES** an existing `Phys/**.lean` module (status M/D/R, not A), OR
- changes `lean-toolchain`, `lake-manifest.json`, or any `scripts/gate*.sh` / `run_costumes.sh`,

…then fast is NOT equivalent, and `gate-fast.sh` `exec`s the canonical FULL building gate
(`scripts/gate.sh`) for that commit. This is safe in the worker's own single-flight turn (no other
build running). Appends to `Phys.lean` / `AxiomAudit.lean` / manifest are the NORMAL per-node
append points and do NOT trigger escalation.

### FULL BATTERY — `scripts/gate-full.sh` (read-only; the frozen-history re-verifier; ~18 min)
The complete battery (D0–D3 + every costume + full axiom audit) with ONE deliberate omission: it
does **NOT** run `lake build`. It reads the CURRENTLY-BUILT oleans only. That makes it **safe to
run concurrently with an active worker** (no write into `.lake/build` → no W4 concurrent-compile
corruption; CPU contention only, so it runs at reduced `COSTUME_JOBS`). Pure verifier: never edits
the repo, never commits, never touches the board.

---

## When the full battery runs — the coverage argument

The full battery's whole job is to catch what is **invisible to the fast gate's diff assumption**.
There are exactly these residuals, and each maps to a trigger:

| Residual (what could slip past fast) | git-visible? | Caught by |
|---|---|---|
| Fast gate scoped itself wrong (checker bug) | no | 3-hourly full battery |
| Toolchain / Mathlib bump | **yes** | fast-gate escalation → full (blocks that commit) |
| Edit to a shared/foundation module | **yes** | fast-gate escalation → full (blocks that commit) |
| Env drift with NO commit (elan default moved, out-of-band `lake update`, partial cache evict) | no | 3-hourly full battery |
| Olean **cache-rot** / stale-but-green oleans | no (invisible even to full battery) | MANAGER clean-rebuild gold-master |

So:

- **Every git-visible history risk** is caught **synchronously, before the commit banks**, by the
  fast-gate escalation. We pay the full cost exactly on the commits where fast isn't equivalent.
- **Every non-git-visible risk except cache-rot** is caught by the **3-hourly timed full battery**
  (`scripts/gate-watchdog.sh timed`, via cron). Time-based, not node-based, so it also fires when
  the chain is idle. It re-verifies the entire frozen tree against current HEAD every 3 hours.
- **Cache-rot** — invisible even to a read-only full battery, because it reads the (rotten) oleans
  — is caught only by a **clean rebuild**: blow away `.lake/build`, rebuild from source, re-run the
  full battery. This is the **MANAGER's periodic + pre-milestone gold-master duty** (not cronned;
  too expensive for a cadence; mandatory before any publish/milestone/scaling change).

**Coverage over time is therefore identical to running the full gate every node — plus two safety
nets the old setup never had** (the timed drift check and the clean-rebuild gold-master). The only
thing that changed is that the frozen history's re-check moved OFF the worker's blocking critical
path.

---

## The failure valve — `scripts/gate-watchdog.sh`

The watchdog runs `gate-full.sh` and owns the alarm. It is the ONLY gate component allowed to
touch the board.

- **On PASS → SILENT.** Writes a PASS sentinel (`docs/gate-logs/LAST-FULL-PASS.log`), prunes old
  logs, says nothing. Green is the norm; a watchdog that cries every 3h is noise.
- **On FAIL → the safety valve fires** (this should be RARE and UNEXPECTED — it means the frozen
  history or the environment regressed):
  1. Creates a **TRIAGE ticket** on the `phys-novelty` board (parked, NOT auto-dispatched to the
     worker) with the failing directions, the full-log path, and HEAD sha.
  2. **BLOCKS the currently-running node** (`block --kind capability` → routes to `blocked` for a
     HUMAN). The chain halts. A human sees the block + ticket and decides how to handle the
     exception.

A stale-lock guard (40 min) prevents a slow battery from stacking on the next 3h tick.

---

## Worker mental model (also in the worker SOUL)

- **Two gates exist.** FAST (`gate-fast.sh`) is blocking and banks the node. FULL
  (`gate-full.sh`) validates the frozen history asynchronously.
- **Bank on FAST. NEVER block-wait on FULL.** Do not run `gate-full.sh` inline; do not re-run the
  full costume battery per node. The 3-hourly watchdog and the fast-gate escalation own the full
  battery.
- **Maintenance is UNCHANGED.** Every node still adds its costume + appends its `#print axioms`
  lines to `Audits/AxiomAudit.lean` exactly as before. The fast gate DEPENDS on those appends
  (D6-fast runs exactly the appended lines; D5-fast runs the new costume). Skipping either makes
  the fast gate FAIL — correctly.
- **If you must MODIFY a banked module** (rare — e.g. a genuine refactor), the fast gate will
  auto-escalate to the full building gate for that commit. Expect it and let it run.
- **Never internalize "fast is enough" as a licence to skip maintenance.** The fast gate is
  equivalent to full ONLY because the commit is append-only AND the costume/audit lines were added.

## Manager duties (also in manager memory)

- Own the **clean-rebuild gold-master** before any milestone / publish / compute-scaling change.
- If the watchdog fires (a `⛔ GATE-FULL REGRESSION` triage ticket + a blocked node): this is an
  unexpected exception. Diagnose the regression class (frozen costume stopped biting? banked axiom
  footprint drifted? bridge slipped in? env/cache drift?), run the clean-rebuild to confirm
  env/cache theories, fix or roll back, then unblock. Never rubber-stamp an unblock.
