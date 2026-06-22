import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

namespace ScratchAlt

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 4000000 in
/-- LEFT ALTERNATIVE LAW, direct coordinate route (mirror of scaling_law). -/
theorem left_alt (x y : CD (CD B)) : x * (x * y) = (x * x) * y := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- RIGHT ALTERNATIVE LAW, direct coordinate route. -/
theorem right_alt (x y : CD (CD B)) : (y * x) * x = y * (x * x) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

end ScratchAlt
