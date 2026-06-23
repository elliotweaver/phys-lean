import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

-- (A) ℝ-free no rational sqrt of 2.  Try Mathlib's rational-level lemma first.
example : ¬ ∃ q : ℚ, q * q = 2 := by
  rintro ⟨q, hq⟩
  -- attempt: use Rat.not_isSquare? or num/den coprimality. Try a generic finish.
  have : ¬ ∃ q : ℚ, q ^ 2 = 2 := by
    simpa using (Rat.not_isSquare_iff_ne_sq).mp ?_ -- guess, may not exist
  sorry

-- (B) does Mathlib have irrational machinery purely at ℚ? check Nat.sqrt facts
#check @Nat.sqrt
#check @irrational_sqrt_two
