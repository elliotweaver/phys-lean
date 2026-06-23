import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

-- THE FORCED MISS: ℚ has no square root of 2 (ℝ-free).
theorem no_int_sqrt_two (n : ℤ) (h : n ^ 2 = 2) : False := by
  have hlo : -2 ≤ n := by nlinarith [sq_nonneg (n+2)]
  have hhi : n ≤ 2 := by nlinarith [sq_nonneg (n-2)]
  interval_cases n <;> omega

theorem no_rat_sqrt_two : ¬ ∃ q : ℚ, q ^ 2 = 2 := by
  rintro ⟨q, h⟩
  have hd : (q ^ 2).den = 1 := by rw [h]; rfl
  rw [Rat.den_pow] at hd
  have hden1 : q.den = 1 := by nlinarith [Nat.one_le_iff_ne_zero.mpr q.den_nz, hd]
  have hnum : (q.num) ^ 2 = 2 := by
    have hp := Rat.num_pow q 2
    rw [h] at hp; simpa [hden1] using hp.symm
  exact no_int_sqrt_two q.num hnum
#print axioms no_rat_sqrt_two
