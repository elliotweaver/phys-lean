/-
  Counterexamples.TowerGatherAmbientProjection7And14WrongValueCostume — N231 anti-vacuity (C263).
  ===========================================================================
  W8 ANTI-VACUITY. The N231 node banks the AMBIENT g₂-EQUIVARIANT FUNDAMENTAL-7 PROJECTOR
  `proj7 : End ℚ ImO → End ℚ ImO`: over the banked octonion rung `O Q` with the banked fundamental
  7-module `ImO` (N22), the Born form `bornBil` (N223/N225), N229's `projSo7` and N226's `projFun`,
  the composite `proj7 = subtype ∘ projFun ∘ codRestrict projSo7` retracts the whole `End ℚ ImO`
  onto the fundamental 7 `range crossEmb`. Its range is GENUINELY the FULL 7-dimensional fundamental
  (banked `finrank_crossEmb_range`, N224):

      finrank Q (range proj7) = 7   (`finrank_proj7_range`, TRUE),

  the projector is neither degenerate (range 0) nor onto the whole so(7) (21) / End (49) — it lands
  exactly on the 7-dim fundamental summand.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the ambient fundamental-7 retraction collapses /
  lands on the whole so(7) (21) / the whole End (49) / has some dimension other than 7): that this
  dimension equals (263 : N). Rewriting the banked value shows the bogus claim reduces to the false
  numeric `7 = 263` in N. The kernel cannot close it; the costume BITES (lean leaves the unsolved
  false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (range proj7)` is genuinely 7 (banked `finrank_proj7_range`), so claiming it
  is 263 is genuinely FALSE (7 /= 263).

  DISTINCT from the banked battery (... C261 = 21=261, C262 = 28=262): the pair (263, 7) is fresh
  (RHS 263 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherAmbientProjection7And14

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the ambient fundamental-7 projector's range is the full 7-dimensional fundamental
    (banked `finrank_proj7_range`). -/
theorem proj7_range_dim_true :
    Module.finrank ℚ (LinearMap.range proj7) = 7 :=
  Phys.Algebra.finrank_proj7_range

/-- BOGUS: claims the ambient fundamental-7 projector's range has dimension `263`. It GENUINELY
    equals `7` (`proj7_range_dim_true`). The WRONG claim (the retraction collapses / lands on the
    whole so(7) (21) / the whole End (49) / is not the 7-dim fundamental summand) reduces — through
    the banked value — to the false numeric `7 = 263`, so this must NOT compile. -/
theorem proj7_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range proj7) = 263 := by
  rw [proj7_range_dim_true]
  -- ⊢ (7 : ℕ) = 263  (FALSE — the costume bites)

end Counterexamples
