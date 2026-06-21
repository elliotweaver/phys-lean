import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

-- (c) Nrm star-invariance: structural?
theorem Nrm_star (z : CD A) : Nrm (star z) = Nrm z := by
  simp only [Nrm, star_star]
  -- Nrm(star z) = (star z * star(star z)).re = (star z * z).re ; Nrm z = (z*star z).re
  sorry

-- check the raw .re symmetry of self-overlap
example (z : CD A) : (z * star z).re = (star z * z).re := by
  simp only [mul_re, star_re, star_im, star_star, neg_mul, mul_neg, neg_neg]
  sorry

#check @bilin_diag
#check @bilin_add_left
#check @P2
#check @selfMul
#check @iota_mul
end Phys.Cascade.CD
