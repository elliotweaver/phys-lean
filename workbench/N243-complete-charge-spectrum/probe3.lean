import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The only rational root of X³+X is 0 (μ³+μ = μ(μ²+1) = 0 with μ²+1 > 0 ⟹ μ = 0).
theorem cube_poly_root_eq_zero (μ : ℚ) (h : (X ^ 3 + X : ℚ[X]).IsRoot μ) : μ = 0 := by
  simp only [IsRoot, eval_add, eval_pow, eval_X] at h
  -- h : μ^3 + μ = 0, i.e. μ(μ²+1) = 0
  have hfac : μ * (μ ^ 2 + 1) = 0 := by linear_combination h
  rcases mul_eq_zero.mp hfac with h0 | h1
  · exact h0
  · nlinarith [sq_nonneg μ]

-- The ONLY rational eigenvalue of chargeOp on the whole ImO is 0 (uses the banked headline).
theorem chargeOp_rational_eigenvalue_eq_zero
    (chargeOp_minpoly : minpoly ℚ chargeOp = (X ^ 3 + X : ℚ[X]))
    (μ : ℚ) (hμ : Module.End.HasEigenvalue chargeOp μ) : μ = 0 := by
  have hroot := Module.End.hasEigenvalue_iff_isRoot.mp hμ
  rw [chargeOp_minpoly] at hroot
  exact cube_poly_root_eq_zero μ hroot

end

end Phys.Algebra
