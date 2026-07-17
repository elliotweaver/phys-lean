import Phys.Algebra.NarrowedBracket4

/-! MEASURE: double-angle structural route for the 1/cutPi LOWER bound.
    cutCos(2y) = 2 cutCos(y)^2 - 1  (from banked cutCos_add + Pythagorean).
    Target: cutCos(y) > L=7071073/1e7 for y < Y=7853970/1e7, with L^2 > 1/2.
    Then cutCos(2y) = 2 cutCos(y)^2 - 1 > 2 L^2 - 1 > 0 for 2y < 15707940/1e7.
    i.e. leastCosZero >= 15707940/1e7 (vs parent 15707705). Near pi/4 the partialCos
    value ~0.707 is well-conditioned (no near-cancellation). Y^2 < 6168485/1e7. -/

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

set_option maxHeartbeats 200000 in
theorem cutCos_double (y : Cut) :
    cutCos (2 * y) = 2 * cutCos y * cutCos y - 1 := by
  have hadd := cutCos_add y y
  have hpy := cutSin_sq_add_cutCos_sq y
  have h2y : (2 : Cut) * y = y + y := by ring
  rw [h2y, hadd]
  nlinarith [hpy]

set_option maxHeartbeats 400000 in
theorem probe_cos_y_gt_L (y : Cut) (hy0 : 0 ≤ y) (hy : y < 7853970 / 10000000) :
    (7071073 / 10000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 6168485 / 10000000 := by
    have h1 : y * y < (7853970 / 10000000) * (7853970 / 10000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (7853970 / 10000000 : Cut) * (7853970 / 10000000) ≤ 6168485 / 10000000 := by norm_num
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
  have hpoly : (7071073 / 10000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

-- STEP 3: assemble cutCos positive on [0, 15707940/1e7) via double-angle. MEASURE.
set_option maxHeartbeats 400000 in
theorem probe_cutCos_pos_15707940 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707940 / 10000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 7853970 / 10000000 := by linarith
  have hcy := probe_cos_y_gt_L (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

end

end ContinuumQ
end Phys.Foundation
