/- PROBE (run 69, W9.7 MEASURE): close block-1 entry (0,1), which has NO Dg-deg-1 (pure bb
   after ocR cancellation). Test: entrysimp, then normalize ocR (central) + abel to cancel
   the ocR terms, leaving the bb1_e01 octonion residue, closed by bb1_e01. KILL 80s. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe69C01
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

-- The (0,1) entry of jdef(Hm)(Xz p00). bb1_e01 gives the Xz analog = 0.
-- Strategy: relate to bb1_e01 by showing the ocR-bearing terms vanish.
-- First: what does the bb1_e01 entry look like vs this? Try linear_combination of bb1_e01.
set_option maxHeartbeats 800000 in
theorem c01 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 1 = 0 := by
  have hbb : (jdef (Xz a b c) (Xz p 0 0)) 0 1 = 0 := bb1_e01 a b c p
  unfold jdef jb Hm Xz at *
  rw [show Xz a b c = Xz a b c from rfl] at hbb
  entrysimp at hbb ⊢
  -- try: the difference (this goal) - hbb should be the ocR-linear part, = 0 by centrality.
  linear_combination (norm := abel) hbb

end Probe69C01
