/- PROBE off-diagonal entry (0,1), brute ℚ, minimal simp, hard-killed. W9.3 viability. -/
import Phys.Algebra.HermitianJordan.Setup
namespace ProbeOff
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 2000000 in
theorem entry_01 (d0 d1 d2 e0 e1 e2 : ℚ) (a b c p q r : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 1 = 0 := by
  unfold jdef jb Hm ocR
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im] <;>
  ring
end ProbeOff
