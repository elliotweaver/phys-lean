/- PROBE (run 70, W9.7 MEASURE): close block-1 entry (0,1).
   blockcounts: (0,1) Dg-deg dist {0:12} — NO surviving ocR; ocR terms cancel by centrality,
   ocR-deg-0 part = bb1_e01 entry. Test: entrysimp both, linear_combination (norm:=abel) hbb.
   KILL 70s. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe70B01
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
theorem b01 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 1 = 0 := by
  have hbb : (jdef (Xz a b c) (Xz p 0 0)) 0 1 = 0 := bb1_e01 a b c p
  unfold jdef jb Xz at hbb
  unfold jdef jb Hm Xz
  entrysimp at hbb ⊢
  linear_combination (norm := abel) hbb
