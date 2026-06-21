import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

set_option maxHeartbeats 4000000 in
example {B : Type*} [CommRing B] [StarRing B]
    (u v w : CD (CD B)) : bilin (u * v) w = bilin v (star u * w) := by
  simp only [bilin, mul_re, mul_im, star_re, star_im, add_re, add_im,
    neg_re, neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
    mul_neg, neg_neg, add_mul, mul_add]
  sorry
end Phys.Cascade.CD
