/-
  Counterexamples.TowerGatherAmbientProjection1And27WrongValueCostume — N232 anti-vacuity (C264).
  ===========================================================================
  W8 ANTI-VACUITY. The N232 node banks the AMBIENT g₂-EQUIVARIANT TRACELESS-SYMMETRIC PROJECTOR
  `proj27 : End ℚ ImO → End ℚ ImO`: over the banked octonion rung `O Q` with the banked fundamental
  7-module `ImO` (N22), the Born form `bornBil` (N223/N225), N230's `projSym` and N228's `trivialLine`/
  `tracelessSym`, the difference `proj27 = projSym − projTrivial` retracts the whole `End ℚ ImO` onto
  the traceless-symmetric 27 `tracelessSym`. Its range is GENUINELY the FULL 27-dimensional
  traceless-symmetric side (banked `finrank_tracelessSym_eq_27`, N228):

      finrank Q (range proj27) = 27   (`finrank_proj27_range`, TRUE),

  the projector is neither degenerate (range 0) nor onto the whole Sym²7 (28) / End (49) — it lands
  exactly on the 27-dim traceless-symmetric summand.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the traceless-symmetric retraction collapses /
  lands on the whole Sym²7 (28) / the whole End (49) / has some dimension other than 27): that this
  dimension equals (264 : N). Rewriting the banked value shows the bogus claim reduces to the false
  numeric `27 = 264` in N. The kernel cannot close it; the costume BITES (lean leaves the unsolved
  false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (range proj27)` is genuinely 27 (banked `finrank_proj27_range`), so claiming it
  is 264 is genuinely FALSE (27 /= 264).

  DISTINCT from the banked battery (... C262 = 28=262, C263 = 7=263): the pair (264, 27) is fresh
  (RHS 264 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the ambient traceless-symmetric projector's range is the full 27-dimensional
    traceless-symmetric side (banked `finrank_proj27_range`). -/
theorem proj27_range_dim_true :
    Module.finrank ℚ (LinearMap.range proj27) = 27 :=
  Phys.Algebra.finrank_proj27_range

/-- BOGUS: claims the ambient traceless-symmetric projector's range has dimension `264`. It GENUINELY
    equals `27` (`proj27_range_dim_true`). The WRONG claim (the retraction collapses / lands on the
    whole Sym²7 (28) / the whole End (49) / is not the 27-dim traceless-symmetric summand) reduces —
    through the banked value — to the false numeric `27 = 264`, so this must NOT compile. -/
theorem proj27_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range proj27) = 264 := by
  rw [proj27_range_dim_true]
  -- ⊢ (27 : ℕ) = 264  (FALSE — the costume bites)

end Counterexamples
