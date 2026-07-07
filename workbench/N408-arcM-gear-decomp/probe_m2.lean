import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Phys.Algebra.LorentzContinuumSqrt
import Mathlib.Tactic

/-
  PROBE — arc-M M2: the S1 gear (Born-survival) decomposition + the S2 gear-search-empty
  obstruction. Over the DERIVED ℝ `Cut` + banked self-seen fraction `Matrix.trace Poth / 3`.
-/

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.HJ

noncomputable section

-- The banked self-seen (Born-survival) fraction, N308: Matrix.trace Poth / 3 = 2/3.
-- The S1 Born-survival gear = the DERIVED √ of the banked rational self-seen fraction.
noncomputable def bornGearP : Cut := cutSqrt (((Matrix.trace Poth / 3 : ℚ) : Cut))

theorem selfseen_cut : ((Matrix.trace Poth / 3 : ℚ) : Cut) = ((2/3 : ℚ) : Cut) := by
  rw [selfseen_two_thirds]

theorem selfseen_nonneg : (0 : Cut) ≤ ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  rw [selfseen_cut]; norm_num

-- S1: the Born gear squares back to the banked self-seen fraction (ties the TYPE to Poth).
theorem bornGearP_sq : bornGearP * bornGearP = ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  unfold bornGearP
  exact cutSqrt_sq selfseen_nonneg

-- S1 grammar-membership: the Born gear IS the derived √ of a rational Born weight.
theorem s1_grammar : ∃ w : ℚ, 0 ≤ w ∧ bornGearP * bornGearP = ((w : ℚ) : Cut) :=
  ⟨Matrix.trace Poth / 3, selfseen_nonneg', bornGearP_sq⟩
where selfseen_nonneg' : (0:ℚ) ≤ Matrix.trace Poth / 3 := by rw [selfseen_two_thirds]; norm_num

-- The load-bearing S2 obstruction (pure ℚ, NO Real): no rational squares to 3.
theorem no_rat_sq_three : ¬ ∃ r : ℚ, r ^ 2 = 3 := by
  rintro ⟨q, hq⟩
  have hnd : (q.num : ℚ) / (q.den : ℚ) = q := Rat.num_div_den q
  have key : (q.num) ^ 2 = 3 * (q.den : ℤ) ^ 2 := by
    have h2 : (q.num : ℚ) ^ 2 = 3 * (q.den : ℚ) ^ 2 := by
      rw [← hnd] at hq
      have hden0 : (q.den : ℚ) ≠ 0 := by exact_mod_cast q.den_nz
      field_simp at hq
      linarith [hq]
    exact_mod_cast h2
  have h3p : Prime (3 : ℤ) := by norm_num
  have hdvd_num : (3 : ℤ) ∣ q.num := h3p.dvd_of_dvd_pow ⟨(q.den : ℤ) ^ 2, key⟩
  obtain ⟨k, hk⟩ := hdvd_num
  have hdvd_den : (3 : ℤ) ∣ (q.den : ℤ) := by
    have h9' : (q.den : ℤ) ^ 2 = 3 * k ^ 2 := by
      have : (3:ℤ) * (q.den : ℤ) ^ 2 = 3 * (3 * k ^ 2) := by rw [← key, hk]; ring
      exact mul_left_cancel₀ (by norm_num : (3:ℤ) ≠ 0) this
    exact h3p.dvd_of_dvd_pow ⟨k ^ 2, h9'⟩
  have hcop : Nat.Coprime q.num.natAbs q.den := q.reduced
  have hd1 : 3 ∣ q.num.natAbs := by
    have := Int.natAbs_dvd_natAbs.mpr (⟨k, hk⟩ : (3:ℤ) ∣ q.num); simpa using this
  have hd2 : 3 ∣ q.den := by
    have := Int.natAbs_dvd_natAbs.mpr hdvd_den; simpa using this
  have : (3 : ℕ) ∣ Nat.gcd q.num.natAbs q.den := Nat.dvd_gcd hd1 hd2
  rw [hcop] at this; norm_num at this

-- corollary: no rational squares to 1/3 either (so the S2 gear's own square is irrational).
theorem no_rat_sq_third : ¬ ∃ r : ℚ, r ^ 2 = 1/3 := by
  rintro ⟨r, hr⟩
  exact no_rat_sq_three ⟨3 * r, by rw [mul_pow]; rw [hr]; norm_num⟩

-- S2's would-be Born weight is 3^{-1/2} = cutSqrt (1/3). Claim: it is NOT a rational cast.
-- (the gear-search over rational Born weights is EMPTY for S2).
theorem s2_bornweight_irrational : ¬ ∃ w : ℚ, cutSqrt (((1/3 : ℚ) : Cut)) = ((w : ℚ) : Cut) := by
  rintro ⟨w, hw⟩
  have hnn : (0:Cut) ≤ ((1/3:ℚ):Cut) := by norm_num
  have hsq : cutSqrt (((1/3:ℚ):Cut)) * cutSqrt (((1/3:ℚ):Cut)) = ((1/3:ℚ):Cut) := cutSqrt_sq hnn
  rw [hw] at hsq
  -- (w:Cut)*(w:Cut) = (1/3:Cut) → w^2 = 1/3 in ℚ
  have : (((w^2 : ℚ)) : Cut) = (((1/3 : ℚ)) : Cut) := by push_cast; ring_nf; ring_nf at hsq; linear_combination hsq
  have hqe : (w^2 : ℚ) = (1/3 : ℚ) := by exact_mod_cast this
  exact no_rat_sq_third ⟨w, hqe⟩

-- The decomposition FORM: amplitude = (phase gear) · (Born gear), squares to phase² · (self-seen fraction).
-- phaseGear is the CANDIDATE parameter (the fold phase tan²P·cosP is arc-O, honestly deferred).
theorem amplitude_decomposition (phaseGear : Cut) :
    (phaseGear * bornGearP) * (phaseGear * bornGearP)
      = (phaseGear * phaseGear) * ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  rw [show (phaseGear * bornGearP) * (phaseGear * bornGearP)
        = (phaseGear * phaseGear) * (bornGearP * bornGearP) by ring, bornGearP_sq]

-- W8 non-vacuity: Born gear ≠ 0, and self-seen 2/3 ≠ democratic 1/3 ≠ 1.
theorem bornGearP_ne_zero : bornGearP ≠ 0 := by
  intro h
  have hsq : bornGearP * bornGearP = ((2/3:ℚ):Cut) := by rw [bornGearP_sq, selfseen_cut]
  rw [h] at hsq
  simp only [mul_zero] at hsq
  have : ((0:ℚ):Cut) = ((2/3:ℚ):Cut) := by push_cast; push_cast at hsq; linarith [hsq]
  have : (0:ℚ) = 2/3 := by exact_mod_cast this
  norm_num at this

theorem selfseen_ne_democratic : ((Matrix.trace Poth / 3 : ℚ) : Cut) ≠ ((1/3 : ℚ) : Cut) := by
  rw [selfseen_cut]
  intro h
  have h2 : (2/3:ℚ) = 1/3 := by exact_mod_cast h
  norm_num at h2

end
