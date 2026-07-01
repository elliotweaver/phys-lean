import Phys.Algebra.TowerGatherObstructionAdjointSo7
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

noncomputable def crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO where
  toFun a := crossOp (a : O ℚ)
  map_add' a b := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [Submodule.coe_add, crossOp_coe, LinearMap.add_apply, Submodule.coe_add]
    unfold octCross
    rw [add_mul, gForm_add_left, add_smul]; abel
  map_smul' c a := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [SetLike.val_smul, crossOp_coe, RingHom.id_apply, LinearMap.smul_apply]
    unfold octCross
    rw [qsmul_mul_left, gForm_smul_left, smul_add, smul_smul]

@[simp] theorem crossEmb_apply (a : ImO) : crossEmb a = crossOp (a : O ℚ) := rfl

-- FAITHFUL: injectivity via contraction + dimension
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
    have h0 : octCross a (0 : O ℚ) = 0 := by rw [← crossOpO_apply]; exact map_zero (crossOpO a)
    rw [h0] at hc
    exact (sub_eq_zero.mp hc.symm).symm
  have hsub : (ImO : Submodule ℚ (O ℚ)) ≤ Submodule.span ℚ {a} := by
    intro y hy
    have hy2 := hcontr y hy
    have hy_eq : y = ((gForm a a)⁻¹ * gForm a y) • a := by
      have h1 : (gForm a a)⁻¹ • (gForm a a • y) = (gForm a a)⁻¹ • (gForm a y • a) := by rw [hy2]
      rw [smul_smul, inv_mul_cancel₀ hne, one_smul, smul_smul] at h1
      exact h1
    rw [hy_eq]; exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self a)
  have hane : a ≠ 0 := by rintro rfl; exact hne (gForm_self_eq_zero.mpr rfl)
  have h7 : Module.finrank ℚ ImO = 7 := finrank_ImO
  have hle : Module.finrank ℚ (ImO : Submodule ℚ (O ℚ)) ≤ Module.finrank ℚ (Submodule.span ℚ {a}) :=
    Submodule.finrank_mono hsub
  have hspan : Module.finrank ℚ (Submodule.span ℚ {a}) = 1 := finrank_span_singleton hane
  omega

theorem crossEmb_injective : Function.Injective crossEmb := by
  rw [injective_iff_map_eq_zero]
  intro a ha
  exact Subtype.ext (crossOp_inj_on_ImO a.2 ha)

theorem finrank_crossEmb_range : Module.finrank ℚ (LinearMap.range crossEmb) = 7 := by
  rw [LinearMap.finrank_range_of_inj crossEmb_injective, finrank_ImO]

-- the range lands inside so(7)
theorem crossEmb_range_le_so7 :
    LinearMap.range crossEmb ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  rw [LinearMap.range_le_iff_comap]
  refine le_top.antisymm ?_
  intro a _
  exact crossOp_mem_so7 (a : O ℚ) a.2

#print axioms crossEmb_injective
#print axioms finrank_crossEmb_range
#print axioms crossEmb_range_le_so7

end
end Phys.Algebra
