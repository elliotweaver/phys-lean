import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
section NA
variable {A : Type*} [NonAssocRing A] [StarRing A]

theorem bilin_add_left_na (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_add]; abel

theorem bilin_zero_left_na (y : CD A) : bilin (0 : CD A) y = 0 := by
  simp only [bilin, mul_re, zero_re, zero_im, star_re, star_im, star_zero,
    zero_mul, mul_zero, add_zero, zero_add, neg_zero, add_re]

theorem bilin_neg_left_na (x y : CD A) : bilin (-x) y = - bilin x y := by
  have hcancel : (-x) + x = 0 := by ext <;> simp
  have h := bilin_add_left_na (-x) x y
  rw [hcancel, bilin_zero_left_na] at h
  exact eq_neg_of_add_eq_zero_left h.symm

theorem bilin_sub_left_na (x x' y : CD A) :
    bilin (x - x') y = bilin x y - bilin x' y := by
  rw [sub_eq_add_neg, bilin_add_left_na, bilin_neg_left_na, ← sub_eq_add_neg]

#print axioms bilin_sub_left_na
end NA
end Phys.Cascade.CD
