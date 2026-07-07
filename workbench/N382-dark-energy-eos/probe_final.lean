import Phys.Algebra.SpacetimeCovariantDerivative
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

namespace ProbeN382c

noncomputable def cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC
noncomputable def cosmoDensity (Λ : Cut) : Cut := ((cosmoStress Λ) (1,0,0)).1
noncomputable def cosmoPressure (Λ : Cut) : Cut := ((cosmoStress Λ) (0,1,0)).2.1
noncomputable def scaleFactor (H t : Cut) : Cut := cutExp (H * t)

example (Λ : Cut) : cosmoDensity Λ = Λ := by
  unfold cosmoDensity cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp

example (Λ : Cut) : cosmoPressure Λ = -Λ := by
  unfold cosmoPressure cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp

example (Λ : Cut) : cosmoPressure Λ = - cosmoDensity Λ := by
  unfold cosmoPressure cosmoDensity cosmoStress
  rw [LinearMap.smul_apply, LinearMap.smul_apply, sigOpC_apply, sigOpC_apply]; simp

example (Λ : Cut) (hΛ : Λ ≠ 0) : cosmoPressure Λ / cosmoDensity Λ = -1 := by
  have hp : cosmoPressure Λ = -Λ := by
    unfold cosmoPressure cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp
  have hd : cosmoDensity Λ = Λ := by
    unfold cosmoDensity cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp
  rw [hp, hd, neg_div, div_self hΛ]

example (Λ : Cut) (hΛ : Λ ≠ 0) : cosmoPressure Λ ≠ cosmoDensity Λ := by
  have hp : cosmoPressure Λ = -Λ := by
    unfold cosmoPressure cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp
  have hd : cosmoDensity Λ = Λ := by
    unfold cosmoDensity cosmoStress; rw [LinearMap.smul_apply, sigOpC_apply]; simp
  rw [hp, hd]; intro hc; apply hΛ
  have h2 : (2:Cut) * Λ = 0 := by linear_combination -hc
  rcases mul_eq_zero.mp h2 with h | hL
  · exact absurd h (by norm_num)
  · exact hL

example (H t : Cut) : 0 < scaleFactor H t := by unfold scaleFactor; exact cutExp_pos _

example (H t Δ : Cut) : scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ := by
  unfold scaleFactor; rw [cutExp_add]; congr 1; ring

example (H t Δ : Cut) : scaleFactor H (t + Δ) / scaleFactor H t = scaleFactor H Δ := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (by unfold scaleFactor; exact cutExp_pos _)
  have hss : scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ := by
    unfold scaleFactor; rw [cutExp_add]; congr 1; ring
  rw [hss, mul_div_cancel_left₀ _ hpos]

example (H t : Cut) (hH : H ≠ 0) :
    CutHasDerivAt (scaleFactor H) (H * scaleFactor H t) t := by
  unfold scaleFactor; exact cutExp_scale_hasDerivAt H t hH

example (H t : Cut) : (H * scaleFactor H t) / scaleFactor H t = H := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (by unfold scaleFactor; exact cutExp_pos _)
  rw [mul_div_cancel_right₀ _ hpos]

example (H t₁ t₂ : Cut) (hH : 0 < H) (ht : t₁ < t₂) :
    scaleFactor H t₁ < scaleFactor H t₂ := by
  unfold scaleFactor; apply cutExp_strictMono; exact mul_lt_mul_of_pos_left ht hH

example (Λ : Cut) (k : MetricEnd) :
    (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 :=
  (cosmoTerm_covDeriv_zero Λ k).2

end ProbeN382c
