import Phys.Algebra.TowerWorldMapCliffordModule
import Mathlib.Tactic

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- (1) bridge: leftReg_clifford in `*`/`1` form
theorem cliff_mul (a b : ImO) :
    leftReg a * leftReg b + leftReg b * leftReg a
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • (1 : Module.End ℚ (O ℚ)) := by
  have h := leftReg_clifford a b
  simpa [Module.End.mul_eq_comp, Module.End.one_eq_id] using h

-- (2) pure ring identity
example (A B C : Module.End ℚ (O ℚ)) :
    (A*B - B*A)*C - C*(A*B - B*A)
      = (A*(B*C+C*B) - (A*C+C*A)*B) - (B*(A*C+C*A) - (B*C+C*B)*A) := by
  noncomm_ring

end
end Phys.Algebra
