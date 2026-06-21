import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]
theorem scal_im_assoc (a b c : A) :
    ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im
        + (b * (star c * a) - (b * star c) * a) := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_zero, zero_mul, add_zero, zero_add, neg_zero,
    mul_neg, neg_mul, neg_neg]
  abel
theorem assoc_of_scal_im
    (Scal : ∀ a b c : A,
      ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
        = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im) :
    ∀ x y z : A, (x * y) * z = x * (y * z) := by
  intro x y z
  have h := Scal z x (star y)
  rw [scal_im_assoc, star_star] at h
  have h2 : x * (y * z) - (x * y) * z = 0 := by
    have h4 : ((iota (Nrm (⟨z,x⟩ : CD A)) * iota (star y)).im)
          + (x * (y * z) - (x * y) * z)
        = ((iota (Nrm (⟨z,x⟩ : CD A)) * iota (star y)).im) + 0 := by
      rw [add_zero]; exact h
    exact add_left_cancel h4
  exact (sub_eq_zero.mp h2).symm
end NonAssoc
#print axioms scal_im_assoc
#print axioms assoc_of_scal_im
end Phys.Cascade.CD
