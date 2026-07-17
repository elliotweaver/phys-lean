import Phys.Algebra.NarrowedBracket9

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra
noncomputable section

-- PROBE B: exact tight bound y^2 < ymax^2 (no rounding slack). ymax=15707963267/4e10,
-- ymax^2 = 246740109997421313289/1.6e21 (exact). Full 5.3e-12 margin. split@6.
set_option maxHeartbeats 4000000 in
theorem pcutCos_gt_pi8_10 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 15707963267 / 40000000000) :
    (184775906503 / 200000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 246740109997421313289 / 1600000000000000000000 := by
    have h1 : y * y < (15707963267 / 40000000000) * (15707963267 / 40000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (15707963267 / 40000000000 : Cut) * (15707963267 / 40000000000)
        = 246740109997421313289 / 1600000000000000000000 := by norm_num
    linarith [h1, h2.le]
  have hxN : y ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hy2]
  have hb := (cutCos_bracket y hy0 6 hxN).1
  rw [partialCos_six] at hb
  have hden : (0 : Cut) < 1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hy2]
  have hinv : (1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹ ≤ 101 / 100 := by
    rw [inv_le_comm₀ hden (by norm_num)]; push_cast; nlinarith [hy2]
  have hcoef : (0 : Cut) ≤ y ^ (2 * 6) / ((2 * 6).factorial : Cut) := by positivity
  have hrembd : cosRemBound y 6 ≤ 101 / 100 * (y ^ 12 / 479001600) := by
    unfold cosRemBound
    have hstep := mul_le_mul_of_nonneg_left hinv hcoef
    calc y ^ (2 * 6) / ((2 * 6).factorial : Cut)
            * (1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹
          ≤ y ^ (2 * 6) / ((2 * 6).factorial : Cut) * (101 / 100) := hstep
      _ = 101 / 100 * (y ^ 12 / 479001600) := by norm_num [Nat.factorial]; ring
  have hpoly : (184775906503 / 200000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

end
end ContinuumQ
end Phys.Foundation
