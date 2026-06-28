import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- banked: gFormC e2 e2 = 1
example : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 1 := e2_gFormC_self

/-- W8 concrete: the spacelike unit axis (banked mSpaceUnit = (0,1,0), BvC = −1). -/
example : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) = -1 := BvC_mSpaceUnit_self

/-- A GENUINELY NULL vector of `STVC`: `nullVec := (1,0,e2)`, `BvC nullVec nullVec = 0` — the null
    cone is genuine over the derived `Cut` (the obstruction N125's anisotropic oracle could not reach). -/
def nullVec : STVC := (1, 0, (CD.e2 : O Cut))

theorem BvC_nullVec_self : BvC (nullVec : STVC) (nullVec : STVC) = 0 := by
  show (1 : Cut) * 1 - 0 * 0 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 0
  rw [e2_gFormC_self]; ring

/-- The concrete isometric image `wVec := (1,1,e2) = mSpaceUnit + nullVec`. Its moved difference
    `wVec − mSpaceUnit = nullVec` is NULL, yet `BvC wVec wVec = −1 = BvC mSpaceUnit mSpaceUnit` (a
    legitimate isometric image). -/
def wVec : STVC := (1, 1, (CD.e2 : O Cut))

theorem BvC_wVec_self : BvC (wVec : STVC) (wVec : STVC) = -1 := by
  show (1 : Cut) * 1 - 1 * 1 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -1
  rw [e2_gFormC_self]; ring

/-- THE NULL MOVED DIFFERENCE: `wVec − mSpaceUnit = nullVec`, genuinely null. The N125 anisotropic
    oracle's hypothesis `BvC (wVec − mSpaceUnit) (wVec − mSpaceUnit) ≠ 0` FAILS here. -/
theorem wVec_sub_mSpaceUnit_null :
    BvC (wVec - mSpaceUnit) (wVec - mSpaceUnit) = 0 := by
  have h : (wVec : STVC) - mSpaceUnit = nullVec := by
    show ((1:Cut),(1:Cut),(CD.e2 : O Cut)) - (0,1,0) = ((1:Cut),0,(CD.e2 : O Cut))
    ext <;> simp
  rw [h, BvC_nullVec_self]

/-- The sum auxiliary `bVec := wVec + mSpaceUnit = (1,2,e2)` is ANISOTROPIC (`BvC = −4 ≠ 0`) — the
    null difference is peeled THROUGH this anisotropic sum. -/
def bVec : STVC := (1, 2, (CD.e2 : O Cut))

theorem BvC_bVec_self : BvC (bVec : STVC) (bVec : STVC) = -4 := by
  show (1 : Cut) * 1 - 2 * 2 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -4
  rw [e2_gFormC_self]; ring

theorem bVec_eq_sum : (bVec : STVC) = wVec + mSpaceUnit := by
  show ((1:Cut),(2:Cut),(CD.e2 : O Cut)) = (1,1,(CD.e2 : O Cut)) + (0,1,0)
  ext <;> simp <;> norm_num
  all_goals norm_num

/-- The sum reflection sends `wVec ↦ −mSpaceUnit` (the auxiliary step). `2·BvC bVec wVec = BvC bVec
    bVec` because `BvC wVec wVec = BvC mSpaceUnit mSpaceUnit` (isometric image). -/
theorem houseHolderM_bVec_wVec : houseHolderM (bVec : STVC) (wVec : STVC) = -mSpaceUnit := by
  have hbb : BvC (bVec : STVC) (bVec : STVC) ≠ 0 := by rw [BvC_bVec_self]; norm_num
  have hbw : BvC (bVec : STVC) (wVec : STVC) = -2 := by
    show (1 : Cut) * 1 - 2 * 1 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -2
    rw [e2_gFormC_self]; ring
  rw [houseHolderM_apply, hbw, BvC_bVec_self]
  have hc : 2 * ((-4 : Cut))⁻¹ * (-2) = 1 := by norm_num
  rw [hc, one_smul]
  show (wVec : STVC) - bVec = -mSpaceUnit
  rw [bVec_eq_sum]; abel

/-- ★★ W8 — THE NULL-DIFFERENCE TWO-REFLECTION PEEL on a CONCRETE genuinely-indefinite witness: the
    composite `houseHolderM mSpaceUnit ∘ houseHolderM bVec` sends `wVec` back to `mSpaceUnit`, EVEN
    THOUGH the moved difference `wVec − mSpaceUnit = nullVec` is NULL. The single-reflection N125
    oracle is inapplicable (its anisotropy hypothesis fails, `wVec_sub_mSpaceUnit_null`); the null
    obstruction dissolves through the anisotropic sum auxiliary `bVec`. -/
theorem houseHolderM_null_two_reflection_witness :
    houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC)) = mSpaceUnit := by
  rw [houseHolderM_bVec_wVec, map_neg, houseHolderM_neg_self, neg_neg]
  rw [BvC_mSpaceUnit_self]; norm_num

/-- ★ W8 TEETH — the Minkowski self-overlap of the peeled image reads `−1` (= `BvC mSpaceUnit
    mSpaceUnit`), NOT `126`. The distinguishing read-off for the costume. -/
theorem houseHolderM_null_peel_self_overlap :
    BvC (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC)))
        (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC))) = -1 := by
  rw [houseHolderM_null_two_reflection_witness, BvC_mSpaceUnit_self]

end

end Phys.Algebra
