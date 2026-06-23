/- PROBE 110: transport pc1 (0,0) diag + (0,1) off-diag to ℚ-scalar • form, then EXPOSE the goal.
   Reuses the banked pc2 transport machinery (tr_l/tr_r/tr_sl/tr_sr from PieceBdeg2).
   Leave the goal unsolved so the compiler prints it — reveals the per-d_k coefficient
   octonion expressions S_k I must prove vanish by alternativity. KILL 90s. -/
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Mathlib.Tactic

namespace Probe110
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 1000000 in
theorem pc1_00 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
  simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]
  trace_state
  sorry

set_option maxHeartbeats 1000000 in
theorem pc1_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
  simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]
  trace_state
  sorry

end Probe110
