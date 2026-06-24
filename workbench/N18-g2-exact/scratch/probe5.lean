import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem smul_one_mul (c : ℚ) (x : O ℚ) : (c • (1 : O ℚ)) * x = c • x := by
  ext <;> simp [CD.mul_im, cd_qsmul_re, cd_qsmul_im]

theorem mul_smul_one (c : ℚ) (x : O ℚ) : x * (c • (1 : O ℚ)) = c • x := by
  ext <;> simp [CD.mul_im, cd_qsmul_re, cd_qsmul_im]

theorem star_smul_one (c : ℚ) : star ((c • (1 : O ℚ))) = c • (1 : O ℚ) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im]

theorem deriv_jordan_anticomm (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : D x * x + x * D x = 0 := by
  have h := deriv_norm_preserve D hD x
  rw [hx, mul_neg] at h
  linear_combination (norm := abel) -h

theorem deriv_re_smul_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : (4 * reQ (D x)) • x = 0 := by
  have hiii := deriv_jordan_anticomm D hD x hx
  have hiv : x * star (D x) + star (D x) * x = 0 := by
    have hs : star (D x * x + x * D x) = 0 := by rw [hiii]; exact star_zero _
    rw [star_add, star_mul, star_mul, hx, neg_mul, mul_neg] at hs
    linear_combination (norm := abel) -hs
  have hsum : (D x + star (D x)) * x + x * (D x + star (D x)) = 0 := by
    rw [add_mul, mul_add]
    linear_combination (norm := abel) hiii + hiv
  rw [trace_id (D x), smul_one_mul, mul_smul_one, ← add_smul] at hsum
  have h4 : (2 * reQ (D x) + 2 * reQ (D x)) = 4 * reQ (D x) := by ring
  rwa [h4] at hsum

-- ===== MEASURE: trace-free on imaginaries =====
theorem deriv_reQ_zero_imag (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : reQ (D x) = 0 := by
  have h := deriv_re_smul_zero D hD x hx
  by_contra hc
  -- 4 reQ Dx ≠ 0, so cancel via field inverse: x = (4 reQ Dx)⁻¹ • ((4 reQ Dx) • x) = 0
  have hc4 : (4 * reQ (D x)) ≠ 0 := by
    intro h0; apply hc; rcases mul_eq_zero.mp h0 with h1 | h1
    · norm_num at h1
    · exact h1
  have hx0 : x = 0 := by
    have hcong := congrArg (fun z => (4 * reQ (D x))⁻¹ • z) h
    simp only [smul_smul, inv_mul_cancel₀ hc4, one_smul, smul_zero] at hcong
    exact hcong
  -- but then D x = 0 so reQ (D x) = 0, contradicting hc
  apply hc
  rw [hx0, map_zero]
  simp [reQ]

-- ===== MEASURE: general trace-free =====
theorem deriv_reQ_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    reQ (D x) = 0 := by
  -- imaginary part xi = x - (reQ x) • 1
  set c : ℚ := reQ x with hc
  set xi : O ℚ := x - c • (1 : O ℚ) with hxi
  have himag : star xi = -xi := by
    have htr : x + star x = (2 * c) • (1 : O ℚ) := trace_id x
    have : star x = (2 * c) • (1 : O ℚ) - x := by linear_combination (norm := abel) htr
    rw [hxi, star_sub, star_smul_one, this]
    rw [two_mul, add_smul]
    abel
  have hDeq : D x = D xi := by
    rw [hxi, map_sub, deriv_qsmul, deriv_one D hD, smul_zero, sub_zero]
  rw [hDeq]
  exact deriv_reQ_zero_imag D hD xi himag

-- ===== MEASURE: D maps into Im (star (D x) = -D x) and commutes with star =====
theorem deriv_maps_im (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    star (D x) = - D x := by
  have h := trace_id (D x)
  rw [deriv_reQ_zero D hD x] at h
  simp only [mul_zero, zero_smul] at h
  linear_combination (norm := abel) h

theorem deriv_comm_star (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D (star x) = star (D x) := by
  rw [deriv_star D hD x, deriv_maps_im D hD x]

end Phys.Algebra
