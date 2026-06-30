import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- commuting with hI ⟹ q.im = 0.
theorem centre_im (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J] at him
  -- him : 0 * q.re + q.im * -Dbl.J = q.im * Dbl.J + 0 * star q.re
  have key : q.im * (Dbl.J : Dbl ℚ) + q.im * Dbl.J = 0 := by
    have := him
    simp only [zero_mul, zero_add, add_zero] at this
    -- this : q.im * -J = q.im * J
    rw [mul_neg] at this
    linear_combination -this
  -- q.im * J + q.im * J = 0 = q.im * (2•J); multiply by -J: J*(-J)=1
  apply_fun (· * (-Dbl.J : Dbl ℚ)) at key
  rw [add_mul, mul_assoc, mul_assoc] at key
  have hJJ : (Dbl.J : Dbl ℚ) * (-Dbl.J) = 1 := by
    rw [mul_neg, Dbl.J_mul_J, neg_neg]
  rw [hJJ, mul_one, mul_one, zero_mul] at key
  -- key : q.im + q.im = 0
  have : (2:ℚ) • q.im = 0 := by rw [two_smul]; exact key
  have h2 : q.im = 0 := by
    have := smul_eq_zero.mp this
    rcases this with h | h
    · norm_num at h
    · exact h
  exact h2

end Phys.Algebra
