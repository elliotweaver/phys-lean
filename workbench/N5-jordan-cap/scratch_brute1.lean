import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ScratchBrute

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def Hz (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 40000000 in
-- FULL brute split to ℚ, close with ring. Time the HARDEST entry (off-diag, zero diag).
theorem zentry01 (a b c p q r : O ℚ) :
    (jdef (Hz a b c) (Hz p q r)) 0 1 = 0 := by
  unfold jdef jb Hz
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, Matrix.zero_apply,
    sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul, add_zero, zero_add, neg_zero] <;>
  ring

end ScratchBrute
