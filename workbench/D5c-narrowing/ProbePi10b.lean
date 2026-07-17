import Phys.Algebra.NarrowedBracket9

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra
noncomputable section

set_option maxHeartbeats 8000000 in
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
  have hB : (0 : Cut) ≤ 246740109997421313289 / 1600000000000000000000 - y ^ 2 := by linarith [hy2]
  have hy2n : (0:Cut) ≤ y^2 := sq_nonneg y
  have hy4n : (0:Cut) ≤ y^4 := by positivity
  have hy6n : (0:Cut) ≤ y^6 := by positivity
  have hy8n : (0:Cut) ≤ y^8 := by positivity
  have hy10n : (0:Cut) ≤ y^10 := by positivity
  have hpoly : (184775906503 / 200000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

-- double-double-angle positivity for x < 15707963267/1e10
theorem pcutCos_pos_15707963267 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707963267 / 10000000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 15707963267 / 40000000000 := by linarith
  have hcy := pcutCos_gt_pi8_10 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (184775906503 / 200000000000 : Cut) * (184775906503 / 200000000000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  -- 2C^2-1 = 14142135624005397689009/20000000000000000000000
  have hu : (14142135624005397689009 / 20000000000000000000000 : Cut) < 2 * c * c - 1 := by nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (14142135624005397689009 / 20000000000000000000000 : Cut)
        * (14142135624005397689009 / 20000000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

-- split@8 upper sign at 15707963268/1e10 (cos ~ -5.1e-12; split@8 rem ~ 6.6e-11 < |cos|? NO -
-- partialCos_eight + remBound gives -4.04e-12 < 0, closes)
set_option maxHeartbeats 4000000 in
theorem pcutCos_15707963268_neg : cutCos (15707963268 / 10000000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 15707963268 / 10000000000 := by norm_num
  have hxN : (15707963268 / 10000000000 : Cut) ^ 2 < (((2 * 8 + 1) * (2 * 8 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707963268 / 10000000000) hx0 8 hxN).2
  rw [partialCos_eight] at hb
  have hrem : cosRemBound (15707963268 / 10000000000 : Cut) 8 ≤ 662 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707963268 / 10000000000) ^ 2 / 2 + (15707963268 / 10000000000) ^ 4 / 24
      - (15707963268 / 10000000000) ^ 6 / 720 + (15707963268 / 10000000000) ^ 8 / 40320
      - (15707963268 / 10000000000) ^ 10 / 3628800 + (15707963268 / 10000000000) ^ 12 / 479001600
      - (15707963268 / 10000000000) ^ 14 / 87178291200 ≤ -702 / 10000000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
