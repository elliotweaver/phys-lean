import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- slot-product reductions for the crux (kAB·(slotB u1) = -slotA 1):
example : jb (slotA u1) (slotB u1) = slotC (star u1 * u1) := jb_slotA_slotB u1 u1
example : (star u1 * u1 : O ℚ) = 1 := by rw [star_u1, neg_mul, complexUnit_sq, neg_neg]
example : jb (slotB (1:O ℚ)) (slotB u1) = Dg (2 * reQ u1) 0 (2 * reQ u1) := jb_slotB1_slotB u1
example : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]  -- measure: is reQ u1 = 0 clean?
example : jb (slotB (1:O ℚ)) (slotC 1) = slotA (1 * star 1) := jb_slotB_slotC 1 1

end Phys.Algebra.HJ
