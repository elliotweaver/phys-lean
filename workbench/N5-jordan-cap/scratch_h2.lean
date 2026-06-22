import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ScratchH2

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def Hz (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 8000000 in
theorem zentry01 (a b c p q r : O ℚ) :
    (jdef (Hz a b c) (Hz p q r)) 0 1 = 0 := by
  unfold jdef jb Hz
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add]
  apply CD.ext
  · -- re component
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
      StarMul.star_mul, _root_.star_add, star_neg, star_star, star_zero, star_one,
      mul_neg, neg_mul, neg_neg, mul_add, add_mul, mul_zero, zero_mul,
      add_zero, zero_add, sub_eq_add_neg]
    noncomm_ring
  · -- im component
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
      StarMul.star_mul, _root_.star_add, star_neg, star_star, star_zero, star_one,
      mul_neg, neg_mul, neg_neg, mul_add, add_mul, mul_zero, zero_mul,
      add_zero, zero_add, sub_eq_add_neg]
    noncomm_ring

end ScratchH2
