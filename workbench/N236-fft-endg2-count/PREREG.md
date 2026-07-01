# N236 — PREREG/FINDINGS: the g₂-equivariant endomorphism space + the FFT LOWER bound

## The named ascent (inherited from N234→N235, re-confirmed)
Target `tracelessSym_irreducible` reduces (N234 measurement) to the g₂ FFT count
`dim End_{g₂}(End ℚ ImO) = 4`, then `Σ mᵢ² = 4` over N233's four DISTINCT-dimension summands
⟹ each of 1,7,14,27 multiplicity-one IRREDUCIBLE. This is a genuine multi-node ASCENT to the
g₂ invariant algebra (Mathlib has ZERO g₂ invariant theory). N235 banked the GENERATORS
(δ=gForm, φ=assoc3, ψ=coassoc4 all g₂-invariant). This node (N236) banks the NEXT forward
brick of that ascent.

## The count splits into TWO honest halves (multi-brick, W9.8 bank-as-you-go)
`dim End_{g₂}(7⊗7) = 4` is `4 ≤ dim` AND `dim ≤ 4`.

- LOWER bound `4 ≤ dim` — NEAR-FREE, and it is what THIS brick banks. The commutant
  `End_{g₂}(End ℚ ImO)` = `{T : End(End ℚ ImO) | ∀ D, adEnd D ∘ T = T ∘ adEnd D}` is a
  ℚ-subspace `commutantG2`. N233's four banked g₂-EQUIVARIANT projectors
  `![projTrivial, proj7, proj14, proj27]` all LIE in it (banked `*_equivariant`), and they are
  ℚ-LINEARLY INDEPENDENT (orthogonal idempotents: right-multiply a vanishing combination by
  `fourProj j`, orthogonality kills the off-diagonal, idempotency + `fourProj j ≠ 0` isolates
  `g j = 0`). Hence `4 = Fintype.card (Fin 4) ≤ finrank commutantG2` via
  `LinearIndependent.fintype_card_le_finrank`. No coordinate grind, all levers banked.

- UPPER bound `dim ≤ 4` — the genuine g₂ FIRST FUNDAMENTAL THEOREM hard core. `δ, φ` (banked
  g₂-invariant, N235) GENERATE all g₂-invariant tensors on the 7, and the independent degree-4
  contractions number exactly 4 (three δ-pairings (12)(34),(13)(24),(14)(23) + one φ·φ). This
  needs Mathlib-absent tensor-invariant machinery (the FFT itself). CHILDED as N237 on the tail.

## What THIS node banks (the LOWER-bound brick + the commutant object)
`Phys/Algebra/TowerGatherFFTCommutantG2.lean` (all foundations-only, over derived ℚ, O ℚ=CD(H ℚ)):
- `commutantG2` — the g₂-equivariant endomorphism space of `End ℚ ImO` as a `Submodule ℚ`.
- `projTrivial_mem_commutantG2`/`proj7_`/`proj14_`/`proj27_mem_commutantG2` — the four banked
  projectors lie in it (banked `*_equivariant`).
- `fourProj_mul_self` (idempotency), `fourProj_mul_ne` (orthogonality), `fourProj_ne_zero`
  (each projector nonzero via banked finrank-range ≠ 0), `fourProj_linearIndependent`.
- ★ `four_le_finrank_commutantG2 : 4 ≤ finrank ℚ commutantG2` — the FFT LOWER bound.

## The dissolution route the child (N237) serves
N237 (dedicated dissolution): the FFT UPPER bound `finrank commutantG2 ≤ 4` (equivalently
`dim (ImO^{⊗4})^{g₂} ≤ 4`) from the N235 generators — BUILD the tensor-invariant machinery
forward (W1 step 1). Then `finrank commutantG2 = 4` combines with N233's `IsInternal` +
distinct-dimension summands ⟹ each summand irreducible ⟹ `tracelessSym_irreducible` +
capstone `irreducible_clebsch_gordan_structure`.

## DISCIPLINE
Measure-first (W9): probe1 compiled standalone BEFORE promotion. No shrink to "semisimple",
no bridge, no assert, no weaken. Strand UNBROKEN (imports only banked N233 projectors +
N235 generators). Words-removable: every theorem TYPE mentions banked tower objects
(adEnd/derivationLieQ/fourProj/projTrivial/proj7/proj14/proj27/ImO) — no free-floating carrier.
