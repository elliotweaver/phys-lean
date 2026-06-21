import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {B : Type*} [Ring B] [StarRing B]

theorem add_mul' (x y z : CD B) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel

theorem mul_add' (x y z : CD B) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel

def bilin (x y : CD B) : B := (x * star y + y * star x).re

theorem Nrm_add (x y : CD B) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, star_add, add_re, mul_re, mul_im, mul_add, add_mul,
    star_im, star_re, neg_add, neg_mul, mul_neg]
  abel

theorem P1 (H : ∀ u v : CD B, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD B) :
    bilin (x * z) (y * z) = bilin x y * Nrm z := by
  have h1 : Nrm ((x + y) * z) = Nrm (x * z) + Nrm (y * z) + bilin (x * z) (y * z) := by
    rw [add_mul']; exact Nrm_add (x * z) (y * z)
  have h2 : Nrm ((x + y) * z) = Nrm x * Nrm z + Nrm y * Nrm z + bilin x y * Nrm z := by
    rw [H, Nrm_add]; ring
  rw [H, H] at h1
  rw [h2] at h1
  -- h1 : Nrm x*Nrm z + Nrm y*Nrm z + bilin x y*Nrm z = Nrm x*Nrm z + Nrm y*Nrm z + bilin(xz)(yz)
  -- wait order: h1 LHS=h2 RHS, h1 RHS = Nrm(xz)+Nrm(yz)+bilin(xz)(yz) -> rw H,H gives
  --   Nrm x*Nrm z + Nrm y*Nrm z + bilin(xz)(yz)
  -- so h1: Nrm x Nz+Nrm y Nz+bilin xy Nz = Nrm x Nz+Nrm y Nz+bilin(xz)(yz)
  exact (add_left_cancel h1).symm

end CD
end Phys.Cascade
