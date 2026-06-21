import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

-- TEST 1: SCALING LAW as unconditional ext+ring identity over CD(CD B)?
set_option maxHeartbeats 4000000 in
theorem scaling_doubled_base {B : Type*} [CommRing B] [StarRing B]
    (x y : CD (CD B)) : x * (star x * y) = iota (Nrm x) * y := by
  rw [Nrm_def]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im,
      neg_re, neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
      mul_neg, neg_neg, add_mul, mul_add, iota_re, iota_im,
      zero_re, zero_im, star_zero, mul_zero, zero_mul, add_zero, zero_add,
      neg_zero, sub_zero] <;>
    ring

#print axioms scaling_doubled_base
end Phys.Cascade.CD
