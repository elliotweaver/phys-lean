/- PROBE 71d (W9.7 EXECUTE): canonicalize ocR (collapse nested via ocR_mul, pull left),
   THEN abel. (0,1): deg1=0 ⇒ ocR cancels by centrality alone; residue = bb1_e01. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe71d
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 400000 in
theorem ocR_mul (r s : ℚ) : ocR r * ocR s = ocR (r * s) := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

-- pull-out levers
theorem pull_L (r : ℚ) (x y : O ℚ) : (ocR r * x) * y = ocR r * (x * y) :=
  (ocR_assocL r x y).symm
theorem pull_RR (r : ℚ) (x y : O ℚ) : (x * y) * ocR r = ocR r * (x * y) :=
  (ocR_comm r (x * y)).symm
theorem pull_M (r : ℚ) (x y : O ℚ) : (x * ocR r) * y = ocR r * (x * y) := by
  rw [← ocR_comm r x]; exact (ocR_assocL r x y).symm
theorem pull_R2 (r : ℚ) (x y : O ℚ) : x * (y * ocR r) = ocR r * (x * y) := by
  rw [ocR_assocR r x y]; exact (ocR_comm r (x * y)).symm
theorem pull_R1 (r : ℚ) (x y : O ℚ) : x * (ocR r * y) = ocR r * (x * y) := by
  rw [ocR_comm r y]; exact pull_R2 r x y

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 8000 in
theorem b01 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 1 = 0 := by
  have hbb : (jdef (Xz a b c) (Xz p 0 0)) 0 1 = 0 := bb1_e01 a b c p
  simp only [jdef, jb, Xz, Fin.isValue, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    mul_add, add_mul] at hbb
  simp only [jdef, jb, Hm, Xz, Fin.isValue, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    mul_add, add_mul]
  simp only [pull_L, pull_M, pull_R1, pull_R2, pull_RR, ocR_mul,
    mul_add, add_mul, mul_zero, zero_mul, add_zero, zero_add]
  linear_combination (norm := abel) hbb

end Probe71d
