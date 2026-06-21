import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {A : Type*} [Ring A] [StarRing A]

theorem add_mul' (x y z : CD A) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel

theorem mul_add' (x y z : CD A) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel

def bilin (x y : CD A) : A := (x * star y + y * star x).re

theorem bilin_diag (x : CD A) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]

theorem bilin_symm (x y : CD A) : bilin x y = bilin y x := by
  simp [bilin, add_comm]

theorem bilin_add_left (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_mul, mul_neg, neg_add]
  abel

theorem bilin_add_right (x y y' : CD A) :
    bilin x (y + y') = bilin x y + bilin x y' := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, add_im, neg_mul, mul_neg, neg_add]
  abel

theorem Nrm_add (x y : CD A) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]
  abel

theorem P1 (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (x * z) (y * z) = bilin x y * Nrm z := by
  have h1 : Nrm ((x + y) * z) = Nrm (x * z) + Nrm (y * z) + bilin (x * z) (y * z) := by
    rw [add_mul']; exact Nrm_add (x * z) (y * z)
  have h2 : Nrm ((x + y) * z) = Nrm x * Nrm z + Nrm y * Nrm z + bilin x y * Nrm z := by
    rw [H, Nrm_add, add_mul, add_mul]
  rw [h2] at h1
  rw [H, H] at h1
  exact (add_left_cancel h1).symm

theorem P2 (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (z * x) (z * y) = Nrm z * bilin x y := by
  have h1 : Nrm (z * (x + y)) = Nrm (z * x) + Nrm (z * y) + bilin (z * x) (z * y) := by
    rw [mul_add']; exact Nrm_add (z * x) (z * y)
  have h2 : Nrm (z * (x + y)) = Nrm z * Nrm x + Nrm z * Nrm y + Nrm z * bilin x y := by
    rw [H, Nrm_add, mul_add, mul_add]
  rw [h2] at h1
  rw [H, H] at h1
  exact (add_left_cancel h1).symm

end CD
end Phys.Cascade
