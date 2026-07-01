/-
  Counterexamples.TowerGatherCanonicalDirectSumWrongValueCostume — N233 anti-vacuity (C265).
  ===========================================================================
  W8 ANTI-VACUITY. The N233 node banks the CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM
  `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`: over the banked octonion rung `O Q` with the banked fundamental
  7-module `ImO` (N22), the four g₂-submodules `![trivialLine, range crossEmb, range imRepL,
  tracelessSym]` of `End ℚ ImO` form a Mathlib internal direct sum, and their dimensions add to the
  full ambient dimension — the independent CONSISTENCY witness of the decomposition:

      finrank Q (fourSummands 0) + finrank Q (fourSummands 1) + finrank Q (fourSummands 2)
        + finrank Q (fourSummands 3) = 1 + 7 + 14 + 27 = 49 = finrank Q (End ℚ ImO)
      (`fourSummands_finrank_sum`, TRUE, with the summand dims 1/7/14/27 by
       `fourSummands_finrank_values`),

  the four summands neither overlapping (their dims would then under-sum) nor over-counting — they
  tile the whole `7 ⊗ 7 = 49` exactly.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the four summands overlap / fail to span / the
  total dimension is anything other than 49): that this total dimension equals (265 : N). Rewriting
  the banked value shows the bogus claim reduces to the false numeric `49 = 265` in N. The kernel
  cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  four submodules genuinely have dimensions summing to `finrank Q (End ℚ ImO) = 49` (banked
  `fourSummands_finrank_sum`), so claiming this equals 265 is genuinely FALSE (49 /= 265).

  DISTINCT from the banked battery (... C263 = 7=263, C264 = 27=264): the pair (265, 49) is fresh
  (RHS 265 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherCanonicalDirectSum

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the four summand dimensions add to the full ambient dimension `49`
    (banked `fourSummands_finrank_sum` composed with `finrank_end_eq_49`). -/
theorem fourSummands_total_dim_true :
    Module.finrank ℚ (fourSummands 0) + Module.finrank ℚ (fourSummands 1)
      + Module.finrank ℚ (fourSummands 2) + Module.finrank ℚ (fourSummands 3)
    = 49 := by
  rw [fourSummands_finrank_sum]; exact finrank_end_eq_49

/-- BOGUS: claims the four summand dimensions add to `265`. They GENUINELY add to `49`
    (`fourSummands_total_dim_true`). The WRONG claim (the summands overlap / fail to span / the total
    is not 49) reduces — through the banked value — to the false numeric `49 = 265`, so this must NOT
    compile. -/
theorem fourSummands_total_dim_wrong_BOGUS :
    Module.finrank ℚ (fourSummands 0) + Module.finrank ℚ (fourSummands 1)
      + Module.finrank ℚ (fourSummands 2) + Module.finrank ℚ (fourSummands 3)
    = 265 := by
  rw [fourSummands_total_dim_true]
  -- ⊢ (49 : ℕ) = 265  (FALSE — the costume bites)

end Counterexamples
