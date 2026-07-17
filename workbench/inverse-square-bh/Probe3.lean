import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

-- Surface gravity κ_sg = f'(r_h)/2 with f'(r)=2M/r², at r_h=2M ⇒ (4M)⁻¹.
theorem surfaceGravity_at_horizon (M : Cut) (hM : M ≠ 0) :
    (2 * M * ((2*M)^2)⁻¹) / 2 = (4 * M)⁻¹ := by
  have h2M : (2:Cut) * M ≠ 0 := mul_ne_zero two_ne_zero hM
  have h4M : (4:Cut) * M ≠ 0 := mul_ne_zero (by norm_num) hM
  field_simp
  ring
