import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]
theorem bilin_iota_e2 (v : CD A) (d : A) :
    bilin v (iota d * (e2 : CD A)) = v.im * star d + d * star v.im := by
  unfold bilin iota e2
  simp only [add_re, mul_re, mul_im, star_re, star_im, star_zero, star_one,
    mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, mul_neg,
    neg_mul, neg_neg, star_mul, star_star, star_neg]
  trace_state
  sorry
end NonAssoc
end Phys.Cascade.CD
