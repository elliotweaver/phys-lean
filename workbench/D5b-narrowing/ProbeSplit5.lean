import Phys.Algebra.NarrowedBracket2

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- partialCos x 5 = 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320
theorem partialCos_five (x : Cut) :
    partialCos x 5 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

-- ===== PROBE: split@5 LOWER positivity at z_lo = 15707/10000 (margin +7e-5) =====
-- The crux is the degree-10 positivity poly (the seed-flagged W9 risk).
-- z_lo^2 = 246709849/100000000. Need x^2 < that.
theorem probe_cos_pos_lt_15707 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707 / 10000) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 246709849 / 100000000 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 5 hxN).1
  rw [partialCos_five] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 5 ≤ x ^ 10 / 1814400 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 5) / ((2 * 5).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 5) / ((2 * 5).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) * 2 := hstep
      _ = x ^ 10 / 1814400 := by norm_num [Nat.factorial]; ring
  -- The degree-10 positivity. Attempt 1: nlinarith with square hints.
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320 - x ^ 10 / 1814400 := by
    nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
      sq_nonneg (x ^ 5), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8, pow_nonneg hx0 10,
      mul_nonneg hx0 (pow_nonneg hx0 3)]
  linarith [hb, hrembd, hpos]

end
end ContinuumQ
end Phys.Foundation
