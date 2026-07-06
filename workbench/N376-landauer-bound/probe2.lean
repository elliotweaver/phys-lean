-- MEASURE-FIRST probe 2 for N376: general n-state reset + cross-tie decomposition.
import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

noncomputable section

-- general reset (delta / definite state): point mass at index 0
def resetState (n : ℕ) : Fin n → Cut := fun i => if (i : ℕ) = 0 then 1 else 0

-- crux A: reset is a probability vector (sums to 1) for n ≥ 1
example : ∑ i, resetState 2 i = 1 := by
  unfold resetState
  rw [Fin.sum_univ_two]
  norm_num

-- crux B: general reset has zero negEntropy (definite = no uncertainty)
example (n : ℕ) : negEntropy (resetState n) = 0 := by
  unfold negEntropy resetState
  apply Finset.sum_eq_zero
  intro i _
  by_cases h : (i : ℕ) = 0
  · simp [h, cutLog_one]
  · simp [h]

-- crux C: the general uniform-reset cost = cutLog n  (destroyed uncertainty)
example (n : ℕ) [NeZero n] :
    negEntropy (resetState n) - negEntropy (uniformState n) = cutLog (n : Cut) := by
  have h0 : negEntropy (resetState n) = 0 := by
    unfold negEntropy resetState
    apply Finset.sum_eq_zero
    intro i _
    by_cases h : (i : ℕ) = 0
    · simp [h, cutLog_one]
    · simp [h]
  rw [h0, negEntropy_uniform]
  ring

-- crux D: cross-tie decomposition — bhEntropy M = (bhArea/cellArea)·erasureCost, erasureCost = cutLog 2
example (M : Cut) :
    Phys.Algebra.bhEntropy M
      = (Phys.Algebra.bhArea M / Phys.Algebra.cellArea) * (cutLog 2) := by
  have h := Phys.Algebra.bhEntropy_cell_decomposition M
  unfold Phys.Algebra.cellEntropy at h
  exact h

end
