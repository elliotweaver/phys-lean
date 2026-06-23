import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic
example (n : ℤ) (h : n ^ 2 = 2) : False := by
  have hb : -2 ≤ n ∧ n ≤ 2 := by constructor <;> nlinarith [sq_nonneg (n-2), sq_nonneg (n+2)]
  interval_cases n <;> omega
