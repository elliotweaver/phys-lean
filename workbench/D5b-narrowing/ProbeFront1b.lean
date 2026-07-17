import Phys.Algebra.NarrowedBracket3

namespace Phys.Algebra.ProbeFront1b
open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- assume the sharpened p,r brackets (proved in ProbeFront1, ~9s):
axiom pB_lo_sharp : (975410084 / 1000000000 : Cut) ≤ pB
axiom pB_hi_sharp : pB ≤ 975410086 / 1000000000
axiom rB_lo_sharp : (381740084 / 1000000000 : Cut) ≤ rB
axiom rB_hi_sharp : rB ≤ 381740101 / 1000000000

-- products (le_trans style, mirroring the banked wp_lo/wr_lo)
theorem wp_lo_sharp : (137943817 / 100000000 : Cut) ≤ wB * pB :=
  le_trans (by norm_num) (mul_le_mul wB_lo pB_lo_sharp (by norm_num) (le_of_lt (by linarith [wB_lo])))
theorem wp_hi_sharp : wB * pB ≤ (137943819 / 100000000 : Cut) :=
  le_trans (mul_le_mul wB_hi pB_hi_sharp (le_of_lt pB_pos) (by norm_num)) (by norm_num)
theorem wr_lo_sharp : (53986155 / 100000000 : Cut) ≤ wB * rB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo rB_lo_sharp (by norm_num) (le_of_lt (by linarith [wB_lo])))
theorem wr_hi_sharp : wB * rB ≤ (53986165 / 100000000 : Cut) := by
  have hrpos : (0 : Cut) < rB := by linarith [rB_lo_sharp]
  exact le_trans (mul_le_mul wB_hi rB_hi_sharp (le_of_lt hrpos) (by norm_num)) (by norm_num)

-- amplitudes
theorem b0_lo_sharp : (237943817 / 100000000 : Cut) ≤ b0 := by unfold b0; linarith [wp_lo_sharp]
theorem b0_hi_sharp : b0 ≤ (237943819 / 100000000 : Cut) := by unfold b0; linarith [wp_hi_sharp]
theorem b1_lo_sharp : (4034989 / 100000000 : Cut) ≤ b1 := by
  unfold b1; have he : (1:Cut) - wB*(pB+rB)/2 = 1 - (wB*pB + wB*rB)/2 := by ring
  rw [he]; linarith [wp_hi_sharp, wr_hi_sharp]
theorem b1_hi_sharp : b1 ≤ (4035011 / 100000000 : Cut) := by
  unfold b1; have he : (1:Cut) - wB*(pB+rB)/2 = 1 - (wB*pB + wB*rB)/2 := by ring
  rw [he]; linarith [wp_lo_sharp, wr_lo_sharp]
theorem b1_pos_sharp : (0 : Cut) < b1 := by have := b1_lo_sharp; linarith
theorem b0_pos_sharp : (0 : Cut) < b0 := by have := b0_lo_sharp; linarith

end
end Phys.Algebra.ProbeFront1b
