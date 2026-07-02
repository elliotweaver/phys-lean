import Phys.Algebra.TowerGatherChargeIsospinRatio
import Mathlib.Tactic
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- MEASURE 1: does the bare linear-combination term even elaborate at default ceiling?
set_option synthInstance.maxHeartbeats 100000 in
example (a b : ℚ) : (a • chargeOp + b • imRep DI : Module.End ℚ ImO) = a • chargeOp + b • imRep DI := rfl

-- MEASURE 2: apply to a vector (the alternative independence route, no trace form)
set_option synthInstance.maxHeartbeats 100000 in
example (a b : ℚ) (v : ImO) :
    (a • chargeOp + b • imRep DI : Module.End ℚ ImO) v = a • chargeOp v + b • imRep DI v := by
  simp only [LinearMap.add_apply, LinearMap.smul_apply]

end Phys.Algebra
