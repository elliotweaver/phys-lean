import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

-- Scaling law as an EQUATION (no Sub on CD A needed).
-- Goal: from Scal, derive base associativity. First, understand the .im structure.
-- Every CD elt ⟨a,b⟩ = iota a + iota b * e2; and x*(star x * y) vs iota(Nrm x)*y.

-- Probe: what is (iota a * (star (iota a) * iota c)).im  vs (iota(Nrm (iota a)) * iota c).im?
-- and the mixed element ⟨a,b⟩. Let's print the goal for the full scaling law at ⟨a,b⟩, y=iota c.

-- Use a raw CD elt ⟨a,b⟩ via the structure constructor.
example (a b c : A) :
    ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_add, star_zero, star_one, mul_zero, zero_mul, add_zero, zero_add,
    neg_zero, mul_one, one_mul, mul_neg, neg_mul, neg_neg]
  sorry

end NonAssoc
end Phys.Cascade.CD
