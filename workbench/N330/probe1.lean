import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Algebra.DimensionalTransmutation
import Mathlib.Tactic

namespace N330Probe

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section

-- (1) The half-rung atom M/M_Pl = e^(−3π).
def planckClosureRatio : Cut :=
  cutExp (-(rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)))

theorem planckClosureRatio_eq : planckClosureRatio = cutExp (-(3 * cutPi)) := by
  unfold planckClosureRatio; rw [rungExponent_at_selfAdj]

theorem planckClosureRatio_pos : 0 < planckClosureRatio := by
  unfold planckClosureRatio; exact cutExp_pos _

theorem planckClosureRatio_lt_one : planckClosureRatio < 1 := by
  rw [planckClosureRatio_eq]
  have hneg : -(3 * cutPi) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

-- (2) 6π = 2 × the n=28 rung.
theorem gravExponent_eq_two_rung :
    (6 : Cut) * cutPi
      = 2 * rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule) := by
  rw [rungExponent_at_selfAdj]; ring

theorem gravExponent_from_numerator :
    (6 : Cut) * cutPi
      = 2 * (criticalPhaseNumerator
              / (Module.finrank ℚ (bornBil).selfAdjointSubmodule : Cut)) := by
  have h : criticalPhaseNumerator
      / (Module.finrank ℚ (bornBil).selfAdjointSubmodule : Cut)
      = rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule) := rfl
  rw [h, rungExponent_at_selfAdj]; ring

-- (3) G·M² = Born self-overlap square = e^(−6π).
def newtonScaleProduct : Cut := planckClosureRatio * planckClosureRatio

theorem newtonScaleProduct_born_square :
    newtonScaleProduct = planckClosureRatio ^ 2 := by
  unfold newtonScaleProduct; ring

theorem newtonScaleProduct_eq : newtonScaleProduct = cutExp (-(6 * cutPi)) := by
  unfold newtonScaleProduct
  rw [planckClosureRatio_eq, cutExp_add]
  congr 1; ring

theorem newtonScaleProduct_pos : 0 < newtonScaleProduct := by
  rw [newtonScaleProduct_eq]; exact cutExp_pos _

theorem newtonScaleProduct_lt_one : newtonScaleProduct < 1 := by
  rw [newtonScaleProduct_eq]
  have hneg : -(6 * cutPi) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

theorem newtonScaleProduct_lt_planckClosureRatio :
    newtonScaleProduct < planckClosureRatio := by
  unfold newtonScaleProduct
  have h1 := planckClosureRatio_lt_one
  have h0 := planckClosureRatio_pos
  calc planckClosureRatio * planckClosureRatio
      < 1 * planckClosureRatio := mul_lt_mul_of_pos_right h1 h0
    _ = planckClosureRatio := one_mul _

theorem newton_gravitational_product :
    newtonScaleProduct = cutExp (-(6 * cutPi))
    ∧ newtonScaleProduct = planckClosureRatio ^ 2
    ∧ (6 : Cut) * cutPi = 2 * rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
    ∧ 0 < newtonScaleProduct
    ∧ newtonScaleProduct < 1 :=
  ⟨newtonScaleProduct_eq, newtonScaleProduct_born_square, gravExponent_eq_two_rung,
   newtonScaleProduct_pos, newtonScaleProduct_lt_one⟩

theorem newtonScaleProduct_ne_halfRung :
    newtonScaleProduct ≠ planckClosureRatio :=
  ne_of_lt newtonScaleProduct_lt_planckClosureRatio

theorem gravExponent_ne_rung : (6 : Cut) * cutPi ≠ 3 * cutPi := by
  intro h
  have := cutPi_pos
  nlinarith [this]

end

end N330Probe
