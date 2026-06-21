import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
-- Over an ASSOCIATIVE base: does the adjoint hold structurally?
section Assoc
variable [Ring A] [StarRing A]
theorem adjoint_ring (u v w : CD A) :
    bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  simp only [add_re, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_add, mul_neg, neg_mul, neg_neg, mul_add, add_mul, neg_add,
    mul_assoc]
  abel
end Assoc
end Phys.Cascade.CD
