import Phys.Algebra.TowerGatherForcedChargeSpectrum
import Mathlib.LinearAlgebra.Eigenspace.Basic

namespace N244Probe2
open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- assume the banked ker fact (proved in probe0); here just test the map-to-singlet bridge shape
theorem chargeOp_ker' : LinearMap.ker chargeOp = Submodule.span ℚ {sgl} := by
  apply le_antisymm
  · intro y hy
    rw [LinearMap.mem_ker] at hy
    have h2 : chargeOp (chargeOp y) = 0 := by rw [hy, map_zero]
    have hc := chargeOp_sq_coe y
    rw [h2, Submodule.coe_zero] at hc
    have hy_eq : (y : O ℚ) = gForm u1 (y : O ℚ) • u1 := (sub_eq_zero.mp hc.symm).symm
    rw [Submodule.mem_span_singleton]
    exact ⟨gForm u1 (y : O ℚ), Subtype.ext hy_eq.symm⟩
  · rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe, LinearMap.mem_ker]
    exact chargeOp_kills_singlet

-- THE BRIDGE to the banked O ℚ-level `singlet` = span{u1}:
-- map of (ker chargeOp = span{sgl}) through ImO.subtype = span{u1} = singlet
theorem ker_chargeOp_map_eq_singlet :
    (LinearMap.ker chargeOp).map (ImO.subtype) = singlet := by
  rw [chargeOp_ker', Submodule.map_span, singlet]
  congr 1
  rw [Set.image_singleton]
  rfl

-- === RECON TEETH: garbage relations MUST fail (comment out to confirm they don't compile) ===
-- theorem bad_finrank : Module.finrank ℚ (LinearMap.ker chargeOp) = 2 := by
--   rw [chargeOp_ker']; rw [finrank_span_singleton sgl_ne_zero]  -- ⊢ 1 = 2 FALSE
-- theorem bad_ker_bot : LinearMap.ker chargeOp = ⊥ := by
--   rw [chargeOp_ker']  -- ⊢ span{sgl} = ⊥ FALSE (sgl ≠ 0)

end
end N244Probe2
