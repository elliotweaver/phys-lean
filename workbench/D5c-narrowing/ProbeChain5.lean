import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section
theorem partialCos_two_ninths_five_PROBE :
    partialCos (2 / 9 : Cut) 5 = 13226284829 / 13559717115 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]
end
end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket4
open Phys.Algebra Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

theorem pB_lo_s5 : (9754100853 / 10000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).1
  rw [Phys.Foundation.ContinuumQ.partialCos_two_ninths_five_PROBE] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (9754100853 / 10000000000 : Cut) ≤ 13226284829 / 13559717115 - 1 / 10000000000000 := by norm_num
  linarith
theorem pB_hi_s5 : pB ≤ 4877050427 / 5000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).2
  rw [Phys.Foundation.ContinuumQ.partialCos_two_ninths_five_PROBE] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (13226284829 / 13559717115 + 1 / 10000000000000 : Cut) ≤ 4877050427 / 5000000000 := by norm_num
  linarith

-- √2 to 1e12
theorem wB_lo_s5 : (1414213562373 / 1000000000000 : Cut) ≤ wB := by nlinarith [wB_ww, wB_nonneg]
theorem wB_hi_s5 : wB ≤ 707106781187 / 500000000000 := by nlinarith [wB_ww, wB_nonneg]

-- conic root: r^2 = 3-3p^2 ; rlo=38174008945/1e11, rhi=38174009023/1e11
theorem rB_lo_s5 : (38174008945 / 100000000000 : Cut) ≤ rB := by
  have hp2hi : pB * pB ≤ (4877050427 / 5000000000 : Cut) * (4877050427 / 5000000000) :=
    mul_le_mul pB_hi_s5 pB_hi_s5 (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]
theorem rB_hi_s5 : rB ≤ 38174009023 / 100000000000 := by
  have hp2lo : (9754100853 / 10000000000 : Cut) * (9754100853 / 10000000000) ≤ pB * pB :=
    mul_le_mul pB_lo_s5 pB_lo_s5 (by norm_num) (le_of_lt (by linarith [pB_lo_s5]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

end
end Phys.Algebra.NarrowedBracket4
