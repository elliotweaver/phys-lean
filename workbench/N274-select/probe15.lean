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

-- Full matrix, but split: first collapse zeros/ifs, THEN abel only where needed.
-- Strategy A: simp with zero_mul/mul_zero LAST so they mop up products created by add_mul.
set_option maxHeartbeats 1600000 in
theorem innerMul_slot_diag_A (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) = slotC ((d2 - d1) • (star a * b)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [jb, slotA, slotB, slotC, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply,
      Fin.isValue, reduceIte, mul_zero, zero_mul, add_zero, zero_add, sub_zero, star_zero,
      ocRmulL, ocRmulR, mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, sub_smul] <;>
    first
      | rfl
      | abel
      | (rw [star_smul]; abel)
      | simp [star_smul, mul_one, one_mul]

end Phys.Algebra.HJ
