/-
  PROBE 2 (X6): validate the full assembly structure before production.
-/
import Phys.Algebra.FineStructureRunningExact
import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- the per-band screening increment
def bandScreen (depth ratio : Cut) : Cut := kappaLeading * depth * cutLog ratio

-- the top-band scale ratio M/v = 1/(v/M) = 1/ewClosureRatio = cutExp(28·cutPi/3)
def topBandRatio : Cut := ewClosureRatio⁻¹

-- key helper: (cutExp(-a))⁻¹ = cutExp a
theorem inv_cutExp_neg (a : Cut) : (cutExp (-a))⁻¹ = cutExp a :=
  inv_eq_of_mul_eq_one_left (by rw [cutExp_add, add_neg_cancel]; exact cutExp_zero)

-- (A) topBandRatio = cutExp(28·cutPi/3)
example : topBandRatio = cutExp (28 * cutPi / 3) := by
  unfold topBandRatio; rw [ewClosureRatio_eq, inv_cutExp_neg]

-- (B) the exact cutPi-free top-band screening rational: 448/27
example : bandScreen chargeTraceDepth topBandRatio = 448 / 27 := by
  unfold bandScreen topBandRatio
  rw [ewClosureRatio_eq, inv_cutExp_neg, cutLog_cutExp, kappaLeading_eq, chargeTraceDepth_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

-- (C) bandScreen is linear in the log-argument
example (depth t : Cut) : bandScreen depth (cutExp t) = kappaLeading * depth * t := by
  unfold bandScreen; rw [cutLog_cutExp]

-- (D) cutLog nonneg for ratio ≥ 1 (helper)
example (ratio : Cut) (hr : 1 ≤ ratio) : 0 ≤ cutLog ratio := by
  rcases eq_or_lt_of_le hr with h | h
  · rw [← h, cutLog_one]
  · exact le_of_lt (cutLog_pos h)

-- (E) the unboundedness tooth: screening exceeds any bound at some ratio > 1 (Archimedean Cut)
example (B : Cut) : ∃ ratio : Cut, 1 < ratio ∧ B < bandScreen chargeTraceDepth ratio := by
  have hbpos : 0 < kappaLeading * chargeTraceDepth := mul_pos kappaLeading_pos chargeTraceDepth_pos
  obtain ⟨n, hn⟩ := exists_nat_gt (B / (kappaLeading * chargeTraceDepth))
  refine ⟨cutExp ((n : Cut) + 1), ?_, ?_⟩
  · calc (1 : Cut) = cutExp 0 := cutExp_zero.symm
      _ < cutExp ((n : Cut) + 1) := cutExp_strictMono (by positivity)
  · unfold bandScreen
    rw [cutLog_cutExp]
    have hstep : B < kappaLeading * chargeTraceDepth * ((n : Cut) + 1) := by
      rw [div_lt_iff₀ hbpos] at hn
      nlinarith [hbpos, hn]
    linarith [hstep]

end

end Phys.Algebra
