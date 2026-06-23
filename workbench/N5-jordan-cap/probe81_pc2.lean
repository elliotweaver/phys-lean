/- PROBE 81: THE SMUL DISSOLUTION on pc2 (0,1).
   Build Module ℚ (O ℚ) via r • x := ocR r * x, prove the scalar-transport lemmas, then close
   the dgsimp'd pc2 (0,1) entry by pushing every ocR to a ℚ-scalar action and closing by
   `module`. MEASURE ONLY. KILL 90s. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe81
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

-- THE Q-MODULE on O ℚ: scalar action by the central real embedding.
noncomputable def qmod : Module ℚ (O ℚ) where
  smul r x := ocR r * x
  one_smul x := ocR_one_mul x
  mul_smul r s x := by show ocR (r*s) * x = ocR r * (ocR s * x); rw [← ocR_mul, ocR_assocL]
  smul_zero r := by show ocR r * 0 = 0; rw [mul_zero]
  smul_add r x y := by show ocR r * (x+y) = ocR r * x + ocR r * y; rw [mul_add]
  add_smul r s x := by show ocR (r+s) * x = ocR r * x + ocR s * x; rw [← ocR_add, add_mul]
  zero_smul x := by show ocR 0 * x = 0; rw [ocR_zero, zero_mul]

attribute [local instance] qmod

theorem qsmul_def (r : ℚ) (x : O ℚ) : r • x = ocR r * x := rfl

-- scalar-transport lemmas (DIRECTED: pull the scalar out through the octonion product)
theorem ocR_smul (r : ℚ) (x : O ℚ) : ocR r * x = r • x := rfl
theorem mul_ocR (r : ℚ) (x : O ℚ) : x * ocR r = r • x := by
  rw [qsmul_def, ocR_comm]
theorem smul_mul_assoc' (r : ℚ) (x y : O ℚ) : (r • x) * y = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocL]
theorem mul_smul_comm' (r : ℚ) (x y : O ℚ) : x * (r • y) = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocM, ← ocR_comm, ocR_assocL]

-- Dg entry helpers reused from PieceBscale (Dg00..Dg21 already banked there).
local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 2000000 in
theorem pc2_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross2
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  -- push every ocR to a ℚ-scalar action, collapse products, close by module
  simp only [ocR_smul, mul_ocR, smul_mul_assoc', mul_smul_comm', smul_add, add_smul,
    smul_smul, mul_smul, smul_zero, smul_neg, neg_smul]
  module

end Probe81
