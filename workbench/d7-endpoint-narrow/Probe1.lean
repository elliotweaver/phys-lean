import Phys.Algebra.D7NarrowingRung1
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
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- PROBE 1: clean mass0 bracket from NB11 s6
theorem mass0_clean_lo_p : (5661726012625403 : Cut) / 1000000000000000 ≤ mass0 := by
  have h := Phys.Algebra.NarrowedBracket11.mass0_lo_s6
  have hk : (5661726012625403 : Cut) / 1000000000000000
      ≤ (1189719085816627 / 500000000000000 : Cut) * (1189719085816627 / 500000000000000) := by
    norm_num
  linarith

theorem mass0_clean_hi_p : mass0 ≤ (5661726012625422 : Cut) / 1000000000000000 := by
  have h := Phys.Algebra.NarrowedBracket11.mass0_hi_s6
  have hk : (1189719085816629 / 500000000000000 : Cut) * (1189719085816629 / 500000000000000)
      ≤ (5661726012625422 : Cut) / 1000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 2000000 in
-- PROBE 2: the deep L_b0 cert at index 20 (both ends)
theorem cutLog_b0_deep :
    (17337287949546 : Cut) / 10000000000000 ≤ cutLog mass0
      ∧ cutLog mass0 ≤ 17337287949547 / 10000000000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  refine ⟨?_, ?_⟩
  · have hcert : (17337287949546 : Cut) / 10000000000000
        ≤ cutLog (5661726012625403 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625403 / 1000000000000000) (17337287949546 / 10000000000000) 20
        (by norm_num) (by norm_num)
      show partialExp (17337287949546 / 10000000000000 : Cut) 20
          + expRemBound (17337287949546 / 10000000000000 : Cut) 20
        ≤ (5661726012625403 : Cut) / 1000000000000000
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((5661726012625403 : Cut) / 1000000000000000) ≤ cutLog mass0 :=
      cutLog_mono (by norm_num) mass0_clean_lo_p
    linarith
  · have hmono : cutLog mass0 ≤ cutLog ((5661726012625422 : Cut) / 1000000000000000) :=
      cutLog_mono hpos mass0_clean_hi_p
    have hcert : cutLog ((5661726012625422 : Cut) / 1000000000000000)
        ≤ (17337287949547 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (5661726012625422 / 1000000000000000) (17337287949547 / 10000000000000) 20
        (by norm_num) (by norm_num)
      show (5661726012625422 : Cut) / 1000000000000000
          ≤ partialExp (17337287949547 / 10000000000000 : Cut) 20
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

end

end Phys.Algebra.D7NarrowingRung2Probe
