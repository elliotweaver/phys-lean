import Phys.Algebra.TowerGatherObstructionComplementSo7
import Mathlib.LinearAlgebra.Projection

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Re-use the crux from probe4 (copy isCompl_fun_adj + projFun + supporting)
theorem isCompl_fun_adj :
    IsCompl ((LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype)
      ((LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) := by
  constructor
  · rw [disjoint_iff, ← Submodule.comap_inf, inf_comm, inter_eq_bot, Submodule.comap_bot,
      Submodule.ker_subtype]
  · rw [codisjoint_iff, eq_top_iff]
    rintro ⟨x, hx⟩ -
    have hx' : x ∈ (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) := by rw [sup_eq_so7]; exact hx
    rw [Submodule.mem_sup] at hx'
    obtain ⟨a, ha, b, hb, rfl⟩ := hx'
    have hasub : a ∈ (bornBil).skewAdjointSubmodule := by rw [← sup_eq_so7]; exact Submodule.mem_sup_left ha
    have hbsub : b ∈ (bornBil).skewAdjointSubmodule := by rw [← sup_eq_so7]; exact Submodule.mem_sup_right hb
    have hsplit : (⟨a + b, hx⟩ : (bornBil).skewAdjointSubmodule)
        = (⟨b, hbsub⟩ : _) + (⟨a, hasub⟩ : _) := by apply Subtype.ext; simp [add_comm]
    rw [hsplit]
    exact Submodule.add_mem _ (Submodule.mem_sup_left (by simpa using hb))
      (Submodule.mem_sup_right (by simpa using ha))

noncomputable def projFun : Module.End ℚ (bornBil).skewAdjointSubmodule :=
  @Submodule.IsCompl.projection ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

theorem projFun_eq (X) : projFun X = isCompl_fun_adj.projection X := rfl

theorem projFun_range :
    LinearMap.range projFun = (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype :=
  @Submodule.IsCompl.projection_range ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

-- W8: projFun ≠ 0 (there is a nonzero fundamental element) and projFun ≠ id (adjoint is killed)
-- non-vacuity: the range is 7-dimensional, so projFun is neither 0 nor id
theorem finrank_projFun_range : Module.finrank ℚ (LinearMap.range projFun) = 7 := by
  rw [projFun_range]
  -- comap subtype of range crossEmb inside so7; range crossEmb ≤ so7 so finrank preserved
  have hle : LinearMap.range crossEmb ≤ (bornBil).skewAdjointSubmodule := crossEmb_range_le_so7'
  rw [(Submodule.comapSubtypeEquivOfLe hle).finrank_eq]
  exact finrank_crossEmb_range

end
end Phys.Algebra
