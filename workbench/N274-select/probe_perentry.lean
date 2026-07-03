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

-- common per-entry simp macro (matches probe_entries which proved (1,2),(2,1),(0,0) EXIT 0)
local macro "entryexp" : tactic =>
  `(tactic| simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply])

set_option maxHeartbeats 800000 in
theorem whole (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2)))
      = slotC ((d2 - d1) • (star a * b)) := by
  have h00 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 0 = 0 := by
    entryexp; norm_num; rw [ocRmulL, ocRmulR, ocRmulL, ocRmulR]; abel
  have h01 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 1 = 0 := by
    entryexp; norm_num; try (rw [ocRmulR, ocRmulL]; abel)
  have h02 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 2 = 0 := by
    entryexp; norm_num; try (rw [ocRmulR, ocRmulL]; abel)
  have h10 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 1 0 = 0 := by
    entryexp; norm_num; try (rw [ocRmulR, ocRmulL]; abel)
  have h11 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 1 1 = 0 := by
    entryexp; norm_num; rw [ocRmulL, ocRmulR, ocRmulL, ocRmulR]; abel
  have h12 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 1 2 = (d2 - d1) • (star a * b) := by
    entryexp; norm_num
    rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL, mul_add, add_mul, qsmul_mul_right, qsmul_mul_right,
      qsmul_mul_left, qsmul_mul_left, sub_smul]; abel
  have h20 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 2 0 = 0 := by
    entryexp; norm_num; try (rw [ocRmulR, ocRmulL]; abel)
  have h21 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 2 1 = 0 := by
    entryexp; norm_num; try (rw [ocRmulR, ocRmulL]; abel)
  have h22 : (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 2 2 = 0 := by
    entryexp; norm_num; rw [ocRmulL, ocRmulR, ocRmulL, ocRmulR]; abel
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j
  · exact h00
  · exact h01
  · exact h02
  · exact h10
  · exact h11
  · rw [h12]; simp [slotC, Xz]
  · exact h20
  · rw [h21]; simp [slotC, Xz]
  · exact h22

end Phys.Algebra.HJ
