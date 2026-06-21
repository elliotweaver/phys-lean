import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade.CD

variable {A : Type*}

section NonAssoc
variable [NonAssocRing A] [StarRing A]

-- P1 over NonAssocRing base
example (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (x * z) (y * z) = bilin x y * Nrm z := by
  have h1 : Nrm ((x + y) * z) = Nrm (x * z) + Nrm (y * z) + bilin (x * z) (y * z) := by
    rw [show (x + y) * z = x * z + y * z by ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel]
    exact Nrm_add (x * z) (y * z)
  have h2 : Nrm ((x + y) * z) = Nrm x * Nrm z + Nrm y * Nrm z + bilin x y * Nrm z := by
    rw [H, Nrm_add, add_mul, add_mul]
  rw [h2] at h1
  rw [H, H] at h1
  exact (add_left_cancel h1).symm

-- THE SCALING LAW DEFECT L(x,y) := x*(star x*y) - iota(Nrm x)*y
-- The reflection R2: with x=iota a, polarized in (iota b, iota b' ... ) we want the associator.
-- Let me first just compute L(iota a, iota c) and the e2 structure concretely.

-- The new generator e2 on CD A
-- iota a, e2 available. Build the reflection target.
-- Lpol(ia, ibe2; ic) where ibe2 = iota b * e2.
-- Claim (numerics R2): Lpol(iota a, iota b * e2, iota c) has re=0, im = [a,b,c]_A := (a*b)*c - a*(b*c)
noncomputable def Ldef (x y : CD A) : CD A := x * (star x * y) - iota (Nrm x) * y

-- Try to compute the reflection identity directly. First, is iota a ring-homish enough?
-- Let me just state and try the associator-extraction identity.
example (a b c : A) :
    (Ldef (iota a + iota b * (e2 : CD A)) (iota c)
      - Ldef (iota a) (iota c)
      - Ldef (iota b * (e2 : CD A)) (iota c)).im = (a * b) * c - a * (b * c) := by
  simp only [Ldef, iota, e2, Nrm, mul_re, mul_im, star_re, star_im, sub_re, sub_im,
    add_re, add_im, mul_zero, zero_mul, add_zero, zero_add, neg_zero, star_zero,
    star_one, one_mul, mul_one, star_mul, star_star, star_add, star_neg, sub_zero]
  ring

end NonAssoc

end Phys.Cascade.CD
