import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace N247Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem chargeOp_lie_colour (y : Module.End ℚ ImO) (hy : y ∈ colourImg) : ⁅chargeOp, y⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hd
  show chargeOp * (imRepL d) - (imRepL d) * chargeOp = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, ← hc.eq, sub_self]

theorem colour_lie_chargeOp (y : Module.End ℚ ImO) (hy : y ∈ colourImg) : ⁅y, chargeOp⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hd
  show (imRepL d) * chargeOp - chargeOp * (imRepL d) = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, hc.eq, sub_self]

theorem colourImg_lie_closed (x y : Module.End ℚ ImO) (hx : x ∈ colourImg) (hy : y ∈ colourImg) :
    ⁅x, y⁆ ∈ colourImg := by
  rw [colourImg, Submodule.mem_map] at hx hy
  obtain ⟨d, hd, rfl⟩ := hx
  obtain ⟨d', hd', rfl⟩ := hy
  have hbr : (⁅d, d'⁆ : derivationLieQ) ∈ colourCentralizer := colourCentralizer.lie_mem hd hd'
  rw [colourImg, Submodule.mem_map]
  exact ⟨⁅d, d'⁆, hbr, by rw [show imRepL ⁅d, d'⁆ = imRep ⁅d, d'⁆ from rfl, LieHom.map_lie]; rfl⟩

theorem chargeLine_lie_colour (x y : Module.End ℚ ImO) (hx : x ∈ chargeLine) (hy : y ∈ colourImg) :
    ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hx
  obtain ⟨a, rfl⟩ := hx
  rw [smul_lie, chargeOp_lie_colour y hy, smul_zero]

theorem colour_lie_chargeLine (x y : Module.End ℚ ImO) (hx : x ∈ colourImg) (hy : y ∈ chargeLine) :
    ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hy
  obtain ⟨b, rfl⟩ := hy
  rw [lie_smul, colour_lie_chargeOp x hx, smul_zero]

theorem chargeLine_lie_chargeLine (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine) (hy : y ∈ chargeLine) : ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hx hy
  obtain ⟨a, rfl⟩ := hx
  obtain ⟨b, rfl⟩ := hy
  have hs : (⁅chargeOp, chargeOp⁆ : Module.End ℚ ImO) = 0 := lie_self chargeOp
  rw [smul_lie, lie_smul, hs, smul_zero, smul_zero]

theorem joint_derived_le_colourImg (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine ⊔ colourImg) (hy : y ∈ chargeLine ⊔ colourImg) :
    ⁅x, y⁆ ∈ colourImg := by
  rw [Submodule.mem_sup] at hx hy
  obtain ⟨xc, hxc, xk, hxk, rfl⟩ := hx
  obtain ⟨yc, hyc, yk, hyk, rfl⟩ := hy
  rw [add_lie, lie_add, lie_add,
      chargeLine_lie_chargeLine xc yc hxc hyc, chargeLine_lie_colour xc yk hxc hyk,
      colour_lie_chargeLine xk yc hxk hyc, add_zero, zero_add, zero_add]
  exact colourImg_lie_closed xk yk hxk hyk

theorem joint_lie_mem (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine ⊔ colourImg) (hy : y ∈ chargeLine ⊔ colourImg) :
    ⁅x, y⁆ ∈ chargeLine ⊔ colourImg :=
  Submodule.mem_sup_right (joint_derived_le_colourImg x y hx hy)

def chargeColourLie : LieSubalgebra ℚ (Module.End ℚ ImO) where
  __ := chargeLine ⊔ colourImg
  lie_mem' {x y} hx hy := joint_lie_mem x y hx hy

-- finrank of the new Lie object's carrier = 9 (transport N246).
theorem chargeColourLie_finrank :
    Module.finrank ℚ chargeColourLie.toSubmodule = 9 :=
  finrank_chargeLine_sup_colourImg

end

end N247Probe
