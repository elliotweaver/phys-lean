import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem centre_im (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J, zero_mul, zero_add, add_zero] at him
  -- him : q.im * -Dbl.J = q.im * Dbl.J
  have key : q.im * (Dbl.J : Dbl ℚ) + q.im * Dbl.J = 0 := by
    rw [mul_neg] at him; linear_combination -him
  have hqJ : q.im * (Dbl.J : Dbl ℚ) = 0 := by
    have h2 : (2:ℚ) • (q.im * (Dbl.J : Dbl ℚ)) = 0 := by rw [two_smul]; exact key
    rcases smul_eq_zero.mp h2 with hc | hc
    · norm_num at hc
    · exact hc
  -- J is a unit: J * -J = 1, so q.im = q.im * (J * -J) = (q.im * J) * -J = 0.
  have hJunit : (Dbl.J : Dbl ℚ) * (-Dbl.J) = 1 := by rw [mul_neg, Dbl.J_mul_J, neg_neg]
  calc q.im = q.im * ((Dbl.J : Dbl ℚ) * (-Dbl.J)) := by rw [hJunit, mul_one]
    _ = (q.im * Dbl.J) * (-Dbl.J) := by rw [mul_assoc]
    _ = 0 := by rw [hqJ, zero_mul]

theorem centre_reim (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : q.re.im = 0 := by
  have hre := congrArg CD.re h
  have him := congrArg CD.im h
  simp only [hJ, CD.e2, CD.mul_re, CD.mul_im, hq, Dbl.zero_re, Dbl.zero_im,
    zero_mul, mul_zero, zero_add, add_zero, neg_zero] at hre him
  sorry

end Phys.Algebra
