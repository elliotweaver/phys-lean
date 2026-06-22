/- PROBE (run 66, W9.2): MEASURE the off-diagonal of Gmat (Hm ...) DIRECTLY (ocR present).
   Risk: ocR coordinate expansion = whnf wall (run 62). KILL 90s. If this blows up, we must
   first reduce G_Hm off-diag = G_Xz off-diag STRUCTURALLY (drop the central diagonal). -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe66HG
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])
local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

set_option maxHeartbeats 400000 in
-- Off-diagonal (0,1) of Gmat (Hm d0 d1 d2 a b c) with ocR present. MEASURE ONLY.
theorem hg_e01 (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    ((Hm d0 d1 d2 a b c) * (jb (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c))
      - (jb (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) * (Hm d0 d1 d2 a b c)) 0 1 = 0 := by
  unfold jb Hm; entrysimp; ext <;> cdsimp0 <;> ring

end Probe66HG
