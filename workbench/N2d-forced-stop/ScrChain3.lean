import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

-- Inspect what's left for Nrm_star
example (z : CD A) : Nrm (star z) = Nrm z := by
  simp only [Nrm, star_star, mul_re, star_re, star_im, mul_neg, neg_neg]
  sorry

-- Try: Nrm z = z.re*star z.re + star z.im*z.im (Nrm_def). For star z:
-- star z = (star z.re, -z.im).  Nrm(star z) = star z.re * star(star z.re) + star(-z.im)*(-z.im)
--        = star z.re * z.re + (-star z.im)*(-z.im) = star z.re * z.re + star z.im * z.im
-- Nrm z = z.re * star z.re + star z.im * z.im.
-- DIFFER: star z.re * z.re  vs  z.re * star z.re. NOT equal over noncomm base!
-- So Nrm_star is NOT structural over [Ring A]. It needs comm of re-part self-overlap.
-- BUT on the doubled base it holds. Check Nrm_def-based:
example (z : CD A) : Nrm z = z.re * star z.re + star z.im * z.im := Nrm_def z
example (z : CD A) : Nrm (star z) = star z.re * z.re + star z.im * z.im := by
  rw [Nrm_def]; simp [star_star]

end Phys.Cascade.CD
