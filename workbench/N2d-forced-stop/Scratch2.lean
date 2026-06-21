import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD

variable {A : Type*}

def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re

theorem Nrm_def [Ring A] [StarRing A] (z : CD A) :
    Nrm z = z.re * star z.re + star z.im * z.im := by
  simp [Nrm, mul_re, star_re, star_im, star_neg, neg_mul]

/-- EASY DIRECTION on a COMMUTATIVE base: the self-overlap norm is multiplicative on
    `CD A` when the base `A` is a commutative `*`-ring. Covers rungs ℂ (base ℝ) and
    ℍ (base ℂ). -/
theorem Nrm_mul_of_comm [CommRing A] [StarRing A] (x y : CD A) :
    Nrm (x * y) = Nrm x * Nrm y := by
  simp only [Nrm_def, mul_re, mul_im, star_re, star_im, star_neg, neg_mul,
    star_mul, star_star, star_add]
  ring
end CD
end Phys.Cascade
