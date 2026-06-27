import Phys.Algebra.LorentzContinuumSpectralExistFull
import Phys.Algebra.LorentzContinuumEigenExtract

namespace CostumeProbe
open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- TRUE value: read the appended eigenvalue 4 from the snoc reconstruction onto the unit mixB.
theorem true_val :
    EvC (specOpN (Fin.snoc (![] : Fin 0 → Cut) (4:Cut)) (Fin.snoc (![] : Fin 0 → STVC) mixB) mixB) mixB
      = 4 := by
  rw [specOpN_snoc]
  simp only [LinearMap.add_apply, LinearMap.smul_apply]
  have hz : specOpN (![] : Fin 0 → Cut) (![] : Fin 0 → STVC) = 0 := by simp [specOpN]
  rw [hz]
  simp only [LinearMap.zero_apply, zero_add]
  rw [projC_apply, mixB_norm, one_smul, EvC_smul_left, mixB_norm, mul_one]

#print axioms true_val
end
end CostumeProbe
