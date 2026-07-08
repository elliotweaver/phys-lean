import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def pfStress (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)

noncomputable def eosDensity (S : STV4 →ₗ[ℚ] STV4) : ℚ := (S (1,0,0)).1
noncomputable def eosPressure (S : STV4 →ₗ[ℚ] STV4) : ℚ := -(S (0,1,0)).2.1
noncomputable def eosState (S : STV4 →ₗ[ℚ] STV4) : ℚ := eosPressure S / eosDensity S

theorem eosDensity_pf (rho P : ℚ) : eosDensity (pfStress rho P) = rho := by
  simp [eosDensity, pfStress, LinearMap.prodMap_apply]
theorem eosPressure_pf (rho P : ℚ) : eosPressure (pfStress rho P) = P := by
  simp [eosPressure, pfStress, LinearMap.prodMap_apply]
theorem eosState_pf (rho P : ℚ) : eosState (pfStress rho P) = P / rho := by
  rw [eosState, eosDensity_pf, eosPressure_pf]

theorem eos_dust (rho : ℚ) : eosState (pfStress rho 0) = 0 := by
  rw [eosState_pf]; simp
theorem eos_radiation (rho : ℚ) (h : rho ≠ 0) : eosState (pfStress rho (rho/3)) = 1/3 := by
  rw [eosState_pf]; field_simp
theorem eos_vacuum (rho : ℚ) (h : rho ≠ 0) : eosState (pfStress rho (-rho)) = -1 := by
  rw [eosState_pf]; field_simp

-- trace / tracelessness → w = 1/n with n = derived spacelike dim
theorem eos_trace (rho P : ℚ) : LinearMap.trace ℚ STV4 (pfStress rho P) = rho - 3 * P := by
  unfold pfStress
  rw [LinearMap.trace_prodMap', map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id,
      Module.finrank_prod, finrank_dbl_eq_two, Module.finrank_self]
  simp only [smul_eq_mul]; push_cast; ring

-- tracelessness forces rho = 3 P, and then w = 1/3
theorem traceless_forces (rho P : ℚ) (h : LinearMap.trace ℚ STV4 (pfStress rho P) = 0) :
    rho = 3 * P := by
  rw [eos_trace] at h; linarith
theorem eos_radiation_from_traceless (rho P : ℚ) (hr : rho ≠ 0)
    (h : LinearMap.trace ℚ STV4 (pfStress rho P) = 0) : eosState (pfStress rho P) = 1/3 := by
  rw [eosState_pf]
  have := traceless_forces rho P h
  field_simp
  linarith

end Phys.Algebra.Probe
