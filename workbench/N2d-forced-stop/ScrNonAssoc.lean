import Phys.Cascade.ForcedStop
import Mathlib.Tactic

/-! Scratch: does Part A port from [Ring A] to [NonAssocRing A]?
    We re-state the key lemmas over [NonAssocRing A][StarRing A] and see what breaks.
    NonAssocRing = distributivity + 1 + add group, NO mul_assoc.
    StarRing requires [NonUnitalNonAssocSemiring]? Check star_mul' availability. -/

namespace Phys.Cascade.CD

variable {A : Type*}

-- Does StarRing typecheck over NonAssocRing? (StarRing extends StarMul extends Star;
-- star_mul : star (r*s) = star s * star r ; needs Mul only)
section NonAssoc
variable [NonAssocRing A] [StarRing A]

-- the CD product re/im simp lemmas only need [Mul][Add][Neg][Star], so they hold.
-- Test Nrm and bilin defs (need Mul/Add/Neg/Star) — fine.
-- Test distributivity add_mul' : (x+y)*z = x*z + y*z over NonAssocRing base.
example (x y z : CD A) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel

example (x y z : CD A) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel

-- Test Nrm_add (polarization) over NonAssocRing
example (x y : CD A) :
    Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]
  abel

end NonAssoc

end Phys.Cascade.CD
