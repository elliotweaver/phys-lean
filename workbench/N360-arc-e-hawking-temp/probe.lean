import Phys.Algebra.SpacetimeGravitationalCoupling

namespace Phys.Algebra.N360Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- near-horizon Euclidean 2-plane point
def eucPlanePoint (ρ θ : Cut) : Cut × Cut := (ρ * cutCos θ, ρ * cutSin θ)

-- (2) closure under a full azimuthal turn (= 2·cutPi = cutPi+cutPi)
theorem eucPlane_closes (ρ θ : Cut) :
    eucPlanePoint ρ (θ + azimuthalTurn) = eucPlanePoint ρ θ := by
  unfold eucPlanePoint azimuthalTurn
  have h2 : (2 : Cut) * cutPi = cutPi + cutPi := by ring
  rw [h2, cutCos_add_two_cutPi, cutSin_add_two_cutPi]

-- (3) W8 non-vacuity: a half-turn does NOT close (conical singularity)
theorem eucPlane_half_turn_conical :
    eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0 := by
  unfold eucPlanePoint
  rw [cutCos_cutPi, cutSin_cutPi, cutCos_zero, cutSin_zero]
  intro h
  have h1 : (1 : Cut) * (-1) = 1 * 1 := (Prod.ext_iff.mp h).1
  norm_num at h1

-- (4) period
def hawkingPeriod (κsg : Cut) : Cut := azimuthalTurn / κsg

-- (5) smoothness: period × surface gravity = one full turn
theorem hawkingPeriod_smoothness (κsg : Cut) (h : κsg ≠ 0) :
    κsg * hawkingPeriod κsg = azimuthalTurn := by
  unfold hawkingPeriod
  field_simp

-- (6)(7) temperature = reciprocal period = κ/2π
def hawkingTemp (κsg : Cut) : Cut := 1 / hawkingPeriod κsg

theorem hawkingTemp_eq (κsg : Cut) :
    hawkingTemp κsg = κsg / (2 * cutPi) := by
  unfold hawkingTemp hawkingPeriod azimuthalTurn
  rw [one_div_div]

-- (8) Schwarzschild home: β = gravCouplingCoeff·M  (= 8·cutPi·M)
theorem hawkingPeriod_schwarzschild (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    hawkingPeriod κsg = gravCouplingCoeff * M := by
  unfold hawkingPeriod azimuthalTurn
  rw [h, gravCouplingCoeff_eq]
  have h4M : (4 : Cut) * M ≠ 0 := by
    intro hc; apply hM; rcases mul_eq_zero.mp hc with h4 | hM0
    · norm_num at h4
    · exact hM0
  field_simp
  ring

-- (9) T_H = 1/(gravCouplingCoeff·M)  (= 1/(8·cutPi·M))
theorem hawkingTemp_schwarzschild (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    hawkingTemp κsg = 1 / (gravCouplingCoeff * M) := by
  unfold hawkingTemp
  rw [hawkingPeriod_schwarzschild κsg M hM h]

end

end Phys.Algebra.N360Probe
