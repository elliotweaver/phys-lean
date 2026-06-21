import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade.CD
variable {A : Type*}
section NonAssoc
variable [NonAssocRing A] [StarRing A]

-- THE SCALING LAW (left), stated as an equation (no Sub on CD A):
--   Scal x y :  x * (star x * y) = iota (Nrm x) * y
-- THE REFLECTION: if the scaling law holds for the element ⟨a,b⟩ at y = iota c,
-- then the base associator [b, star c, a] vanishes. With the right choice we get
-- ALL base associators, hence A associative.

-- Step 1: the im-component identity (H-free, pure structural):
-- (⟨a,b⟩ * (star ⟨a,b⟩ * iota c)).im - (iota (Nrm ⟨a,b⟩) * iota c).im
--   = b * (star c * a) - (b * star c) * a
theorem scal_im_assoc (a b c : A) :
    ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im
        + (b * (star c * a) - (b * star c) * a) := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_zero, mul_zero, zero_mul, add_zero, zero_add, neg_zero,
    one_mul, mul_neg, neg_mul, neg_neg]
  abel

-- So if Scal holds at ⟨a,b⟩, iota c, then b*(star c * a) = (b*star c)*a for all a,b,c.
-- Setting star c = arbitrary d (star surjective): b*(d*a)=(b*d)*a for all a,b,d => assoc.
theorem assoc_of_scal_im
    (Scal : ∀ a b c : A,
      ((⟨a,b⟩ : CD A) * (star (⟨a,b⟩ : CD A) * iota c)).im
        = (iota (Nrm (⟨a,b⟩ : CD A)) * iota c).im) :
    ∀ x y z : A, (x * y) * z = x * (y * z) := by
  intro x y z
  -- want (x*y)*z = x*(y*z). Use scal_im_assoc with b:=x, star c := y, a:=z.
  -- need c with star c = y: c := star y.
  have h := Scal z x (star y)
  rw [scal_im_assoc] at h
  -- h : RHS = RHS + (x*(star (star y) * z) - (x * star (star y))*z)
  rw [star_star] at h
  -- h : T = T + (x*(y*z) - (x*y)*z); cancel
  have := add_right_cancel (a := (0:A)) (b := _) (c := _)
  -- from h: 0 = x*(y*z) - (x*y)*z
  have h2 : x * (y * z) - (x * y) * z = 0 := by
    have := h
    linarith [h]  -- placeholder; will fix
  linarith [h2]

end NonAssoc
end Phys.Cascade.CD
