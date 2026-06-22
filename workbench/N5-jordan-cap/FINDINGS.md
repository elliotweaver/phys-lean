# N5c — H₃(𝕆) JORDAN-IDENTITY ASSEMBLY: FINDINGS (corrected run 47)

Target: prove `jdef (Hm …) (Hm …) = 0` for the general Hermitian 3×3 over the terminal
algebra `O ℚ` — pinning N5's cap EXACTLY at 3 (Part 1 proved failure at n≥4). The cap value
3 = the exact gap between `𝕆` ALTERNATIVE (kept) and ASSOCIATIVE (lost at the cascade stop).

## ✅ RUN 52 — W9.7 EXECUTED: the FIRST positive-edge case is PROVED AND BANKED
The 2-empty-run streak (runs 50, 51) is BROKEN. Per RUNBOOK W9.7 (reconnaissance is not the
deliverable: route specified + automated closers measured-dead + ≥2 empty runs ⇒ STOP probing,
WRITE the proof on the smallest sub-case, bank incrementally), run 52 stopped all further
solver/probe reconnaissance and executed the sequenced-rewrite route on the SMALLEST honest
sub-case. MEASURED first (W9.2): the single-generator pair unfolds in 9.8 s / 3.25 GB (the
matrix unfold was never the cost), confirming the octonion-level goal is tractable. Then
discovered the decisive structural shortcut and BANKED two production theorems:

  - `Phys/Algebra/HermitianJordan/SinglePair.lean` (namespace `Phys.Algebra.HJ`, foundations-only):
    • `central_diag` — ★ THE GENERIC DIAGONAL-ENTRY WORKHORSE. Over ANY `NonAssocRing`, if `n`
      commutes (`hc`) and associates in the middle/right positions (`hAM`/`hAR`) with everything,
      the single-generator Jordan-defect diagonal combination
      `(a·sp + p·sa)·(n+n) + (n+n)·(a·sp + p·sa) − (a·(sp·(n+n)+(n+n)·sp) + (p·(n+n)+(n+n)·p)·sa) = 0`.
      Proof is a two-rewrite re-bracketing (`← hAR a sp`; `p·n·sa = p·sa·n` via hAM/hc/hAR) + `abel`.
      Centrality of `n` is the ONLY hypothesis — the diagonal half of the Jacobson nuclearity
      condition isolated as a pure ring identity. Axioms: [propext].
    • `jdef_single_pair` — ★ THE SMALLEST POSITIVE-EDGE CASE. `jdef (Xz a 0 0) (Xz p 0 0) = 0` for
      the zero-diagonal Hermitian core over `CD (CD B)` carrying a SINGLE off-diagonal generator.
      Every matrix entry vanishes: the (0,0)/(1,1) diagonal entries by `central_diag` with the
      central norm `n = a·star a` (banked `nrm_comm`/`nrm_assocM`/`nrm_assocR`, both orders
      identified by `nrm_symm`); the off-diagonal/third-index entries arithmetically.
      DECISIVE STRUCTURAL FACT: the single-generator case closes by COMPOSITION-CENTRALITY ALONE —
      NO alternativity, NO associator algebra, NO coordinate `ring`. (Artin: one generator + its
      conjugate generate an associative subalgebra, so the only obstruction is the centrality of
      the norm, which is banked.) Build cost 14 s. Axioms: [propext, Classical.choice, Quot.sound].

  Also WIRED the previously-orphaned `Linear.lean` (committed run 51 but never imported) into
  `Phys.lean` + `Audits/AxiomAudit.lean`. Costume `C20`
  (`Counterexamples/SinglePairNonVacuityCostume.lean`) guards non-vacuity: the seeding square
  `jb (Xz e₂ 0 0)(Xz e₂ 0 0)` has (0,0) entry `2·(e₂·star e₂) = 2`, false core `1 + 1 = 0`.
  GATE GREEN D0–D6: 20/20 costumes, 183 theorems foundations-only.

  REMAINDER (childed onto the chain tail, W3): the MULTI-generator entries of the full
  `jdef_H3 = 0`. Their cross terms (e.g. `b·star r`, `a·r + p·c`, `star c · star a` — MEASURED in
  the 3-generator core (0,0) goal, run 52 `probe_core00v2.lean`) bridge across distinct generators
  and genuinely require the alternating-form laws (`assoc_swap12/23`, Moufang) of
  `Phys/Algebra/Alternative.lean` — the multi-page associator algebra. That is the heavy part that
  remains; the single-generator base case + the `central_diag` workhorse + the `jdef_add_right`
  reduction lever are now banked under it.



## ⛔ DEAD ROUTE — ADDENDUM (run 51): the projection-FIRST coordinate route is ALSO dead
MEASURED (W9, bounded probe workbench/N5-jordan-cap/probe_core00r.lean), do NOT re-run:
- Hypothesis: the dead `cdsimp <;> ring` blew up because `cdsimp` includes `add_mul`/`mul_add`,
  distributing CD-level products combinatorially BEFORE projecting. So try projecting FIRST
  (only `mul_re`/`mul_im`/`star_*`/`add_*`/`neg_*` + `sub_eq_add_neg`, NO `add_mul`/`mul_add`),
  pushing distribution down to ground-ring `B`, then a single `ring` at the B level.
- VERDICT on core entry (0,0): RSS climbed past 4.6 GB at 75 s AND `ring` FAILED ("ring tactic
  failed to close the goal") on the projected B-coordinate goal. So the coordinate route is dead
  EVEN when distribution is deferred to `ring` — the degree-4 octonion product expanded across the
  4 B-coordinates is the same measured instrument wall. KILLED per the run-51 prereg KILL.
- CONCLUSION (re-confirms the run-48/49 + run-50 verdict a SIXTH independent way): no
  coordinate-level automation (`ring`, `cdsimp+ring`, projection-first `ring`) closes a core entry.
  The route is the structural OCTONION-LEVEL sequenced rewrite, which no single Lean automation
  fires. This is genuine multi-page manual associator algebra per entry — correctly childed.

## ⚠⚠ THIRD CORRECTION (run 47) — the prior premise was WRONG
The pre-run-47 version of this file (and the task body / parent handoff) asserted:
  "every defect entry IS a sum of octonion associators, killed by the alternating-form laws."
**THIS IS FALSE.** It was inferred from `assoc_decompose2.py`'s *associative+central
collapse* test (which only shows the entries vanish in the ASSOCIATIVE quotient — i.e. each
entry lies in the associator ideal as a SET), NOT from an actual span computation. Run 46
tried to turn it into a `linear_combination (norm := abel)` certificate, but its dense
Gauss-Jordan solver HUNG (50k–130k instances, exact-ℚ dense elimination) and banked NOTHING
in 45 min — it never discovered the premise was false.

Run 47 built a FAST sparse incremental span-membership solver (`cert_span.py`,
`cert_span_broad.py`, dict vectors + incremental pivot basis, ~0.5–4 s/entry) and the
verdict is DECISIVE and reproducible:

  **ALTERNATION-ONLY IS INSUFFICIENT.** Every one of the 9 defect entries is NO-SOLUTION
  in the ℚ-span of alternating-law instances — even with the BROAD 129 600-instance pool
  (all degree-≤2 products of the 12 generators as arguments). Residual = 52 monomials/entry.
  `cert_span.py` (own-subtree pool): all 9 entries NO-SOLUTION, residual 50–52.
  `cert_span_broad.py` (full generator pool): entry(0,1) NO-SOLUTION, residual 52.

This is THE ONE LAW in action: the theory is right (H₃(𝕆) IS Jordan), the FRAMING was wrong
(the alternating-form laws alone do not span the defect).

## ⚠⚠ SECOND CORRECTION (run 48/49) — the FLAT abel-certificate route is ALSO dead
Run 47's corrected route (task body of `t_d8f1c104`, step 3) prescribed: add the
composition-centrality relations as extra columns to the SPARSE span solver, extract a flat
ℚ-certificate per entry, and port it as `linear_combination (norm := abel) Σ cᵢ·lawᵢ`. Run 48
BANKED composition-centrality (ingredient 2, `CompCentral.lean`, foundations-only, oleans
current — verified run 49) and then **refuted the flat-certificate framing** with two fast,
evaluation-only diagnostics:

  - `block_eval.py` (faithful Zorn split-octonion model): for every defect entry, the FULL
    entry is ZERO but its atom-multiset BLOCKS do NOT vanish individually — **11–12 nonzero
    blocks per entry** (entry(0,1): 11 nonzero; entry(0,0): 12; entry(1,2): 11; entry(2,2):
    12). The blocks bridge ACROSS distinct atom-multisets: e.g. an `ACaq` block cancels against
    a `Qaac` block ONLY after the conjugate `A = star a` is rewritten `star a = (a+star a) − a =
    T_a − a` (T_a central) and squares are reduced by Cayley–Hamilton. The cancellation is a
    SUBSTITUTION/degree-lowering, not an addition of pre-existing law instances.
  - `inspect_entry.py`: each entry is ~40–48 monomials across ~13–16 atom-multisets, every
    multiset's coeffsum = 0 (necessary, not sufficient — the octonion structure inside each
    multiset still has to cancel).

So the entry does NOT lie in the ℚ-span of {alt instances} ∪ {flat centrality difference
vectors}: the closing operation is `star a ↦ T_a − a` (substitution) and `a*a ↦ T_a·a − N_a`
(`sq_ch`, degree-LOWERING), which CHANGE the monomial set rather than add a fixed law vector.
A flat `linear_combination (norm := abel)` cannot model a substitution that lowers degree and
re-routes monomials between blocks; that is why a flat solver finds NO-SOLUTION and why the
abel port is the wrong instrument. **The honest closing route is a SEQUENCED REWRITE** (rewrite
every off-diagonal `star x` to `T_x − x` and every square via `sq_ch`, push the now-central
`T_x`/`N_x` scalars out with `tr_*`/`nrm_*`/`ocR_*`, then the residual associator combination
closes by the alternating-form laws). This is heavier than one `linear_combination` and is the
remaining OWED work — see CHILD'S JOB below (revised).

## ★★ THIRD CORRECTION + KEY REFRAME (run 50) — the CENTRAL-DIAGONAL REDUCTION
THE ONE LAW reframe paid off. The decisive NEW structural fact (workbench/central_split.py,
exact Zorn, 200 samples, reproduced):

    jdef(D + X, E + Y) = jdef(X, Y)      — the central diagonal contributes NOTHING.

where D, E are the real central diagonals (`ocR d_i`, central by banked tr/nrm/ocR) and X, Y
are the ZERO-DIAGONAL Hermitian off-parts. Verified at the finer grain too:
  jdef(D+X, B) = jdef(X, B)  and  jdef(X, E+Y) = jdef(X, Y)  (central arg in either slot drops).
CONSEQUENCE: the full H₃ cap `jdef_H3 = 0` REDUCES to the smaller ZERO-DIAGONAL CORE
`jdef(Xz, Yz) = 0` (Xz, Yz zero-diagonal Hermitian over O ℚ). The core entries are 40–48
monomials each (all pure degree-4 in the 6 off-diagonal generators), vs 216 for the full
entry — the 6 central diagonal variables were pure clutter. The reduction lemma itself is
provable from banked centrality (`tr_*`/`nrm_*`/`ocR_*`) — this is REAL banked progress and
should be the next thing formalized (it shrinks the hard part by ~4×).

## ⛔ DEAD ROUTE — ADDENDUM (run 50): the COORDINATE route is dead on the CORE too
MEASURED (W9), do NOT re-run on any matrix entry (full OR zero-diagonal core):
- `ext <;> cdsimp <;> ring` on core entry (0,1), maxHeartbeats 20M: RSS climbed past 7 GB at
  2:23, KILLED. Same memory-balloon signature as the dead full abstract-B route (#3).
- `ext <;> cdsimp` ALONE (no ring closer), core entry (0,1), 1M heartbeats: simp `whnf`
  timeout at 43 s / 3.4 GB. So the COORDINATE EXPANSION ITSELF (not just `ring`) is the wall,
  even on the reduced core. The full coordinate route is dead at EVERY layer.
- product-form lemmas (`mul_mul_left`/`mul_flex`/Moufang) as raw `simp only` rewrites on the
  OPAQUE octonion core goal: "simp made no progress" (+ name ambiguity with Mathlib) — they do
  NOT auto-fire; the goal is not in `x*(x*y)` shape. The structural route needs MANUAL
  re-bracketing per entry before the alternative laws apply (genuine multi-page associator
  algebra), confirming the run-48/49 verdict on the reduced core.

## ⛔ DEAD ROUTE — ADDENDUM (run 50): NO flat certificate, re-confirmed 5 ways
The post-substitution central-coefficient model (star x = T_x − x; centrals as coefficients —
the INTENDED Lean model, NOT the dead Zorn-block model) was tested for flat-span membership
with degree-complete pools: `cert_freeword.py` (leaf args, residual 210), `cert_central.py`
(generator words, residual 116/102), `cert_altideal.py` (generator-mult closure, residual
124/106/110), `cert_compound.py` (compound-arg instances up to deg-4, residual 116/112/112),
`cert_subterm.py` (compound-subterm pool — EXPLODES, the cert_ch fate). ALL NO-SOLUTION. The
flat `linear_combination`/`abel` route is conclusively dead even in the right model. The route
remains the SEQUENCED REWRITE, now on the SMALLER zero-diagonal core (after the central-diag
reduction). DO NOT re-attempt any flat certificate.

## DEAD ROUTES — ADDENDUM (run 48/49)
- The FLAT span+abel certificate route (cert_span.py + extra centrality columns → abel port):
  refuted by `block_eval.py` as above. The defect is NOT a flat span even WITH the centrality
  vectors added — blocks bridge by substitution/degree-lowering. DO NOT re-attempt a flat
  `linear_combination (norm := abel)` certificate for a full entry.
- `cert_ch.py` (the span solver augmented with CH columns): HANGS past 60 s (the CH-augmented
  pool re-introduces the dense-explosion that killed run 46's solver). DO NOT RE-RUN — its
  question is already answered NEGATIVELY by `block_eval.py` in <1 s.
  Use `block_eval.py`/`inspect_entry.py` (fast, evaluation-only) for any further structural
  diagnosis, NOT a span solver.

## THE CORRECTED, CONFIRMED RELATION SET (run 47)
`cert_confirm.py` — the faithful split-octonion (Zorn vector-matrix) model, which is
alternative AND a composition algebra (norm/trace central) — confirms:
  - n=3, REAL diagonal: jdef = 0 in 0/50 samples  → **alt + composition SUFFICES.**
  - n=3, octonion diagonal (control): jdef ≠ 0 in 50/50 → the REAL diagonal is essential.
  - n=4, real diagonal (cap control): jdef ≠ 0 in 50/50 → the cap at 3 bites.

So the entrywise assembly needs THREE ingredients, ALL in-chain:
  1. **Alternativity** — banked: `Phys/Algebra/Alternative.lean` (`alt_*`, `assoc_swap*`,
     Moufang). The associator is an alternating trilinear form.
  2. **Composition-centrality of the involution** — the symmetric trace `a + star a` and
     norm `a · star a` are CENTRAL/NUCLEAR. This is the classical Jacobson/Schafer condition
     ("`H₃(A)` Jordan ⟺ `A` alternative AND involution nuclear"). It traces back to N2's
     banked scaling/composition law (`CDcore.scaling_of_H`, the multiplicative norm). NOT
     yet expressed as the Lean lemma set the assembly consumes — THE CHILD'S MAIN JOB.
  3. **Centrality of the real diagonal `ocR r`** — banked THIS run:
     `Phys/Algebra/HermitianJordan/Helpers.lean` (`ocR_comm`, `ocR_assocL/M/R`, `ocR_star`,
     all foundations-only). `ocR r` commutes & associates with all of `O ℚ` and is
     self-adjoint.

## ⛔ DEAD ROUTES — DO NOT RE-RUN (W9.5 anti-circling)
The FOUR brute whole-expression normalizers (all INSTRUMENT-WALL casualties, W9):
| # | route | result |
|---|-------|--------|
| 1 | brute ℚ-coordinate `ring` on diagonal entry | 16 min, RSS >9 GB, SIGTERM, zero output |
| 2 | `noncomm_ring` over the associative base H | LOGICALLY INSUFFICIENT (88–148 residuals) |
| 3 | brute abstract-`CD (CD B)` `ring` | 357 s, 6 GB, FAILED (simp max-recursion) |
| 4 | brute ℚ-coordinate `ring` on off-diagonal (0,1) | 71 s, 4.3 GB, deterministic whnf-timeout |

NEW dead approach (run 46): the **dense Gauss-Jordan certificate solver** (`certificate.py`,
`certificate2.py`, `cert_fast.py`) — generates 12k–130k law instances per entry then does
EXACT-ℚ DENSE elimination on a matrix that wide. HANGS past any sane budget; banks nothing.
**Use the SPARSE incremental span solver (`cert_span.py`/`cert_span_broad.py`) instead** —
it is the same question answered in <4 s.

## THE CHILD'S JOB (the corrected dissolution — REVISED run 48/49)
Composition-centrality (ingredient 2) is now BANKED (`CompCentral.lean`, committed run 49,
foundations-only). The flat span+abel-certificate route (old steps 2–3) is DEAD (see SECOND
CORRECTION). The honest, in-chain assembly of `jdef_H3 = 0` WITHOUT a brute normalizer:
1. ✅ DONE — composition-centrality as Lean lemmas (`tr_comm`/`tr_assoc*`, `nrm_comm`/
   `nrm_assoc*`, `nrm_symm`, `sq_ch`) in `CompCentral.lean`. Plus `ocR_*` (Helpers) and the
   alternating-form laws (`Alternative.lean`). All three ingredients banked.
2. **The closing route is a SEQUENCED REWRITE, not a flat certificate.** For each defect entry:
   (a) rewrite every conjugate off-diagonal `star x ↦ (x + star x) − x` so the only `star`
       left is inside the central trace `T_x := x + star x`;
   (b) rewrite every square `x*x` via `sq_ch` (`x*x = (x+star x)*x − x*star x`), lowering degree
       and exposing the central norm `N_x := x*star x`;
   (c) push the now-central scalars `T_x`, `N_x` (and the real diagonal `ocR`) out to the front
       with `tr_comm`/`tr_assoc*`, `nrm_comm`/`nrm_assoc*`/`nrm_symm`, `ocR_comm`/`ocR_assoc*`;
   (d) the residual pure-associator combination closes by the alternating-form laws
       (`assoc_swap12/23`, `alt_*`, Moufang).
   This MUST be the proof shape; a single `linear_combination (norm := abel)` cannot model the
   degree-lowering substitution (proven by `block_eval.py`: blocks bridge across atom-multisets,
   they do not add as fixed vectors). MEASURE per-entry compile cost in a bounded scratch probe
   FIRST (W9.2). KILL at 90 s wall / 2 GB RSS per entry → decompose that entry into
   associator-group sub-lemmas (each its own banked olean, W9.3).
3. Each entry its OWN lemma in its OWN file under Phys/Algebra/HermitianJordan/ (freeze-on-
   compile banks the olean once). Diagonal entries (0,0),(1,1),(2,2) and off-diagonals
   (0,1),(0,2),(1,2) — by Hermiticity the lower triangle follows from the upper.
4. Assemble the 9 entries → `jdef_H3 = 0` via `Matrix.ext` + `fin_cases`. Reassemble
   `jordan_cap_pinned_at_three := ⟨jdef_H3, jordan_fails_H4⟩`.
5. Re-add the H3 wrong-cap costume (a defect-entry coordinate asserted ≠ its true value →
   false core) once an entry lemma exists; ONE row in scripts/costume_manifest.tsv.

Lever (Alternative), carrier (Setup), real-diagonal centrality (Helpers), AND composition-
centrality (CompCentral) are ALL BANKED. The remaining owed work is the sequenced-rewrite
assembly of the 9 entries (step 2–4) + the costume.

## WORKBENCH INVENTORY (runs 47–49, all under workbench/N5-jordan-cap/)
- `block_eval.py` — ✅ FAST (eval-only) faithful Zorn model: shows blocks do NOT vanish
  individually (11–12 nonzero/entry) → the flat-span route is dead, the route is a rewrite.
- `inspect_entry.py` — ✅ FAST: per-entry monomial/atom-multiset structure (coeffsums = 0).
- `cert_span.py` — ✅ FAST sparse span solver (own-subtree pool). All 9 entries NO-SOLUTION (alt-only).
- `cert_span_broad.py` — ✅ FAST sparse span solver (full generator pool). Confirms NO-SOLUTION isn't a pool artifact.
- `cert_confirm.py` — ✅ split-octonion model: alt+composition SUFFICES (n=3 real-diag 0/50; controls bite).
- `verify_compcentral.py` — ✅ confirms trace/norm centrality + norm symmetry + reality in exact O ℚ.
- `diag_size.py` — diagnostic: per-entry pool sizes (why the dense solver hangs).
- `cert_ch.py` — ⛔ CH-augmented span solver, HANGS >60 s. DO NOT RE-RUN (answered NO by block_eval).
- `cert_fast.py`, `certificate.py`, `certificate2.py` — ⛔ DENSE solvers, HANG. DO NOT RE-RUN.
