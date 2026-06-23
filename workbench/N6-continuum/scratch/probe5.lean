import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

-- no integer n with n^2 = 2
example (n : ℤ) (h : n ^ 2 = 2) : False := by
  have h1 : n.natAbs ^ 2 = 2 := by
    have := Int.natAbs_pow n 2
    omega_nat <;> omega
  sorry
