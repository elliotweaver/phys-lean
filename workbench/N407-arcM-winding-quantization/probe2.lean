import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Quantum.PrimitiveFibre
import Mathlib.Tactic

open scoped BigOperators
namespace Phys.Algebra.WindingProbe2

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Phys.Quantum Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def windingRungIndex (k : ℤ) : ℤ := 1 + (Module.finrank ℚ Uhol : ℤ) * k
def boundaryRungIndex : ℤ := -1

theorem windingRungIndex_eq (k : ℤ) : windingRungIndex k = 1 + 3 * k := by
  unfold windingRungIndex; rw [finrank_Uhol]; push_cast; ring

theorem windingRungIndex_spacing (k : ℤ) :
    windingRungIndex (k + 1) - windingRungIndex k = (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRungIndex; ring

theorem windingRungIndex_residue (k : ℤ) :
    windingRungIndex k % (Module.finrank ℚ Uhol : ℤ) = 1 := by
  rw [windingRungIndex_eq, finrank_Uhol]; omega

theorem windingRungIndex_not_dvd (k : ℤ) :
    ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRungIndex k := by
  rw [windingRungIndex_eq, finrank_Uhol]; omega

theorem windingRungIndex_injective : Function.Injective windingRungIndex := by
  intro a b h; rw [windingRungIndex_eq, windingRungIndex_eq] at h; omega

-- arc-F cross-tie: disjoint from N368 baryon grid
theorem windingRung_ne_baryonGrid (k m : ℤ) :
    windingRungIndex k ≠ baryonShift (Module.finrank ℚ Uhol) m := by
  rw [windingRungIndex_eq, baryonShift_eq, finrank_Uhol]; omega

theorem groundRung : windingRungIndex 0 = 1 := by rw [windingRungIndex_eq]; ring

theorem windingRung_boundary :
    windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRungIndex boundaryRungIndex; ring

theorem boundary_is_first_descent :
    windingRungIndex boundaryRungIndex < windingRungIndex 0
    ∧ ∀ k : ℤ, k < 0 → windingRungIndex k ≤ windingRungIndex boundaryRungIndex := by
  refine ⟨?_, ?_⟩
  · rw [windingRungIndex_eq, windingRungIndex_eq]; unfold boundaryRungIndex; omega
  · intro k hk; rw [windingRungIndex_eq, windingRungIndex_eq]; unfold boundaryRungIndex; omega

-- arc-B phase reading over Cut: winding the Born circle azimuthalTurn = 2·cutPi
def windingPhase (k : ℤ) : Cut := azimuthalTurn * (windingRungIndex k : Cut)

theorem windingPhase_step (k : ℤ) :
    windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn := by
  unfold windingPhase windingRungIndex; rw [finrank_Uhol]; push_cast; ring

theorem windingPhase_zero : windingPhase 0 = azimuthalTurn := by
  unfold windingPhase windingRungIndex; push_cast; ring

theorem windingPhase_step_pos (k : ℤ) : 0 < windingPhase (k + 1) - windingPhase k := by
  rw [windingPhase_step, finrank_Uhol]; have hpi := cutPi_pos; unfold azimuthalTurn; push_cast; nlinarith [hpi]

-- tie back to the banked 84π budget
theorem criticalBudget_channelform :
    criticalPhaseNumerator = azimuthalTurn * channelCount := rfl

-- candidate boundary value (isolated, inception-flagged)
theorem candidate_boundary_expressible :
    (9 : ℚ) / 4
      = ((Module.finrank ℚ Uhol : ℚ) / (Module.finrank ContinuumQ.Cut StateFibre : ℚ)) ^ 2 := by
  rw [finrank_Uhol, fibre_finrank]; norm_num

-- W8
theorem windingRungIndex_spacing_ne_one :
    windingRungIndex 1 - windingRungIndex 0 ≠ 1 := by rw [windingRungIndex_eq, windingRungIndex_eq]; omega

theorem boundaryRungIndex_ne_ground : boundaryRungIndex ≠ 0 := by unfold boundaryRungIndex; omega

theorem winding_quantization :
    (∀ k : ℤ, windingRungIndex k % (Module.finrank ℚ Uhol : ℤ) = 1)
    ∧ (∀ k : ℤ, ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRungIndex k)
    ∧ (∀ k m : ℤ, windingRungIndex k ≠ baryonShift (Module.finrank ℚ Uhol) m)
    ∧ windingRungIndex 0 = 1
    ∧ windingRungIndex boundaryRungIndex < windingRungIndex 0
    ∧ (∀ k : ℤ, windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn) :=
  ⟨windingRungIndex_residue, windingRungIndex_not_dvd, windingRung_ne_baryonGrid, groundRung,
   boundary_is_first_descent.1, windingPhase_step⟩

end
end Phys.Algebra.WindingProbe2
