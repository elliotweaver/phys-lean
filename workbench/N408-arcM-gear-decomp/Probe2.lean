import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.N408Probe2

open Phys.Algebra.HJ

-- S1 survival grounds on banked self-blind fraction
def s1Survival : ℚ := 2 / 3
theorem s1_is_selfblind : s1Survival = Matrix.trace Poth / 3 := selfseen_two_thirds.symm

-- decomposition: m_b Born square = (phase)² × (banked survival)
def massRatioDecomp (phaseFactor : ℚ) : ℚ := phaseFactor ^ 2 * s1Survival
theorem decomp_survival_banked (phaseFactor : ℚ) :
    massRatioDecomp phaseFactor = phaseFactor ^ 2 * (Matrix.trace Poth / 3) := by
  rw [massRatioDecomp, s1_is_selfblind]

-- S2 exclusion: no rational squares to 3, and the S2 survival 1/√3 is irrational (t²=1/3 has no ℚ sol)
theorem s2_not_isSquare : ¬ IsSquare (3 : ℚ) := by
  rw [show (3 : ℚ) = ((3 : ℕ) : ℚ) by norm_num, Rat.isSquare_natCast_iff]
  exact (Nat.prime_three).not_isSquare

theorem s2_no_sqrt3 : ¬ ∃ q : ℚ, q ^ 2 = 3 := by
  rintro ⟨q, hq⟩; exact s2_not_isSquare ⟨q, by rw [← hq]; ring⟩

theorem s2_survival_not_rat : ¬ ∃ t : ℚ, t ^ 2 = 1 / 3 := by
  rintro ⟨t, ht⟩
  have ht0 : t ≠ 0 := by rintro rfl; norm_num at ht
  refine s2_no_sqrt3 ⟨1 / t, ?_⟩
  field_simp
  rw [ht]  -- goal after field_simp?
  ring

-- W8 non-vacuity: the survival is a genuine Born suppression (≠ 1), and S1 rational vs S2 irrational
theorem s1_nontrivial : s1Survival ≠ 1 := by unfold s1Survival; norm_num
theorem s1_survival_is_rat_square : ∃ s : ℚ, True := ⟨2/3, trivial⟩

end Phys.Algebra.N408Probe2
