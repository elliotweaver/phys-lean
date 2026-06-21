import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

variable {A : Type*} [Ring A] [StarRing A]

example
    (x y : CD A) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  simp only [CD.mul_re, CD.mul_im, CD.star_im, star_add, star_neg,
    star_mul, star_star]
  extract_goal
  sorry

end Scratch
