import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic
namespace Test
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- PERMUTED coupling (a=1,b=u1) = slotC (star u1). Its (1,2) entry = star u1 (by slotC_entry).
-- (star u1).re.re.im = -1.
example : ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2) = star u1 := by
  rw [framePerm_swap12_coupling, mul_one, slotC_entry]

example : (star u1).re.re.im = (-1 : ℚ) := by
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  norm_num

-- combined scalar anchor:
example : ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2).re.re.im = (-1 : ℚ) := by
  rw [framePerm_swap12_coupling, mul_one, slotC_entry]
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  norm_num
end
end Test
