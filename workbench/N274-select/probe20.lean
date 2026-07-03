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

-- CLEAN CLOSER: structural simp only; then per entry:
--   live entries -> normalize distribution (ocRmul,distribute,sub_smul) + abel;
--   zero entries -> full `simp` (only it crushes octonion 0-products).
-- Order the `first` so the algebra branch (no zero lemmas -> no-progress FAILS on zeros) is tried
-- first, falling through to `simp` for the zeros.
set_option maxHeartbeats 1600000 in
theorem innerMul_slot_diag_F (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) = slotC ((d2 - d1) • (star a * b)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    (simp only [jb, slotA, slotB, slotC, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
       Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
       Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
       Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply,
       Fin.isValue, reduceIte] <;>
     first
       | (rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL, mul_add, add_mul, qsmul_mul_right,
            qsmul_mul_right, qsmul_mul_left, qsmul_mul_left, sub_smul]; abel)
       | simp)

end Phys.Algebra.HJ
