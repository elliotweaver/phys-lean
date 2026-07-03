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

-- entryexp WITH explicit if-reduction via Nat decide lemmas + zero cleanup
local macro "entryexp2" : tactic =>
  `(tactic| simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply,
      show (1:ℕ)=2 ↔ False by decide, show (2:ℕ)=1 ↔ False by decide,
      show (0:ℕ)=2 ↔ False by decide, show (2:ℕ)=0 ↔ False by decide,
      show (0:ℕ)=1 ↔ False by decide, show (1:ℕ)=0 ↔ False by decide,
      if_false, if_true, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero,
      star_zero, mul_one, one_mul])

set_option maxHeartbeats 800000 in
theorem e01 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 1 = 0 := by
  entryexp2
  first
    | rfl
    | (rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL]; abel)
    | (rw [ocRmulR, ocRmulL]; abel)
    | (rw [ocRmulL, ocRmulR]; abel)

set_option maxHeartbeats 800000 in
theorem e00 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 0 0 = 0 := by
  entryexp2
  first
    | rfl
    | (rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL]; abel)
    | (rw [ocRmulL, ocRmulR]; abel)

set_option maxHeartbeats 800000 in
theorem e12 (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))) 1 2
      = (d2 - d1) • (star a * b) := by
  entryexp2
  rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL, mul_add, add_mul, qsmul_mul_right, qsmul_mul_right,
    qsmul_mul_left, qsmul_mul_left, sub_smul]; abel

end Phys.Algebra.HJ
