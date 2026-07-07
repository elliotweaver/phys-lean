import Phys.Algebra.SpacetimeCovariantDerivative
import Phys.Foundation.ContinuumExpDeriv
import Mathlib.Tactic

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

namespace ProbeN382

-- carrier + banked objects
-- STVC := Cut × Cut × O Cut ; MetricEnd := Module.End Cut STVC ; sigOpC ; cutExp

def cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC
def cosmoDensity (Λ : Cut) : Cut := ((cosmoStress Λ) (1,0,0)).1
def cosmoPressure (Λ : Cut) : Cut := ((cosmoStress Λ) (0,1,0)).2.1
def scaleFactor (H t : Cut) : Cut := cutExp (H * t)

-- density reading = Λ
example (Λ : Cut) : cosmoDensity Λ = Λ := by
  unfold cosmoDensity cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]
  simp

-- pressure reading = -Λ
example (Λ : Cut) : cosmoPressure Λ = -Λ := by
  unfold cosmoPressure cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]
  simp

-- P = -ρ
example (Λ : Cut) : cosmoPressure Λ = - cosmoDensity Λ := by
  unfold cosmoPressure cosmoDensity cosmoStress
  rw [LinearMap.smul_apply, LinearMap.smul_apply, sigOpC_apply, sigOpC_apply]
  simp

-- w = -1
example (Λ : Cut) (hΛ : Λ ≠ 0) : cosmoPressure Λ / cosmoDensity Λ = -1 := by
  have hp : cosmoPressure Λ = -Λ := by
    unfold cosmoPressure cosmoStress
    rw [LinearMap.smul_apply, sigOpC_apply]; simp
  have hd : cosmoDensity Λ = Λ := by
    unfold cosmoDensity cosmoStress
    rw [LinearMap.smul_apply, sigOpC_apply]; simp
  rw [hp, hd, neg_div, div_self hΛ]

-- w != +1 load-bearing
example (Λ : Cut) (hΛ : Λ ≠ 0) : cosmoPressure Λ ≠ cosmoDensity Λ := by
  have hp : cosmoPressure Λ = -Λ := by
    unfold cosmoPressure cosmoStress
    rw [LinearMap.smul_apply, sigOpC_apply]; simp
  have hd : cosmoDensity Λ = Λ := by
    unfold cosmoDensity cosmoStress
    rw [LinearMap.smul_apply, sigOpC_apply]; simp
  rw [hp, hd]
  intro hc
  apply hΛ
  have : (2:Cut) * Λ = 0 := by linear_combination -hc
  rcases mul_eq_zero.mp this with h2 | hL
  · exact absurd h2 (by norm_num)
  · exact hL

-- scale factor positive
example (H t : Cut) : 0 < scaleFactor H t := by
  unfold scaleFactor; exact cutExp_pos _

-- self-similar
example (H t Δ : Cut) : scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ := by
  unfold scaleFactor
  rw [cutExp_add]; congr 1; ring

-- ratio epoch-independent
example (H t Δ : Cut) : scaleFactor H (t + Δ) / scaleFactor H t = scaleFactor H Δ := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (by unfold scaleFactor; exact cutExp_pos _)
  have hss : scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ := by
    unfold scaleFactor; rw [cutExp_add]; congr 1; ring
  rw [hss, mul_div_cancel_left₀ _ hpos]

-- hubble deriv
example (H t : Cut) (hH : H ≠ 0) :
    CutHasDerivAt (scaleFactor H) (H * scaleFactor H t) t := by
  unfold scaleFactor
  exact cutExp_scale_hasDerivAt H t hH

-- hubble ratio constant
example (H t : Cut) : (H * scaleFactor H t) / scaleFactor H t = H := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (by unfold scaleFactor; exact cutExp_pos _)
  rw [mul_div_cancel_right₀ _ hpos]

end ProbeN382
