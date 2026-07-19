import Phys.Algebra.NarrowedBracket12

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! PROBE UPPER: the 1e12-grid upper sign via DDA NEGATIVITY. v = cutCos(314159265359/8e11) ≈ 0.3927. -/

set_option maxHeartbeats 8000000 in
/-- v upper bound at split@7 near π/8: `v ≤ 923879532511277/1e15 (≤ cos π/8)`. -/
theorem v_le_R_12 :
    cutCos (314159265359 / 800000000000 : Cut) ≤ 923879532511277 / 1000000000000000 := by
  have hx0 : (0 : Cut) ≤ 314159265359 / 800000000000 := by norm_num
  have hxN : (314159265359 / 800000000000 : Cut) ^ 2 < (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (314159265359 / 800000000000) hx0 7 hxN).2
  rw [partialCos_seven] at hb
  have hrem : cosRemBound (314159265359 / 800000000000 : Cut) 7 ≤ 3 / 100000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (314159265359 / 800000000000) ^ 2 / 2 + (314159265359 / 800000000000) ^ 4 / 24
      - (314159265359 / 800000000000) ^ 6 / 720 + (314159265359 / 800000000000) ^ 8 / 40320
      - (314159265359 / 800000000000) ^ 10 / 3628800 + (314159265359 / 800000000000) ^ 12 / 479001600
      + 3 / 100000000000000000 ≤ 923879532511277 / 1000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 8000000 in
/-- v coarse lower bound: `9/10 ≤ v` (split@6, huge margin). -/
theorem v_ge_9_10_12 :
    (9 / 10 : Cut) ≤ cutCos (314159265359 / 800000000000 : Cut) := by
  have hx0 : (0 : Cut) ≤ 314159265359 / 800000000000 := by norm_num
  have hxN : (314159265359 / 800000000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (314159265359 / 800000000000) hx0 6 hxN).1
  rw [partialCos_six] at hb
  have hrem : cosRemBound (314159265359 / 800000000000 : Cut) 6 ≤ 3 / 100000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (9 / 10 : Cut)
      ≤ 1 - (314159265359 / 800000000000 : Cut) ^ 2 / 2 + (314159265359 / 800000000000) ^ 4 / 24
        - (314159265359 / 800000000000) ^ 6 / 720 + (314159265359 / 800000000000) ^ 8 / 40320
        - (314159265359 / 800000000000) ^ 10 / 3628800 - 3 / 100000000000000 := by norm_num
  linarith

set_option maxHeartbeats 4000000 in
/-- THE 1e12-GRID UPPER SIGN via DDA negativity: `cutCos (1570796326795/1e12) < 0`. -/
theorem cutCos_1570796326795_neg :
    cutCos (1570796326795 / 1000000000000 : Cut) < 0 := by
  have hd1 := cutCos_double (314159265359 / 800000000000 : Cut)
  have hd2 := cutCos_double (314159265359 / 400000000000 : Cut)
  have e1 : (2 : Cut) * (314159265359 / 800000000000) = 314159265359 / 400000000000 := by norm_num
  have e2 : (2 : Cut) * (314159265359 / 400000000000) = 1570796326795 / 1000000000000 := by norm_num
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set v := cutCos (314159265359 / 800000000000) with hv
  have hvR := v_le_R_12
  have hvLo := v_ge_9_10_12
  rw [← hv] at hvR hvLo
  have hu_pos : (0 : Cut) < 2 * v * v - 1 := by nlinarith [hvLo]
  have hu_le : 2 * v * v - 1 ≤ 353553390593255735226132170729 / 500000000000000000000000000000 := by
    nlinarith [hvR, hvLo]
  nlinarith [hu_pos, hu_le]

theorem leastCosZero_le_1570796326795 : leastCosZero ≤ 1570796326795 / 1000000000000 := by
  have h02 : (0 : Cut) ≤ 1570796326795 / 1000000000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (1570796326795 / 1000000000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (1570796326795 / 1000000000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_1570796326795_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

end

end ContinuumQ
end Phys.Foundation
