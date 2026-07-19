import Phys.Algebra.D7NarrowingRung3

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! W9 COST PROBE: the 1e14-grid UPPER sign via DDA NEGATIVITY. v = cutCos(ceil14/4e14) ≈ 0.3927. -/

set_option maxHeartbeats 8000000 in
/-- v upper bound at split@7 near π/8: `v ≤ 9238795325112867/1e16 (≤ cos π/8)`. -/
theorem v_le_R_14 :
    cutCos (15707963267949 / 40000000000000 : Cut) ≤ 9238795325112867 / 10000000000000000 := by
  have hx0 : (0 : Cut) ≤ 15707963267949 / 40000000000000 := by norm_num
  have hxN : (15707963267949 / 40000000000000 : Cut) ^ 2 < (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707963267949 / 40000000000000) hx0 7 hxN).2
  rw [partialCos_seven] at hb
  have hrem : cosRemBound (15707963267949 / 40000000000000 : Cut) 7 ≤ 24 / 1000000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707963267949 / 40000000000000) ^ 2 / 2 + (15707963267949 / 40000000000000) ^ 4 / 24
      - (15707963267949 / 40000000000000) ^ 6 / 720 + (15707963267949 / 40000000000000) ^ 8 / 40320
      - (15707963267949 / 40000000000000) ^ 10 / 3628800 + (15707963267949 / 40000000000000) ^ 12 / 479001600
      + 24 / 1000000000000000000 ≤ 9238795325112867 / 10000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 8000000 in
/-- v coarse lower bound: `9/10 ≤ v` (split@6, huge margin). -/
theorem v_ge_9_10_14 :
    (9 / 10 : Cut) ≤ cutCos (15707963267949 / 40000000000000 : Cut) := by
  have hx0 : (0 : Cut) ≤ 15707963267949 / 40000000000000 := by norm_num
  have hxN : (15707963267949 / 40000000000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707963267949 / 40000000000000) hx0 6 hxN).1
  rw [partialCos_six] at hb
  have hrem : cosRemBound (15707963267949 / 40000000000000 : Cut) 6 ≤ 29 / 1000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (9 / 10 : Cut)
      ≤ 1 - (15707963267949 / 40000000000000 : Cut) ^ 2 / 2 + (15707963267949 / 40000000000000) ^ 4 / 24
        - (15707963267949 / 40000000000000) ^ 6 / 720 + (15707963267949 / 40000000000000) ^ 8 / 40320
        - (15707963267949 / 40000000000000) ^ 10 / 3628800 - 29 / 1000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 4000000 in
/-- THE 1e14-GRID UPPER SIGN via DDA negativity: `cutCos (15707963267949/1e13) < 0`. -/
theorem cutCos_15707963267949_neg :
    cutCos (15707963267949 / 10000000000000 : Cut) < 0 := by
  have hd1 := cutCos_double (15707963267949 / 40000000000000 : Cut)
  have hd2 := cutCos_double (15707963267949 / 20000000000000 : Cut)
  have e1 : (2 : Cut) * (15707963267949 / 40000000000000) = 15707963267949 / 20000000000000 := by norm_num
  have e2 : (2 : Cut) * (15707963267949 / 20000000000000) = 15707963267949 / 10000000000000 := by norm_num
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set v := cutCos (15707963267949 / 40000000000000) with hv
  have hvR := v_le_R_14
  have hvLo := v_ge_9_10_14
  rw [← hv] at hvR hvLo
  have hu_pos : (0 : Cut) < 2 * v * v - 1 := by nlinarith [hvLo]
  have hu_le : 2 * v * v - 1 ≤ 35355339059327365848906288959689 / 50000000000000000000000000000000 := by
    nlinarith [hvR, hvLo]
  nlinarith [hu_pos, hu_le]

end

end ContinuumQ
end Phys.Foundation
