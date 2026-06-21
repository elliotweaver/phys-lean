import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

variable {A : Type*} [Ring A] [StarRing A]

-- The generic forward law. Hypotheses (the trunk's Born/conjugation structure):
--   selfCentral : ∀ a w, (a * star a) * w = w * (a * star a)   [Born self-overlap central]
--   selfSymm    : ∀ a, a * star a = star a * a                 [self-overlap symmetric]
--   We'll also derive the polarized form from these as needed.
-- Target: (x*y).Nrm = x.Nrm * y.Nrm.

-- First inspect the goal precisely after expanding Nrm_def.
set_option maxHeartbeats 1000000 in
example (x y : CD A) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, star_add, star_neg,
    star_mul, star_star, neg_mul, mul_neg, neg_neg]
  extract_goal
  sorry

end Scratch
