/- PROBE 104: transported (2,2) diagonal entry + (0,1) off-diagonal. Show post-transport
   goal to hand-build the asw_star/ka close. Diagonal should be Σ d_k•(assoc+star assoc). -/
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe104
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

local macro "transport" : tactic =>
  `(tactic|
    (simp only [Matrix.add_apply, Matrix.sub_apply]
     dgsimp
     simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
     simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]))

set_option maxHeartbeats 4000000 in
theorem pc1_22 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 2 = 0 := by
  unfold polarCross1
  transport
  trace_state
  sorry

end Probe104
