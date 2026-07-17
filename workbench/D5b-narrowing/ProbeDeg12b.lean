import Phys.Algebra.NarrowedBracket3
namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section
-- test deg-12 positivity at x^2 < 2.467395 (z_lo=15707945, margin ~2.3e-7 -- the tight one)
theorem probe_deg12_tight (x : Cut) (hx0 : 0 ≤ x) (hx2 : x ^ 2 < 2467395 / 1000000) :
    0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320 - x ^ 10 / 3628800
      - x ^ 12 / 239500800 := by
  nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
    sq_nonneg (x ^ 5), sq_nonneg (x ^ 6), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8,
    pow_nonneg hx0 10, pow_nonneg hx0 12, mul_nonneg hx0 (pow_nonneg hx0 3),
    mul_nonneg hx0 (pow_nonneg hx0 5)]
end
end ContinuumQ
end Phys.Foundation
