import Phys.Algebra.NarrowedBracket8

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra
noncomputable section

-- PROBE: partialCos_seven and partialCos_eight expansions
theorem probe_partialCos_seven (x : Cut) :
    partialCos x 7 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - x ^ 10 / 3628800 + x ^ 12 / 479001600 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]; ring

theorem probe_partialCos_eight (x : Cut) :
    partialCos x 8 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - x ^ 10 / 3628800 + x ^ 12 / 479001600 - x ^ 14 / 87178291200 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]; ring

-- PROBE: the N=8 upper sign at the 1e9 tick 1570796327 (norm_num on x^16 cost risk)
set_option maxHeartbeats 4000000 in
theorem probe_cutCos_1570796327_neg : cutCos (1570796327 / 1000000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 1570796327 / 1000000000 := by norm_num
  have hxN : (1570796327 / 1000000000 : Cut) ^ 2 < (((2 * 8 + 1) * (2 * 8 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (1570796327 / 1000000000) hx0 8 hxN).2
  rw [probe_partialCos_eight] at hb
  have hrem : cosRemBound (1570796327 / 1000000000 : Cut) 8 ≤ 7 / 100000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (1570796327 / 1000000000) ^ 2 / 2 + (1570796327 / 1000000000) ^ 4 / 24
      - (1570796327 / 1000000000) ^ 6 / 720 + (1570796327 / 1000000000) ^ 8 / 40320
      - (1570796327 / 1000000000) ^ 10 / 3628800 + (1570796327 / 1000000000) ^ 12 / 479001600
      - (1570796327 / 1000000000) ^ 14 / 87178291200 ≤ -2 / 10000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
