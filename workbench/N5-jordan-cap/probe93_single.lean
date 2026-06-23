/- PROBE 93: the FULLY-REDUCED pc1 piece. Single d_k (Dg d0 0 0) + single Y-gen (Xz p 0 0).
   After smul-extract d0, the entry should be d0 • (pure 4-generator octonion T) = 0, and T=0
   by the bb1-style coordinate route. Test pc1 (Dg d0 0 0)(Xz a b c)(Xz p 0 0) entries (0,0),(0,1)
   via: smul-transport, then is it d0 • (pure oct)? close by `module`? OR coordinate route?
   First TRACE after transport to see the d0-only structure. KILL 90s. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe93
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

-- single d0, single Y-gen p: trace after dgsimp + transport
set_option maxHeartbeats 2000000 in
theorem pc1_single_00 (d0 : ℚ) (a b c p : O ℚ) :
    (polarCross1 (Dg d0 0 0) (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
  simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]
  trace_state
  sorry

end Probe93
