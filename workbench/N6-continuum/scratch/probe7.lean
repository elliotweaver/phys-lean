import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic
example (n : ℤ) (h : n ^ 2 = 2) : False := by
  have hlo : -2 ≤ n := by nlinarith [sq_nonneg (n+2)]
  have hhi : n ≤ 2 := by nlinarith [sq_nonneg (n-2)]
  interval_cases n <;> omega
