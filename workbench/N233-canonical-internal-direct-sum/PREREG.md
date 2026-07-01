# N233 — PREREG: THE CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM `7⊗7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`

## THE DECIDED TARGET (single, no menu)
Bank `DirectSum.IsInternal` of the four g₂-submodules of `End ℚ ImO`
    A : Fin 4 → Submodule ℚ (End ℚ ImO) := ![trivialLine, range crossEmb, range imRepL, tracelessSym]
(the 1, 7, 14, 27 summands), proved through the four banked N231/N232 ambient idempotents
`projTrivial`/`proj7`/`proj14`/`proj27` (matched to A 0/A 1/A 2/A 3), PLUS:
- the dimension identity `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)`;
- each summand g₂-stable under `adEnd D` (the direct sum is of g₂-MODULES);
- a capstone bundling IsInternal + dim identity + g₂-stability.

## LOCK COMPLIANCE
On the GATHER side. Every object is a banked gather-arc projector/submodule on the derived
`O ℚ = CD(H ℚ)` tower. No hypercharge / Freudenthal / Peirce / invariant-tower method. This is
the canonical PACKAGING of the N219–N232 projector arc into one Mathlib direct-sum object.

## ROUTE (all ingredients confirmed banked — no missing structural fact, no route-finding child)
Match projector `P i` to summand `A i`:  P = ![projTrivial, proj7, proj14, proj27].
Two families of pointwise facts (all banked, direct compositions):
  FIX  (P i fixes A i):  projTrivial_apply_triv / proj7_apply_fun / proj14_apply_adj / proj27_apply_tracefree
  KILL (P i kills A j, j≠i), 12 facts, e.g.:
    projTrivial kills 7/14 via *_apply_skew∘{crossEmb_range_le_so7', imRep_range_le_so7}; kills 27 via *_apply_tracefree
    proj7 kills 1/27 via *_apply_self∘{trivialLine_le_selfAdj, tracelessSym_le_selfAdj}; kills 14 via proj7_apply_adj
    proj14 kills 1/27 via *_apply_self∘le_selfAdj; kills 7 via proj14_apply_fun
    proj27 kills 1 via proj27_apply_triv; kills 7/14 via *_apply_skew∘le_so7
- iSup A = ⊤: from the four-way resolution `projTrivial X + proj27 X + proj7 X + proj14 X = X`
  (banked `projTrivial_add_proj27_add_proj7_add_proj14`), each term ∈ A i ⟹ X ∈ iSup A.
- iSupIndep A: for each i, `Disjoint (A i) (⨆ j≠i, A j)` via `Submodule.disjoint_def`:
  x ∈ A i ⟹ P i x = x (FIX); x ∈ ⨆ j≠i A j ≤ ker (P i) (each A j killed by P i ⟹ sup ≤ ker) ⟹ P i x = 0 ⟹ x = 0.
- IsInternal via `DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top`.
- dim identity: banked finrank_trivialLine(1)/finrank_crossEmb_range(7)/finrank_imRep_range(14)/
  finrank_tracelessSym_eq_27(27)/finrank_end_eq_49(49).
- g₂-stability per summand under adEnd D:
  trivialLine_adEnd_inv / crossEmb_range_g2_invariant / imRep_range_g2_invariant / tracelessSym_adEnd_inv
  (the two range facts stated via ⁅imRep D,X⁆ = adEnd D X by adEnd_apply).

## COST BUDGET / KILL
Pure packaging — NO coordinate `ring`, NO `decide` blowup, NO degree-4 expansion; everything
composes banked pointwise lemmas + one Mathlib direct-sum lemma. Expect < 60s total build.
KILL: if any single obligation > 90s or whole-file build > 5 min, STOP — instrument signal;
measure/decompose the offending obligation (likely the `![...]`/`fin_cases` reduction) into a
banked sub-lemma. No route-finding child expected.

## STANDARD (pre-commit)
- UNBROKEN: imports only banked N232 (transitively the whole tower) + Mathlib DirectSum/SupIndep
  MACHINERY on derived objects. Ground = derived ℚ; no ℝ/ℂ content; nothing posited; no bridge.
- COMPLETE: every claim proved; #print axioms ⊆ {propext, Classical.choice, Quot.sound}.
- PHYSICS-WORDS-REMOVABLE: delete g₂/trivial/fundamental/adjoint/traceless — the statement is
  "the four submodules {trivialLine, range crossEmb, range imRepL, tracelessSym} of End ℚ ImO form
  an internal direct sum, dims 1+7+14+27=49, each adEnd-stable". No physics word load-bearing.
- FREE-FLOATING: every headline TYPE mentions the banked tower objects (trivialLine, crossEmb,
  imRepL, tracelessSym, projTrivial, proj7, proj14, proj27, adEnd, derivationLieQ, ImO) on O ℚ.
  A = ![...] is the CONCRETE banked family, NOT carrier-agnostic.

## COSTUME (C265)
Anti-vacuity: the direct sum GENUINELY has total dimension 49 (dim identity witness). A bogus
"the summands overlap / sum to something other than 49" reduces through the banked value to a
false numeric `49 = 265` in ℕ. RHS 265 fresh.
