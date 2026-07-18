import Phys.Foundation.ContinuumBracket
import Phys.Algebra.NarrowedBracket7
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

noncomputable section

-- MEASURE 1: cutPi/3 rational bracket from cutPi_bracket_ext2.
example : (1047197 / 1000000 : Cut) ≤ cutPi / 3 ∧ cutPi / 3 ≤ 1047198 / 1000000 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext2
  constructor <;> linarith

-- MEASURE 2: partialExp lower at alo, N=8 — cost of evaluating the 8-term sum.
example : (2849 / 1000 : Cut) ≤ partialExp (1047197 / 1000000) 8 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

-- MEASURE 3: partialExp upper + remBound at ahi, N=8.
example : partialExp (1047198 / 1000000 : Cut) 8 + expRemBound (1047198 / 1000000) 8
    ≤ 2850 / 1000 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
