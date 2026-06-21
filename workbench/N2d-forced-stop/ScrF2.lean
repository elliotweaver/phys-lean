import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

variable {A : Type*} [Ring A] [StarRing A]

example
    (htr : ∀ a b : A, (a + star a) * b = b * (a + star a))
    (hnm : ∀ a b : A, (a * star a) * b = b * (a * star a))
    (x y : CD A) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  simp only [CD.mul_re, CD.mul_im, CD.star_im, star_add, star_neg,
    star_mul, star_star, mul_neg, neg_mul, neg_neg]
  -- inspect the goal:
  sorry

end Scratch
