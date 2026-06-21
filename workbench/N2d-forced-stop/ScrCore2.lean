import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

theorem bilin_iota (v : CD A) (d : A) :
    bilin v (iota d) = v.re * star d + d * star v.re := by
  unfold bilin iota
  simp only [mul_re, mul_im, star_re, star_im, star_zero,
    mul_zero, zero_mul, add_zero, zero_add, neg_zero, mul_neg, neg_mul, neg_neg]
  abel

end NonAssoc
end Phys.Cascade.CD
