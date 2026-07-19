import Phys.Algebra.NarrowedBracket12

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! PROBE: the 1e12-grid lower positivity `cutCos_gt_pi8_12`, mirroring `cutCos_gt_pi8_11`. -/

set_option maxHeartbeats 8000000 in
theorem cutCos_gt_pi8_12 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 785398163397 / 2000000000000) :
    (9238795325113 / 10000000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 616850275067380710579609 / 4000000000000000000000000 := by
    have h1 : y * y < (785398163397 / 2000000000000) * (785398163397 / 2000000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (785398163397 / 2000000000000 : Cut) * (785398163397 / 2000000000000)
        = 616850275067380710579609 / 4000000000000000000000000 := by norm_num
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
  have hB : (0 : Cut) ≤ 616850275067380710579609 / 4000000000000000000000000 - y ^ 2 := by linarith [hy2]
  have hy2n : (0 : Cut) ≤ y ^ 2 := sq_nonneg y
  have hy4n : (0 : Cut) ≤ y ^ 4 := by positivity
  have hy6n : (0 : Cut) ≤ y ^ 6 := by positivity
  have hy8n : (0 : Cut) ≤ y ^ 8 := by positivity
  have hy10n : (0 : Cut) ≤ y ^ 10 := by positivity
  have hpoly : (9238795325113 / 10000000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

theorem cutCos_pos_of_lt_1570796326794 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 1570796326794 / 1000000000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 785398163397 / 2000000000000 := by linarith
  have hcy := cutCos_gt_pi8_12 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (9238795325113 / 10000000000000 : Cut) * (9238795325113 / 10000000000000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (35355339059329823368462769 / 50000000000000000000000000 : Cut) < 2 * c * c - 1 := by
    nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (35355339059329823368462769 / 50000000000000000000000000 : Cut)
        * (35355339059329823368462769 / 50000000000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

theorem le_leastCosZero_1570796326794 : (1570796326794 / 1000000000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_1570796326794 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

end

end ContinuumQ
end Phys.Foundation
