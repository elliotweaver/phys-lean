import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

theorem ker_inf_range_chargeOp : LinearMap.ker chargeOp ⊓ LinearMap.range chargeOp = ⊥ := by
  rw [Submodule.eq_bot_iff]; intro y hy
  rw [Submodule.mem_inf] at hy; obtain ⟨hker, hrange⟩ := hy
  rw [chargeOp_ker, Submodule.mem_span_singleton] at hker
  obtain ⟨a, rfl⟩ := hker
  have hcoe : ((a • sgl : ImO) : O ℚ) ∈ Vsub := by
    rw [← range_chargeOp_map_eq_Vsub]; exact ⟨a • sgl, hrange, rfl⟩
  have hsing : ((a • sgl : ImO) : O ℚ) ∈ singlet := by
    show (a • (sgl:O ℚ)) ∈ singlet
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self u1)
  have hbot : ((a • sgl : ImO) : O ℚ) ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]; exact ⟨hsing, hcoe⟩
  rw [Submodule.mem_bot] at hbot
  apply Subtype.ext; simpa using hbot

theorem ker_sup_range_chargeOp : LinearMap.ker chargeOp ⊔ LinearMap.range chargeOp = ⊤ := by
  apply Submodule.eq_top_of_finrank_eq
  have h := Submodule.finrank_sup_add_finrank_inf_eq (LinearMap.ker chargeOp) (LinearMap.range chargeOp)
  rw [ker_inf_range_chargeOp, finrank_bot, finrank_ker_chargeOp, finrank_range_chargeOp] at h
  rw [finrank_ImO]
  omega

#check @ker_sup_range_chargeOp

end
end Phys.Algebra
