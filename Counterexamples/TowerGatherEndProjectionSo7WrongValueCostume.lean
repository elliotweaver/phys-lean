/-
  Counterexamples.TowerGatherEndProjectionSo7WrongValueCostume — N229 anti-vacuity (C261).
  ===========================================================================
  W8 ANTI-VACUITY. The N229 node banks the g₂-EQUIVARIANT PROJECTOR `End ℚ ImO → so(7)` along
  `Sym²7`: over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22),
  the Born form `bornBil` (N223/N225) and the N227 direct-sum `End = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`,
  the linear projection `projSo7` retracts the whole `End ℚ ImO` onto so(7). Its range is GENUINELY
  the FULL 21-dimensional so(7) (banked `finrank_so7_eq_21`, N225):

      finrank Q (range projSo7) = 21   (`finrank_projSo7_range`, TRUE),

  the projector is neither degenerate (range 0) nor onto the whole 49 — it lands exactly on the
  21-dim so(7) summand.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the retraction collapses / lands on the whole
  End (49) / has some dimension other than 21): that this dimension equals (261 : N). Rewriting the
  banked value shows the bogus claim reduces to the false numeric `21 = 261` in N. The kernel cannot
  close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (range projSo7)` is genuinely 21 (banked `finrank_projSo7_range`), so
  claiming it is 261 is genuinely FALSE (21 /= 261).

  DISTINCT from the banked battery (... C259 = 28=259, C260 = 27=260): the pair (261, 21) is fresh
  (RHS 261 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherEndProjectionSo7

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the projector's range is the full 21-dimensional so(7) (banked `finrank_projSo7_range`). -/
theorem projSo7_range_dim_true :
    Module.finrank ℚ (LinearMap.range projSo7) = 21 :=
  Phys.Algebra.finrank_projSo7_range

/-- BOGUS: claims the projector's range has dimension `261`. It GENUINELY equals `21`
    (`projSo7_range_dim_true`). The WRONG claim (the retraction collapses / lands on the whole 49 /
    is not the 21-dim so(7) summand) reduces — through the banked value — to the false numeric
    `21 = 261`, so this must NOT compile. -/
theorem projSo7_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range projSo7) = 261 := by
  rw [projSo7_range_dim_true]
  -- ⊢ (21 : ℕ) = 261  (FALSE — the costume bites)

end Counterexamples
