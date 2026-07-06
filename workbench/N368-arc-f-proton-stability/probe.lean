import Mathlib.Tactic
open scoped BigOperators
open Finset

-- Probe the F3 arithmetic in isolation (no Phys deps) to de-risk before production.

noncomputable def baryonShift (n : ℕ) (k : ℤ) : ℤ := ∑ _g : Fin n, k

theorem baryonShift_eq (n : ℕ) (k : ℤ) : baryonShift n k = (n : ℤ) * k := by
  unfold baryonShift
  rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin]
  simp [nsmul_eq_mul]

theorem single_unit_forbidden (n : ℕ) (hn : 2 ≤ n) (k : ℤ) : baryonShift n k ≠ -1 := by
  rw [baryonShift_eq]
  intro h
  -- (n:ℤ) * k = -1 ⇒ (n:ℤ) ∣ -1 ⇒ (n:ℤ) ∣ 1 ⇒ n ≤ 1, contra 2 ≤ n
  have hdvd : (n : ℤ) ∣ (-1 : ℤ) := ⟨k, h.symm⟩
  have hdvd1 : (n : ℤ) ∣ (1 : ℤ) := (dvd_neg).mp hdvd
  have hle : (n : ℤ) ≤ 1 := Int.le_of_dvd (by norm_num) hdvd1
  have : (n : ℤ) ≥ 2 := by exact_mod_cast hn
  linarith

theorem single_unit_allowed_at_one : baryonShift 1 (-1) = -1 := by
  rw [baryonShift_eq]; norm_num

theorem bMinusL_conserved (n : ℕ) (k : ℤ) : baryonShift n k - baryonShift n k = 0 := by ring

theorem bPlusL_anomalous (n : ℕ) (k : ℤ) : baryonShift n k + baryonShift n k = 2 * (n:ℤ) * k := by
  rw [baryonShift_eq]; ring

theorem baryonShift_mem_multiples (n : ℕ) (k : ℤ) : ∃ m : ℤ, baryonShift n k = (n:ℤ) * m :=
  ⟨k, baryonShift_eq n k⟩

-- W8-style flag arithmetic sanity (mirrors costume pattern)
example : min (393 : ℕ) 1 = 1 := by decide
