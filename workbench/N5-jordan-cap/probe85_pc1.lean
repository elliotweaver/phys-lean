/- PROBE 85: polarCross1 (Dg)(Xz)(Xz) — the deg-1 alternativity kernel. Measure the (0,0)
   diagonal entry and (0,1) off-diagonal structure after dgsimp + scalar transport.
   Does the smul frame reduce it to Σ ocR d_k · (associator), and does asw_star/ka close it?
   First just TRACE the structure. KILL 100s. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.PieceB
import Mathlib.Tactic

namespace Probe85
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 2000000 in
theorem pc1_00 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  trace_state
  sorry

end Probe85
