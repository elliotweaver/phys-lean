import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

-- Path 1: reduce to integers via num/den, use parity / coprimality.
-- Mathlib: q*q = 2 -> (q.num)^2 = 2 * (q.den)^2 with gcd(num,den)=1.
example : ¬ ∃ q : ℚ, q * q = 2 := by
  rintro ⟨q, hq⟩
  -- Try: there is `Rat.den_eq_one_iff` and den dvd. Use that q is an integer then.
  sorry

-- check available API
open Rat in
#check @Rat.num_div_den
#check @Rat.den_nz
example (q : ℚ) : (q.num : ℚ) = q * q.den := by exact_mod_cast (Rat.num_div_den q) ▸ by field_simp
