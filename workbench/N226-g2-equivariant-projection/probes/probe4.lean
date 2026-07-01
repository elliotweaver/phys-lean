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

def adSo7 (D : derivationLieQ) : Module.End ℚ (bornBil).skewAdjointSubmodule where
  toFun X := ⟨⁅imRep D, (X : Module.End ℚ ImO)⁆,
    LinearMap.BilinForm.isSkewAdjoint_bracket _ (imRep_mem_so7 D) X.2⟩
  map_add' X Y := by apply Subtype.ext; simp [lie_add]
  map_smul' c X := by apply Subtype.ext; simp [lie_smul]

theorem funIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype :=
  crossEmb_range_g2_invariant D hY

theorem adjIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype :=
  imRep_range_g2_invariant D hY

noncomputable def projFun : Module.End ℚ (bornBil).skewAdjointSubmodule :=
  @Submodule.IsCompl.projection ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

theorem projFun_eq (X) : projFun X = isCompl_fun_adj.projection X := rfl

theorem projFun_idem : IsIdempotentElem projFun :=
  @Submodule.IsCompl.projection_isIdempotentElem ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

theorem projFun_projFun (X : (bornBil).skewAdjointSubmodule) : projFun (projFun X) = projFun X := by
  have h := projFun_idem
  rw [IsIdempotentElem] at h
  calc projFun (projFun X) = (projFun * projFun) X := by rw [Module.End.mul_apply]
    _ = projFun X := by rw [h]

theorem projFun_apply_mem (X : (bornBil).skewAdjointSubmodule) :
    projFun X ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype := by
  rw [projFun_eq]; exact isCompl_fun_adj.projection_apply_mem X

theorem projFun_apply_fun {X : (bornBil).skewAdjointSubmodule}
    (hX : X ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype) :
    projFun X = X := by
  rw [projFun_eq]; exact isCompl_fun_adj.projection_apply_left ⟨X, hX⟩

theorem projFun_apply_adj {X : (bornBil).skewAdjointSubmodule}
    (hX : X ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) :
    projFun X = 0 := by
  rw [projFun_eq]; exact (isCompl_fun_adj.projection_apply_eq_zero_iff).2 hX

-- THE CROWN: g₂-equivariance of the projection
theorem projFun_equivariant (D : derivationLieQ) (X : (bornBil).skewAdjointSubmodule) :
    projFun (adSo7 D X) = adSo7 D (projFun X) := by
  have hfun := projFun_apply_mem X
  have hadj : X - projFun X ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype := by
    have hz : projFun (X - projFun X) = 0 := by
      rw [map_sub projFun X (projFun X), projFun_projFun, sub_self]
    rw [projFun_eq] at hz
    exact (isCompl_fun_adj.projection_apply_eq_zero_iff).1 hz
  have h1 := funIn_adSo7_inv D hfun
  have h2 := adjIn_adSo7_inv D hadj
  have hX : X = projFun X + (X - projFun X) := by abel
  calc projFun (adSo7 D X)
      = projFun (adSo7 D (projFun X)) + projFun (adSo7 D (X - projFun X)) := by
        conv_lhs => rw [hX]; rw [map_add, map_add]
    _ = adSo7 D (projFun X) + 0 := by
        rw [projFun_apply_fun h1, projFun_apply_adj h2]
    _ = adSo7 D (projFun X) := add_zero _

end
end Phys.Algebra
