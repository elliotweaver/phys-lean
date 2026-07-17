import Phys.Algebra.NarrowedBracket3
namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- split@5 lower with TIGHT factor f=103/100 (deg-10), z_lo=15707920/1e7, x^2 < 2467387/1000000
theorem probe_cutCos_pos_tight (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707920 / 10000000) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 2467387 / 1000000 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 5 hxN).1
  rw [partialCos_five] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  -- tighter factor bound: (1 - x^2/132)^-1 <= 103/100  (valid since x^2 < 132*3/103)
  have hinv : (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹ ≤ 103 / 100 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 5 ≤ 103 / 100 * (x ^ 10 / 3628800) := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 5) / ((2 * 5).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) * (103 / 100) :=
      mul_le_mul_of_nonneg_left hinv hcoef
    calc x ^ (2 * 5) / ((2 * 5).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 5 + 1) * (2 * 5 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 5) / ((2 * 5).factorial : Cut) * (103 / 100) := hstep
      _ = 103 / 100 * (x ^ 10 / 3628800) := by norm_num [Nat.factorial]; ring
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - 103 / 100 * (x ^ 10 / 3628800) := by
    nlinarith [hx2, hx0, sq_nonneg x, sq_nonneg (x ^ 2), sq_nonneg (x ^ 3), sq_nonneg (x ^ 4),
      sq_nonneg (x ^ 5), pow_nonneg hx0 4, pow_nonneg hx0 6, pow_nonneg hx0 8, pow_nonneg hx0 10,
      mul_nonneg hx0 (pow_nonneg hx0 3)]
  linarith [hb, hrembd, hpos]

end
end ContinuumQ
end Phys.Foundation
