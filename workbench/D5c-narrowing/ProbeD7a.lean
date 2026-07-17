import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section

-- (1) split@5 partial cosine at cycle phase 2/9 (factorial 10 norm_num cost)
theorem partialCos_two_ninths_five_PROBE :
    partialCos (2 / 9 : Cut) 5 = 13226284829 / 13559717115 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

-- (2) the new near-π/4 lower bound: cutCos y > 70710679/1e8 for 0≤y<78539814/1e8
set_option maxHeartbeats 1200000 in
theorem cutCos_gt_invSqrt2_ext2_PROBE (y : Cut) (hy0 : 0 ≤ y) (hy : y < 78539814 / 100000000) :
    (70710679 / 100000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 61685024 / 100000000 := by
    have h1 : y * y < (78539814 / 100000000) * (78539814 / 100000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (78539814 / 100000000 : Cut) * (78539814 / 100000000) ≤ 61685024 / 100000000 := by norm_num
    linarith [h1, h2]
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
  have hpoly : (70710679 / 100000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

-- (3) double-angle positivity to x<157079628/1e8
theorem cutCos_pos_of_lt_157079628_PROBE (x : Cut) (hx0 : 0 ≤ x) (hx : x < 157079628 / 100000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 78539814 / 100000000 := by linarith
  have hcy := cutCos_gt_invSqrt2_ext2_PROBE (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

end
end ContinuumQ
end Phys.Foundation
