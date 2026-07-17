import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section

-- isolate: does hpoly (nlinarith) close at the pushed endpoint?
set_option maxHeartbeats 1600000 in
theorem hpoly_test (y : Cut) (hy0 : 0 ≤ y) (hy2 : y ^ 2 < 61685024 / 100000000) :
    (70710679 / 100000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
  nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
    sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
    pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]

end
end ContinuumQ
end Phys.Foundation
