/- PROBE (run 65): GX off-diagonal via the jb-form G = X*(jb X X) − (jb X X)*X (master's G),
   matching master_Q exactly. Measure (0,1) and (1,2) entries. -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace ProbeGX2
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

set_option maxHeartbeats 1200000 in
theorem gx_e01 (a b c : CD (CD B)) :
    ((Xz a b c) * (jb (Xz a b c) (Xz a b c)) - (jb (Xz a b c) (Xz a b c)) * (Xz a b c)) 0 1 = 0 := by
  unfold jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 1200000 in
theorem gx_e12 (a b c : CD (CD B)) :
    ((Xz a b c) * (jb (Xz a b c) (Xz a b c)) - (jb (Xz a b c) (Xz a b c)) * (Xz a b c)) 1 2 = 0 := by
  unfold jb Xz; entrysimp; ext <;> cdsimp0 <;> ring

end ProbeGX2
