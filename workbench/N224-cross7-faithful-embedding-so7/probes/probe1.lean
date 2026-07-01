import Phys.Algebra.TowerGatherObstructionAdjointSo7
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationCompact

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- CRUX: crossOp is injective on ImO: the embedding a ↦ crossOp a is FAITHFUL.
theorem crossOp_inj_on_ImO {a : O ℚ} (ha : a ∈ ImO) (h : crossOp a = 0) : a = 0 := by
  have hoc : ∀ y : O ℚ, y ∈ ImO → octCross a y = 0 := by
    intro y hy
    have hz : (crossOp a ⟨y, hy⟩ : ImO) = 0 := by rw [h]; rfl
    have := congrArg (Subtype.val) hz
    simpa [crossOp_coe] using this
  suffices hgaa : gForm a a = 0 by exact gForm_self_eq_zero.mp hgaa
  by_contra hne
  have hcontr : ∀ y : O ℚ, y ∈ ImO → gForm a a • y = gForm a y • a := by
    intro y hy
    have hc := octCross_contraction ha hy
    rw [hoc y hy] at hc
    have h0 : octCross a (0 : O ℚ) = 0 := by
      rw [← crossOpO_apply]; exact map_zero (crossOpO a)
    rw [h0] at hc
    exact (sub_eq_zero.mp hc.symm).symm
  have hsub : (ImO : Submodule ℚ (O ℚ)) ≤ Submodule.span ℚ {a} := by
    intro y hy
    have hy2 := hcontr y hy
    have hy_eq : y = ((gForm a a)⁻¹ * gForm a y) • a := by
      have h1 : (gForm a a)⁻¹ • (gForm a a • y) = (gForm a a)⁻¹ • (gForm a y • a) := by rw [hy2]
      rw [smul_smul, inv_mul_cancel₀ hne, one_smul, smul_smul] at h1
      exact h1
    rw [hy_eq]
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self a)
  have hane : a ≠ 0 := by rintro rfl; exact hne (gForm_self_eq_zero.mpr rfl)
  have h7 : Module.finrank ℚ ImO = 7 := finrank_ImO
  have hle : Module.finrank ℚ (ImO : Submodule ℚ (O ℚ)) ≤ Module.finrank ℚ (Submodule.span ℚ {a}) :=
    Submodule.finrank_mono hsub
  have hspan : Module.finrank ℚ (Submodule.span ℚ {a}) = 1 := finrank_span_singleton hane
  omega

#print axioms crossOp_inj_on_ImO

end
end Phys.Algebra
