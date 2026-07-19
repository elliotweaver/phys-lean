import Phys.Algebra.D7NarrowingRung3

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! W9 COST PROBE: the split@7 near-π/8 POSITIVITY at the 1e14 grid (`cutCos_gt_pi8_14`).
    One polynomial degree deeper than ext7's split@6. THE HEAVIEST obligation — measure it. -/

set_option maxHeartbeats 8000000 in
/-- split@7 near-π/8 POSITIVITY (remainder factor `≤ 101/100`): `923879532511287/1e15 < cutCos y` for
    `0 ≤ y < 157079632679489/4e14` (`≈ π/8`, well-conditioned). -/
theorem cutCos_gt_pi8_14 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 157079632679489 / 400000000000000) :
    (923879532511287 / 1000000000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 24674011002723188597801301121 / 160000000000000000000000000000 := by
    have h1 : y * y < (157079632679489 / 400000000000000) * (157079632679489 / 400000000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (157079632679489 / 400000000000000 : Cut) * (157079632679489 / 400000000000000)
        = 24674011002723188597801301121 / 160000000000000000000000000000 := by norm_num
    linarith [h1, h2.le]
  have hxN : y ^ 2 < (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hy2]
  have hb := (cutCos_bracket y hy0 7 hxN).1
  rw [partialCos_seven] at hb
  have hden : (0 : Cut) < 1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hy2]
  have hinv : (1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut))⁻¹ ≤ 101 / 100 := by
    rw [inv_le_comm₀ hden (by norm_num)]; push_cast; nlinarith [hy2]
  have hcoef : (0 : Cut) ≤ y ^ (2 * 7) / ((2 * 7).factorial : Cut) := by positivity
  have hrembd : cosRemBound y 7 ≤ 101 / 100 * (y ^ 14 / 87178291200) := by
    unfold cosRemBound
    have hstep := mul_le_mul_of_nonneg_left hinv hcoef
    calc y ^ (2 * 7) / ((2 * 7).factorial : Cut)
            * (1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut))⁻¹
          ≤ y ^ (2 * 7) / ((2 * 7).factorial : Cut) * (101 / 100) := hstep
      _ = 101 / 100 * (y ^ 14 / 87178291200) := by norm_num [Nat.factorial]; ring
  have hB : (0 : Cut) ≤ 24674011002723188597801301121 / 160000000000000000000000000000 - y ^ 2 := by
    linarith [hy2]
  have hy2n : (0 : Cut) ≤ y ^ 2 := sq_nonneg y
  have hy4n : (0 : Cut) ≤ y ^ 4 := by positivity
  have hy6n : (0 : Cut) ≤ y ^ 6 := by positivity
  have hy8n : (0 : Cut) ≤ y ^ 8 := by positivity
  have hy10n : (0 : Cut) ≤ y ^ 10 := by positivity
  have hy12n : (0 : Cut) ≤ y ^ 12 := by positivity
  have hpoly : (923879532511287 / 1000000000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        + y ^ 12 / 479001600 - 101 / 100 * (y ^ 14 / 87178291200) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n, hy12n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hy12n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

end

end ContinuumQ
end Phys.Foundation
