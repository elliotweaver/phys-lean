import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

namespace ScratchMouf

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 8000000 in
/-- LEFT MOUFANG: x*(y*(x*z)) = ((x*y)*x)*z. -/
theorem moufang_left (x y z : CD (CD B)) : x * (y * (x * z)) = ((x * y) * x) * z := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

set_option maxHeartbeats 8000000 in
/-- RIGHT MOUFANG: ((z*x)*y)*x = z*(x*(y*x)). -/
theorem moufang_right (x y z : CD (CD B)) : ((z * x) * y) * x = z * (x * (y * x)) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

set_option maxHeartbeats 8000000 in
/-- MIDDLE MOUFANG: (x*y)*(z*x) = x*((y*z)*x). -/
theorem moufang_mid (x y z : CD (CD B)) : (x * y) * (z * x) = x * ((y * z) * x) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

end ScratchMouf
