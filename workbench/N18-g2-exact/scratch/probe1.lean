import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ===== MEASURE: GO1 anticommutator (expect trivial) =====
-- For imaginary x (star x = -x): D x * x + x * D x = 0.
theorem deriv_jordan_anticomm (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : D x * x + x * D x = 0 := by
  have h := deriv_norm_preserve D hD x
  rw [hx] at h          -- D x * (-x) = x * D x
  rw [mul_neg] at h     -- -(D x * x) = x * D x
  linear_combination (norm := abel) -h

-- ===== MEASURE: GO2 reflection (N') : D x * x = star x * D x =====
theorem deriv_reflect (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D x * x = star x * D x := by
  have h := deriv_norm_preserve D hD (star x)
  rw [star_star, deriv_star D hD x] at h   -- (-D x) * x = star x * (-D x)
  rw [neg_mul, mul_neg] at h
  linear_combination (norm := abel) -h

end Phys.Algebra
