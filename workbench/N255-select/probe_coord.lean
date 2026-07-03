import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- What is hyperOp ⟨u1⟩ = octCross (kappaO 1) u1 ? Find a nonzero coordinate.
-- c0..c7 layout: an O ℚ elt z has re,im : H ℚ; H ℚ elt has re,im : Dbl ℚ; Dbl elt has re,im : ℚ.
example : True := by
  have v : O ℚ := (hyperOp ⟨u1, u1_mem_ImO⟩ : ImO)
  trivial

-- probe each of the 8 coordinates
#eval "probe below"
example : ((hyperOp ⟨u1, u1_mem_ImO⟩ : ImO) : O ℚ).re.re.re = 0 := by
  simp [hyperOp, crossOp_coe, octCross, kappaO, u1, gForm]
  decide
