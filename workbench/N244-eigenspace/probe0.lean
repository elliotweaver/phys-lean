import Phys.Algebra.TowerGatherForcedChargeSpectrum
import Mathlib.LinearAlgebra.Eigenspace.Basic

namespace N244Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- (sgl : O ℚ) = u1  (definitional)
example : ((sgl : ImO) : O ℚ) = u1 := rfl

-- ⊇ : sgl ∈ ker chargeOp
theorem sgl_mem_ker : sgl ∈ LinearMap.ker chargeOp := by
  rw [LinearMap.mem_ker]; exact chargeOp_kills_singlet

theorem span_sgl_le_ker : Submodule.span ℚ {sgl} ≤ LinearMap.ker chargeOp := by
  rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact sgl_mem_ker

-- ⊆ : THE SPINE.  y ∈ ker ⟹ y = ⟨u1,y⟩ • sgl ∈ span{sgl}
theorem ker_le_span_sgl : LinearMap.ker chargeOp ≤ Submodule.span ℚ {sgl} := by
  intro y hy
  rw [LinearMap.mem_ker] at hy
  -- chargeOp (chargeOp y) = 0
  have h2 : chargeOp (chargeOp y) = 0 := by rw [hy, map_zero]
  -- coe of chargeOp_sq_coe : 0 = ⟨u1,y⟩•u1 − y  at the O ℚ level
  have hc := chargeOp_sq_coe y
  rw [h2] at hc
  -- hc : ((0 : ImO) : O ℚ) = gForm u1 (y:Oℚ) • u1 - (y:Oℚ)
  rw [Submodule.coe_zero] at hc
  -- so (y : O ℚ) = gForm u1 (y:Oℚ) • u1
  have hy_eq : (y : O ℚ) = gForm u1 (y : O ℚ) • u1 := by
    have := sub_eq_zero.mp hc.symm
    exact this.symm
  -- conclude y = c • sgl in ImO
  rw [Submodule.mem_span_singleton]
  refine ⟨gForm u1 (y : O ℚ), ?_⟩
  apply Subtype.ext
  show gForm u1 (y : O ℚ) • u1 = (y : O ℚ)
  exact hy_eq.symm

theorem chargeOp_ker : LinearMap.ker chargeOp = Submodule.span ℚ {sgl} :=
  le_antisymm ker_le_span_sgl span_sgl_le_ker

theorem finrank_ker_chargeOp : Module.finrank ℚ (LinearMap.ker chargeOp) = 1 := by
  rw [chargeOp_ker]; exact finrank_span_singleton sgl_ne_zero

theorem chargeOp_eigenspace_zero :
    Module.End.eigenspace chargeOp 0 = Submodule.span ℚ {sgl} := by
  rw [Module.End.eigenspace_zero, chargeOp_ker]

-- complement: ker chargeOpV = ⊥ (no charge-0 direction on the 6)
theorem chargeOpV_ker : LinearMap.ker chargeOpV = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro v hv
  rw [LinearMap.mem_ker] at hv
  have h : (chargeOpV.comp chargeOpV) v = -v := by rw [chargeOpV_sq]; rfl
  rw [LinearMap.comp_apply, hv, map_zero] at h
  exact neg_eq_zero.mp h.symm

end
end N244Probe
