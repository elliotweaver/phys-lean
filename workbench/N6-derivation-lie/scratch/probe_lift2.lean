import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeLift2

-- δ a base derivation of an (associative) Ring A with star, star-commuting.
-- Lift to CD A (which we give narCD when A is a NonAssocRing; but for the witness
-- A = H ℚ is an honest Ring, so CD A = O ℚ via narCD).
-- We must build Dlift as an additive map and prove IsDeriv over the narCD product.

section
variable {A : Type*} [Ring A] [StarRing A]
-- On CD A we use the genuine instances? CD A with [CommRing A] would be Ring, but H ℚ is
-- NON-commutative, so CD (H ℚ) = O ℚ uses narCD. Provide narCD for CD A over [Ring A]⊆[NonAssocRing A].
attribute [local instance] CD.narCD CD.srCD

-- raw lift function
def dlift (δ : A → A) (z : CD A) : CD A := ⟨δ z.re, δ z.im⟩

@[simp] theorem dlift_re (δ : A → A) (z : CD A) : (dlift δ z).re = δ z.re := rfl
@[simp] theorem dlift_im (δ : A → A) (z : CD A) : (dlift δ z).im = δ z.im := rfl

-- IsDeriv-style Leibniz law for the lift, given δ's laws.
-- δ additive, δ Leibniz, δ star-commute.
theorem dlift_leibniz (δ : A → A)
    (hadd : ∀ a b, δ (a + b) = δ a + δ b)
    (hneg : ∀ a, δ (-a) = -δ a)
    (hder : ∀ a b, δ (a * b) = δ a * b + a * δ b)
    (hstar : ∀ a, δ (star a) = star (δ a))
    (x y : CD A) :
    dlift δ (x * y) = dlift δ x * y + x * dlift δ y := by
  ext
  · -- re component: δ(x.re*y.re + -(star y.im * x.im))
    show δ ((x*y).re) = (dlift δ x * y + x * dlift δ y).re
    simp only [mul_re, dlift_re, dlift_im, add_re]
    rw [hadd, hder, hneg, hder, hstar]
    abel
  · show δ ((x*y).im) = (dlift δ x * y + x * dlift δ y).im
    simp only [mul_im, dlift_re, dlift_im, add_im]
    rw [hadd, hder, hder, hstar]
    abel

end
end ProbeLift2
