import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Production def: mixed stress as a prodMap (cleanest for trace + readings both).
def pfStress (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)

noncomputable def eosDensity (S : STV4 →ₗ[ℚ] STV4) : ℚ := (S (1,0,0)).1
noncomputable def eosPressure (S : STV4 →ₗ[ℚ] STV4) : ℚ := -(S (0,1,0)).2.1
noncomputable def eosState (S : STV4 →ₗ[ℚ] STV4) : ℚ := eosPressure S / eosDensity S

-- readings on the prodMap form
example (rho P : ℚ) : eosDensity (pfStress rho P) = rho := by
  simp [eosDensity, pfStress, LinearMap.prodMap_apply]
example (rho P : ℚ) : eosPressure (pfStress rho P) = P := by
  simp [eosPressure, pfStress, LinearMap.prodMap_apply]

-- trace
example (rho P : ℚ) : LinearMap.trace ℚ STV4 (pfStress rho P) = rho - 3 * P := by
  unfold pfStress
  rw [LinearMap.trace_prodMap', map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id,
      Module.finrank_prod, finrank_dbl_eq_two, Module.finrank_self]
  simp only [smul_eq_mul]
  push_cast; ring

-- w's
example (rho : ℚ) (h : rho ≠ 0) : eosState (pfStress rho 0) = 0 := by
  simp [eosState, eosDensity, eosPressure, pfStress, LinearMap.prodMap_apply]
example (rho : ℚ) (h : rho ≠ 0) : eosState (pfStress rho (rho/3)) = 1/3 := by
  unfold eosState eosPressure eosDensity pfStress
  simp only [LinearMap.prodMap_apply, LinearMap.smul_apply, LinearMap.id_coe, id_eq]
  rw [show ((1:ℚ),(0:ℚ),(0:Dbl ℚ)).1 = 1 from rfl]
  field_simp
  ring
example (rho : ℚ) (h : rho ≠ 0) : eosState (pfStress rho (-rho)) = -1 := by
  unfold eosState eosPressure eosDensity pfStress
  simp only [LinearMap.prodMap_apply, LinearMap.smul_apply, LinearMap.id_coe, id_eq]
  field_simp

end Phys.Algebra.Probe
