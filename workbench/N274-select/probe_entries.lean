import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem ocRmulL (d : ℚ) (x : O ℚ) : ocR d * x = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_left, one_mul]
theorem ocRmulR (d : ℚ) (x : O ℚ) : x * ocR d = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_right, mul_one]

set_option maxHeartbeats 800000 in
theorem germ_entry12 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 1 2
      = (d2 - d1) • (star a * b) := by
  simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply]
  norm_num
  rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL]
  rw [mul_add, add_mul, qsmul_mul_right, qsmul_mul_right, qsmul_mul_left, qsmul_mul_left, sub_smul]
  abel

-- CANDIDATE: the (2,1) conjugate entry.
set_option maxHeartbeats 800000 in
theorem germ_entry21 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 2 1
      = (d2 - d1) • (star b * a) := by
  simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply]
  norm_num
  rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL]
  rw [mul_add, add_mul, qsmul_mul_right, qsmul_mul_right, qsmul_mul_left, qsmul_mul_left, sub_smul]
  abel

-- CANDIDATE: a zero cell, e.g. (0,0). Test if simp+norm_num closes it.
set_option maxHeartbeats 800000 in
theorem germ_entry00 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 0
      = 0 := by
  simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply]
  norm_num
  rw [ocRmulL, ocRmulR, ocRmulL, ocRmulR]
  abel

end Phys.Algebra.HJ
