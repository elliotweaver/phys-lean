import Phys.Algebra.SeesawScale
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- PART (1): the one object
def scaleTowerRung (n : ℕ) (m : ℤ) : Cut := cutExp ((m : Cut) * rungExponent n)

theorem scaleTowerRung_exponent_lock (n : ℕ) (m : ℤ) (hn : (n : Cut) ≠ 0) :
    ((m : Cut) * rungExponent n) * (n : Cut) = (m : Cut) * criticalPhaseNumerator := by
  rw [mul_assoc, numerator_lock n hn]

theorem scaleTowerRung_mul_same (n : ℕ) (m₁ m₂ : ℤ) :
    scaleTowerRung n m₁ * scaleTowerRung n m₂ = scaleTowerRung n (m₁ + m₂) := by
  unfold scaleTowerRung
  rw [cutExp_add]; congr 1; push_cast; ring

theorem scaleTowerRung_sq (n : ℕ) (m : ℤ) :
    (scaleTowerRung n m) ^ 2 = scaleTowerRung n (2 * m) := by
  rw [pow_two, scaleTowerRung_mul_same]; congr 1; ring

-- instances
theorem ewClosureRatio_as_rung : ewClosureRatio = scaleTowerRung 9 (-1) := by
  unfold ewClosureRatio scaleTowerRung
  rw [finrank_spaceSub]; congr 1; push_cast; ring

theorem planckClosureRatio_as_rung : planckClosureRatio = scaleTowerRung 28 (-1) := by
  unfold planckClosureRatio scaleTowerRung
  rw [finrank_selfAdj_eq_28]; congr 1; push_cast; ring

theorem planckMassRatio_as_rung : planckMassRatio = scaleTowerRung 28 1 := by
  unfold planckMassRatio scaleTowerRung
  rw [finrank_selfAdj_eq_28]; congr 1; push_cast; ring

theorem seesawRatio_as_rung : seesawRatio = scaleTowerRung 9 (-2) := by
  rw [seesawRatio_born_square, ewClosureRatio_as_rung, scaleTowerRung_sq]; congr 1

theorem newtonScaleProduct_as_rung : newtonScaleProduct = scaleTowerRung 28 (-2) := by
  rw [newtonScaleProduct_born_square, planckClosureRatio_as_rung, scaleTowerRung_sq]; congr 1

-- QCD rung completing {7,9,28}
theorem rungExponent_at_7 : rungExponent 7 = 12 * cutPi := by
  rw [rungExponent, criticalPhaseNumerator_eq]; push_cast; ring

def qcdClosureRatio : Cut := scaleTowerRung 7 (-1)

theorem qcdClosureRatio_eq : qcdClosureRatio = cutExp (-(12 * cutPi)) := by
  unfold qcdClosureRatio scaleTowerRung
  rw [rungExponent_at_7]; congr 1; push_cast; ring

theorem qcdClosureRatio_pos : 0 < qcdClosureRatio := by
  rw [qcdClosureRatio_eq]; exact cutExp_pos _

theorem qcdClosureRatio_lt_one : qcdClosureRatio < 1 := by
  rw [qcdClosureRatio_eq]
  have hneg : -(12 * cutPi) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

-- PART (2): the eigenvalue reading
def criticalEigenvalue (n : ℕ) : Cut := -(n : Cut) / criticalPhaseNumerator

theorem criticalEigenvalue_eq (n : ℕ) :
    criticalEigenvalue n = -(n : Cut) / (84 * cutPi) := by
  unfold criticalEigenvalue; rw [criticalPhaseNumerator_eq]

theorem criticalEigenvalue_mul_rungExponent (n : ℕ) (hn : (n : Cut) ≠ 0) :
    criticalEigenvalue n * rungExponent n = -1 := by
  unfold criticalEigenvalue rungExponent
  have hK : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  field_simp

theorem criticalPhaseNumerator_mul_eigenvalue (n : ℕ) :
    criticalPhaseNumerator * criticalEigenvalue n = -(n : Cut) := by
  unfold criticalEigenvalue
  have hK : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  field_simp

theorem criticalEigenvalue_eq_neg_inv_rung (n : ℕ) (hn : (n : Cut) ≠ 0) :
    criticalEigenvalue n = -(rungExponent n)⁻¹ := by
  unfold criticalEigenvalue rungExponent
  have hK : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  rw [inv_div]
  field_simp

theorem criticalEigenvalue_at_7 : criticalEigenvalue 7 = -1 / (12 * cutPi) := by
  rw [criticalEigenvalue_eq]
  have hp := cutPi_pos
  field_simp
  ring

theorem criticalEigenvalue_at_9 : criticalEigenvalue 9 = -3 / (28 * cutPi) := by
  rw [criticalEigenvalue_eq]
  have hp := cutPi_pos
  field_simp
  ring

theorem criticalEigenvalue_at_28 : criticalEigenvalue 28 = -1 / (3 * cutPi) := by
  rw [criticalEigenvalue_eq]
  have hp := cutPi_pos
  field_simp
  ring

end

end Phys.Algebra
