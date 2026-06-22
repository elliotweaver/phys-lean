import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

namespace ScratchTk

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- The associator of the octonion shape. -/
def assoc (x y z : CD (CD B)) : CD (CD B) := (x * y) * z - x * (y * z)

set_option maxHeartbeats 4000000 in
/-- LEFT ALTERNATIVE: assoc x x y = 0. -/
theorem assoc_llz (x y : CD (CD B)) : assoc x x y = 0 := by
  unfold assoc
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_re, sub_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero, sub_eq_add_neg] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- RIGHT ALTERNATIVE: assoc x y y = 0. -/
theorem assoc_lrr (x y : CD (CD B)) : assoc x y y = 0 := by
  unfold assoc
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_re, sub_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero, sub_eq_add_neg] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- FLEXIBLE LAW: assoc x y x = 0. -/
theorem assoc_lxx (x y : CD (CD B)) : assoc x y x = 0 := by
  unfold assoc
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_re, sub_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero, sub_eq_add_neg] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ANTISYMMETRY in args 1,2 (linearized left-alt). -/
theorem assoc_anti12 (x y z : CD (CD B)) : assoc x y z + assoc y x z = 0 := by
  unfold assoc
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_re, sub_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero, sub_eq_add_neg] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ANTISYMMETRY in args 2,3 (linearized right-alt). -/
theorem assoc_anti23 (x y z : CD (CD B)) : assoc x y z + assoc x z y = 0 := by
  unfold assoc
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_re, sub_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero, sub_eq_add_neg] <;>
    ring

end ScratchTk
