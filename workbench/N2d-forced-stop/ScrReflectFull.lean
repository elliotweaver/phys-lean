import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

-- structural im-identity
theorem scal_im_assoc (a b c : A) :
    ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im
        + (b * (star c * a) - (b * star c) * a) := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_zero, zero_mul, add_zero, zero_add, neg_zero,
    mul_neg, neg_mul, neg_neg]
  abel

-- THE REFLECTION: the full scaling law forces base associativity.
theorem assoc_of_scaling
    (Scal : ∀ x y : CD A, x * (star x * y) = iota (Nrm x) * y) :
    ∀ a b c : A, (a * b) * c = a * (b * c) := by
  intro a b c
  -- apply Scal at x = ⟨c, a⟩, y = ι (star b), take .im
  have h := congrArg CD.im (Scal (⟨c,a⟩ : CD A) (iota (star b)))
  rw [scal_im_assoc, star_star] at h
  -- h : T + (a*(b*c) - (a*b)*c) = T
  have h2 : a * (b * c) - (a * b) * c = 0 := by
    have h4 : ((iota (Nrm (⟨c,a⟩ : CD A)) * iota (star b)).im)
          + (a * (b * c) - (a * b) * c)
        = ((iota (Nrm (⟨c,a⟩ : CD A)) * iota (star b)).im) + 0 := by
      rw [add_zero]; exact h
    exact add_left_cancel h4
  exact (sub_eq_zero.mp h2).symm

#print axioms scal_im_assoc
#print axioms assoc_of_scaling
end NonAssoc
end Phys.Cascade.CD
