import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Test: does base1 close by ext + jb-slot simp on the ARENA? (measure heaviness / feasibility)
set_option maxHeartbeats 4000000 in
theorem base1 : ⁅Lmul (slotA u1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆ = 0 := by
  ext X : 1
  simp only [Module.End.lie_apply, innerMul_apply, Lmul_apply]
  -- goal: jb (slotA u1) (jb (slotB 1)(jb (slotC 1) X) - jb (slotC 1)(jb (slotB 1) X))
  --     - (jb (slotB 1)(jb (slotC 1)(jb (slotA u1) X)) - jb (slotC 1)(jb (slotB 1)(jb (slotA u1) X))) = 0
  -- This is a 27-dim identity in X. Try abel after expanding jb bilinearity? Likely NOT closed.
  ring_nf
  sorry

end Phys.Algebra.HJ
