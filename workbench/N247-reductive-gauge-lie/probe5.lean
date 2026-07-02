import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace N247Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ≤ so(7): chargeLine ≤ so(7) and colourImg ≤ so(7), so their sup ≤ so(7).
-- chargeOp ∈ so(7) (N240 chargeOp_mem_so7); colourImg ≤ range imRepL ≤ so(7) (imRep_mem_so7).
example : chargeLine ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  rw [chargeLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact chargeOp_mem_so7

example : colourImg ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  intro x hx
  rw [colourImg, Submodule.mem_map] at hx
  obtain ⟨d, hd, rfl⟩ := hx
  have : (imRepL d) = imRep d := rfl
  rw [this]
  exact imRep_mem_so7 d

-- W8 TEETH: chargeOp is NOT central in all of so(7): ⁅imRep DJ, chargeOp⁆ ≠ 0.
example : ⁅imRep DJ, chargeOp⁆ ≠ 0 := chargeOp_stabilizer_proper

-- Also useful: imRep DJ ∈ so(7).
example : imRep DJ ∈ skewAdjointLieSubalgebra bornBil := imRep_mem_so7 DJ

end

end N247Probe
