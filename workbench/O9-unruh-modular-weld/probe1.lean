import Phys.Algebra.SpacetimeHawkingTemperature
import Phys.Algebra.MaxEntArrowOfTime

namespace Phys.Algebra.UnruhProbe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- unruhPeriod as hawkingPeriod
def unruhPeriod (a : Cut) : Cut := hawkingPeriod a

def rindlerEucPoint (ρ a τ : Cut) : Cut × Cut := eucPlanePoint ρ (a * τ)

-- PROBE 1: rindler_closes
theorem rindler_closes (ρ a τ : Cut) (ha : a ≠ 0) :
    rindlerEucPoint ρ a (τ + unruhPeriod a) = rindlerEucPoint ρ a τ := by
  unfold rindlerEucPoint unruhPeriod hawkingPeriod
  have heq : a * (τ + azimuthalTurn / a) = a * τ + azimuthalTurn := by
    field_simp
  rw [heq]
  exact eucPlane_closes ρ (a * τ)

-- PROBE 2: W8 half-period conical
theorem rindler_half_period_conical :
    rindlerEucPoint 1 1 cutPi ≠ rindlerEucPoint 1 1 0 := by
  unfold rindlerEucPoint
  simp only [one_mul, mul_zero]
  exact eucPlane_half_turn_conical

-- PROBE 3: closure smoothness
theorem unruh_closure (a : Cut) (ha : a ≠ 0) : a * unruhPeriod a = azimuthalTurn :=
  hawkingPeriod_smoothness a ha

-- PROBE 4: unruhTemp
def unruhTemp (a : Cut) : Cut := hawkingTemp a
theorem unruhTemp_eq (a : Cut) : unruhTemp a = a / (2 * cutPi) := hawkingTemp_eq a
theorem unruhTemp_pos (a : Cut) (h : 0 < a) : 0 < unruhTemp a := hawkingTemp_pos a h

-- PROBE 5: THE KMS weld — the equilibrium the probe reads is the banked N375 Gibbs state
theorem unruh_kms_equilibrium {n : ℕ} [NeZero n] (E : Fin n → Cut) (a : Cut) :
    ∃ c, MaxEnt.IsGibbsState (MaxEnt.boltzmann E (unruhPeriod a)) E (unruhPeriod a) c :=
  ⟨_, MaxEnt.boltzmann_isGibbs E (unruhPeriod a)⟩

-- PROBE 6: temperature acceleration-dependent (W8)
theorem unruhTemp_two_ne_one : unruhTemp 2 ≠ unruhTemp 1 := by
  rw [unruhTemp_eq, unruhTemp_eq]
  have hπ := cutPi_pos
  intro h
  -- 2/(2cutPi) = 1/(2cutPi) → 2 = 1
  have h2 : (2 : Cut) * cutPi ≠ 0 := by positivity
  field_simp at h
  -- expect a false numeric
  norm_num at h

end

end Phys.Algebra.UnruhProbe
