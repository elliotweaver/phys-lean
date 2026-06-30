import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem centre_im (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J] at him
  have key : q.im * (Dbl.J : Dbl ℚ) + q.im * Dbl.J = 0 := by
    have := him
    simp only [zero_mul, zero_add, add_zero] at this
    rw [mul_neg] at this
    linear_combination -this
  apply_fun (· * (-Dbl.J : Dbl ℚ)) at key
  have hJJ : (Dbl.J : Dbl ℚ) * (-Dbl.J) = 1 := by
    rw [mul_neg, Dbl.J_mul_J, neg_neg]
  rw [add_mul, mul_assoc, mul_assoc, hJJ, mul_one, mul_one, zero_mul] at key
  have h2 : (2:ℚ) • q.im = 0 := by rw [two_smul]; exact key
  rcases smul_eq_zero.mp h2 with h | h
  · norm_num at h
  · exact h

-- commuting with hJ ⟹ q.re.im = 0 (given q.im already 0).
theorem centre_reim (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : q.re.im = 0 := by
  have hre := congrArg CD.re h
  simp only [hJ, CD.e2, CD.mul_re, hq, Dbl.star_zero] at hre
  -- explore
  sorry

end Phys.Algebra
