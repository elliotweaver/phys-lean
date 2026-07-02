import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace N247Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- fix colour_lie_chargeLine via (lie_skew x y).symm
example (x y : Module.End ℚ ImO) (h : ⁅y, x⁆ = 0) : ⁅x, y⁆ = 0 := by
  rw [(lie_skew x y).symm, h, neg_zero]

-- fix chargeLine_lie_chargeLine — test lie_self explicit + simp fallback
example (a b : ℚ) : a • b • ⁅chargeOp, chargeOp⁆ = (0 : Module.End ℚ ImO) := by
  rw [lie_self chargeOp, smul_zero, smul_zero]

example (a b : ℚ) : ⁅a • chargeOp, b • chargeOp⁆ = (0 : Module.End ℚ ImO) := by
  simp only [smul_lie, lie_smul, lie_self, smul_zero]

end

end N247Probe
