/- PROBE 111: KEY TEST. The pc1 coefficient with NUMERIC diagonal (Dg 1 0 0) is a PURE octonion
   identity (ocR 1, ocR 0 numeric) — does it close by the bb1-style coordinate route cdsimp0<;>ring?
   If YES, the specialization+linearity assembly is viable. Test pc1_00 (diag) AND pc1_01 (off-diag)
   for Dg 1 0 0. KILL 120s each. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe111
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
      zero_mul, mul_zero, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 2000000 in
theorem pc1_00_d0 (a b c p q r : O ℚ) :
    (polarCross1 (Dg 1 0 0) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 2000000 in
theorem pc1_01_d0 (a b c p q r : O ℚ) :
    (polarCross1 (Dg 1 0 0) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  ext <;> cdsimp0 <;> ring

end Probe111
