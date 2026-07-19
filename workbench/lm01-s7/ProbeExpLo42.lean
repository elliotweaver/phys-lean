import Phys.Algebra.NarrowedBracket11

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra
noncomputable section

-- PROBE the two N=42 exp-cert obligations in isolation to measure cost.
-- Lower: partialExp a 42 + expRemBound a 42 <= c  with a=815406111272599/1e14, c=347747283710459/1e11
set_option maxHeartbeats 4000000 in
theorem cutlog_lo_cert_PROBE :
    partialExp (815406111272599 / 100000000000000 : Cut) 42
      + expRemBound (815406111272599 / 100000000000000 : Cut) 42
      ≤ (347747283710459 : Cut) / 100000000000 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
end ContinuumQ
end Phys.Foundation
