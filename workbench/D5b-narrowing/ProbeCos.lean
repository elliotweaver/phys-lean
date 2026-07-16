import Phys.Algebra.InvCutPiBracket

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- partialCos 4 = 1 - x^2/2 + x^4/24 - x^6/720
theorem partialCos_four (x : Cut) : partialCos x 4 = 1 - x^2/2 + x^4/24 - x^6/720 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

-- UPPER: cutCos(8/5) < 0 at split@4.
theorem probe_cos_85_neg : cutCos (8 / 5 : Cut) < 0 := by
  have hb := (cutCos_bracket (8 / 5) (by norm_num) 4 (by norm_num)).2
  rw [partialCos_four] at hb
  have hpart : (1 : Cut) - (8/5)^2/2 + (8/5)^4/24 - (8/5)^6/720 = -340144/11250000 := by norm_num
  rw [hpart] at hb
  have hrem : cosRemBound (8 / 5 : Cut) 4 < 340144/11250000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

-- LOWER: 0 < cutCos x on [0, 3/2) at split@3.
theorem probe_cos_pos_lt_32 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 3 / 2) : 0 < cutCos x := by
  have hx2 : x ^ 2 < 9 / 4 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 3 hxN).1
  rw [partialCos_three] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 3 ≤ x ^ 6 / 360 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 3) / ((2 * 3).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 3) / ((2 * 3).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 := hstep
      _ = x ^ 6 / 360 := by norm_num [Nat.factorial]; ring
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 360 := by
    nlinarith [hx2, sq_nonneg (x ^ 2), pow_nonneg (sq_nonneg x) 2, hx0, sq_nonneg x]
  linarith [hb, hrembd, hpos]

end
end ContinuumQ
end Phys.Foundation
