import Phys.Algebra.PathIntegralMeasureRenorm
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Phys.Algebra.ReciprocalSpectrumProbe

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.PathIntegral

noncomputable section

-- ★ THE WELD: rungExponent n · scalingDim n = -1  (for (n:Cut) ≠ 0)
-- rungExponent n = criticalPhaseNumerator / n   (N329)
-- scalingDim n   = -(n:Cut) / criticalPhaseNumerator   (N377)
-- product = (D/n)·(-n/D) = -1
theorem rung_scaling_reciprocal (n : ℕ) (hn : (n : Cut) ≠ 0) :
    rungExponent n * scalingDim n = -1 := by
  unfold rungExponent scalingDim
  have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  field_simp

-- reciprocal form
theorem scalingDim_eq_neg_inv_rung (n : ℕ) (hn : (n : Cut) ≠ 0) :
    scalingDim n = -1 / rungExponent n := by
  have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  unfold rungExponent scalingDim
  field_simp

-- evaluations at the three banked counts
theorem reciprocal_at_imO :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) = -1 := by
  apply rung_scaling_reciprocal
  rw [finrank_ImO]; norm_num

theorem reciprocal_at_spaceSub :
    rungExponent (Module.finrank ℚ spaceSub) * scalingDim (Module.finrank ℚ spaceSub) = -1 := by
  apply rung_scaling_reciprocal
  rw [finrank_spaceSub]; norm_num

theorem reciprocal_at_selfAdj :
    rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
      * scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -1 := by
  apply rung_scaling_reciprocal
  rw [finrank_selfAdj_eq_28]; norm_num

end

end Phys.Algebra.ReciprocalSpectrumProbe
