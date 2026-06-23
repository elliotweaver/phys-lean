# THE RUNBOOK — walls and the correct reaction to each
*When a worker hits a wall, it consults this. Each wall has ONE correct reaction. The wrong
reactions listed are the ones that actually happened in the predecessor project (phys-clay)
and that this project exists to prevent. Read docs/STANDARD.md first — this operationalizes it.*

---

## W1 — "I cannot prove the full target in Lean"
**THE central wall. Every past failure routed through a wrong reaction here.**

- ❌ WRONG (forbidden): shrink the theorem to what you *could* prove and "fix the docstring";
  write `NAMED BRIDGE` / `asserted at grade` / `NOT proved here`; mark the node done anyway.
- ✅ CORRECT (forced escalation — STANDARD §4):
  1. Is the blocker just "Mathlib lacks the structure"? Then **build the structure.** That is
     not a wall. Do not panic, do not block, do not bypass.
  2. Reframe through the trunk (fold → cascade → derived algebra). Does the difficulty
     *dissolve* when attacked from the origin instead of by the classical path? Try this BEFORE
     grinding the standard hard proof.
  3. Still genuinely hard? **Enqueue a dedicated dissolution ticket as the IMMEDIATE NEXT node**
     (title: `<node> — creative theory-native dissolution of <the hard lemma>`), write a crisp
     handoff of exactly what is hard and what trunk facts are available, then `kanban_block`
     THIS node on that child. You did not fail; you scoped the hard part to a dedicated attack.

## W2 — "I need a result that isn't banked yet (e.g. a dimension, a simplicity fact)"
- ❌ WRONG: cite it "at grade," proceed as if proved, mark done. (This created circular debt in
  phys-clay: a node cited `dim g₂ = 14` that a *later* node was supposed to prove.)
- ✅ CORRECT: it is a HARD dependency. Either (a) it is already a banked theorem — `import` and
  USE it (not "cite at grade"); or (b) it is not banked — then it is a prerequisite NODE. Build
  the prerequisite first, or block this node on a new prerequisite ticket. You may never depend
  on an *unproven* assertion. If you can't import it as a real theorem, you can't use it.

## W3 — "This node is too big for one session / I'm running low on turns"
- ✅ CORRECT (this worked in phys-clay, keep it): DECOMPOSE before you run out of turns. Commit
  what is safely bankable, `kanban_create` a child for the remainder, `kanban_link` parent=this
  child=new (LINEAR chain — see W4), write a crisp handoff, then `kanban_complete` THIS task as
  "decomposed: part N done, part N+1 enqueued." Never end a run by silently running out of turns
  (that auto-blocks and stalls autonomy). Keep nodes small by design.

## W4 — "What do I enqueue next / how do I keep the board single-flight?"
- ❌ WRONG: create two successor tasks, or a task with no parent link → two become `ready` → the
  dispatcher spawns TWO workers → concurrent lean compiles corrupt the shared tree.
- ✅ CORRECT: the board is single-flight via a STRICTLY LINEAR dependency chain. Before creating
  the next node: (a) `kanban_list` — if a ready/blocked successor already exists, do NOT create
  another; (b) link the new node onto the TAIL of the chain (A→B→C, never A→B and A→C); (c) honor
  the idempotency-key. A stalled (empty) board is SAFE; a forked board is NOT.

## W5 — "The numerics won't converge / the proof won't close / it feels forced"
- ❌ WRONG: search for a *weaker* claim that does close, then bank the weaker claim. (This is W1's
  disease in disguise — quietly lowering the target.)
- ✅ CORRECT (THE ONE LAW): if it fights you, you are likely DRIFTING — the instrument/framing is
  wrong, not the theory. Return to the trunk. NEVER add a new hypothesis or axiom to get past a
  fight. NEVER weaken the target to make it close. If after returning to the trunk it is still
  hard, that is a W1 dissolution ticket, not a reason to bank less.

## W6 — "A previous worker left partial/uncommitted work on this node"
- ❌ WRONG: rubber-stamp it ("looks gate-green, complete it"). The verifier did exactly this to a
  scope-reduced node in phys-clay.
- ✅ CORRECT: VERIFY independently against THE STANDARD before trusting it. Run the gate yourself.
  Apply the physics-words-removable test. Check `#print axioms` yourself. Only then commit. A
  green gate is necessary, NEVER sufficient — the STANDARD is the second gate.

## W7 — "The gate passed — am I done?"
- ❌ WRONG: gate-green ⟹ done. (The gate cannot see scope-reduction unless it's coded to; even
  then it is necessary, not sufficient.)
- ✅ CORRECT: gate-green is NECESSARY, NEVER SUFFICIENT. The node is done only when it ALSO meets
  THE STANDARD §1 (unbroken, complete, physics-words-removable). The completion claim in your
  handoff must assert all three explicitly, with the real `#print axioms` output pasted in.

## W8 — "The result came out surprisingly easy"
- ❌ WRONG: celebrate, bank it, move on.
- ✅ CORRECT: a too-easy result is a BUG until proven otherwise. Check the costume actually BITES
  (a wrong value MUST fail to compile). Check you didn't prove a vacuous/trivial statement. Check
  the physics-words-removable test didn't pass *because the theorem says nothing*. Anti-vacuity is
  as important as anti-overclaim.

## W9 — "the proof is written but won't COMPILE in bounded time/memory"
**The instrument-cost wall. A proof that is logically correct can still be computationally
intractable for the kernel. This is an INSTRUMENT failure (W5 family) — the theory is fine, the
TACTIC is wrong. Recognize it early; never burn a whole budget grinding it.**

- ❌ WRONG: inflate `maxHeartbeats` (e.g. to tens of millions), throw a single monolithic
  normalizer (`ring`/`decide`/`simp`) at a fully-expanded ground-coordinate goal, and wait.
  Background that compile and keep working — it silently eats wall-clock, balloons memory, and is
  UN-parallelizable (one tactic call = one core, forever). Re-attempting the same blob across runs
  banks NOTHING and is the circular-failure trap (the predecessor pattern: looks busy, produces
  nothing).
- ✅ CORRECT — recognize, then act:
  1. RECOGNIZE the signature: a heartbeat ceiling raised far above default; a single tactic with no
     output for minutes; RSS climbing into many GB; or ≥2 runs ending at full budget having banked
     nothing. Any one = instrument wall. STOP grinding.
  2. MEASURE BEFORE YOU COMMIT. Before trusting any heavy tactic on the full obligation, isolate the
     SMALLEST sub-obligation and time it; extrapolate. If the smallest piece is already expensive,
     the monolith will not close. Measuring is cheap; grinding blind is the trap. NEVER run an
     unbounded compile inside your own turn budget — measure in a bounded, throwaway probe first.
  3. DECOMPOSE the obligation, not just the node. Split one heavy proof into named sub-lemmas, each
     with a BOUNDED cost, each proved and committed separately. A successfully compiled declaration
     is BANKED as an `.olean` and never re-elaborated unless its source or an upstream dep changes —
     so freeze upstream, compile each piece ONCE, assemble cheaply. Pay each cost once, never
     repeatedly. (If you keep editing a file, you keep paying its full cost — freeze it the moment
     it compiles.)
  4. PREFER STRUCTURE OVER EXPANSION. Whole-expression normalizers over fully expanded ground
     coordinates scale terribly and don't parallelize. A goal that won't close cheaply almost always
     wants to be re-expressed through higher-level identities / already-banked lemmas (reframe
     through the trunk — W1) rather than bashed at the coordinate level. The expensive brute form is
     a SMELL that a structural reduction is being skipped.
  5. ANTI-CIRCLING. Keep a running note of every route attempted and its failure mode (workbench or
     handoff). NEVER re-run a route already shown to blow up. If after measuring + decomposing +
     reframing it is still intractable, that is a W1 dissolution ticket (a dedicated node to find the
     performant proof), NOT another grind — decompose with turns to spare and child the remainder
     onto the chain tail (W3).
  6. INHERITED HEAVY WIP. When you inherit UNCOMMITTED proof files from a prior run, do NOT bulk-build
     them to "verify" them — that is how you re-trigger a beast the prior run already died on. A file
     carrying an inflated `maxHeartbeats` (far above default) or a single monolithic brute normalizer
     is itself the FOSSIL of a prior W9 instrument-wall casualty: it did not compile last time and it
     will not compile now. Before building ANY inherited file: read the git log, the prior run's
     handoff/thread, and check which `.olean`s already exist. Treat any inflated-ceiling / monolithic
     file as a KNOWN-SUSPECT to measure/decompose/reframe — never as something to rebuild blind. The
     absence of an `.olean` for such a file is evidence it is unbuildable as written, not an invitation
     to try again.
  7. RECONNAISSANCE IS NOT THE DELIVERABLE — when the route is already specified and the automated
     closers are measured-dead, STOP probing and WRITE the proof. The proof is the deliverable; a
     solver, a certificate search, a goal-trace, a reduction lemma are SCAFFOLDING for it. This clause
     fires when ALL THREE hold: (a) the route is already specified in the ticket / FINDINGS / handoff
     (e.g. "the closer is a manual sequenced rewrite, NOT a single automation"); (b) bounded probes
     have already MEASURED the automated closers dead (`ring`/`simp`/`decide`/a flat certificate all
     timed out or returned unsolved); and (c) ≥2 runs have banked NO new theorem on this obligation.
     When all three hold you are in RECONNAISSANCE-AS-AVOIDANCE: writing the Nth probe / the Nth
     solver / the Nth reduction is the circular-failure trap wearing the costume of diligence (it
     "looks busy, produces nothing" — the predecessor pattern, W9 item 5). The corrective is forced
     and in this order: (i) COMMIT any proven reduction/structural lemma already in hand — if it
     compiles clean (`#print axioms` ok), bank its `.olean` NOW so the reduction is never lost to a
     timeout; never let a proven lever sit uncommitted across runs. (ii) EXECUTE the specified route
     on the SMALLEST sub-case (the minimal entry / the most-reduced obligation) — write the actual
     hand-built proof, not another measurement of whether it's needed; the ticket already settled that
     it is. (iii) BANK the first sub-lemma that compiles, even if partial, then child the remainder
     (W3). A measurement only earns its budget if it CHANGES the plan; once the plan is fixed and the
     shortcuts are dead, further measurement is avoidance, not de-risking. Re-measuring a route the
     FINDINGS already record as dead is the item-5 violation; hunting a NEW automated shortcut the
     ticket already ruled out is the same violation in fresh paint.
  8. BANK-AS-YOU-GO — the moment a sub-lemma COMPILES CLEAN, COMMIT it; never hoard proven work for a
     grand assembly. This is the most expensive recurring failure on long structural nodes and it is
     SEPARATE from item 7: it fires on EVERY run, not just after empty runs. The pattern: a run finds a
     genuine clean lever — a reduction, a building-block identity, a key structural lemma — gets it
     COMPILING (no sorry, `#print axioms` ok), then leaves it in `/tmp` or a scratch file and spends
     the rest of the budget chasing the FULL theorem, and the run times out with the proven lever
     UNBANKED. Next run re-derives the same lever from scratch. Three empty runs can each "make
     progress" and bank nothing this way — the work is real but it evaporates at the budget boundary.
     THE RULE: a proven, compiling sub-lemma is a DELIVERABLE the instant it elaborates — treat it like
     one. The correct loop is: prove the smallest piece → move it from scratch into a PRODUCTION file
     under the node's dir → wire it (import in the umbrella file / `Phys.lean` / AxiomAudit) → `git
     commit` it → THEN attack the next piece. Do NOT wait until the whole entry / the whole `jdef_H3`
     assembles; each compiling lever, reduction, and entry-lemma is its own frozen `.olean` banked on
     its own commit (W9.3 freeze-on-compile). Operational test, applied at every run's midpoint and
     before any risk of running low: "is there a clean-compiling lemma I have NOT yet committed?" If
     yes, COMMIT IT NOW before writing one more probe or chasing one more assembly step. A scratch
     file is where you DRAFT a proof; the instant it is green it must graduate to production and a
     commit, or it does not count and it will be lost. A run that ends having proven something clean
     but committed nothing has FAILED even though it "found the answer" — the bank is the deliverable,
     not the discovery.
     ★ START-OF-RUN RECOVERY (the recover-then-restrand death-loop). When you INHERIT a node whose
     prior run(s) left clean-compiling lemmas in `/tmp` or `workbench/` scratch (you can see them:
     `0 sorry`, real `theorem`s, named in the handoff), your FIRST production action — before writing
     any new probe, before measuring any entry — is to GRADUATE THOSE INTO PRODUCTION AND COMMIT THEM.
     Recover → move into the node's production file → wire → `git commit` → only THEN continue. Rationale:
     under slow/memory-pressured compiles a run can die before the bank ceremony, so each successor
     keeps re-deriving the same scratch levers and the production state never advances (observed: 5
     runs, spine + 1 lever, everything else repeatedly stranded and recovered). Banking the inherited
     scratch family is CHEAP (the lemmas already compiled once) and converts a wasted recovery into
     permanent progress in the first few minutes. NEVER re-derive a lever that already exists `0 sorry`
     in scratch — commit it. A run that inherits a stranded clean lever family and does not bank it in
     its first production act has already repeated the predecessor's failure.

---

## The single question that resolves every wall
> *Is the chain still unbroken and every claim still fully proved back to the fold?*
If yes → proceed. If no → you owe a completion/dissolution ticket, NOT a bridge, NOT a weaker
claim, NOT a "done." There is one category of unfinished work: incomplete derivation.
