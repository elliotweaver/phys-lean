import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

#check @LinearMap.trace_prodMap'
#check @LinearMap.map_smul  -- trace is linear map so map_smul works
example (rho : ℚ) : LinearMap.trace ℚ (Dbl ℚ) (rho • LinearMap.id) = rho * 2 := by
  rw [map_smul, LinearMap.trace_id, finrank_dbl_eq_two]; norm_num

def sM (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)

example (rho P : ℚ) : LinearMap.trace ℚ STV4 (sM rho P) = rho - 3 * P := by
  unfold sM
  rw [LinearMap.trace_prodMap']
  rw [map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id]
  rw [Module.finrank_prod, finrank_dbl_eq_two, Module.finrank_self]
  push_cast
  ring

end Phys.Algebra.Probe
