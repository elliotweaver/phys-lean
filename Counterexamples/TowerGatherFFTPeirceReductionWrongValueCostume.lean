/-
  Counterexamples.TowerGatherFFTPeirceReductionWrongValueCostume — N237 anti-vacuity (C268).
  ===========================================================================
  W8 ANTI-VACUITY. The N237 node banks the PEIRCE REDUCTION of the g₂-equivariant endomorphism
  algebra `commutantG2 = End_{g₂}(End ℚ ImO)` and the sharpening of the FFT UPPER bound. A key
  UNCONDITIONAL fact is `finrank_commutantSpan_le_four` : `finrank ℚ commutantSpan ≤ 4`, where
  `commutantSpan` is the ℚ-span of the four banked projectors inside `End ℚ (End ℚ ImO)`. The bound
  has genuine content: a span of four vectors has dimension at most four (`finrank_range_le_card`),
  and (banked N236) those four vectors are linearly independent, so the dimension is EXACTLY four.

  The bound `finrank ℚ commutantSpan ≤ 4` is not vacuous, so the anchor is the genuine inequality
  itself, packaged as the clean equality `min (finrank ℚ commutantSpan) 4 = finrank ℚ commutantSpan`
  (which holds precisely BECAUSE `finrank ℚ commutantSpan ≤ 4`, banked `finrank_commutantSpan_le_four`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the span is bigger than four / the four
  projectors do NOT bound the dimension / the Peirce reduction miscounts the corners): that
  `min (finrank ℚ commutantSpan) 4` equals `268`. It GENUINELY equals `finrank ℚ commutantSpan`
  (`commutantSpan_finrank_min_true`), which is `≤ 4 < 268`. Rewriting the banked value reduces the
  bogus claim to the false numeric goal `finrank ℚ commutantSpan = 268` in ℕ (with the banked
  `finrank ℚ commutantSpan ≤ 4` on record). The kernel cannot close it; the costume BITES (lean
  leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the span of the four
  banked projectors genuinely has dimension `≤ 4`, so `min (finrank ℚ commutantSpan) 4 =
  finrank ℚ commutantSpan ≤ 4`, and claiming this min equals `268` is genuinely FALSE.

  DISTINCT from the banked battery (... C266 = 1=266, C267 = 4=267): the RHS `268` is fresh
  (distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherFFTPeirceReduction

namespace Counterexamples

open Phys.Algebra

/-- TRUE: `min (finrank ℚ commutantSpan) 4 = finrank ℚ commutantSpan`, holding precisely because the
    span of the four banked projectors has dimension at most four (banked
    `finrank_commutantSpan_le_four`). -/
theorem commutantSpan_finrank_min_true :
    min (Module.finrank ℚ commutantSpan) 4 = Module.finrank ℚ commutantSpan := by
  have h : Module.finrank ℚ commutantSpan ≤ 4 := finrank_commutantSpan_le_four
  omega

/-- BOGUS: claims `min (finrank ℚ commutantSpan) 4 = 268`. It GENUINELY equals
    `finrank ℚ commutantSpan` (`commutantSpan_finrank_min_true`), which is `≤ 4 < 268`. The WRONG
    claim (the span exceeds four / the Peirce corner count is wrong) reduces — through the banked
    value — to the false numeric goal `finrank ℚ commutantSpan = 268`, so this must NOT compile. -/
theorem commutantSpan_finrank_wrong_BOGUS :
    min (Module.finrank ℚ commutantSpan) 4 = 268 := by
  rw [commutantSpan_finrank_min_true]
  -- ⊢ Module.finrank ℚ commutantSpan = 268  (FALSE — the costume bites)

end Counterexamples
