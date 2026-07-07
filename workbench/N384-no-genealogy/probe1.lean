import Phys.Algebra.SpacetimeSingularityClosure
import Phys.Algebra.LandauerBound
import Phys.Algebra.NoDialDissolutionTheorems
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN384

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.Landauer
open Phys.Algebra.MaxEnt

noncomputable section

/-! TR1 — far-side ψ-independence: an observable read off the closure tip is direction-blind. -/

def farSideState {α : Type} (obs : Cut × Cut → α) (θ : Cut) : α := obs (closureTip θ)

theorem farSideState_psi_independent {α : Type} (obs : Cut × Cut → α) (θ θ' : Cut) :
    farSideState obs θ = farSideState obs θ' := by
  unfold farSideState
  rw [closureTip_angle_independent θ θ']

theorem closure_forgets_direction (θ θ' : Cut) : closureTip θ = closureTip θ' :=
  closureTip_angle_independent θ θ'

-- non-vacuity: off the tip directional data is real
example : eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0 := closureSection_faithful_off_tip

/-! TR2 — the blank/single-point state has zero self-datum = S_init = cutLog 1. -/

theorem farSide_selfDatum_eq_cutLog_one (n : ℕ) :
    negEntropy (resetState n) = cutLog 1 := by
  rw [resetState_zero_negEntropy, cutLog_one]

theorem farSide_blank_zero (n : ℕ) : negEntropy (resetState n) = 0 :=
  resetState_zero_negEntropy n

/-! TR3 — S_init cross-check: informational face agrees with fold-gap face, both = 0. -/

theorem sInit_crosscheck (c : Cut) (n : ℕ) :
    negEntropy (resetState n) = foldCoherenceGap c 0 := by
  rw [resetState_zero_negEntropy, Phys.Algebra.NoDial.initialEntropy_leg]

/-! TR4 — the isotropy wash. -/

def anisotropyWash (δ k N : Cut) : Cut := δ * cutExp (-(k * N))

theorem anisotropyWash_zero (δ k : Cut) : anisotropyWash δ k 0 = δ := by
  unfold anisotropyWash
  rw [mul_zero, neg_zero, cutExp_zero, mul_one]

theorem anisotropyWash_pos (δ k N : Cut) (hδ : 0 < δ) : 0 < anisotropyWash δ k N := by
  unfold anisotropyWash
  exact mul_pos hδ (cutExp_pos _)

theorem anisotropyWash_lt_initial (δ k N : Cut) (hδ : 0 < δ) (hk : 0 < k) (hN : 0 < N) :
    anisotropyWash δ k N < δ := by
  unfold anisotropyWash
  have hlt : cutExp (-(k * N)) < 1 := by
    have h0 : -(k * N) < 0 := by
      have : 0 < k * N := mul_pos hk hN
      linarith
    calc cutExp (-(k * N)) < cutExp 0 := cutExp_strictMono h0
      _ = 1 := cutExp_zero
  calc δ * cutExp (-(k * N)) < δ * 1 := by exact mul_lt_mul_of_pos_left hlt hδ
    _ = δ := mul_one δ

theorem anisotropyWash_strictAnti (δ k N₁ N₂ : Cut) (hδ : 0 < δ) (hk : 0 < k) (h : N₁ < N₂) :
    anisotropyWash δ k N₂ < anisotropyWash δ k N₁ := by
  unfold anisotropyWash
  apply mul_lt_mul_of_pos_left _ hδ
  apply cutExp_strictMono
  have hkn : k * N₁ < k * N₂ := mul_lt_mul_of_pos_left h hk
  linarith

end

end Phys.Algebra.ProbeN384
