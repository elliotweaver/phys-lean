import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- Test the rotation action FC (slotB b) = slotA b via banked lemmas (structural route).
-- FC (slotB b) = jb(slotA 1)(jb(slotB 1)(slotB b)) - jb(slotB 1)(jb(slotA 1)(slotB b))
-- term2: jb(slotA 1)(slotB b) = slotC(star 1 * b) = slotC b; then jb(slotB 1)(slotC b) = slotA(1*star b)=slotA(star b)
-- term1: jb(slotB 1)(slotB b) = same-slot -> Dg; jb(slotA 1)(Dg) -> slotA
-- This is getting complex. Test if the direct route on a slot arg is fast:
theorem FC_slotB (b : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotB b) = slotA b := by
  rw [innerMul_apply]
  -- term A: jb (slotB 1)(slotB b)  [same slot]
  -- term B: jb (slotA 1)(slotB b) = slotC (star 1 * b) = slotC b
  rw [show jb (slotA (1:O ℚ)) (slotB b) = slotC (star (1:O ℚ) * b) from jb_slotA_slotB 1 b]
  rw [star_one, one_mul]
  -- now: jb (slotA 1)(jb (slotB 1)(slotB b)) - jb (slotB 1)(slotC b)
  rw [show jb (slotB (1:O ℚ)) (slotC b) = slotA (1 * star b) from jb_slotB_slotC 1 b]
  rw [one_mul]
  sorry

end Phys.Algebra.HJ
