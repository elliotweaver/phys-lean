import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation
import Phys.Algebra.LorentzContinuumSpin9Product

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- minimal re-decls for the probe (copy from Probe4)
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

/-! ## T7 measure — the concrete quarter-turn moves e2 to je2 in the octonion block. -/

-- octPlaneRot e2 je2 0 1 e2 = je2
theorem octPlaneRot_e2je2_quarter_moves :
    octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1 (CD.e2 : O Cut) = (je2 : O Cut) := by
  rw [octPlaneRot_apply, e2_gFormC_self, octDeflate_e2_je2_gFormC_zero]
  -- v + ((0-1)*1 - 1*0)•e2 + (1*1 + (0-1)*0)•je2 = e2 - e2 + je2
  rw [show ((0:Cut) - 1) * 1 - 1 * 0 = -1 by ring, show (1:Cut) * 1 + (0 - 1) * 0 = 1 by ring]
  rw [neg_one_smul, one_smul]
  abel

-- the lifted quarter-turn sends (0,0,e2) to (0,0,je2), reading 1 on the je2 slot
theorem octBlockEndC_octPlaneRot_e2je2_moves_read :
    gFormC ((octBlockEndC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1)
      ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2) (je2 : O Cut) = 1 := by
  rw [octBlockEndC_apply]
  show gFormC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1 (CD.e2 : O Cut)) (je2 : O Cut) = 1
  rw [octPlaneRot_e2je2_quarter_moves, je2_gFormC_self]

end
end Phys.Algebra
