import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section

-- LOWER push to x<157079624/1e8 via Y<78539812/1e8, keeping parent's L=7071068/1e7.
-- hpoly margin cert(Y)-L ~1.16e-8 (parent had 2.58e-8). y^2 bound: (78539812/1e8)^2 ~0.61685020...
set_option maxHeartbeats 1600000 in
theorem cutCos_gt_invSqrt2_ext2_PROBE (y : Cut) (hy0 : 0 ≤ y) (hy : y < 78539812 / 100000000) :
    (7071068 / 10000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 61685021 / 100000000 := by
    have h1 : y * y < (78539812 / 100000000) * (78539812 / 100000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (78539812 / 100000000 : Cut) * (78539812 / 100000000) ≤ 61685021 / 100000000 := by norm_num
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
  have hpoly : (7071068 / 10000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

theorem cutCos_pos_of_lt_157079624_PROBE (x : Cut) (hx0 : 0 ≤ x) (hx : x < 157079624 / 100000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 78539812 / 100000000 := by linarith
  have hcy := cutCos_gt_invSqrt2_ext2_PROBE (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

-- UPPER sign push to 157079634/1e8 (exact rational norm_num; parent used 157079635)
theorem cutCos_157079634_neg_PROBE : cutCos (157079634 / 100000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 157079634 / 100000000 := by norm_num
  have hxN : (157079634 / 100000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (157079634 / 100000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (157079634 / 100000000 : Cut) 6 ≤ 47757 / 100000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (157079634 / 100000000) ^ 2 / 2 + (157079634 / 100000000) ^ 4 / 24
      - (157079634 / 100000000) ^ 6 / 720 + (157079634 / 100000000) ^ 8 / 40320
      - (157079634 / 100000000) ^ 10 / 3628800 ≤ -4778 / 10000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
