import Phys.Algebra.TowerGatherForcedChargeEigenvalues
import Phys.Algebra.TowerGatherForcedChargeEigenspace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Helper: crossOpO u1 sends every element of ImO into Vsub (kills the singlet part, maps Vsub→Vsub).
theorem crossOpO_u1_ImO_mem_Vsub (z : O ℚ) (hz : z ∈ ImO) : crossOpO u1 z ∈ Vsub := by
  rw [← singlet_sup_Vsub_eq_ImO] at hz
  rw [Submodule.mem_sup] at hz
  obtain ⟨a, ha, b, hb, rfl⟩ := hz
  rw [singlet, Submodule.mem_span_singleton] at ha
  obtain ⟨c, rfl⟩ := ha
  rw [map_add, map_smul]
  have h0 : crossOpO u1 u1 = 0 := by rw [crossOpO_apply]; exact octCross_self u1_mem_ImO
  rw [h0, smul_zero, zero_add]
  exact crossOpO_u1_mapsTo_Vsub b hb

-- TARGET: the charged complement (range of the charge operator) pushed through ImO.subtype
-- is EXACTLY the banked branching 6-space Vsub = 3 ⊕ 3̄.
theorem range_chargeOp_map_eq_Vsub :
    (LinearMap.range chargeOp).map (ImO.subtype) = Vsub := by
  apply le_antisymm
  · rintro _ ⟨x, hx, rfl⟩
    rw [SetLike.mem_coe, LinearMap.mem_range] at hx
    obtain ⟨y, rfl⟩ := hx
    show (chargeOp y : O ℚ) ∈ Vsub
    have : (chargeOp y : O ℚ) = crossOpO u1 (y : O ℚ) := by
      show octCross u1 (y : O ℚ) = crossOpO u1 (y : O ℚ)
      rw [crossOpO_apply]
    rw [this]
    exact crossOpO_u1_ImO_mem_Vsub (y : O ℚ) y.2
  · intro v hv
    have hvim : v ∈ Vsub.map (crossOpO u1) := by rw [Vsub_map_crossOpO]; exact hv
    obtain ⟨w, hw, hwv⟩ := hvim
    refine ⟨chargeOp ⟨w, Vsub_le_ImO hw⟩, ?_, ?_⟩
    · exact LinearMap.mem_range_self _ _
    · show (chargeOp ⟨w, Vsub_le_ImO hw⟩ : O ℚ) = v
      show octCross u1 w = v
      rw [← crossOpO_apply]; exact hwv

end

end Phys.Algebra
