import Phys.Algebra.ScaleTowerAbsoluteScaleChain
import Phys.Algebra.OctonionJordanGenerationCycleForm
import Mathlib.Tactic

open Phys.Algebra Phys.Algebra.Gear Phys.Algebra.Winding Phys.Algebra.ScaleChain Phys.Algebra.HJ
open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! ## CT1 — the one self-blind count threads M1 winding spacing AND M2 gear divisor. -/

theorem ct1_spacing : windingRungIndex 1 - windingRungIndex 0 = (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRungIndex; ring

theorem ct1_gear_divisor : s1BornProb * (Module.finrank ℚ Uhol : ℚ) = Matrix.trace Poth := by
  rw [s1BornProb, finrank_Uhol]; push_cast; ring

theorem ct1 :
    (windingRungIndex 1 - windingRungIndex 0 = (Module.finrank ℚ Uhol : ℤ))
    ∧ (s1BornProb * (Module.finrank ℚ Uhol : ℚ) = Matrix.trace Poth) :=
  ⟨ct1_spacing, ct1_gear_divisor⟩

/-! ## CT2 — grade split: ratio scale-invariant/pinned (exact) vs absolute parameter-dependent (conditional). -/

theorem ct2_ratio_scale_invariant (M A M' A' : ℚ) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2)
    (hM' : M' ≠ 0) (hA' : A' ^ 2 = 2 * M' ^ 2) :
    Qkoide (cosVec M A) = Qkoide (cosVec M' A') := by
  rw [koide_cosVec M A hM hA, koide_cosVec M' A' hM' hA']

theorem ct2_abs_parameter_dependent :
    ∃ pb pb' : ℚ, absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1 := by
  refine ⟨0, 1, ?_⟩
  have hL : absScaleChain 0 1 1 = 0 := by
    unfold absScaleChain
    rw [mbBornRatio_value]
    push_cast
    ring
  have hR : (0 : Cut) < absScaleChain 1 1 1 := by
    apply absScaleChain_pos <;> norm_num
  rw [hL]
  exact ne_of_lt hR

theorem ct2 :
    (∀ M A M' A' : ℚ, M ≠ 0 → A ^ 2 = 2 * M ^ 2 → M' ≠ 0 → A' ^ 2 = 2 * M' ^ 2 →
        Qkoide (cosVec M A) = Qkoide (cosVec M' A'))
    ∧ (∃ pb pb' : ℚ, absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1) :=
  ⟨fun M A M' A' => ct2_ratio_scale_invariant M A M' A', ct2_abs_parameter_dependent⟩

/-! ## CT3 — the assembled chain's two links both threaded by the one count. -/

theorem ct3_mb_link : (mbBornRatio 1 : ℚ) = Matrix.trace Poth / (Module.finrank ℚ Uhol : ℚ) := by
  rw [mbBornRatio, s1BornProb, finrank_Uhol]; push_cast; ring

theorem ct3_me_link : windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) :=
  windingRung_boundary

theorem ct3 :
    ((mbBornRatio 1 : ℚ) = Matrix.trace Poth / (Module.finrank ℚ Uhol : ℚ))
    ∧ (windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ)) :=
  ⟨ct3_mb_link, ct3_me_link⟩

/-! ## Non-vacuity checks. -/

theorem nv_count : (Module.finrank ℚ Uhol : ℤ) ≠ 1 := by rw [finrank_Uhol]; norm_num

theorem nv_ratio_value_nontrivial : (2 : ℚ) / 3 ≠ 1 := by norm_num

-- the pinned ratio value is genuinely the balanced 2/3, not the degenerate all-aligned 1
theorem nv_ratio_pinned_to_two_thirds (M A : ℚ) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) :
    Qkoide (cosVec M A) = 2 / 3 ∧ Qkoide (cosVec M A) ≠ 1 := by
  have h := koide_cosVec M A hM hA
  exact ⟨h, by rw [h]; norm_num⟩

end
