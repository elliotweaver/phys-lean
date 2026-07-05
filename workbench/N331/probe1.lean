import Phys.Algebra.NewtonScaleProduct
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN331

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section

/-- M_Pl/M, the reciprocal half-rung. -/
def planckMassRatio : Cut :=
  cutExp (rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule))

theorem planckMassRatio_eq : planckMassRatio = cutExp (3 * cutPi) := by
  unfold planckMassRatio; rw [rungExponent_at_selfAdj]

theorem planckMassRatio_pos : 0 < planckMassRatio := by
  unfold planckMassRatio; exact cutExp_pos _

theorem planckMassRatio_mul_planckClosureRatio :
    planckMassRatio * planckClosureRatio = 1 := by
  unfold planckMassRatio planckClosureRatio
  exact cutExp_mul_neg _

theorem planckMassRatio_eq_inv : planckMassRatio = (planckClosureRatio)⁻¹ :=
  eq_inv_of_mul_eq_one_left
    (mul_comm planckMassRatio planckClosureRatio ▸ planckMassRatio_mul_planckClosureRatio)

theorem planckMassRatio_gt_one : 1 < planckMassRatio := by
  rw [planckMassRatio_eq]
  have hpos : (0 : Cut) < 3 * cutPi := by have := cutPi_pos; linarith
  have := cutExp_strictMono hpos
  rwa [cutExp_zero] at this

theorem planckMassRatio_sq_mul_newtonScaleProduct :
    planckMassRatio ^ 2 * newtonScaleProduct = 1 := by
  rw [planckMassRatio_eq, newtonScaleProduct_eq, pow_two, cutExp_add, cutExp_add]
  have h0 : (3 * cutPi + 3 * cutPi) + (-(6 * cutPi)) = 0 := by ring
  rw [h0, cutExp_zero]

theorem planckMassRatio_ne_planckClosureRatio :
    planckMassRatio ≠ planckClosureRatio := by
  have h1 := planckMassRatio_gt_one
  have h2 := planckClosureRatio_lt_one
  intro h; rw [h] at h1; linarith

theorem planckMassRatio_ne_one : planckMassRatio ≠ 1 := by
  have := planckMassRatio_gt_one; intro h; rw [h] at this; linarith

end

end Phys.Algebra.ProbeN331

#print axioms Phys.Algebra.ProbeN331.planckMassRatio_sq_mul_newtonScaleProduct
#print axioms Phys.Algebra.ProbeN331.planckMassRatio_mul_planckClosureRatio
#print axioms Phys.Algebra.ProbeN331.planckMassRatio_eq_inv
#print axioms Phys.Algebra.ProbeN331.planckMassRatio_gt_one
