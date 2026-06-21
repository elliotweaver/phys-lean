import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

-- TEST A: the ADJOINT as unconditional ext+ring identity over CD(CD B), B CommRing?
--   bilin (u*v) w = bilin v (star u * w)   on the algebra CD(CD B)
set_option maxHeartbeats 4000000 in
theorem adjoint_doubled {B : Type*} [CommRing B] [StarRing B]
    (u v w : CD (CD B)) : bilin (u * v) w = bilin v (star u * w) := by
  simp only [bilin, mul_re, mul_im, star_re, star_im, add_re, add_im,
    neg_re, neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
    mul_neg, neg_neg, add_mul, mul_add]
  ring

#print axioms adjoint_doubled
end Phys.Cascade.CD
