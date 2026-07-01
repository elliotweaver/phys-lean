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

-- Frame lemma E0: keeps (0,1)=a and (0,2)=b, kills (1,2)=c.
theorem jb_Du0_Xzabc (a b c : O ℚ) :
    jb (Du0 (B := Dbl ℚ)) (Xz a b c) = Xz a b 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

-- Frame lemma E1: keeps (0,1)=a and (1,2)=c, kills (0,2)=b.
theorem jb_Du1_Xzabc (a b c : O ℚ) :
    jb (Du1 (B := Dbl ℚ)) (Xz a b c) = Xz a 0 c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

-- Frame lemma E2: keeps (0,2)=b and (1,2)=c, kills (0,1)=a.
theorem jb_Du2_Xzabc (a b c : O ℚ) :
    jb (Du2 (B := Dbl ℚ)) (Xz a b c) = Xz 0 b c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

-- scalar-star compatibility on O ℚ under the ℚ-action r•x = ocR r * x.
theorem smul_star_O (r : ℚ) (x : O ℚ) : star (r • x) = r • star x := by
  rw [qsmul_def, qsmul_def, star_mul, ocR_star, ocR_comm]

-- Xz is ℚ-linear (compatible with smul), using the star-compat helper on the lower entries.
theorem Xz_smul (r : ℚ) (a b c : O ℚ) :
    r • Xz a b c = Xz (r • a) (r • b) (r • c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.smul_apply, smul_star_O, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

-- Xz additivity.
theorem Xz_add (a b c p q r : O ℚ) :
    Xz a b c + Xz p q r = Xz (a + p) (b + q) (c + r) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.add_apply, star_add, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

-- ★★★ THE FULL WEIGHT DIAGRAM: all three off-diagonal slots simultaneously.
theorem jb_Dg_Xzabc (t0 t1 t2 : ℚ) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((t0 + t1) • a) ((t0 + t2) • b) ((t1 + t2) • c) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xzabc, jb_Du1_Xzabc, jb_Du2_Xzabc,
      Xz_smul, Xz_smul, Xz_smul, Xz_add, Xz_add]
  simp only [smul_zero, add_zero, zero_add, add_smul]

#print axioms jb_Du0_Xzabc
#print axioms jb_Du1_Xzabc
#print axioms jb_Du2_Xzabc
#print axioms smul_star_O
#print axioms Xz_smul
#print axioms Xz_add
#print axioms jb_Dg_Xzabc

end Phys.Algebra.HJ
