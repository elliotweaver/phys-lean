import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def octPlaneRot (e f : O Cut) (c s : Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := v + ((c - 1) * gFormC v e - s * gFormC v f) • e
               + (s * gFormC v e + (c - 1) * gFormC v f) • f
  map_add' v w := by
    simp only [gFormC_add_left]
    rw [show ((c - 1) * (gFormC v e + gFormC w e) - s * (gFormC v f + gFormC w f))
          = ((c - 1) * gFormC v e - s * gFormC v f) + ((c - 1) * gFormC w e - s * gFormC w f) by ring,
        show (s * (gFormC v e + gFormC w e) + (c - 1) * (gFormC v f + gFormC w f))
          = (s * gFormC v e + (c - 1) * gFormC v f) + (s * gFormC w e + (c - 1) * gFormC w f) by ring,
        add_smul, add_smul]
    abel
  map_smul' a v := by
    simp only [gFormC_smul_left, RingHom.id_apply, smul_add]
    rw [show ((c - 1) * (a * gFormC v e) - s * (a * gFormC v f))
          = a * ((c - 1) * gFormC v e - s * gFormC v f) by ring,
        show (s * (a * gFormC v e) + (c - 1) * (a * gFormC v f))
          = a * (s * gFormC v e + (c - 1) * gFormC v f) by ring,
        smul_smul, smul_smul]

theorem octPlaneRot_apply (e f : O Cut) (c s : Cut) (v : O Cut) :
    octPlaneRot e f c s v
      = v + ((c - 1) * gFormC v e - s * gFormC v f) • e
          + (s * gFormC v e + (c - 1) * gFormC v f) • f := rfl

theorem gFormC_twoaxis_expand (e f v w : O Cut) (α β γ δ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) :
    gFormC (v + α • e + β • f) (w + γ • e + δ • f)
      = gFormC v w + γ * gFormC v e + δ * gFormC v f
        + α * gFormC w e + β * gFormC w f
        + α * γ + β * δ := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
    hee, hff, hef, hfe]
  rw [gFormC_symm e w, gFormC_symm f w]
  ring

/-- ★★ T2 — `octPlaneRot e f c s` is a `gFormC`-isometry for ORTHONORMAL e,f and a circle point. -/
theorem octPlaneRot_isGFormCIsom (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    IsGFormCIsom (octPlaneRot e f c s) := by
  intro v w
  rw [octPlaneRot_apply, octPlaneRot_apply]
  rw [gFormC_twoaxis_expand e f v w
        ((c - 1) * gFormC v e - s * gFormC v f) (s * gFormC v e + (c - 1) * gFormC v f)
        ((c - 1) * gFormC w e - s * gFormC w f) (s * gFormC w e + (c - 1) * gFormC w f)
        hee hff hef]
  have hc2 : c ^ 2 = 1 - s ^ 2 := by linarith
  linear_combination (gFormC v e * gFormC w e + gFormC v f * gFormC w f) * hcs

end
end Phys.Algebra
