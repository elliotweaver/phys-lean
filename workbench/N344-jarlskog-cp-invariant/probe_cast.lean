import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra

noncomputable section

-- (0) cast probe: the associator witness as a Cut-valued CP unit
def cpUnitProbe : Cut := ((assoc3 u2 u1 (octCross u1 u2) : ℚ) : Cut)
example : cpUnitProbe = -1 := by unfold cpUnitProbe; rw [assoc3_witness]; push_cast; ring
example : cpUnitProbe ^ 2 = 1 := by unfold cpUnitProbe; rw [assoc3_witness]; push_cast; ring

-- (1) cutSqrt monotone helpers
theorem cutSqrt_le_of_sq_le {a b : Cut} (hb : 0 ≤ b) (h : a ≤ b * b) : cutSqrt a ≤ b := by
  rcases le_total 0 a with ha | ha
  · have hs := cutSqrt_nonneg a
    have hsq := cutSqrt_sq ha
    nlinarith [hsq, hs, hb, h]
  · rcases eq_or_lt_of_le ha with ha0 | ha0
    · have hs := cutSqrt_nonneg a
      have hsq := cutSqrt_sq (le_of_eq ha0.symm)
      nlinarith [hsq, hs, hb, h]
    · rw [show cutSqrt a = 0 from by unfold cutSqrt; rw [dif_neg (not_le.mpr ha0)]]
      exact hb

theorem le_cutSqrt_of_sq_le {a c : Cut} (ha : 0 ≤ a) (hc : 0 ≤ c) (h : c * c ≤ a) : c ≤ cutSqrt a := by
  have hs := cutSqrt_nonneg a
  have hsq := cutSqrt_sq ha
  nlinarith [hsq, hs, hc, h]

-- (2) g-band: sinSq * cosSq via closure reduction to one variable
theorem g12_lo : (478 : Cut)/100000 ≤ sinSqMix mass1 mass2 * cosSqMix mass1 mass2 := by
  have hc : cosSqMix mass1 mass2 = 1 - sinSqMix mass1 mass2 := by
    have h := sinSq_add_cosSq mass1 mass2 (ne_of_gt sum12_pos); linarith [h]
  rw [hc]; nlinarith [sinSq12_lo, sinSq12_hi]
theorem g12_hi : sinSqMix mass1 mass2 * cosSqMix mass1 mass2 ≤ (480 : Cut)/100000 := by
  have hc : cosSqMix mass1 mass2 = 1 - sinSqMix mass1 mass2 := by
    have h := sinSq_add_cosSq mass1 mass2 (ne_of_gt sum12_pos); linarith [h]
  rw [hc]; nlinarith [sinSq12_lo, sinSq12_hi]
