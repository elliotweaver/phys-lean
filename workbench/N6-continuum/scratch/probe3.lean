import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.RingTheory.Int.Basic
import Mathlib.Tactic

-- Try: q*q=2 forces q integer, then int has no sqrt of 2.
-- Path via den: for reduced q, (q^2).den = q.den^2 ... check API
#check @Rat.den
example (q : ℚ) (h : q * q = 2) : False := by
  -- promote to integers: q.num^2 = 2 * q.den^2
  have hden : q.den ≠ 0 := q.den_nz
  have key : (q.num) ^ 2 = 2 * (q.den : ℤ) ^ 2 := by
    have := Rat.num_div_den q
    field_simp at h ⊢
    -- h : q*q = 2 ; want num^2 = 2 den^2
    nlinarith [Rat.num_div_den q, sq_nonneg q] 
  sorry
