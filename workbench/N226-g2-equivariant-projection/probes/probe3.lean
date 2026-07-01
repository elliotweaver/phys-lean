import Phys.Algebra.TowerGatherObstructionComplementSo7
import Mathlib.LinearAlgebra.Projection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem isCompl_fun_adj :
    IsCompl ((LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype)
      ((LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) := by
  constructor
  · rw [disjoint_iff, ← Submodule.comap_inf, inf_comm, inter_eq_bot, Submodule.comap_bot]
    rw [Submodule.ker_subtype]
  · rw [codisjoint_iff, eq_top_iff]
    rintro ⟨x, hx⟩ -
    have hx' : x ∈ (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) := by
      rw [sup_eq_so7]; exact hx
    rw [Submodule.mem_sup] at hx'
    obtain ⟨a, ha, b, hb, rfl⟩ := hx'
    have hasub : a ∈ (bornBil).skewAdjointSubmodule := by
      rw [← sup_eq_so7]; exact Submodule.mem_sup_left ha
    have hbsub : b ∈ (bornBil).skewAdjointSubmodule := by
      rw [← sup_eq_so7]; exact Submodule.mem_sup_right hb
    have hsplit : (⟨a + b, hx⟩ : (bornBil).skewAdjointSubmodule)
        = (⟨b, hbsub⟩ : (bornBil).skewAdjointSubmodule) + (⟨a, hasub⟩ : _) := by
      apply Subtype.ext; simp [add_comm]
    rw [hsplit]
    apply Submodule.add_mem
    · exact Submodule.mem_sup_left (by simpa using hb)
    · exact Submodule.mem_sup_right (by simpa using ha)

/-- The adjoint g₂-action on `↥so7`: `X ↦ ⁅imRep D, X⁆`, well-defined since so7 is a Lie
    subalgebra containing `imRep D`. -/
def adSo7 (D : derivationLieQ) : Module.End ℚ (bornBil).skewAdjointSubmodule where
  toFun X := ⟨⁅imRep D, (X : Module.End ℚ ImO)⁆,
    LinearMap.BilinForm.isSkewAdjoint_bracket _ (imRep_mem_so7 D) X.2⟩
  map_add' X Y := by apply Subtype.ext; simp [lie_add]
  map_smul' c X := by apply Subtype.ext; simp [lie_smul]

-- funIn invariance under adSo7
theorem funIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype := by
  have hYval : (Y : Module.End ℚ ImO) ∈ LinearMap.range crossEmb := hY
  show (⁅imRep D, (Y : Module.End ℚ ImO)⁆) ∈ LinearMap.range crossEmb
  exact crossEmb_range_g2_invariant D hYval

-- adjIn invariance under adSo7
theorem adjIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype := by
  have hYval : (Y : Module.End ℚ ImO) ∈ LinearMap.range imRepL := hY
  show (⁅imRep D, (Y : Module.End ℚ ImO)⁆) ∈ LinearMap.range imRepL
  exact imRep_range_g2_invariant D hYval

end
end Phys.Algebra
