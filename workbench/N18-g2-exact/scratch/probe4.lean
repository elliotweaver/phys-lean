import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem smul_one_mul (c : ℚ) (x : O ℚ) : (c • (1 : O ℚ)) * x = c • x := by
  ext <;> simp [CD.mul_re, CD.mul_im, cd_qsmul_re, cd_qsmul_im]

theorem mul_smul_one (c : ℚ) (x : O ℚ) : x * (c • (1 : O ℚ)) = c • x := by
  ext <;> simp [CD.mul_re, CD.mul_im, cd_qsmul_re, cd_qsmul_im]

theorem deriv_jordan_anticomm (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : D x * x + x * D x = 0 := by
  have h := deriv_norm_preserve D hD x
  rw [hx, mul_neg] at h
  linear_combination (norm := abel) -h

-- ===== MEASURE the assembled (4 reQ Dx) • x = 0 on imaginary x =====
theorem deriv_re_smul_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : (4 * reQ (D x)) • x = 0 := by
  have hiii := deriv_jordan_anticomm D hD x hx
  -- (iv): star of (iii): x * star (D x) + star (D x) * x = 0
  have hiv : x * star (D x) + star (D x) * x = 0 := by
    have hs : star (D x * x + x * D x) = 0 := by rw [hiii]; exact star_zero _
    rw [star_add, star_mul, star_mul, hx] at hs
    -- hs : star x?? let's see: star(D x * x) = star x * star (D x) = (-x)*star Dx
    --      star(x * D x) = star (D x) * star x = star Dx * (-x)
    -- so hs : (-x) * star (D x) + star (D x) * (-x) = 0
    rw [neg_mul, mul_neg] at hs
    linear_combination (norm := abel) -hs
  -- combine: (D x + star (D x)) * x + x * (D x + star (D x)) = 0
  have hsum : (D x + star (D x)) * x + x * (D x + star (D x)) = 0 := by
    rw [add_mul, mul_add]
    linear_combination (norm := abel) hiii + hiv
  -- trace_id: D x + star (D x) = (2 * reQ (D x)) • 1
  rw [trace_id (D x), smul_one_mul, mul_smul_one] at hsum
  -- hsum : (2 * reQ (D x)) • x + (2 * reQ (D x)) • x = 0
  rw [← add_smul] at hsum
  have : (2 * reQ (D x) + 2 * reQ (D x)) = 4 * reQ (D x) := by ring
  rwa [this] at hsum

end Phys.Algebra
