import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

-- (1) Nrm star-invariance: structural [Ring A][StarRing A]?
theorem Nrm_star (z : CD A) : Nrm (star z) = Nrm z := by
  simp only [Nrm, star_star, mul_re, star_re, star_im, neg_mul, mul_neg, neg_neg]
  ring

-- (2) self-overlap is central as a base element?  Nrm z lands in base; is it
--     central + self-conjugate over a general [Ring A]? (expect NO in general)
-- We'll instead need it on the cascade. Just check star (Nrm z) = Nrm z structurally:
theorem Nrm_selfconj (z : CD A) : star (Nrm z) = Nrm z := by
  simp only [Nrm, mul_re, star_re, star_im, star_add, star_mul, star_star, star_neg, neg_mul, mul_neg, neg_neg]
  ring

#print axioms Nrm_star
#print axioms Nrm_selfconj
end Phys.Cascade.CD
