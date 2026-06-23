/- PROBE (run 74): polarCross1 entry (0,1) with Dg entries REDUCED (off-diag->0, diag->ocR d_k)
   and ocR kept OPAQUE. Print the reduced goal. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe74R
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 1200000 in
theorem p1_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1 jb Dg Xz
  simp only [Fin.isValue, Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply,
    Fin.sum_univ_three, Matrix.diagonal_apply_eq, Matrix.diagonal_apply_ne,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    show (0:Fin 3) ≠ 1 by decide, show (0:Fin 3) ≠ 2 by decide,
    show (1:Fin 3) ≠ 0 by decide, show (1:Fin 3) ≠ 2 by decide,
    show (2:Fin 3) ≠ 0 by decide, show (2:Fin 3) ≠ 1 by decide]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]
  trace_state
  sorry

end Probe74R
