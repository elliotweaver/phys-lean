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

-- split@6 LOWER positivity (degree-12 W9 risk) at z_lo=15707947/1e7
theorem probe_cutCos_pos_of_lt_15707947 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707947 / 10000000) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 616849 / 250000 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 6 hxN).1
  rw [probe_partialCos_six] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 6 ≤ x ^ 12 / 239500800 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 6) / ((2 * 6).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 6) / ((2 * 6).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 6) / ((2 * 6).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 6) / ((2 * 6).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 6) / ((2 * 6).factorial : Cut) * 2 := hstep
      _ = x ^ 12 / 239500800 := by norm_num [Nat.factorial]; ring
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320 - x ^ 10 / 3628800
      - x ^ 12 / 239500800 := by
    nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
      sq_nonneg (x ^ 5), sq_nonneg (x ^ 6), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8,
      pow_nonneg hx0 10, pow_nonneg hx0 12, mul_nonneg hx0 (pow_nonneg hx0 3),
      mul_nonneg hx0 (pow_nonneg hx0 5)]
  linarith [hb, hrembd, hpos]

end
end ContinuumQ
end Phys.Foundation
