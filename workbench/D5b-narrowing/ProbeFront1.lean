import Phys.Algebra.NarrowedBracket3

namespace Phys.Algebra.ProbeFront1
open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- ===== sharpened p = cutCos(2/9) via split@4 (same instrument as cutPi's least-zero) =====
theorem pB_lo_sharp : (975410084 / 1000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 4 (by norm_num)).1
  have hhead : partialCos (2 / 9 : Cut) 4 = 23326781 / 23914845 := by
    unfold partialCos cosTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  rw [hhead] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 4 ≤ 2 / 13552276941 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (975410084 / 1000000000 : Cut) ≤ 23326781 / 23914845 - 2 / 13552276941 := by norm_num
  linarith

theorem pB_hi_sharp : pB ≤ 975410086 / 1000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 4 (by norm_num)).2
  have hhead : partialCos (2 / 9 : Cut) 4 = 23326781 / 23914845 := by
    unfold partialCos cosTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  rw [hhead] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 4 ≤ 2 / 13552276941 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (23326781 / 23914845 + 2 / 13552276941 : Cut) ≤ 975410086 / 1000000000 := by norm_num
  linarith

-- ===== sharpened r via the conic and the sharpened p bracket =====
theorem rB_lo_sharp : (381740084 / 1000000000 : Cut) ≤ rB := by
  have hp2hi : pB * pB ≤ (975410086 / 1000000000 : Cut) * (975410086 / 1000000000) :=
    mul_le_mul pB_hi_sharp pB_hi_sharp (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]

theorem rB_hi_sharp : rB ≤ 381740101 / 1000000000 := by
  have hp2lo : (975410084 / 1000000000 : Cut) * (975410084 / 1000000000) ≤ pB * pB :=
    mul_le_mul pB_lo_sharp pB_lo_sharp (by norm_num) (le_of_lt (by linarith [pB_lo_sharp]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

end
end Phys.Algebra.ProbeFront1
