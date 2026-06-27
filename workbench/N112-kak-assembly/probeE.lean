import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem biMulLin_apply' (u u' : O Cut) (t x : Cut) (v : O Cut) :
    biMulLin u u' (t, x, v) = (t, x, u * (v * u')) := rfl

/-- The v-block linear map of `biMulLin u u'`: `v ↦ u·(v·u')`. -/
def biMulV (u u' : O Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := u * (v * u')
  map_add' p q := by show u * ((p + q) * u') = u * (p * u') + u * (q * u'); rw [add_mul, mul_add]
  map_smul' c v := by
    have hsc := smulCompat_oCut
    show u * ((c • v) * u') = c • (u * (v * u'))
    rw [hsc.hl c v u', hsc.hr c u (v * u')]

theorem biMulV_apply (u u' v : O Cut) : biMulV u u' v = u * (v * u') := rfl

/-- The v-block of `genTwoPlaneLin u w` is `biMulV w w ∘ biMulV u u`. -/
def vTwoPlane (u w : O Cut) : O Cut →ₗ[Cut] O Cut := (biMulV w w).comp (biMulV u u)

theorem genTwoPlaneLin_vblock (u w : O Cut) (t x : Cut) (v : O Cut) :
    genTwoPlaneLin u w (t, x, v) = (t, x, vTwoPlane u w v) := by
  rw [genTwoPlaneLin, Module.End.mul_apply, biMulLin_apply', biMulLin_apply',
      vTwoPlane, LinearMap.comp_apply, biMulV_apply, biMulV_apply]

/-- The v-block fixes 1 for imaginary units (linearity route, no octonion mul_neg). -/
theorem vTwoPlane_fix_one (u w : O Cut) (hu : u * u = -1) (hw : w * w = -1) :
    vTwoPlane u w 1 = 1 := by
  rw [vTwoPlane, LinearMap.comp_apply]
  have hin : biMulV u u 1 = -1 := by rw [biMulV_apply, one_mul, hu]
  rw [hin, map_neg, biMulV_apply, one_mul, hw, neg_neg]

end

end Phys.Algebra
