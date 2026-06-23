/- PROBE 82: THE SMUL DISSOLUTION on pc2 (0,1) — distribute FIRST, then transport, then module. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe82
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

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

-- scalar-transport: pull every ocR-scalar OUT and to a smul, MERGE adjacent scalars.
theorem tr_l (r : ℚ) (x : O ℚ) : ocR r * x = r • x := rfl
theorem tr_r (r : ℚ) (x : O ℚ) : x * ocR r = r • x := by rw [qsmul_def, ocR_comm]
theorem tr_sl (r : ℚ) (x y : O ℚ) : (r • x) * y = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocL]
theorem tr_sr (r : ℚ) (x y : O ℚ) : x * (r • y) = r • (x * y) := by
  rw [qsmul_def, qsmul_def, ocR_assocM, ← ocR_comm, ocR_assocL]

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
  -- 1. fully distribute the octonion products into a flat sum of monomials
  simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
  -- 2. transport every ocR-scalar OUT to a ℚ-smul; merge nested scalars (smul_smul)
  simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]
  -- 3. ℚ-module identity: coefficients of each octonion 2-monomial cancel
  module

end Probe82
