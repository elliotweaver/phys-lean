import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

#check @LinearMap.trace_prodMap
#check @LinearMap.trace_id

example : Module.finrank ℚ (ℚ × Dbl ℚ) = 3 := by
  rw [Module.finrank_prod, finrank_dbl_eq_two]; norm_num

def sM (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)

example (rho P : ℚ) : LinearMap.trace ℚ STV4 (sM rho P) = rho - 3 * P := by
  unfold sM
  sorry

end Phys.Algebra.Probe
