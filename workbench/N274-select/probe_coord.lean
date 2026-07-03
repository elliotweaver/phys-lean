import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Candidate A: full coordinate brute on the whole matrix (like qsmul_mul_left's closer).
set_option maxHeartbeats 4000000 in
theorem cand_A (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) = slotC ((d2 - d1) • (star a * b)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    (simp only [jb, slotA, slotB, slotC, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply,
      Fin.isValue] ;
     ext <;> simp [cd_qsmul_re, cd_qsmul_im, mul_re, mul_im, star_re, star_im,
       add_re, add_im, sub_re, sub_im, neg_re, neg_im] <;> ring)

end Phys.Algebra.HJ
