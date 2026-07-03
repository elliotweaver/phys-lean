import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic
namespace Test
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- witness: entry (1,2) of framePerm(swap12)(jb (slotA u1)(slotB 1)) = slotC(star 1 * u1)=slotC u1
-- so its (1,2) entry is u1. Compare with unpermuted jb (slotA u1)(slotB 1)=slotC(star u1 * 1)=slotC(star u1).
-- concrete scalar: take (1,2) entry .re.re.im of the PERMUTED coupling with a=1,b=u1.
-- framePerm_swap12_coupling a=1 b=u1: = slotC (star u1 * 1) = slotC (star u1). star u1 has re.re.im = -1.
example : ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2).re.re.im = -1 := by
  rw [framePerm_swap12_coupling]
  simp only [slotC, Xz, mul_one]
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im', Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  norm_num
end
end Test
