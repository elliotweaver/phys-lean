import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- TRUE: the DJ-bracket of hyperOp vanishes (headline hyperOp_bracket_DJ), so applied to the
-- singlet vector kap1' it is the zero vector, and every coordinate is 0.
theorem probe_true :
    min (286 : ℚ) (((⁅imRep DJ, hyperOp⁆ kap1' : ImO) : O ℚ).re.re.re) = 0 := by
  rw [hyperOp_bracket_DJ]
  simp

#print axioms probe_true

end Phys.Algebra
