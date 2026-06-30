import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Algebra.N200Probe
open Phys.Cascade

-- helper: right-mul by zero on S ℚ (no MulZeroClass instance; prove by ext)
theorem sX_mul_zero (x : S ℚ) : x * (0 : S ℚ) = 0 := by
  ext <;> simp [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im]

-- (a) THE TEETH: with y = zdY (banked), RHS = zdX*(zdX*zdY) = zdX*0 = 0, LHS ≠ 0.
theorem leftAlt_rhs_zero : zdX * (zdX * zdY) = 0 := by
  rw [zero_divisor_prod, sX_mul_zero]

-- LHS coordinate (coord 5 = re.im.re.im) is -2, hence LHS ≠ 0.
theorem leftAlt_lhs_coord : ((zdX * zdX) * zdY).re.im.re.im = -2 := by
  simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

theorem leftAlt_lhs_ne_zero : (zdX * zdX) * zdY ≠ 0 := by
  intro h
  have hc : ((zdX * zdX) * zdY).re.im.re.im = -2 := leftAlt_lhs_coord
  rw [h] at hc
  simp at hc

theorem sedenion_left_alt_witness : (zdX * zdX) * zdY ≠ zdX * (zdX * zdY) := by
  rw [leftAlt_rhs_zero]
  exact leftAlt_lhs_ne_zero

-- (b) THE HEADLINE: left-alternative law fails on S ℚ.
theorem sedenion_not_left_alternative : ¬ ∀ x y : S ℚ, (x * x) * y = x * (x * y) := by
  intro h
  exact sedenion_left_alt_witness (h zdX zdY)

#print axioms sX_mul_zero
#print axioms leftAlt_rhs_zero
#print axioms leftAlt_lhs_coord
#print axioms sedenion_left_alt_witness
#print axioms sedenion_not_left_alternative

end Phys.Algebra.N200Probe
