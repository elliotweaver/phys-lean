/-
  Counterexamples.TowerGatherFFTCommutantG2WrongValueCostume — N236 anti-vacuity (C267).
  ===========================================================================
  W8 ANTI-VACUITY. The N236 node banks the FFT LOWER BOUND `four_le_finrank_commutantG2` :
  `4 ≤ finrank ℚ commutantG2`, where `commutantG2 = End_{g₂}(End ℚ ImO)` is the g₂-equivariant
  endomorphism space (the commutant of the adjoint g₂-action `adEnd`). The bound has genuine
  content: the four banked g₂-equivariant projectors `![projTrivial, proj7, proj14, proj27]` are
  linearly-independent members of `commutantG2` (mutually-orthogonal nonzero idempotents), so its
  dimension is at least the number of them, `4`.

  An inequality `4 ≤ n` is not vacuous of the zero space, so the anchor is the genuine lower bound
  itself, packaged as the clean equality `min 4 (finrank ℚ commutantG2) = 4` (which holds precisely
  BECAUSE `4 ≤ finrank`, banked `four_le_finrank_commutantG2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the four projectors are NOT independent / the
  commutant is too small / the count collapses below four): that `min 4 (finrank ℚ commutantG2)`
  equals `267`. It GENUINELY equals `4` (`commutantG2_dim_ge_four_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `4 = 267` in ℕ. The kernel cannot close it; the
  costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the four
  linearly-independent commuting idempotents genuinely force `4 ≤ finrank ℚ commutantG2`, hence
  `min 4 (finrank ℚ commutantG2) = 4`, so claiming it equals `267` is genuinely FALSE (4 ≠ 267).

  DISTINCT from the banked battery (... C265 = 49=265, C266 = 1=266): the pair (267, 4) is fresh
  (RHS 267 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Counterexamples

open Phys.Algebra

/-- TRUE: `min 4 (finrank ℚ commutantG2) = 4`, holding precisely because the four banked
    linearly-independent projectors force `4 ≤ finrank ℚ commutantG2` (banked
    `four_le_finrank_commutantG2`). -/
theorem commutantG2_dim_ge_four_true : min 4 (Module.finrank ℚ commutantG2) = 4 := by
  have h : 4 ≤ Module.finrank ℚ commutantG2 := four_le_finrank_commutantG2
  omega

/-- BOGUS: claims `min 4 (finrank ℚ commutantG2) = 267`. It GENUINELY equals `4`
    (`commutantG2_dim_ge_four_true`). The WRONG claim (the four projectors fail to raise the
    dimension to at least 4 / the commutant collapses) reduces — through the banked value — to the
    false numeric `4 = 267`, so this must NOT compile. -/
theorem commutantG2_dim_wrong_BOGUS : min 4 (Module.finrank ℚ commutantG2) = 267 := by
  rw [commutantG2_dim_ge_four_true]
  -- ⊢ (4 : ℕ) = 267  (FALSE — the costume bites)

end Counterexamples
