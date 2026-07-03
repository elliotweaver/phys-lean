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

local macro "entryexp" : tactic =>
  `(tactic| simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply])

-- e01: plain recipe, then INSPECT what remains (use sorry to see goal but still compile-check the simp)
set_option maxHeartbeats 800000 in
theorem e01 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 1 = 0 := by
  entryexp
  norm_num
  -- try the universal closer: normalize ocR then abel
  simp only [ocRmulL, ocRmulR]
  abel

end Phys.Algebra.HJ
