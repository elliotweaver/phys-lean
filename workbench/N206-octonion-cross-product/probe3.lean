import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.SpinorRotation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem gForm_one_right (v : O ℚ) : gForm v (1 : O ℚ) = reQ v := by
  show reQ (v * star (1 : O ℚ)) = reQ v
  rw [show star (1 : O ℚ) = 1 by simp, mul_one]

theorem octMul_re_eq_neg_gForm {x y : O ℚ} (hy : y ∈ ImO) :
    reQ (x * y) = - gForm x y := by
  rw [mem_ImO] at hy
  show reQ (x * y) = - reQ (x * star y)
  rw [hy, mul_neg, reQ_neg]; ring

def octCross (x y : O ℚ) : O ℚ := x * y + (gForm x y) • (1 : O ℚ)

theorem octCross_mem_ImO {x y : O ℚ} (hy : y ∈ ImO) :
    octCross x y ∈ ImO := by
  rw [mem_ImO]
  have htr := trace_id (octCross x y)
  have hre : reQ (octCross x y) = 0 := by
    show reQ (x * y + (gForm x y) • (1 : O ℚ)) = 0
    rw [reQ_add, octMul_re_eq_neg_gForm hy]
    have : reQ ((gForm x y) • (1 : O ℚ)) = gForm x y := by
      rw [reQ_smul, reQ_one, mul_one]
    rw [this]; ring
  rw [hre] at htr
  simp only [mul_zero, zero_smul] at htr
  linear_combination (norm := abel) htr

/-- ★ THE SYMMETRIC PRODUCT IDENTITY: for imaginary x, y, the symmetric part of the octonion
    product is the real scalar `−2⟨x,y⟩`: `x·y + y·x = −(2 gForm x y) • 1`. (star is an
    anti-automorphism, star x = −x, star y = −y, so star(x·y) = y·x; the trace identity gives
    x·y + y·x = (2 re(x·y))•1, and re(x·y) = −gForm x y.) -/
theorem octMul_symm_eq {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    x * y + y * x = (-(2 * gForm x y)) • (1 : O ℚ) := by
  have hsx : star x = -x := (mem_ImO).mp hx
  have hsy : star y = -y := (mem_ImO).mp hy
  have hstar : star (x * y) = y * x := by rw [star_mul, hsx, hsy, neg_mul_neg]
  have htr := trace_id (x * y)
  rw [hstar] at htr
  rw [htr, octMul_re_eq_neg_gForm hy]; rw [mul_neg]

/-- ★ ANTISYMMETRY: the cross product of imaginaries is antisymmetric, `x⊗y = −(y⊗x)`. -/
theorem octCross_antisymm {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x y = - octCross y x := by
  unfold octCross
  have hsymm := octMul_symm_eq hx hy
  rw [gForm_symm y x]
  -- x*y + gForm x y•1 = -(y*x + gForm x y•1)  ⟺  x*y + y*x = -(2 gForm x y)•1
  linear_combination (norm := module) hsymm

theorem gForm_one_one : gForm (1 : O ℚ) (1 : O ℚ) = 1 := by
  rw [gForm_one_right, reQ_one]

theorem gForm_ImO_one {x : O ℚ} (hx : x ∈ ImO) : gForm x (1 : O ℚ) = 0 := by
  rw [gForm_one_right]
  rw [mem_ImO] at hx
  have htr := trace_id x
  rw [hx, add_neg_cancel] at htr
  have h1 : (2 * reQ x) • (1 : O ℚ) = 0 := htr.symm
  rcases smul_eq_zero.mp h1 with h | h
  · rcases mul_eq_zero.mp h with h2 | h2
    · norm_num at h2
    · exact h2
  · exact absurd h one_ne_zero_O

/-- ★★★ THE LAGRANGE / PYTHAGOREAN NORM IDENTITY (the headline). -/
theorem octCross_lagrange {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    gForm (octCross x y) (octCross x y)
      = gForm x x * gForm y y - (gForm x y)^2 := by
  have hcomp := gForm_comp x y
  set c := gForm x y with hc
  set w := octCross x y with hw
  have hxy : x * y = w + (-c) • (1 : O ℚ) := by
    rw [hw]; unfold octCross; rw [neg_smul]; abel
  have hwmem : w ∈ ImO := by rw [hw]; exact octCross_mem_ImO hy
  have hw1 : gForm w (1 : O ℚ) = 0 := gForm_ImO_one hwmem
  have h1w : gForm (1 : O ℚ) w = 0 := by rw [gForm_symm]; exact hw1
  have h11 : gForm (1 : O ℚ) (1 : O ℚ) = 1 := gForm_one_one
  rw [hxy] at hcomp
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
      hw1, h1w, h11] at hcomp
  nlinarith [hcomp]

/-! ## W8 NON-VACUITY TEETH — the cross product is genuinely nonzero, the Lagrange value genuine. -/

/-- The two banked imaginary units `u1, u2` are gForm-orthogonal. -/
theorem gForm_u1_u2 : gForm u1 u2 = 0 := by
  show reQ (u1 * star u2) = 0
  simp only [reQ, u1, u2, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

/-- `gForm u2 u2 = 1` (u2 is a Born unit). -/
theorem gForm_u2_u2 : gForm u2 u2 = 1 := by
  show reQ (u2 * star u2) = 1
  simp only [reQ, u2, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

/-- ★ A NONZERO CROSS PRODUCT: `octCross u1 u2 = u1·u2` (orthogonal pair) and its `re.im.im`
    coordinate is `1` (it is the next imaginary unit `e₁·e₂ = e₃`), so it is genuinely nonzero —
    the cross product is not identically zero. -/
theorem octCross_u1_u2_coord : (octCross u1 u2).re.im.im = 1 := by
  unfold octCross
  rw [gForm_u1_u2, zero_smul, add_zero]
  simp only [u1, u2, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im]
  norm_num

theorem octCross_u1_u2_ne_zero : octCross u1 u2 ≠ 0 := by
  intro h
  have hz : (octCross u1 u2).re.im.im = 1 := octCross_u1_u2_coord
  rw [h] at hz
  simp only [CD.zero_re, CD.zero_im, Dbl.zero_im] at hz
  norm_num at hz

/-- ★ THE LAGRANGE VALUE AT THE ORTHONORMAL PAIR `(u1,u2)` IS `1`: `1·1 − 0² = 1`. The norm
    identity is non-vacuous — the cross product of two orthonormal imaginary units is itself a
    Born unit. -/
theorem octCross_lagrange_u1_u2 :
    gForm (octCross u1 u2) (octCross u1 u2) = 1 := by
  rw [octCross_lagrange u1_mem_ImO u2_mem_ImO, gForm_u1, gForm_u2_u2, gForm_u1_u2]
  norm_num

#print axioms octCross_antisymm
#print axioms octCross_lagrange
#print axioms octCross_u1_u2_ne_zero
#print axioms octCross_lagrange_u1_u2

end

end Phys.Algebra
