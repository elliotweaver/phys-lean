/- PROBE (run 69, W9.2): EXTRACT the pieceB block-1 (0,0) DIAGONAL entry goal after
   entrysimp, ocR opaque. (0,0) has L1 = asw_star combos (2 associators). See the FULL
   structure including any Dg-deg-2/3 residue. -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.HermitianJordan.Core
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe69E00
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

set_option maxHeartbeats 400000 in
theorem pieceB_e00_goal (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold jdef jb Hm Xz
  entrysimp
  extract_goal
  sorry

end Probe69E00
