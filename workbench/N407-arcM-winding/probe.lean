import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE WINDING/LADDER-RUNG INDEX QUANTIZATION over ℤ, grounded on the derived generation
    count `finrank ℚ Uhol = 3` (the ℤ₃ self-blind cycle). -/

def windingRungIndex (k : ℤ) : ℤ := 1 + (Module.finrank ℚ Uhol : ℤ) * k

theorem windingRungIndex_eq (k : ℤ) : windingRungIndex k = 1 + 3 * k := by
  unfold windingRungIndex; rw [finrank_Uhol]

theorem windingRungShift_quantized (k : ℤ) :
    (Module.finrank ℚ Uhol : ℤ) ∣ (windingRungIndex k - 1) := by
  unfold windingRungIndex; exact ⟨k, by ring⟩

theorem windingRungIndex_emod (k : ℤ) : windingRungIndex k % 3 = 1 := by
  rw [windingRungIndex_eq]; omega

theorem windingRungIndex_injective : Function.Injective windingRungIndex := by
  intro a b h; rw [windingRungIndex_eq, windingRungIndex_eq] at h; omega

/-- THE SINGLET-OFFSET TEETH: the base offset `1` is genuinely OUTSIDE the winding sublattice
    (`finrank ℚ Uhol ∤ 1`), so no winding is ever a pure complete cycle. -/
theorem baseOffset_not_cycle : ¬ (Module.finrank ℚ Uhol : ℤ) ∣ (1 : ℤ) := by
  rw [finrank_Uhol]; omega

theorem windingRungIndex_ne_zero (k : ℤ) : windingRungIndex k ≠ 0 := by
  rw [windingRungIndex_eq]; omega

theorem windingRung_at_neg_one : windingRungIndex (-1) = -2 := by
  rw [windingRungIndex_eq]; ring

/-! ## (2) THE PHASE READING over the derived ℝ `Cut`: winding k winds the Born circle
    `azimuthalTurn = 2·cutPi` by the rung index; one cycle = `finrank ℚ Uhol` full turns. -/

def windingPhase (k : ℤ) : Cut := azimuthalTurn * (windingRungIndex k : Cut)

theorem windingPhase_eq (k : ℤ) :
    windingPhase k = azimuthalTurn * ((1 + 3 * k : ℤ) : Cut) := by
  unfold windingPhase; rw [windingRungIndex_eq]

theorem windingPhase_step (k : ℤ) :
    windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn := by
  unfold windingPhase windingRungIndex
  rw [finrank_Uhol]
  push_cast
  ring

theorem windingPhase_zero : windingPhase 0 = azimuthalTurn := by
  unfold windingPhase windingRungIndex
  push_cast
  ring

theorem windingPhase_step_pos (k : ℤ) : 0 < windingPhase (k + 1) - windingPhase k := by
  rw [windingPhase_step, finrank_Uhol]
  have hpi := cutPi_pos
  unfold azimuthalTurn
  push_cast
  nlinarith [hpi]

/-! ## (3) THE TIE BACK TO THE 84π BUDGET (banked): the critical phase budget is `azimuthalTurn`
    times the banked channel count `1/α* = 42`. -/

theorem criticalBudget_channelform :
    criticalPhaseNumerator = azimuthalTurn * channelCount := rfl

/-! ## CAPSTONE -/

theorem winding_quantization_structure :
    (∀ k : ℤ, windingRungIndex k = 1 + 3 * k) ∧
    (∀ k : ℤ, (Module.finrank ℚ Uhol : ℤ) ∣ (windingRungIndex k - 1)) ∧
    (¬ (Module.finrank ℚ Uhol : ℤ) ∣ (1 : ℤ)) ∧
    (Function.Injective windingRungIndex) ∧
    (∀ k : ℤ, windingRungIndex k ≠ 0) ∧
    (windingRungIndex (-1) = -2) ∧
    (∀ k : ℤ, windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn) :=
  ⟨windingRungIndex_eq, windingRungShift_quantized, baseOffset_not_cycle,
   windingRungIndex_injective, windingRungIndex_ne_zero, windingRung_at_neg_one, windingPhase_step⟩

end

end Phys.Algebra
