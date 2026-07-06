-- MEASURE-FIRST probe 3 for N376: lock the EXACT production forms (unified resetState).
import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

noncomputable section

-- THE RESET (definite / erased state): point mass at index 0.
def resetState (n : ℕ) : Fin n → Cut := fun i => if (i : ℕ) = 0 then 1 else 0

-- reset is positive-index-0, zero elsewhere; a probability vector (n = 2)
example : ∑ i, resetState 2 i = 1 := by
  unfold resetState; rw [Fin.sum_univ_two]; norm_num

-- zero negEntropy (definite ⇒ no self-uncertainty)
example (n : ℕ) : negEntropy (resetState n) = 0 := by
  unfold negEntropy resetState
  apply Finset.sum_eq_zero
  intro i _
  by_cases h : (i : ℕ) = 0
  · simp [h, cutLog_one]
  · simp [h]

-- THE ERASURE COST = relInfo(reset ‖ uniform 2) = cutLog 2, unified resetState form
example : relInfo (resetState 2) (uniformState 2) = cutLog 2 := by
  unfold relInfo resetState uniformState
  rw [Fin.sum_univ_two]
  have hne : ((2:ℕ):Cut) = (2:Cut) := by norm_num
  simp only [Fin.val_zero, Fin.val_one, if_true, if_false, Nat.one_ne_zero, hne,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  have hinv : cutLog ((2:Cut)⁻¹) = - cutLog 2 := cutLog_inv (by norm_num)
  rw [cutLog_one, hinv]
  ring

-- entropy-deficit reading: relInfo(reset ‖ uniform) = negEntropy(reset) − negEntropy(uniform)
example (n : ℕ) [NeZero n] :
    negEntropy (resetState n) - negEntropy (uniformState n) = cutLog (n : Cut) := by
  have h0 : negEntropy (resetState n) = 0 := by
    unfold negEntropy resetState
    apply Finset.sum_eq_zero
    intro i _
    by_cases h : (i : ℕ) = 0
    · simp [h, cutLog_one]
    · simp [h]
  rw [h0, negEntropy_uniform]; ring

end
