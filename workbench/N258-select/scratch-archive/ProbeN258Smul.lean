import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
noncomputable section
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000

-- test candidate incantations for pulling a scalar out of a bracket on Module.End ℚ ImO
example (a : ℚ) : ⁅a • imRep DI, hyperOp⁆ = a • ⁅imRep DI, hyperOp⁆ := by
  exact smul_lie a (imRep DI) hyperOp

end
end Phys.Algebra
