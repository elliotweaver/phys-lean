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

-- Isolated: JUST the degree-12 positivity, with MORE margin (z_lo=15707900, x^2<2.46734)
theorem probe_deg12_pos (x : Cut) (hx0 : 0 ≤ x) (hx2 : x ^ 2 < 246734 / 100000) :
    0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320 - x ^ 10 / 3628800
      - x ^ 12 / 239500800 := by
  nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
    sq_nonneg (x ^ 5), sq_nonneg (x ^ 6), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8,
    pow_nonneg hx0 10, pow_nonneg hx0 12, mul_nonneg hx0 (pow_nonneg hx0 3),
    mul_nonneg hx0 (pow_nonneg hx0 5)]

end
end ContinuumQ
end Phys.Foundation
