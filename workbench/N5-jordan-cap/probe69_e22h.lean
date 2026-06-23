/- PROBE (run 69, W9.7): attempt Hm block-1 entry (2,2) building on e22's ka pattern.
   (2,2) = e22 content (deg-0) + ocR d0·(asw/ka) + ocR d1·(asw/ka). Measure what abel needs. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe69E22H
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

set_option maxHeartbeats 1200000 in
theorem e22h (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 2 2 = 0 := by
  unfold jdef jb Hm Xz
  entrysimp
  extract_goal
  sorry

end Probe69E22H
