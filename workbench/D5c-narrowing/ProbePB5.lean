import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section

-- (1) split@5 partial cosine at cycle phase 2/9 (factorial-10 norm_num cost at 2/9)
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

-- (2) split@5 pB bracket: pB in [9754100853/1e10, 4877050427/5e9], width 1e-10
theorem pB_lo_s5_PROBE : (9754100853 / 10000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).1
  rw [Phys.Foundation.ContinuumQ.partialCos_two_ninths_five_PROBE] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (9754100853 / 10000000000 : Cut) ≤ 13226284829 / 13559717115 - 1 / 10000000000000 := by norm_num
  linarith

theorem pB_hi_s5_PROBE : pB ≤ 4877050427 / 5000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).2
  rw [Phys.Foundation.ContinuumQ.partialCos_two_ninths_five_PROBE] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (13226284829 / 13559717115 + 1 / 10000000000000 : Cut) ≤ 4877050427 / 5000000000 := by norm_num
  linarith

end
end Phys.Algebra.NarrowedBracket4
