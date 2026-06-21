import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {B : Type*} [Ring B] [StarRing B]

theorem add_mul' (x y z : CD B) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel

def bilin (x y : CD B) : B := (x * star y + y * star x).re

theorem Nrm_add (x y : CD B) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]
  abel

-- P1: right composition identity under multiplicativity. B is non-commutative, so
-- Nrm z is NOT central in general; but the identity bilin(xz)(yz) = bilin x y * Nrm z
-- holds because the polarization is in the SCALAR (B-valued .re) and we right-cancel.
theorem P1 (H : ∀ u v : CD B, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD B) :
    bilin (x * z) (y * z) = bilin x y * Nrm z := by
  have h1 : Nrm ((x + y) * z) = Nrm (x * z) + Nrm (y * z) + bilin (x * z) (y * z) := by
    rw [add_mul']; exact Nrm_add (x * z) (y * z)
  have h2 : Nrm ((x + y) * z) = Nrm x * Nrm z + Nrm y * Nrm z + bilin x y * Nrm z := by
    rw [H, Nrm_add, add_mul, add_mul]
  rw [H, H] at h1
  rw [h2] at h1
  exact (add_left_cancel h1).symm

end CD
end Phys.Cascade
