import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
-- try a few tactics for kappaO 1 = u2
theorem k1 : (kappaO (1 : H ℚ)) = u2 := by rfl
#print axioms k1
