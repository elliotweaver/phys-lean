import Phys.Algebra.NarrowedBracket3

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- PROBE 1: cutCos(2/9) at split@4 via cutCos_bracket (the theory-native p-sharpening).
-- partialCos(2/9,4) = 23326781/23914845 ; cosRemBound(2/9,4) = 2/13552276941 (~1.48e-10)
theorem probe_partialCos_2_9_four :
    partialCos (2 / 9 : Cut) 4 = 23326781 / 23914845 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

theorem probe_pB_lo_sharp : (975410084 / 1000000000 : Cut) ≤ cutCos (2 / 9 : Cut) := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 4 (by norm_num)).1
  rw [probe_partialCos_2_9_four] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 4 ≤ 2 / 13552276941 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  -- 23326781/23914845 - 2/13552276941 >= 975410084/1e9
  have hnum : (23326781 / 23914845 - 2 / 13552276941 : Cut) ≥ 975410084 / 1000000000 := by norm_num
  linarith

theorem probe_pB_hi_sharp : cutCos (2 / 9 : Cut) ≤ 975410086 / 1000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 4 (by norm_num)).2
  rw [probe_partialCos_2_9_four] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 4 ≤ 2 / 13552276941 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hnum : (23326781 / 23914845 + 2 / 13552276941 : Cut) ≤ 975410086 / 1000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
