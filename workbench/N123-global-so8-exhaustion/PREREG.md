# N123 PREREG — THE GLOBAL OCTONION-BLOCK EXHAUSTION (frozen before compute)

## Node
N123: the global octonion-block exhaustion — the finrank-strong-recursion assembly built on
N121 subspace-preservation core + N122 derived-Cut finrank tower / depth bound 7. Over the
banked N49–N122 + the derived ℝ ContinuumQ.Cut + terminal algebra O Cut.

## What is BANKED (in hand) — the per-peel ingredients are ALL proved
- N119 rank-DROP engine: `ePerp e := ker(gFormCRight e)`, `ePerp_finrank` (codim-1 drop),
  `isom_fixes_mapsTo_ePerp` (KEY), `isomRestrict` + `isomRestrict_gFormC_isom` (closure),
  `ePerp_finite`, `self_not_mem_ePerp`, `ePerp_ne_top`.
- N120 connective tissue + bounded TWO-axis: `octDeflate_fixes_orthogonal_axis`,
  `octDeflate_two_axis_step`, `octDeflate_two_axis_factorization`, ke2je2 orthogonalities.
- N121 subspace-preservation core: `octReflBlock`, `octReflBlock_gFormC_diag`,
  `octReflBlock_fixes_orthogonal`, `octReflBlock_mapsTo_ePerp`, `octReflBlockRestrict`,
  `octReflBlockRestrict_gFormC_isom`.
- N122 finrank tower: `finrank_O_eq_eight_Cut = 8`, `finrank_STVC = 10`,
  `ePerp_finrank_value = 7`, `finrank_End_O_Cut = 64`.
- N85 TEMPLATE: `specExists_aux` — Nat strong-recursion on finrank W, peel + deflate +
  recurse on `W ⊓ uPerp` (the codim-1 drop). On the EvC-SPECTRAL strand (eigenvalue peel),
  NOT the gFormC-ISOMETRY strand — structural template only.

## THE REFRAME (THE ONE LAW — dissolve the "resistant piece")
The ticket flags as resistant: "is there always a moved unit-imaginary axis INSIDE the
complement (the gFormC-isometry strand has no analogue of N85's eigenvalue existence)?"
DISSOLUTION: the recursion does NOT need a moved axis to EXIST. The dichotomy is the
tautology (classical `em`): at each block W, EITHER S = id on W (TERMINATE — base case),
OR ∃ moved v ∈ W (peel it). No eigenvalue analogue needed. The genuine remaining content is
(a) the BASE CASE (full-rank fixed ⟹ identity) and (b) the reflection CONSTRUCTION at a
general moved vector (normalize + imaginary handling) and the nested-restriction bookkeeping
for the FULL assembly — the latter is the genuine HEAVY remainder.

## GO / NO-GO (measured, smallest-first; bank-as-you-go, child the heavy remainder)
- GO target A (cleanest, the recursion BASE CASE, finrank-native, NO explicit basis needed):
  `isometry_fixes_full_eq_id` — a gFormC-isometry S on O Cut whose fixed subspace has
  finrank 8 is the identity. Via `Submodule.eq_top_of_finrank_eq` + `finrank_O_eq_eight_Cut`.
  The depth-0 termination of the descent (dual form: grow the fixed subspace to full ⟹ done).
- GO target B (sanctioned immediately-bankable, certain): the THREE-axis exhaustion —
  extend N120's two-axis by one more orthogonal peel using `octDeflate_fixes_orthogonal_axis`
  + `octDeflate_step` (three reflections fix three mutually-bisector-orthogonal axes).
- STRETCH C: an abstract one-step descent lemma tying the peel to the finrank drop on O Cut.
- The FULL global SO(8) surjectivity assembly (nested-restriction recursion + reflection
  construction at general moved vectors + reflection-lifting from ePerp) and the operator
  TOPOLOGY over Cut → child the heavy remainder N124.

## KILL (instrument-failure classifier — W9)
- KILL any single obligation that does not typecheck-probe clean in ≤ 90s `lake env lean`.
- KILL the FULL recursion attempt if the nested-restriction bookkeeping does not close in a
  bounded probe — it is then the genuine W1/W9 HEAVY remainder, child it, do NOT grind.
- NO inflated maxHeartbeats, NO native_decide, NO monolithic brute. A fight = INSTRUMENT/
  framing wrong (THE ONE LAW), reframe through the trunk or child — never weaken/bridge.
- Anti-timeout: checkpoint + commit each clean lemma EARLY; finalize (gate-bg + child +
  complete) with turns AND iterations to spare.

## W8 costume (next id C155) — MUST bite a WRONG global-exhaustion/base-case/three-axis claim
A false numeric DISTINCT from the banked battery (… C153 1=117, C154 8=119). Reuse banked
objects. Candidate: a wrong three-axis fixed-image self-overlap coordinate (=1) vs a false
RHS, or a wrong base-case finrank claim.

## STANDARD
Unbroken (every object derived back to the fold / banked N49–N122 / standard Mathlib
machinery on derived objects), complete (foundations-only, #print axioms ⊆
{propext,Classical.choice,Quot.sound}, no sorry/axiom/native_decide), physics-words-removable.
NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge.
