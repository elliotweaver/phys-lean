import Mathlib

-- Load-bearing sub-obligation: NO rational squares to 3 (pure ℚ, NO Real as content).

-- Clean route: q^2 = 3 → q.num^2 = 3 * q.den^2 → 3∣num, 3∣den → contradiction with coprime.
example (q : ℚ) (hq : q ^ 2 = 3) : False := by
  have hden0 : (q.den : ℚ) ≠ 0 := by exact_mod_cast q.den_nz
  -- num/den form
  have hnd : (q.num : ℚ) / (q.den : ℚ) = q := Rat.num_div_den q
  have key : (q.num) ^ 2 = 3 * (q.den : ℤ) ^ 2 := by
    have h2 : (q.num : ℚ) ^ 2 = 3 * (q.den : ℚ) ^ 2 := by
      rw [← hnd] at hq
      field_simp at hq
      linarith [hq]
    exact_mod_cast h2
  have h3p : Prime (3 : ℤ) := by norm_num
  have hdvd_num : (3 : ℤ) ∣ q.num := by
    have : (3 : ℤ) ∣ q.num ^ 2 := ⟨(q.den : ℤ) ^ 2, key⟩
    exact h3p.dvd_of_dvd_pow this
  obtain ⟨k, hk⟩ := hdvd_num
  have hdvd_den : (3 : ℤ) ∣ (q.den : ℤ) := by
    have h9' : (q.den : ℤ) ^ 2 = 3 * k ^ 2 := by
      have : (3:ℤ) * (q.den : ℤ) ^ 2 = 3 * (3 * k ^ 2) := by rw [← key, hk]; ring
      exact mul_left_cancel₀ (by norm_num : (3:ℤ) ≠ 0) this
    have : (3 : ℤ) ∣ (q.den : ℤ) ^ 2 := ⟨k ^ 2, h9'⟩
    exact h3p.dvd_of_dvd_pow this
  -- contradiction with coprimality num/den
  have hcop : Nat.Coprime q.num.natAbs q.den := q.reduced
  have h3n : (3 : ℤ).natAbs = 3 := rfl
  have hd1 : 3 ∣ q.num.natAbs := by
    have := Int.natAbs_dvd_natAbs.mpr (⟨k, hk⟩ : (3:ℤ) ∣ q.num)
    simpa using this
  have hd2 : 3 ∣ q.den := by
    have := Int.natAbs_dvd_natAbs.mpr hdvd_den
    simpa using this
  have : (3 : ℕ) ∣ Nat.gcd q.num.natAbs q.den := Nat.dvd_gcd hd1 hd2
  rw [hcop] at this
  norm_num at this
