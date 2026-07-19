import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.D7NarrowingRung2Probe3

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.AssembledBracket
open Phys.Algebra.D7NarrowingRung1
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! L_b2: b2 clean [58021192014752/1e14, 58021192014755/1e14] from NB11 s6 wp/wr;
    mass2 [336645872281271/1e15, 336645872281307/1e15]; 1/mass2 certs 14/16. -/
theorem b2_clean_lo : (336645872281271 : Cut) / 1000000000000000 ≤ mass2 := by
  have hb2lo : (58021192014752 : Cut) / 100000000000000 ≤ b2 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [Phys.Algebra.NarrowedBracket11.wp_hi_s6, Phys.Algebra.NarrowedBracket11.wr_lo_s6]
  have hb2pos : (0 : Cut) < b2 := by linarith
  have := mul_le_mul hb2lo hb2lo (by norm_num) (le_of_lt hb2pos)
  unfold mass2
  nlinarith [this]

theorem b2_clean_hi : mass2 ≤ (336645872281307 : Cut) / 1000000000000000 := by
  have hb2hi : b2 ≤ (58021192014755 : Cut) / 100000000000000 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [Phys.Algebra.NarrowedBracket11.wp_lo_s6, Phys.Algebra.NarrowedBracket11.wr_hi_s6]
  have hb2pos : (0 : Cut) < b2 := b2_sharp_pos
  have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num)
  unfold mass2
  nlinarith [this]

theorem invMass2_deep :
    (1000000000000000 : Cut) / 336645872281307 ≤ 1 / mass2
      ∧ 1 / mass2 ≤ 1000000000000000 / 336645872281271 := by
  have hpos : (0 : Cut) < mass2 := mass2_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [b2_clean_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [b2_clean_lo]

set_option maxHeartbeats 2000000 in
theorem cutLog_b2_deep :
    (-10887237252238 / 10000000000000 : Cut) ≤ cutLog mass2
      ∧ cutLog mass2 ≤ -10887237252235 / 10000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMass2_deep
  have hinvpos : (0 : Cut) < 1 / mass2 := by positivity
  have hlog_lo : (10887237252235 : Cut) / 10000000000000 ≤ cutLog (1 / mass2) := by
    have hcert : (10887237252235 : Cut) / 10000000000000
        ≤ cutLog (1000000000000000 / 336645872281307) := by
      apply cutLog_ge_certified (1000000000000000 / 336645872281307) (10887237252235 / 10000000000000) 14
        (by norm_num) (by norm_num)
      show partialExp (10887237252235 / 10000000000000 : Cut) 14
          + expRemBound (10887237252235 / 10000000000000 : Cut) 14
        ≤ (1000000000000000 : Cut) / 336645872281307
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000 : Cut) / 336645872281307) ≤ cutLog (1 / mass2) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mass2) ≤ (10887237252238 : Cut) / 10000000000000 := by
    have hmono : cutLog (1 / mass2) ≤ cutLog ((1000000000000000 : Cut) / 336645872281271) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000 : Cut) / 336645872281271)
        ≤ (10887237252238 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (1000000000000000 / 336645872281271) (10887237252238 / 10000000000000) 16
        (by norm_num) (by norm_num)
      show (1000000000000000 : Cut) / 336645872281271
          ≤ partialExp (10887237252238 / 10000000000000 : Cut) 16
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mass2) = - cutLog mass2 := cutLog_inv_pos mass2_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! THE BARE ENDPOINT CORE (mirror endpoint_core_s1) with the 13-digit brackets. -/
set_option maxHeartbeats 2000000 in
theorem endpoint_core_r2 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-40893066400068 / 10000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066400067 / 10000000000000)
    (hLb0 : (17337287949546 : Cut) / 10000000000000 ≤ Lb0 ∧ Lb0 ≤ 17337287949547 / 10000000000000)
    (hLb2 : (-10887237252238 / 10000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887237252235 / 10000000000000) :
    (1363071881405 / 10000000000 : Cut)
        ≤ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 1363071881406 / 10000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (149379518556 / 10000000000 : Cut)
      ≤ 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 149379518557 / 10000000000 := by nlinarith
  set C := 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((1250000000 / 3926990817 : Cut) / 3) * (149379518556 / 10000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((1250000000 / 3926990817 : Cut) / 3) * (149379518556 / 10000000000)
        ≥ 1363071881405 / 10000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000 / 157079632679 : Cut) / 3) * (149379518557 / 10000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000 / 157079632679 : Cut) / 3) * (149379518557 / 10000000000)
        ≤ 1363071881406 / 10000000000 - 2425 / 18 := by norm_num
    linarith

end

end Phys.Algebra.D7NarrowingRung2Probe3
