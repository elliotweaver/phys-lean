import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank
namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
def pfStress (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)
theorem vacuum_eq_smul_id (rho : ℚ) : pfStress rho (-rho) = rho • LinearMap.id := by
  unfold pfStress; ext p <;> simp [LinearMap.prodMap_apply]
theorem trace_dust (rho : ℚ) : LinearMap.trace ℚ STV4 (pfStress rho 0) = rho := by
  unfold pfStress
  rw [LinearMap.trace_prodMap', map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id]; simp
theorem trace_vac (rho : ℚ) : LinearMap.trace ℚ STV4 (pfStress rho (-rho)) = 4 * rho := by
  unfold pfStress
  rw [LinearMap.trace_prodMap', map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id,
      Module.finrank_prod, finrank_dbl_eq_two, Module.finrank_self]
  simp only [smul_eq_mul]; push_cast; ring
theorem finrank_STV4 : Module.finrank ℚ STV4 = 4 := by
  simp [STV4, Module.finrank_prod, finrank_dbl_eq_two]
#print axioms vacuum_eq_smul_id
#print axioms trace_vac
end Phys.Algebra.Probe
