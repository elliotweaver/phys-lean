/-
  SCRATCH — de-risk the generic associator-iff before production.
  (isolated; not imported by Phys.lean)
-/
import Phys.Cascade.Double
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD

variable {A : Type*}

/-- ★ THE ONE CAUSE of non-ASSOCIATIVITY one rung up. In the double, the triple
    `(ι a, ι b, e₂)` associates IFF the base elements `a, b` commute. -/
theorem iota_iota_e2_assoc_iff [Ring A] [StarRing A] (a b : A) :
    (iota a * iota b) * (e2 : CD A) = iota a * (iota b * (e2 : CD A))
      ↔ a * b = b * a := by
  constructor
  · intro h
    have hi := congrArg CD.im h
    simp only [iota, e2, mul_re, mul_im, mul_zero, zero_mul, add_zero, zero_add,
      star_zero, star_one, mul_one, one_mul, neg_zero] at hi
    exact hi
  · intro h
    ext
    · simp only [iota, e2, mul_re, mul_im, mul_zero, zero_mul, add_zero, zero_add,
        star_zero, star_one, mul_one, one_mul, neg_zero]
    · simp only [iota, e2, mul_re, mul_im, mul_zero, zero_mul, add_zero, zero_add,
        star_zero, star_one, mul_one, one_mul, neg_zero]
      exact h

end CD
end Phys.Cascade
