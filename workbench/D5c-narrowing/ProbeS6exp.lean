import Phys.Algebra.NarrowedBracket10

namespace Phys.Foundation.ContinuumQ
open Phys.Algebra
noncomputable section

-- split@6 partialCos value
theorem partialCos_two_ninths_six_probe : partialCos (2 / 9 : Cut) 6 = 48209808201701 / 49425168884175 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

set_option maxHeartbeats 2000000 in
-- N=36 exp certification LOWER: partialExp a 36 + expRemBound a 36 <= m01_lo
theorem exp36_lower_probe :
    partialExp (815406111272 / 100000000000 : Cut) 36 + expRemBound (815406111272 / 100000000000) 36
      ≤ 3477472837103 / 1000000000 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
end Phys.Foundation.ContinuumQ
