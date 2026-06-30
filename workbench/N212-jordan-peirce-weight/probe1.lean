import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

variable (a : O ℚ)

/-- E0 acts on the (0,1)-slot with unscaled eigenvalue 1. -/
theorem jb_Du0_Xz (a : O ℚ) : jb (Du0 (B := Dbl ℚ)) (Xz a 0 0) = Xz a 0 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- E1 acts on the (0,1)-slot with unscaled eigenvalue 1. -/
theorem jb_Du1_Xz (a : O ℚ) : jb (Du1 (B := Dbl ℚ)) (Xz a 0 0) = Xz a 0 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- E2 ANNIHILATES the (0,1)-slot (eigenvalue 0 — the slot is NOT in E2's support). -/
theorem jb_Du2_Xz (a : O ℚ) : jb (Du2 (B := Dbl ℚ)) (Xz a 0 0) = 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- ★ THE HEADLINE — the FORCED WEIGHT. The (0,1)-slot carries weight `t0 + t1` under the
    diagonal Cartan `diag(t0,t1,t2)`. Structural route: Dg_eq_smul + jb_add_left + jb_smul_left
    + the three unit lemmas — NO octonion-coordinate ring. -/
theorem jb_Dg_Xz (t0 t1 t2 : ℚ) (a : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) • (Xz a 0 0) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xz, jb_Du1_Xz, jb_Du2_Xz, smul_zero, add_zero, add_smul]

/-- The frame is complete: the three diagonal units resolve the identity. -/
theorem frame_sum :
    Du0 (B := Dbl ℚ) + Du1 (B := Dbl ℚ) + Du2 (B := Dbl ℚ)
      = (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Du0, Du1, Du2, Matrix.add_apply, Matrix.one_apply, Matrix.diagonal_apply]

/-- E0 is idempotent. -/
theorem Du0_idem : Du0 (B := Dbl ℚ) * Du0 (B := Dbl ℚ) = Du0 (B := Dbl ℚ) := by
  apply Matrix.ext; intro i j
  simp only [Du0, Matrix.diagonal_mul]
  fin_cases i <;> fin_cases j <;> simp [Matrix.diagonal_apply]

/-- Distinct frame idempotents are Jordan-orthogonal. -/
theorem jb_Du0_Du1 : jb (Du0 (B := Dbl ℚ)) (Du1 (B := Dbl ℚ)) = 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;> simp [Matrix.diagonal_apply]

/-- ★ W8 TEETH: the (0,1)-slot weight under `diag(2,3,0)` is genuinely `2+3 = 5`. -/
theorem slot01_weight_witness :
    ((jb (Dg 2 3 0) (Xz (1 : O ℚ) 0 0)) 0 1).re.re.re = 5 := by
  rw [jb_Dg_Xz]
  simp only [Matrix.smul_apply, qsmul_def, Xz, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    ocR, CD.mul_re, CD.mul_im, CD.one_re, CD.one_im, mul_one, mul_zero, sub_zero, add_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.one_re, Dbl.one_im]
  norm_num

#print axioms jb_Du0_Xz
#print axioms jb_Du1_Xz
#print axioms jb_Du2_Xz
#print axioms jb_Dg_Xz
#print axioms frame_sum
#print axioms Du0_idem
#print axioms jb_Du0_Du1
#print axioms slot01_weight_witness

end Phys.Algebra.HJ
