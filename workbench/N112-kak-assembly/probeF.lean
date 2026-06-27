import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- Polarization: diagonal gFormC-preservation ⟹ bilinear preservation. -/
theorem polarize (T : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (T v) (T v) = gFormC v v) (a b : O Cut) :
    gFormC (T a) (T b) = gFormC a b := by
  have hab := hdiag (a + b)
  rw [map_add] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [hdiag a, hdiag b, gFormC_symm (T b) (T a), gFormC_symm b a] at hab
  linarith [hab]

def biMulV (u u' : O Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := u * (v * u')
  map_add' p q := by show u * ((p + q) * u') = u * (p * u') + u * (q * u'); rw [add_mul, mul_add]
  map_smul' c v := by
    have hsc := smulCompat_oCut
    show u * ((c • v) * u') = c • (u * (v * u'))
    rw [hsc.hl c v u', hsc.hr c u (v * u')]

theorem biMulV_apply (u u' v : O Cut) : biMulV u u' v = u * (v * u') := rfl

def vTwoPlane (u w : O Cut) : O Cut →ₗ[Cut] O Cut := (biMulV w w).comp (biMulV u u)

theorem vTwoPlane_apply (u w v : O Cut) : vTwoPlane u w v = w * ((u * (v * u)) * w) := rfl

/-- The v-block preserves gFormC diagonally: from biMulFun_isom (the v-block of biMulFun u u'
    preserves gFormC). gFormC (vTwoPlane u w v)(vTwoPlane u w v) = gFormC v v for born units. -/
theorem vTwoPlane_gFormC_diag (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (v : O Cut) :
    gFormC (vTwoPlane u w v) (vTwoPlane u w v) = gFormC v v := by
  rw [vTwoPlane_apply]
  rw [biMul_gFormC w (w) (u * (v * u)), hw, biMul_gFormC u u v, hu]
  ring

/-- reQC preservation: reQC x = gFormC x 1 (gFormC_one_right), vTwoPlane fixes 1, preserves gFormC bilinearly. -/
theorem vTwoPlane_reQC (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (h1 : vTwoPlane u w 1 = 1) (v : O Cut) :
    reQC (vTwoPlane u w v) = reQC v := by
  have hpol := polarize (vTwoPlane u w) (vTwoPlane_gFormC_diag u w hu hw) v 1
  rw [h1] at hpol
  rw [← gFormC_one_right, ← gFormC_one_right v]
  exact hpol

end

end Phys.Algebra
