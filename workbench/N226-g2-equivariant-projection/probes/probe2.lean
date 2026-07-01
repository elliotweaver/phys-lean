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

noncomputable def projFun :
    Module.End ℚ (bornBil).skewAdjointSubmodule :=
  @Submodule.IsCompl.projection ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

#check @projFun

theorem proj_idem : IsIdempotentElem projFun :=
  @Submodule.IsCompl.projection_isIdempotentElem ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

end
end Phys.Algebra
