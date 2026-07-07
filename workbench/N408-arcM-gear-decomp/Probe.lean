import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.N408Probe

open Phys.Algebra.HJ

-- MEASURE 1: S1 Born-survival grounds on the banked self-blind others fraction.
theorem m1_S1_survival_banked : (2 : ℚ) / 3 = Matrix.trace Poth / 3 :=
  (selfseen_two_thirds).symm

-- MEASURE 2: S2 exclusion — no rational squares to 3 (empty gear-search), ℚ-only.
theorem m2_three_not_isSquare_rat : ¬ IsSquare (3 : ℚ) := by
  rw [show (3 : ℚ) = ((3 : ℕ) : ℚ) by norm_num, Rat.isSquare_natCast_iff]
  exact (Nat.prime_three).not_isSquare

theorem m2_no_rat_sqrt_three : ¬ ∃ q : ℚ, q * q = 3 := by
  rintro ⟨q, hq⟩
  exact m2_three_not_isSquare_rat ⟨q, hq.symm⟩

theorem m2_no_rat_pow_three : ¬ ∃ q : ℚ, q ^ 2 = 3 := by
  rintro ⟨q, hq⟩
  exact m2_three_not_isSquare_rat ⟨q, by rw [← hq]; ring⟩

end Phys.Algebra.N408Probe
