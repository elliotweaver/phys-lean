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

/-! ## T2: the isometry. Measure the gFormC of two images.

For orthonormal e,f (gFormC e e = gFormC f f = 1, gFormC e f = 0) and circle point c²+s²=1,
gFormC (R v) (R w) = gFormC v w.

Strategy: expand gFormC (R v) (R w) by full bilinearity into a polynomial in the six scalars
a:=gFormC v e, b:=gFormC v f, p:=gFormC w e, q:=gFormC w f, and the cross term gFormC v w; then
the e,f-orthonormality + c²+s²=1 collapse it to gFormC v w. Try `ring`/`nlinarith` on the field
goal after rewriting with the bilinear lemmas. MEASURE the cost. -/

-- helper: gFormC of (v + α•e + β•f) (w + γ•e + δ•f) under orthonormal e,f
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

end
end Phys.Algebra
