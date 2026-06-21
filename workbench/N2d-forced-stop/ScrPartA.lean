import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

-- ============ Part-A machinery ported to [NonAssocRing A][StarRing A] ============
section NonAssoc
variable {A : Type*} [NonAssocRing A] [StarRing A]

theorem add_mul_na (x y z : CD A) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel
theorem mul_add_na (x y z : CD A) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel
theorem Nrm_add_na (x y : CD A) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]; abel
theorem bilin_diag_na (x : CD A) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]
theorem bilin_add_left_na (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_add]; abel
theorem bilin_neg_left_na (x y : CD A) : bilin (-x) y = - bilin x y := by
  simp only [bilin, neg_re, mul_re, neg_mul, mul_neg, star_re, star_im,
    star_neg, neg_neg, add_im, neg_add]
  abel
theorem bilin_sub_left_na (x x' y : CD A) :
    bilin (x - x') y = bilin x y - bilin x' y := by
  rw [sub_eq_add_neg, bilin_add_left_na, bilin_neg_left_na, ← sub_eq_add_neg]
theorem P2_na (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (z * x) (z * y) = Nrm z * bilin x y := by
  have h1 : Nrm (z * (x + y)) = Nrm (z * x) + Nrm (z * y) + bilin (z * x) (z * y) := by
    rw [mul_add_na]; exact Nrm_add_na (z * x) (z * y)
  have h2 : Nrm (z * (x + y)) = Nrm z * Nrm x + Nrm z * Nrm y + Nrm z * bilin x y := by
    rw [H, Nrm_add_na, mul_add, mul_add]
  rw [h2] at h1; rw [H, H] at h1
  exact (add_left_cancel h1).symm
end NonAssoc

#check @P2_na
end Phys.Cascade.CD
