/- PROBE (run 66, W9.2): MEASURE the octonion-coordinate burden for pieceA.
   G_X = X·(jb X X) − (jb X X)·X, X = Xz a b c (zero-diagonal, octonion-only, NO ocR).
   Burden 1 (alt): the OFF-DIAGONAL entries of G_X vanish. Test (0,1),(0,2),(1,2).
   Bounded: maxHeartbeats 400000 (NOT inflated). Wall-kill at 90s by the harness. -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe66GXZ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD
variable {B : Type*} [CommRing B] [StarRing B]

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
theorem gx_e01 (a b c : CD (CD B)) :
    ((Xz a b c) * (jb (Xz a b c) (Xz a b c)) - (jb (Xz a b c) (Xz a b c)) * (Xz a b c)) 0 1 = 0 := by
  unfold jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

end Probe66GXZ
