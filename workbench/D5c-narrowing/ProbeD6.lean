import Phys.Algebra.NarrowedBracket5

/-! MEASURE all D5-next-6 obligations in one bounded probe (W9). -/

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket4
noncomputable section

-- (1a) tighter m01 lower: 34774707/10000 <= mass0/mass1  (thin margin 1.18e-7)
theorem probe_m01_lo6 : (34774707 / 10000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_sharp, mass0_lo_sharp]

-- (1b) tighter m01 upper: mass0/mass1 <= 34774761/10000  (thin margin 1.12e-7)
theorem probe_m01_hi6 : mass0 / mass1 ≤ (34774761 / 10000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_sharp, mass0_hi_sharp]

-- (2a) cutLog LOWER at N=24: 81540604/1e7 <= cutLog(m01)
set_option maxHeartbeats 800000 in
theorem probe_cutLog_lo6 : (81540604 / 10000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((34774707 : Cut) / 10000) ≤ cutLog (mass0 / mass1) :=
    Phys.Algebra.AssembledBracket.cutLog_mono (by norm_num) probe_m01_lo6
  have hge : (81540604 / 10000000 : Cut) ≤ cutLog ((34774707 : Cut) / 10000) := by
    apply cutLog_ge_certified ((34774707 : Cut) / 10000) (81540604 / 10000000) 24 (by norm_num) (by norm_num)
    show partialExp (81540604 / 10000000) 24 + expRemBound (81540604 / 10000000) 24 ≤ (34774707 : Cut) / 10000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

-- (2b) cutLog UPPER at N=27: cutLog(m01) <= 81540623/1e7
set_option maxHeartbeats 800000 in
theorem probe_cutLog_hi6 : cutLog (mass0 / mass1) ≤ (81540623 / 10000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 34774707 / 10000) probe_m01_lo6
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((34774761 : Cut) / 10000) :=
    Phys.Algebra.AssembledBracket.cutLog_mono hpos probe_m01_hi6
  have hbnd : cutLog ((34774761 : Cut) / 10000) ≤ (81540623 / 10000000 : Cut) := by
    apply cutLog_le_certified ((34774761 : Cut) / 10000) (81540623 / 10000000) 27 (by norm_num) (by norm_num)
    show (34774761 : Cut) / 10000 ≤ partialExp (81540623 / 10000000) 27
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

-- (3) EXTENDED gt_invSqrt2 for y < 7853981/1e7 (thin poly margin near pi/4)
set_option maxHeartbeats 1200000 in
theorem probe_cutCos_gt_invSqrt2_ext (y : Cut) (hy0 : 0 ≤ y) (hy : y < 7853981 / 10000000) :
    (7071068 / 10000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 6168502 / 10000000 := by
    have h1 : y * y < (7853981 / 10000000) * (7853981 / 10000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (7853981 / 10000000 : Cut) * (7853981 / 10000000) ≤ 6168502 / 10000000 := by norm_num
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

-- (4) double-angle lower positivity: 0 < cutCos x for x < 157079620/1e8
theorem probe_cutCos_pos_ext (x : Cut) (hx0 : 0 ≤ x) (hx : x < 157079620 / 100000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 7853981 / 10000000 := by linarith
  have hcy := probe_cutCos_gt_invSqrt2_ext (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

-- (5) sharper upper sign: cutCos(157079635/1e8) < 0
theorem probe_cutCos_neg6 : cutCos (157079635 / 100000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 157079635 / 100000000 := by norm_num
  have hxN : (157079635 / 100000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (157079635 / 100000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (157079635 / 100000000 : Cut) 6 ≤ 478 / 1000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (157079635 / 100000000) ^ 2 / 2 + (157079635 / 100000000) ^ 4 / 24
      - (157079635 / 100000000) ^ 6 / 720 + (157079635 / 100000000) ^ 8 / 40320
      - (157079635 / 100000000) ^ 10 / 3628800 ≤ -487 / 1000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
