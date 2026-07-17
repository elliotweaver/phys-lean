import Phys.Algebra.NarrowedBracket3

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

theorem probe_partialCos_six (x : Cut) :
    partialCos x 6 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - x ^ 10 / 3628800 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

theorem probe_cutCos_zhi_neg : cutCos (15707970 / 10000000 : Cut) < 0 := by
  have hb := (cutCos_bracket (15707970 / 10000000) (by norm_num) 6 (by norm_num)).2
  rw [probe_partialCos_six] at hb
  have hpart : (1 : Cut) - (15707970 / 10000000) ^ 2 / 2 + (15707970 / 10000000) ^ 4 / 24
      - (15707970 / 10000000) ^ 6 / 720 + (15707970 / 10000000) ^ 8 / 40320
      - (15707970 / 10000000) ^ 10 / 3628800 ≤ -1137 / 1000000000 := by norm_num
  have hrem : cosRemBound (15707970 / 10000000 : Cut) 6 ≤ 478 / 1000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

end
end ContinuumQ
end Phys.Foundation
