import Phys
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section
namespace Probe2

def channelCount : Cut := ((1 / alphaStar : ℚ) : Cut)
theorem channelCount_eq : channelCount = 42 := by
  unfold channelCount; rw [inverseAlphaStar_eq_42]; norm_num

def sharedNumerator : Cut := azimuthalTurn * channelCount
theorem sharedNumerator_eq : sharedNumerator = 84 * cutPi := by
  unfold sharedNumerator azimuthalTurn; rw [channelCount_eq]; ring

def rungExponent (n : ℕ) : Cut := sharedNumerator / (n : Cut)

-- general lock lemma (needs n ≠ 0)
theorem numerator_lock (n : ℕ) (hn : (n : Cut) ≠ 0) :
    rungExponent n * (n : Cut) = sharedNumerator := by
  unfold rungExponent; field_simp

-- selfAdj lock
theorem lock_selfAdj :
    rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
      * (Module.finrank ℚ (bornBil).selfAdjointSubmodule : Cut) = sharedNumerator := by
  rw [numerator_lock]; rw [finrank_selfAdj_eq_28]; norm_num

theorem rung_selfAdj :
    rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = 3 * cutPi := by
  rw [rungExponent, finrank_selfAdj_eq_28, sharedNumerator_eq]; norm_num; ring

-- triple equality: all three products equal (12π·7 = (28π/3)·9 = 3π·28)
theorem triple_equality :
    (12 * cutPi) * 7 = (28 * cutPi / 3) * 9 ∧ (28 * cutPi / 3) * 9 = (3 * cutPi) * 28 := by
  constructor <;> ring

-- non-vacuity: shared numerator is the FULL turn (84π), not the half-turn budget (42π)
theorem sharedNumerator_ne_half : sharedNumerator ≠ 42 * cutPi := by
  rw [sharedNumerator_eq]; intro h
  have hp := cutPi_pos
  nlinarith [hp]

-- non-vacuity: rungs are distinct
theorem rungs_distinct : (12 * cutPi) ≠ (3 * cutPi) := by
  intro h; have hp := cutPi_pos; nlinarith [hp]

end Probe2
end
