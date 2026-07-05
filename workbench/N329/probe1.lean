import Phys
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section
namespace Probe

-- (1) channelCount = 42 via the banked arc-A reciprocal 1/α* = 42
def channelCount : Cut := ((1 / alphaStar : ℚ) : Cut)

theorem channelCount_eq : channelCount = 42 := by
  unfold channelCount
  rw [inverseAlphaStar_eq_42]
  norm_num

-- (2) shared numerator 2π·42 = 84·cutPi, built from banked azimuthalTurn (2·cutPi) × channelCount
def sharedNumerator : Cut := azimuthalTurn * channelCount

theorem sharedNumerator_eq : sharedNumerator = 84 * cutPi := by
  unfold sharedNumerator azimuthalTurn
  rw [channelCount_eq]
  ring

-- the 2π/α* form is definitional (ties to arc A)
theorem sharedNumerator_phase_form :
    sharedNumerator = azimuthalTurn * ((1 / alphaStar : ℚ) : Cut) := rfl

-- (3) rung exponents at the three banked counts, values FALL OUT
def rungExponent (n : ℕ) : Cut := sharedNumerator / (n : Cut)

theorem rung_ImO : rungExponent (Module.finrank ℚ ImO) = 12 * cutPi := by
  rw [rungExponent, finrank_ImO, sharedNumerator_eq]
  norm_num
  ring

theorem rung_space : rungExponent (Module.finrank ℚ spaceSub) = 28 * cutPi / 3 := by
  rw [rungExponent, finrank_spaceSub, sharedNumerator_eq]
  push_cast
  ring

theorem rung_selfAdj :
    rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = 3 * cutPi := by
  rw [rungExponent, finrank_selfAdj_eq_28, sharedNumerator_eq]
  norm_num
  ring

-- (4) THE NUMERATOR LOCK: bare_exponent × divisor = shared numerator, all three
theorem lock_ImO :
    rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut) = sharedNumerator := by
  rw [rungExponent, finrank_ImO]
  push_cast
  field_simp

theorem lock_space :
    rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut) = sharedNumerator := by
  rw [rungExponent, finrank_spaceSub]
  push_cast
  field_simp

end Probe
end
