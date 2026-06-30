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

theorem gForm_one_one : gForm (1 : O ℚ) (1 : O ℚ) = 1 := by
  rw [gForm_one_right, reQ_one]

theorem gForm_ImO_one {x : O ℚ} (hx : x ∈ ImO) : gForm x (1 : O ℚ) = 0 := by
  rw [gForm_one_right]
  rw [mem_ImO] at hx
  have htr := trace_id x
  rw [hx, add_neg_cancel] at htr
  have h1 : (2 * reQ x) • (1 : O ℚ) = 0 := htr.symm
  rcases smul_eq_zero.mp h1 with h | h
  · have : reQ x = 0 := by
      rcases mul_eq_zero.mp h with h2 | h2
      · norm_num at h2
      · exact h2
    exact this
  · exact absurd h one_ne_zero_O

/-- ★★★ THE LAGRANGE / PYTHAGOREAN NORM IDENTITY (the headline):
    gForm (octCross x y) (octCross x y) = gForm x x · gForm y y − (gForm x y)²
    for imaginary x, y. The defining composition-algebra relation of the cross product. -/
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
  -- hcomp now a polynomial identity in gForm w w and c
  nlinarith [hcomp]

#print axioms octCross_lagrange
#print axioms gForm_one_one
#print axioms gForm_ImO_one

end

end Phys.Algebra
