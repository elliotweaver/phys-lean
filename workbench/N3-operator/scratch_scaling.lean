import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

namespace Phys.Cascade.Scratch

variable {B : Type*} [CommRing B] [StarRing B]

set_option maxHeartbeats 4000000 in
/-- THE LEFT SCALING LAW (= left-alternative law), hypothesis-free on the octonion shape
    `CD (CD B)`: `x · (star x · y) = ι (Nrm x) · y`. -/
theorem scaling_law (x y : CD (CD B)) :
    x * (star x * y) = iota (Nrm x) * y := by
  rw [Nrm_def]
  ext <;>
    simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, zero_add, add_zero, star_zero, neg_zero] <;>
    ring

end Phys.Cascade.Scratch
