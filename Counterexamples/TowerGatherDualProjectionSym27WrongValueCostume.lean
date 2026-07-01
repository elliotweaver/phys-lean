/-
  Counterexamples.TowerGatherDualProjectionSym27WrongValueCostume — N230 anti-vacuity (C262).
  ===========================================================================
  W8 ANTI-VACUITY. The N230 node banks the g₂-EQUIVARIANT DUAL PROJECTOR `End ℚ ImO → Sym²7` along
  `so(7)`: over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22), the
  Born form `bornBil` (N223/N225) and the N227 direct-sum `End = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`, the
  linear projection `projSym` retracts the whole `End ℚ ImO` onto `Sym²7`, the complementary partner
  of N229's `projSo7`. Its range is GENUINELY the FULL 28-dimensional `Sym²7` (banked
  `finrank_selfAdj_eq_28`, N227):

      finrank Q (range projSym) = 28   (`finrank_projSym_range`, TRUE),

  the projector is neither degenerate (range 0) nor onto the whole 49 — it lands exactly on the
  28-dim symmetric summand.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the dual retraction collapses / lands on the whole
  End (49) / has some dimension other than 28): that this dimension equals (262 : N). Rewriting the
  banked value shows the bogus claim reduces to the false numeric `28 = 262` in N. The kernel cannot
  close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (range projSym)` is genuinely 28 (banked `finrank_projSym_range`), so
  claiming it is 262 is genuinely FALSE (28 /= 262).

  DISTINCT from the banked battery (... C260 = 27=260, C261 = 21=261): the pair (262, 28) is fresh
  (RHS 262 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherDualProjectionSym27

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the dual projector's range is the full 28-dimensional `Sym²7` (banked `finrank_projSym_range`). -/
theorem projSym_range_dim_true :
    Module.finrank ℚ (LinearMap.range projSym) = 28 :=
  Phys.Algebra.finrank_projSym_range

/-- BOGUS: claims the dual projector's range has dimension `262`. It GENUINELY equals `28`
    (`projSym_range_dim_true`). The WRONG claim (the retraction collapses / lands on the whole 49 /
    is not the 28-dim Sym²7 summand) reduces — through the banked value — to the false numeric
    `28 = 262`, so this must NOT compile. -/
theorem projSym_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range projSym) = 262 := by
  rw [projSym_range_dim_true]
  -- ⊢ (28 : ℕ) = 262  (FALSE — the costume bites)

end Counterexamples
