import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

set_option linter.unusedSimpArgs false in
example (a b c : A) :
    ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_zero, mul_zero, zero_mul, add_zero, zero_add, neg_zero,
    one_mul, mul_neg, neg_mul, neg_neg]
  ring_nf
  sorry

end NonAssoc
end Phys.Cascade.CD
