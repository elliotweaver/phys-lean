import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace N247Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- RISK 1 (fixed): Commute → Lie bracket 0 via `show` unfolding the End bracket.
example (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    ⁅chargeOp, imRepL D⁆ = 0 := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  show chargeOp * (imRepL D) - (imRepL D) * chargeOp = 0
  have hEq : (imRepL D) = imRep D := rfl
  rw [hEq, ← hc.eq, sub_self]

-- RISK 2 (fixed): whole colour submodule.
example (y : Module.End ℚ ImO) (hy : y ∈ colourImg) : ⁅chargeOp, y⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hdc : d ∈ colourCentralizer := hd
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hdc
  show chargeOp * (imRepL d) - (imRepL d) * chargeOp = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, ← hc.eq, sub_self]

-- RISK 4: the LieSubalgebra construction from chargeLine ⊔ colourImg with lie_mem'.
-- Need to prove: x,y ∈ chargeLine ⊔ colourImg → ⁅x,y⁆ ∈ chargeLine ⊔ colourImg.
-- chargeLine = span{chargeOp}. Decompose x = a•chargeOp + c₁, y = b•chargeOp + c₂ (cᵢ ∈ colourImg).
-- Four terms: ⁅a•chargeOp, b•chargeOp⁆ = 0 (self); ⁅a•chargeOp, c₂⁆ = 0 (u1 central);
--   ⁅c₁, b•chargeOp⁆ = 0; ⁅c₁,c₂⁆ ∈ colourImg (closure). So ∈ colourImg ≤ join.
-- Test the KEY collapse: chargeLine elements bracket-commute with everything in the join.
-- First: ⁅chargeOp, chargeOp⁆ = 0 (trivially).
example : ⁅chargeOp, chargeOp⁆ = (0 : Module.End ℚ ImO) := lie_self chargeOp

-- Test bracket of a colourImg elt with chargeOp (other order) = 0.
example (y : Module.End ℚ ImO) (hy : y ∈ colourImg) : ⁅y, chargeOp⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hdc : d ∈ colourCentralizer := hd
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hdc
  show (imRepL d) * chargeOp - chargeOp * (imRepL d) = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, hc.eq, sub_self]

end

end N247Probe
