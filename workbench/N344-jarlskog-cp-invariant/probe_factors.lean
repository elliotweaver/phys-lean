import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra

noncomputable section

-- cutSqrt helpers (banked-in-production)
theorem cutSqrt_le_of_sq_le {a b : Cut} (hb : 0 ≤ b) (h : a ≤ b * b) : cutSqrt a ≤ b := by
  rcases le_total 0 a with ha | ha
  · nlinarith [cutSqrt_sq ha, cutSqrt_nonneg a, hb, h]
  · rcases eq_or_lt_of_le ha with ha0 | ha0
    · nlinarith [cutSqrt_sq (le_of_eq ha0.symm), cutSqrt_nonneg a, hb, h]
    · rw [show cutSqrt a = 0 from by unfold cutSqrt; rw [dif_neg (not_le.mpr ha0)]]; exact hb
theorem le_cutSqrt_of_sq_le {a c : Cut} (ha : 0 ≤ a) (hc : 0 ≤ c) (h : c * c ≤ a) : c ≤ cutSqrt a := by
  nlinarith [cutSqrt_sq ha, cutSqrt_nonneg a, hc, h]

-- cosSq closure shorthands
theorem cos12 : cosSqMix mass1 mass2 = 1 - sinSqMix mass1 mass2 := by
  have h := sinSq_add_cosSq mass1 mass2 (ne_of_gt sum12_pos); linarith
theorem cos23 : cosSqMix mass2 mass0 = 1 - sinSqMix mass2 mass0 := by
  have h := sinSq_add_cosSq mass2 mass0 (ne_of_gt sum23_pos); linarith
theorem cos13 : cosSqMix mass1 mass0 = 1 - sinSqMix mass1 mass0 := by
  have h := sinSq_add_cosSq mass1 mass0 (ne_of_gt sum13_pos); linarith

-- factor g12 = sinSq12 * cosSq12 ∈ [4786/1e6, 4797/1e6]
def g12 : Cut := sinSqMix mass1 mass2 * cosSqMix mass1 mass2
theorem g12_lo : (4786 : Cut)/1000000 ≤ g12 := by
  unfold g12; rw [cos12]; nlinarith [sinSq12_lo, sinSq12_hi]
theorem g12_hi : g12 ≤ (4797 : Cut)/1000000 := by
  unfold g12; rw [cos12]; nlinarith [sinSq12_lo, sinSq12_hi]
theorem g12_pos : (0:Cut) < g12 := by have := g12_lo; linarith

-- factor g23 ∈ [5295/1e5, 5305/1e5]
def g23 : Cut := sinSqMix mass2 mass0 * cosSqMix mass2 mass0
theorem g23_lo : (5295 : Cut)/100000 ≤ g23 := by
  unfold g23; rw [cos23]; nlinarith [sinSq23_lo, sinSq23_hi]
theorem g23_hi : g23 ≤ (5305 : Cut)/100000 := by
  unfold g23; rw [cos23]; nlinarith [sinSq23_lo, sinSq23_hi]
theorem g23_pos : (0:Cut) < g23 := by have := g23_lo; linarith

-- factor h13 = sinSq13 * cosSq13^2 ∈ [2868/1e7, 2879/1e7]  (cubic in sinSq13)
def h13 : Cut := sinSqMix mass1 mass0 * cosSqMix mass1 mass0 ^ 2
theorem h13_lo : (2868 : Cut)/10000000 ≤ h13 := by
  unfold h13; rw [cos13]; nlinarith [sinSq13_lo, sinSq13_hi]
theorem h13_hi : h13 ≤ (2879 : Cut)/10000000 := by
  unfold h13; rw [cos13]; nlinarith [sinSq13_lo, sinSq13_hi]
theorem h13_pos : (0:Cut) < h13 := by have := h13_lo; linarith
