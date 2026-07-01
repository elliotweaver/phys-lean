import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Phys.Algebra.OctonionJordanFrameWeight
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem jb_Du0_Xzabc (a b c : O ℚ) :
    jb (Du0 (B := Dbl ℚ)) (Xz a b c) = Xz a b 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem jb_Du1_Xzabc (a b c : O ℚ) :
    jb (Du1 (B := Dbl ℚ)) (Xz a b c) = Xz a 0 c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem jb_Du2_Xzabc (a b c : O ℚ) :
    jb (Du2 (B := Dbl ℚ)) (Xz a b c) = Xz 0 b c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem Xz_smul (r : ℚ) (a b c : O ℚ) :
    r • Xz a b c = Xz (r • a) (r • b) (r • c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.smul_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

theorem Xz_add (a b c p q r : O ℚ) :
    Xz a b c + Xz p q r = Xz (a + p) (b + q) (c + r) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.add_apply, star_add, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

theorem jb_Dg_Xzabc (t0 t1 t2 : ℚ) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((t0 + t1) • a) ((t0 + t2) • b) ((t1 + t2) • c) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xzabc, jb_Du1_Xzabc, jb_Du2_Xzabc,
      Xz_smul, Xz_smul, Xz_smul, Xz_add, Xz_add]
  simp only [smul_zero, add_zero, zero_add, add_smul]

-- W8 witness: (1,2)-slot weight under the TRACE-ZERO Cartan diag(2,3,-5): t1+t2 = 3+(-5) = -2.
theorem slot12_traceZero_weight_witness :
    ((jb (Dg 2 3 (-5)) (Xz (0 : O ℚ) 0 1)) 1 2).re.re.re = -2 := by
  rw [jb_Dg_Xzabc]
  simp only [Matrix.smul_apply, qsmul_def, Xz, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
    ocR, CD.mul_re, CD.mul_im, CD.one_re, CD.one_im, mul_one, mul_zero, sub_zero, add_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.one_re]
  norm_num [Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons, Matrix.cons_val_zero,
    Matrix.cons_val_one]

#print axioms slot12_traceZero_weight_witness

end Phys.Algebra.HJ
