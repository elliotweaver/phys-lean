import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace N247Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- RISK 1: Commute → Lie bracket 0 (u(1) commutes with a single colour generator at bracket level).
-- imRepL d = imRep d definitionally; colour_commute_chargeOp gives Commute (imRep D) chargeOp.
example (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    ⁅chargeOp, imRepL D⁆ = 0 := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  have : (imRepL D) = imRep D := rfl
  rw [this, Ring.lie_def]
  -- ⁅chargeOp, imRep D⁆ = chargeOp * imRep D - imRep D * chargeOp = 0
  rw [← hc.eq, sub_self]

-- RISK 2: ⁅chargeOp, y⁆ = 0 for y ∈ colourImg (the whole colour submodule, not just generators).
example (y : Module.End ℚ ImO) (hy : y ∈ colourImg) : ⁅chargeOp, y⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  -- hd : d ∈ colourCentralizer.toSubmodule
  have hdc : d ∈ colourCentralizer := hd
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hdc
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, Ring.lie_def, ← hc.eq, sub_self]

-- RISK 3: colourImg is Lie-bracket closed (colour su(3) bracket-closed via LieHom.map_lie).
example (x y : Module.End ℚ ImO) (hx : x ∈ colourImg) (hy : y ∈ colourImg) :
    ⁅x, y⁆ ∈ colourImg := by
  rw [colourImg, Submodule.mem_map] at hx hy
  obtain ⟨d, hd, rfl⟩ := hx
  obtain ⟨d', hd', rfl⟩ := hy
  have hdc : d ∈ colourCentralizer := hd
  have hd'c : d' ∈ colourCentralizer := hd'
  have hbr : (⁅d, d'⁆ : derivationLieQ) ∈ colourCentralizer := colourCentralizer.lie_mem hdc hd'c
  rw [colourImg, Submodule.mem_map]
  refine ⟨⁅d, d'⁆, hbr, ?_⟩
  -- ⁅imRepL d, imRepL d'⁆ = imRepL ⁅d,d'⁆
  rw [show imRepL ⁅d, d'⁆ = imRep ⁅d, d'⁆ from rfl, LieHom.map_lie]
  rfl

end

end N247Probe
