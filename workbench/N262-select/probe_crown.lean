import Phys.Algebra.TowerWorldMapCliffordModule
import Mathlib.Tactic

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- The spin generator: the ANTISYMMETRIC part of the worldMap composition.
-- Using `*` = comp in the End ring.
def spinGen (a b : ImO) : Module.End ℚ (O ℚ) :=
  leftReg a * leftReg b - leftReg b * leftReg a

-- First: is leftReg_clifford stated in `*` terms or `.comp`? Check the bridge.
example (a b : ImO) :
    leftReg a * leftReg b + leftReg b * leftReg a
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • (1 : Module.End ℚ (O ℚ)) := by
  have h := leftReg_clifford a b
  simpa [Module.End.mul_eq_comp, Module.End.one_eq_id] using h

-- The pure ring identity: [AB - BA, C] = A{B,C} - {A,C}B - (B{A,C} - {B,C}A)
-- i.e. (AB-BA)C - C(AB-BA) = A(BC+CB) - (AC+CA)B - B(AC+CA) + (BC+CB)A
example (A B C : Module.End ℚ (O ℚ)) :
    (A*B - B*A)*C - C*(A*B - B*A)
      = (A*(B*C+C*B) - (A*C+C*A)*B) - (B*(A*C+C*A) - (B*C+C*B)*A) := by
  noncomm_ring

-- THE CROWN: the spin generator rotates the Clifford generators as an infinitesimal so(7).
theorem spinGen_act (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = (4 * gForm (a : O ℚ) (c : O ℚ)) • leftReg b
        - (4 * gForm (b : O ℚ) (c : O ℚ)) • leftReg a := by
  have hbc := leftReg_clifford b c
  have hac := leftReg_clifford a c
  -- bridge to `*`/`1`
  rw [Module.End.mul_eq_comp] at *  -- may not be needed; try
  sorry

end
end Phys.Algebra
