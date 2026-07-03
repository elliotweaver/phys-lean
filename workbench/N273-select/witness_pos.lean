import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic
namespace Test
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- slotC x has x at (1,2) and star x at (2,1). For x = star u1: (2,1) entry = star(star u1)=u1, .re.re.im=+1.
-- framePerm(swap12)(jb (slotA 1)(slotB u1)) = slotC(star u1 * 1) = slotC(star u1).
-- its (2,1) entry = star(star u1) = u1 ; u1.re.re.im = 1.
theorem witness_true :
    ((framePerm (Equiv.swap 1 2) (jb (slotA (1 : O ℚ)) (slotB u1))) 2 1).re.re.im = (1 : ℚ) := by
  rw [framePerm_swap12_coupling, mul_one]
  simp only [slotC, Xz, u1, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, star_star, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
    Matrix.empty_val', Matrix.cons_val_fin_one]
  norm_num
end
end Test
