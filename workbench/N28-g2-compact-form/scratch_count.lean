import Mathlib.Tactic
example (d : ℕ) (hd0 : 0 < d) (hd7 : d < 7)
    (hfin : (14:ℕ) ≤ d.choose 2 + (7 - d).choose 2) : False := by
  interval_cases d <;> revert hfin <;> decide
