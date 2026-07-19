import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.D7NarrowingRung2Probe

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

/-! L_b0: clean mass0 [5661726012625402/1e15, 5661726012625422/1e15] (Rung1's), certs 18/19. -/
theorem mass0_clean_lo_p : (5661726012625402 : Cut) / 1000000000000000 ≤ mass0 :=
  Phys.Algebra.D7NarrowingRung1.mass0_clean_lo
theorem mass0_clean_hi_p : mass0 ≤ (5661726012625422 : Cut) / 1000000000000000 :=
  Phys.Algebra.D7NarrowingRung1.mass0_clean_hi

set_option maxHeartbeats 2000000 in
theorem cutLog_b0_deep :
    (17337287949546 : Cut) / 10000000000000 ≤ cutLog mass0
      ∧ cutLog mass0 ≤ 17337287949547 / 10000000000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  refine ⟨?_, ?_⟩
  · have hcert : (17337287949546 : Cut) / 10000000000000
        ≤ cutLog (5661726012625402 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625402 / 1000000000000000) (17337287949546 / 10000000000000) 18
        (by norm_num) (by norm_num)
      show partialExp (17337287949546 / 10000000000000 : Cut) 18
          + expRemBound (17337287949546 / 10000000000000 : Cut) 18
        ≤ (5661726012625402 : Cut) / 1000000000000000
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((5661726012625402 : Cut) / 1000000000000000) ≤ cutLog mass0 :=
      cutLog_mono (by norm_num) mass0_clean_lo_p
    linarith
  · have hmono : cutLog mass0 ≤ cutLog ((5661726012625422 : Cut) / 1000000000000000) :=
      cutLog_mono hpos mass0_clean_hi_p
    have hcert : cutLog ((5661726012625422 : Cut) / 1000000000000000)
        ≤ (17337287949547 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (5661726012625422 / 1000000000000000) (17337287949547 / 10000000000000) 19
        (by norm_num) (by norm_num)
      show (5661726012625422 : Cut) / 1000000000000000
          ≤ partialExp (17337287949547 / 10000000000000 : Cut) 19
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

/-! L_mb: q at 15 digits, mbR clean [16750843898055717/1e18, 16750843898055843/1e18], 1/mbR certs 25/27. -/
theorem q_deep_lo : (707106781186547 : Cut) / 1000000000000000 ≤ q := by nlinarith [q_sq, q_pos]
theorem q_deep_hi : q ≤ (707106781186548 : Cut) / 1000000000000000 := by nlinarith [q_sq, q_pos]

theorem mbR_clean_lo : (16750843898055717 : Cut) / 1000000000000000000 ≤ mbRatioDerived := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [le_div_iff₀ h1]
  nlinarith [q_deep_hi, q_pos, q_lt_one, q_sq]

theorem mbR_clean_hi : mbRatioDerived ≤ (16750843898055843 : Cut) / 1000000000000000000 := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [div_le_iff₀ h1]
  nlinarith [q_deep_lo, q_pos, q_lt_one, q_sq]

theorem invMbR_deep :
    (1000000000000000000 : Cut) / 16750843898055843 ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 1000000000000000000 / 16750843898055717 := by
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mbR_clean_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mbR_clean_lo]

set_option maxHeartbeats 2000000 in
theorem cutLog_mb_deep :
    (-40893066400068 / 10000000000000 : Cut) ≤ cutLog mbRatioDerived
      ∧ cutLog mbRatioDerived ≤ -40893066400067 / 10000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMbR_deep
  have hinvpos : (0 : Cut) < 1 / mbRatioDerived := by positivity
  have hlog_lo : (40893066400067 : Cut) / 10000000000000 ≤ cutLog (1 / mbRatioDerived) := by
    have hcert : (40893066400067 : Cut) / 10000000000000
        ≤ cutLog (1000000000000000000 / 16750843898055843) := by
      apply cutLog_ge_certified (1000000000000000000 / 16750843898055843) (40893066400067 / 10000000000000) 25
        (by norm_num) (by norm_num)
      show partialExp (40893066400067 / 10000000000000 : Cut) 25
          + expRemBound (40893066400067 / 10000000000000 : Cut) 25
        ≤ (1000000000000000000 : Cut) / 16750843898055843
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000000 : Cut) / 16750843898055843) ≤ cutLog (1 / mbRatioDerived) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mbRatioDerived) ≤ (40893066400068 : Cut) / 10000000000000 := by
    have hmono : cutLog (1 / mbRatioDerived) ≤ cutLog ((1000000000000000000 : Cut) / 16750843898055717) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000000 : Cut) / 16750843898055717)
        ≤ (40893066400068 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (1000000000000000000 / 16750843898055717) (40893066400068 / 10000000000000) 27
        (by norm_num) (by norm_num)
      show (1000000000000000000 : Cut) / 16750843898055717
          ≤ partialExp (40893066400068 / 10000000000000 : Cut) 27
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived := cutLog_inv_pos mbRatioDerived_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

end

end Phys.Algebra.D7NarrowingRung2Probe
