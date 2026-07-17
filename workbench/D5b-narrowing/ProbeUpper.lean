import Phys.Algebra.NarrowedBracket2

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- ===== PROBE 1: split@4 UPPER sign at z_hi = 15709/10000 =====
-- partialCos(15709/10000,4) = -719039100237722316297241/720000000000000000000000000
theorem probe_cos_15709_neg : cutCos (15709 / 10000 : Cut) < 0 := by
  have hb := (cutCos_bracket (15709 / 10000) (by norm_num) 4 (by norm_num)).2
  rw [partialCos_four] at hb
  have hpart : (1 : Cut) - (15709/10000)^2/2 + (15709/10000)^4/24 - (15709/10000)^6/720
      = -719039100237722316297241/720000000000000000000000000 := by norm_num
  rw [hpart] at hb
  have hrem : cosRemBound (15709 / 10000 : Cut) 4
      < 719039100237722316297241/720000000000000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

-- ===== PROBE 2: split@4 LOWER positivity at z_lo = 15679/10000 (margin +0.0002) =====
theorem probe_cos_pos_lt_15679 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15679 / 10000) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 245831041 / 100000000 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 4 + 1) * (2 * 4 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 4 hxN).1
  rw [partialCos_four] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 4 + 1) * (2 * 4 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 4 + 1) * (2 * 4 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 4 ≤ x ^ 8 / 20160 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 4) / ((2 * 4).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 4) / ((2 * 4).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 4 + 1) * (2 * 4 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 4) / ((2 * 4).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 4) / ((2 * 4).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 4 + 1) * (2 * 4 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 4) / ((2 * 4).factorial : Cut) * 2 := hstep
      _ = x ^ 8 / 20160 := by norm_num [Nat.factorial]; ring
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 - x ^ 8 / 20160 := by
    nlinarith [hx2, sq_nonneg (x ^ 2), pow_nonneg (sq_nonneg x) 2, hx0, sq_nonneg x,
      pow_nonneg hx0 4, pow_nonneg hx0 6]
  linarith [hb, hrembd, hpos]

end
end ContinuumQ
end Phys.Foundation
