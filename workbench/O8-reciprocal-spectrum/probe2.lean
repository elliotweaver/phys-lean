import Phys.Algebra.PathIntegralMeasureRenorm
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Phys.Algebra.ReciprocalSpectrumProbe2

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.PathIntegral
open Phys.Algebra.Universality

noncomputable section

theorem rung_scaling_reciprocal (n : ℕ) (hn : (n : Cut) ≠ 0) :
    rungExponent n * scalingDim n = -1 := by
  unfold rungExponent scalingDim
  have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  field_simp

-- The three RG eigenvalues explicitly, via scalingDim_eq (= -n/(84·cutPi))
theorem scalingDim_at_imO :
    scalingDim (Module.finrank ℚ ImO) = -(7 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_ImO]; push_cast; ring

theorem scalingDim_at_spaceSub :
    scalingDim (Module.finrank ℚ spaceSub) = -(9 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_spaceSub]; push_cast; ring

theorem scalingDim_at_selfAdj :
    scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -(28 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_selfAdj_eq_28]; push_cast; ring

-- eigenvalues distinct
theorem eigenvalues_imO_ne_selfAdj :
    scalingDim (Module.finrank ℚ ImO)
      ≠ scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) := by
  rw [scalingDim_at_imO, scalingDim_at_selfAdj]
  intro h
  have hpi := cutPi_pos
  have hden : (84 * cutPi : Cut) ≠ 0 := by positivity
  rw [div_eq_div_iff hden hden] at h
  nlinarith [hpi]

-- CAPSTONE: three reciprocals = -1, shared budget = 84π, universality tie 84 = 2/α*
theorem one_spectrum_three_counts :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) = -1
    ∧ rungExponent (Module.finrank ℚ spaceSub) * scalingDim (Module.finrank ℚ spaceSub) = -1
    ∧ rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
        * scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -1
    ∧ criticalPhaseNumerator = 84 * cutPi
    ∧ (84 : ℚ) = 2 / alphaStar := by
  refine ⟨?_, ?_, ?_, criticalPhaseNumerator_eq, (scaleTowerNumerator_eq).1⟩
  · apply rung_scaling_reciprocal; rw [finrank_ImO]; norm_num
  · apply rung_scaling_reciprocal; rw [finrank_spaceSub]; norm_num
  · apply rung_scaling_reciprocal; rw [finrank_selfAdj_eq_28]; norm_num

-- W8: product = -1 ≠ +1 (the sign IS the negative eigenvalue)
theorem reciprocal_ne_one :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) ≠ 1 := by
  have h : rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) = -1 := by
    apply rung_scaling_reciprocal; rw [finrank_ImO]; norm_num
  rw [h]; norm_num

end

end Phys.Algebra.ReciprocalSpectrumProbe2
