import Phys.Algebra.NarrowedBracket3
namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section
-- Just the deg-10 tight-factor positivity, various margins. x^2 < B.
theorem probe_p1 (x : Cut) (hx0 : 0 ≤ x) (hx2 : x ^ 2 < 2467380 / 1000000) :
    0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - 103 / 100 * (x ^ 10 / 3628800) := by
  nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
    sq_nonneg (x ^ 5), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8, pow_nonneg hx0 10,
    mul_nonneg hx0 (pow_nonneg hx0 3)]
end
end ContinuumQ
end Phys.Foundation
