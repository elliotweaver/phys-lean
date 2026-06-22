import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

namespace ScratchOne
attribute [local instance] CD.narCD CD.srCD

-- Zero-diagonal Hermitian 3x3 over O ℚ = CD (H ℚ). Off-diagonals a,b,c opaque octonions.
noncomputable def Hz (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 4000000 in
-- TEST: one-layer CD split (NOT all the way to ℚ) + push star to atoms + noncomm_ring over H.
theorem zentry01 (a b c p q r : O ℚ) :
    (jdef (Hz a b c) (Hz p q r)) 0 1 = 0 := by
  unfold jdef jb Hz
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    star_mul', star_add, star_neg, star_star, star_zero, star_one,
    mul_neg, neg_mul, neg_neg, mul_add, add_mul, mul_zero, zero_mul,
    add_zero, zero_add, neg_zero] <;>
  noncomm_ring

end ScratchOne
