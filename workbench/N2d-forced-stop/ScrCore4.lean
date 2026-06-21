import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

theorem bilin_iota (v : CD A) (d : A) :
    bilin v (iota d) = v.re * star d + d * star v.re := by
  unfold bilin iota
  simp only [add_re, mul_re, mul_im, star_re, star_im, star_zero,
    mul_zero, zero_mul, add_zero, zero_add, neg_zero, mul_neg, neg_mul, neg_neg]

theorem bilin_iota_e2 (v : CD A) (d : A) :
    bilin v (iota d * (e2 : CD A)) = v.im * star d + d * star v.im := by
  unfold bilin iota e2
  simp only [add_re, mul_re, mul_im, star_re, star_im, star_zero, star_one,
    mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, mul_neg,
    neg_mul, neg_neg, star_mul, star_star]
  abel

-- The adjoint identity (H-FREE): bilin (u * v) w = bilin v (star u * w)
theorem adjoint (u v w : CD A) :
    bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  simp only [add_re, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, mul_neg, neg_mul, neg_neg, mul_add, add_mul]
  trace_state
  sorry

end NonAssoc
end Phys.Cascade.CD
