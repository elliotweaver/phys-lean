/- PROBE (run 74, W9 MEASURE): ocR-OPAQUE goal shape for polarCross1 entry (0,1).
   Keep ocR opaque (do NOT unfold ocR). Unfold Dg->diagonal, entrysimp, then print the
   octonion goal. Measure cost. KILL 75s. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe74Op
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.diagonal_apply_eq, Matrix.diagonal_apply_ne, Ne, Fin.zero_eta, Fin.mk.injEq,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

set_option maxHeartbeats 1200000 in
theorem p1_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1 jb Dg Xz
  entrysimp
  trace_state
  sorry

end Probe74Op
