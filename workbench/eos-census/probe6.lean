import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def pfStress (rho P : ℚ) : STV4 →ₗ[ℚ] STV4 :=
  LinearMap.prodMap (rho • LinearMap.id) ((-P) • LinearMap.id)

-- The trace coefficient of P is LITERALLY the finrank of the spacelike block ℚ × Dbl ℚ.
theorem eos_trace_dim (rho P : ℚ) :
    LinearMap.trace ℚ STV4 (pfStress rho P)
      = rho - (Module.finrank ℚ (ℚ × Dbl ℚ) : ℚ) * P := by
  unfold pfStress
  rw [LinearMap.trace_prodMap', map_smul, map_smul, LinearMap.trace_id, LinearMap.trace_id,
      Module.finrank_self]
  simp only [smul_eq_mul]; push_cast; ring

-- The spacelike block ℚ × Dbl ℚ has the SAME dimension (3) as the banked derived (1,3)
-- spatial subspace spaceSub4 (N419). The dimension-lock anchor.
theorem spacelike_block_finrank : Module.finrank ℚ (ℚ × Dbl ℚ) = 3 := by
  rw [Module.finrank_prod, finrank_dbl_eq_two, Module.finrank_self]
theorem spacelike_block_eq_spaceSub4_dim :
    Module.finrank ℚ (ℚ × Dbl ℚ) = Module.finrank ℚ spaceSub4 := by
  rw [spacelike_block_finrank, finrank_spaceSub4]

#print axioms eos_trace_dim
#print axioms spacelike_block_eq_spaceSub4_dim
end Phys.Algebra.Probe
