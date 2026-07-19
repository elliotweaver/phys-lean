/-
  # N584 — ARC-D (THE DIGITS): D7 ENDPOINT NARROWING RUNG 4 — κ = 1/cutPi lifted onto the 1e14 grid
  + the edge logs deepened one rung (grid 1e14), re-assembling the freeze-out endpoint at ≥ 15 sig digits.

  Succeeds N583 (D7NarrowingRung3): the owner FRAME AUDIT is closed and the residual endpoint precision
  is INSTRUMENT precision, so the ≥15-sig-digit narrowing CONTINUES. N583 lifted κ onto the 1e12 grid
  (ext7) and wired in the split@7 `L_m01`, landing bare ≈ 14 sig digits, dressed ≈ 13–14; after ext7,
  κ = 1/cutPi was AGAIN the dominant residual.

  ## W9 MEASURE-FIRST (workbench/d7-kappa-narrow/{measure_ext8.py,decide_grid.py,lock_final14.py})
  Ranking the endpoint residual contributions with the deeper κ shows:
  - the 1e13 grid (the ticket's ext8) lands BARE at ~15.06 but DRESSED at only ~14.89: the dressed
    endpoint is κ-FLOORED because its inner combination (≈ 22.4) is ~50% larger than the bare's
    (≈ 14.94), so the κ-width contribution alone floors the dressed short of 15 on the 1e13 grid;
  - the 1e14 grid lands BOTH endpoints ≥ 15 (bare ~15.5, dressed ~15.3) in ONE node, AND the edge logs
    (co-dominant after the deeper κ) deepened one rung to the 1e14 grid.
  Following the theory (≥15 on the REAL >137 prediction, the dressed endpoint) over the arc's stated
  grid, this node targets the 1e14 grid — the SAME double-double-angle lever, one more grid deep.

  This node reads the SAME banked derived objects deeper — NO fit, NO new axiom:

    recomposedEndpoint         = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2)
    recomposedEndpointDressed  = 2425/18 + κ·(3·L_m01 + (7/2)·L_mb + (11/2)·L_b0 − (5/2)·L_b2)

  ## (A) κ = 1/cutPi 1e14 — LIFT `leastCosZero` onto the 1e14 grid (SAME double-double-angle lever)
  - LOWER (positivity): `cutCos_gt_pi8_14` reads `cutCos` near π/8 at split@7 (remainder factor 101/100,
    one polynomial term deeper than ext7's split@6), then TWO applications of the fold's own
    `cutCos_double` fold near-π/2 positivity to the well-conditioned near-π/8 argument, giving
    `cutCos_pos_of_lt_157079632679489` ⇒ `le_leastCosZero_157079632679489`:
    `157079632679489/1e14 ≤ leastCosZero`.
  - UPPER (negativity via DDA — the trunk-native mirror): `v = cutCos(15707963267949/4e13) ∈ [9/10, R]`,
    `R = 9238795325112867/1e16 ≤ cos(π/8)`; `closure(R) = 2(2R²−1)²−1 < 0` ⇒
    `cutCos(15707963267949/1e13) < 0` ⇒ `leastCosZero ≤ 15707963267949/1e13` via IVT
    (`intermediate_value_Icc'`).
  Together `cutPi = 2·leastCosZero ∈ [157079632679489/5e13, 15707963267949/5e12]`, hence
  `1/cutPi ∈ [5000000000000/15707963267949, 50000000000000/157079632679489]` (width ≈ 2.03×10⁻¹⁵,
  ≈ 100× narrower than ext7, nested strictly inside), and `κ = kappaLeading = (1/cutPi)/3`.

  ## (B) split@7 `L_m01` — reuse N583's `cutLog_lo_s7`/`cutLog_hi_s7` (width `4×10⁻¹⁴`) VERBATIM.

  ## (C) edge logs deepened one rung to the 1e14 grid — read the SAME banked amplitude/closed-form
  brackets through the exp instrument one index deeper:
  - `L_b0 = cutLog mass0 ∈ [173372879495463/1e14, 173372879495464/1e14]` (width `10⁻¹⁴`), from the
    banked s7 Born-square `mass0 = b0²` (`b0 ∈ [2379438171633255409/1e18, …413/1e18]`) at exp indices 20/21;
  - `L_b2 = cutLog mass2 ∈ [−108872372522363/1e14, −108872372522362/1e14]` (width `10⁻¹⁴`), from the
    banked s7 products `wB·pB`, `wB·rB` → `b2 = 1 − (wB·pB − wB·rB)/2` → `mass2 = b2²`, reciprocal, at
    exp indices 16/17;
  - `L_mb = cutLog mbRatioDerived ∈ [−408930664000672/1e14, −408930664000670/1e14]` (width `2×10⁻¹⁴`),
    from the CLOSED FORM `(1−q)²/(3(1+q))` with `q² = 1/2` deepened to `q ∈ [q₀/1e18, (q₀+1)/1e18]`,
    reciprocal, at exp indices 26/29.

  ## LANDING (verified exact arithmetic — the abstract cores keep transcendentals OUT)
  - BARE `recomposedEndpoint ∈ [13630718814055173/1e14, 13630718814055178/1e14]`
    (`136.30718814055173 … 136.30718814055178`, width `5×10⁻¹⁴`, ≈ 15.4 sig digits), nested STRICTLY
    inside the banked N583 `[136.3071881405515, 136.3071881405528]`, `< 137`.
  - DRESSED `recomposedEndpointDressed ∈ [13709967109971648/1e14, 13709967109971655/1e14]`
    (`137.09967109971648 … 137.09967109971655`, width `7×10⁻¹⁴`, ≈ 15.3 sig digits), nested STRICTLY
    inside the banked N583 `[137.0996710997162, 137.0996710997180]`, `> 137`.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`, no error bar). ≥ 15 sig digits on BOTH endpoints — the campaign target. The dominant
  residual is now κ = 1/cutPi at the 1e14 grid (its width still dominates the assembly); pushing further
  is a mechanical grid deepening of the SAME banked route, but ≥15 on the real prediction is reached.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index (the split index `7` / the π/2 grid `1e14` / the exp partial-sum indices), NEVER by where
  any measured value sits. No empirical number appears in any statement or proof; the measured
  `1/α(0) ≈ 137.036` and `π` are REMOVABLE ORIENTATION PROSE ONLY. Words-removable: every theorem below
  is a statement about certified rational brackets of a derived closed real of `Cut`.

  Imports: `D7NarrowingRung3` (the ext7 instrument + `cutCos_gt_pi8_12`/`cutCos_double`/`cutCos_bracket`/
  `partialCos_six`/`partialCos_seven`/`leastCosZero`/`cutPi` + the split@7 `L_m01` + the s7 amplitude
  brackets `b0_lo_s7`/`b0_hi_s7`/`wp_*_s7`/`wr_*_s7` + `endpoint_core_r3` pattern + the banked normal
  forms transitively), `Mathlib.Tactic`. DERIVED `ℝ` `Cut` only; NO Mathlib ℝ/ℂ as content, NO
  `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO floats in production.
  Foundations-only.
-/
import Phys.Algebra.D7NarrowingRung3
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE 1e14-GRID `leastCosZero` INSTRUMENT — the SAME double-double-angle lever as ext7,
    re-aimed one grid deeper (split@7 lower positivity). LOWER via near-π/8 positivity folded twice;
    UPPER via DDA negativity. -/

set_option maxHeartbeats 8000000 in
/-- THE split@7 near-π/8 POSITIVITY (remainder factor `≤ 101/100`): `923879532511287/1e15 < cutCos y`
    for `0 ≤ y < 157079632679489/4e14` (`≈ π/8`, well-conditioned). Mirrors the ext7 `cutCos_gt_pi8_12`
    one polynomial term deeper, re-aimed at the `1e14`-grid quarter-argument. -/
theorem cutCos_gt_pi8_14 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 157079632679489 / 400000000000000) :
    (923879532511287 / 1000000000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 24674011002723188597801301121 / 160000000000000000000000000000 := by
    have h1 : y * y < (157079632679489 / 400000000000000) * (157079632679489 / 400000000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (157079632679489 / 400000000000000 : Cut) * (157079632679489 / 400000000000000)
        = 24674011002723188597801301121 / 160000000000000000000000000000 := by norm_num
    linarith [h1, h2.le]
  have hxN : y ^ 2 < (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hy2]
  have hb := (cutCos_bracket y hy0 7 hxN).1
  rw [partialCos_seven] at hb
  have hden : (0 : Cut) < 1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hy2]
  have hinv : (1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut))⁻¹ ≤ 101 / 100 := by
    rw [inv_le_comm₀ hden (by norm_num)]; push_cast; nlinarith [hy2]
  have hcoef : (0 : Cut) ≤ y ^ (2 * 7) / ((2 * 7).factorial : Cut) := by positivity
  have hrembd : cosRemBound y 7 ≤ 101 / 100 * (y ^ 14 / 87178291200) := by
    unfold cosRemBound
    have hstep := mul_le_mul_of_nonneg_left hinv hcoef
    calc y ^ (2 * 7) / ((2 * 7).factorial : Cut)
            * (1 - y ^ 2 / (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut))⁻¹
          ≤ y ^ (2 * 7) / ((2 * 7).factorial : Cut) * (101 / 100) := hstep
      _ = 101 / 100 * (y ^ 14 / 87178291200) := by norm_num [Nat.factorial]; ring
  have hB : (0 : Cut) ≤ 24674011002723188597801301121 / 160000000000000000000000000000 - y ^ 2 := by
    linarith [hy2]
  have hy2n : (0 : Cut) ≤ y ^ 2 := sq_nonneg y
  have hy4n : (0 : Cut) ≤ y ^ 4 := by positivity
  have hy6n : (0 : Cut) ≤ y ^ 6 := by positivity
  have hy8n : (0 : Cut) ≤ y ^ 8 := by positivity
  have hy10n : (0 : Cut) ≤ y ^ 10 := by positivity
  have hy12n : (0 : Cut) ≤ y ^ 12 := by positivity
  have hpoly : (923879532511287 / 1000000000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        + y ^ 12 / 479001600 - 101 / 100 * (y ^ 14 / 87178291200) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n, hy12n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hy12n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

/-- THE 1e14-GRID LOWER POSITIVITY: `0 < cutCos x` for `0 ≤ x < 157079632679489/1e14`, via TWO
    applications of the fold's own `cutCos_double` (folding near-π/2 positivity to the well-conditioned
    near-π/8 read `cutCos_gt_pi8_14`). Sets `y = x/4`. -/
theorem cutCos_pos_of_lt_157079632679489 (x : Cut) (hx0 : 0 ≤ x)
    (hx : x < 157079632679489 / 100000000000000) : 0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 157079632679489 / 400000000000000 := by linarith
  have hcy := cutCos_gt_pi8_14 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (923879532511287 / 1000000000000000 : Cut) * (923879532511287 / 1000000000000000)
      < c * c := mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (35355339059327365848906288959689 / 50000000000000000000000000000000 : Cut)
      < 2 * c * c - 1 := by nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (35355339059327365848906288959689 / 50000000000000000000000000000000 : Cut)
        * (35355339059327365848906288959689 / 50000000000000000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

/-- THE 1e14-GRID LOWER BOUND: `157079632679489/1e14 ≤ leastCosZero` (the integer floor of `π/2·1e14`).
    The cosine is strictly positive below this argument, so no cosine zero sits below it. -/
theorem le_leastCosZero_157079632679489 :
    (157079632679489 / 100000000000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_157079632679489 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

set_option maxHeartbeats 8000000 in
/-- `v = cutCos(15707963267949/4e13)` UPPER bound at split@7 near π/8: `v ≤ 9238795325112867/1e16`
    (`≤ cos π/8`). -/
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
/-- `v = cutCos(15707963267949/4e13)` coarse LOWER bound: `9/10 ≤ v` (split@6, huge margin). -/
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
/-- THE 1e14-GRID UPPER SIGN via DDA NEGATIVITY: `cutCos(15707963267949/1e13) < 0`, from
    `cutCos(15707963267949/1e13) = 2(2v²−1)²−1` with `v ∈ [9/10, 9238795325112867/1e16]`. -/
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

/-- THE 1e14-GRID UPPER BOUND: `leastCosZero ≤ 15707963267949/1e13` (the integer ceil of `π/2·1e14`),
    via the intermediate value theorem (`intermediate_value_Icc'`) on the sign change of `cutCos`. -/
theorem leastCosZero_le_15707963267949 : leastCosZero ≤ 15707963267949 / 10000000000000 := by
  have h02 : (0 : Cut) ≤ 15707963267949 / 10000000000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (15707963267949 / 10000000000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (15707963267949 / 10000000000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_15707963267949_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-! ## (A′) THE 1e14-GRID `cutPi` AND `1/cutPi` BRACKETS. -/

/-- THE 1e14-GRID `cutPi` BRACKET: `cutPi ∈ [157079632679489/5e13, 15707963267949/5e12]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [157079632679489/1e14, 15707963267949/1e13]`. -/
theorem cutPi_bracket_ext8 :
    (157079632679489 / 50000000000000 : Cut) ≤ cutPi
      ∧ cutPi ≤ 15707963267949 / 5000000000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_157079632679489; linarith
  · have := leastCosZero_le_15707963267949; linarith

/-- THE 1e14-GRID RESIDUAL BRACKET: `1/cutPi ∈ [5000000000000/15707963267949,
    50000000000000/157079632679489]` — a certified two-sided rational bracket of `Cut` for the derived
    `1/cutPi`, width `≈ 2.03×10⁻¹⁵`, nested strictly inside the banked ext7 `[100000000000/314159265359,
    250000000000/785398163397]` (`≈ 100×` narrower). -/
theorem inv_cutPi_bracket_ext8 :
    (5000000000000 / 15707963267949 : Cut) ≤ 1 / cutPi
      ∧ 1 / cutPi ≤ 50000000000000 / 157079632679489 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext8
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE 1e14-GRID RESIDUAL BRACKET IS STRICTLY TWO-SIDED (width `≈ 2.03×10⁻¹⁵`, not a point). -/
theorem inv_cutPi_ext8_strict :
    (5000000000000 / 15707963267949 : Cut) < 50000000000000 / 157079632679489 := by norm_num

/-- W8 — THE 1e14-GRID `1/cutPi` BRACKET IS NESTED INSIDE the banked ext7 `[100000000000/314159265359,
    250000000000/785398163397]`: lower moved inward and upper moved inward. -/
theorem inv_cutPi_ext8_nested :
    (100000000000 / 314159265359 : Cut) ≤ 5000000000000 / 15707963267949
      ∧ (50000000000000 / 157079632679489 : Cut) ≤ 250000000000 / 785398163397 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.D7NarrowingRung4

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.AssembledBracket
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7CompositionAttestation
open Phys.Algebra.D7NarrowingRung1
open Phys.Algebra.D7NarrowingRung2
open Phys.Algebra.D7NarrowingRung3
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE 1e14 `κ = kappaLeading` BRACKET (from the 1e14-grid `1/cutPi`). -/

/-- THE 1e14 `κ = kappaLeading` BRACKET: `(5000000000000/15707963267949)/3 ≤ kappaLeading ≤
    (50000000000000/157079632679489)/3` (`kappaLeading = (1/cutPi)/3`), from the `1e14`-grid
    `inv_cutPi_bracket_ext8`. -/
theorem kappa_bracket_ext8 :
    (5000000000000 / 15707963267949 : Cut) / 3 ≤ kappaLeading
      ∧ kappaLeading ≤ (50000000000000 / 157079632679489 : Cut) / 3 := by
  obtain ⟨hlo, hhi⟩ := inv_cutPi_bracket_ext8
  have hk : kappaLeading = (1 / cutPi) / 3 := by rw [kappaLeading_eq, div_div, mul_comm]
  rw [hk]; exact ⟨by linarith, by linarith⟩

/-! ## (C) THE DEEPENED EDGE LOGS (grid 1e14) — read the SAME banked s7 amplitude / closed-form
    brackets through the exp instrument one index deeper. -/

set_option maxHeartbeats 2000000 in
/-- THE DEEPENED HEAVY SHAPE LOG: `173372879495463/1e14 ≤ cutLog mass0 ≤ 173372879495464/1e14`
    (width `10⁻¹⁴`), from the banked s7 Born-square `mass0 = b0² ∈ [b0_lo², b0_hi²]` through
    `cutLog_ge/le_certified` at exp indices 20/21 + `cutLog_mono`. -/
theorem cutLog_b0_ext8 :
    (173372879495463 : Cut) / 100000000000000 ≤ cutLog mass0
      ∧ cutLog mass0 ≤ 173372879495464 / 100000000000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  -- s7 mass0 bracket from b0 s7
  have hm0lo : (5661726012625409 : Cut) / 1000000000000000 ≤ mass0 := by
    have := mul_le_mul b0_lo_s7 b0_lo_s7 (by norm_num) (le_of_lt b0_pos_s7)
    unfold mass0; nlinarith [this]
  have hm0hi : mass0 ≤ (5661726012625410 : Cut) / 1000000000000000 := by
    have := mul_le_mul b0_hi_s7 b0_hi_s7 (le_of_lt b0_pos_s7) (by norm_num)
    unfold mass0; nlinarith [this]
  refine ⟨?_, ?_⟩
  · have hcert : (173372879495463 : Cut) / 100000000000000
        ≤ cutLog (5661726012625409 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625409 / 1000000000000000)
        (173372879495463 / 100000000000000) 20 (by norm_num) (by norm_num)
      show partialExp (173372879495463 / 100000000000000 : Cut) 20
          + expRemBound (173372879495463 / 100000000000000 : Cut) 20
        ≤ (5661726012625409 : Cut) / 1000000000000000
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((5661726012625409 : Cut) / 1000000000000000) ≤ cutLog mass0 :=
      cutLog_mono (by norm_num) hm0lo
    linarith
  · have hmono : cutLog mass0 ≤ cutLog ((5661726012625410 : Cut) / 1000000000000000) :=
      cutLog_mono hpos hm0hi
    have hcert : cutLog ((5661726012625410 : Cut) / 1000000000000000)
        ≤ (173372879495464 : Cut) / 100000000000000 := by
      apply cutLog_le_certified (5661726012625410 / 1000000000000000)
        (173372879495464 / 100000000000000) 21 (by norm_num) (by norm_num)
      show (5661726012625410 : Cut) / 1000000000000000
          ≤ partialExp (173372879495464 / 100000000000000 : Cut) 21
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

/-- The deepened clean `mass2` lower bracket from the s7 products (`b2 = 1 − (wB·pB − wB·rB)/2`). -/
theorem b2_clean_lo_s7 : (3366458722812920 : Cut) / 10000000000000000 ≤ mass2 := by
  have hb2lo : (5802119201475372 : Cut) / 10000000000000000 ≤ b2 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [wp_hi_s7, wr_lo_s7]
  have hb2pos : (0 : Cut) < b2 := by linarith
  have := mul_le_mul hb2lo hb2lo (by norm_num) (le_of_lt hb2pos)
  unfold mass2
  nlinarith [this]

/-- The deepened clean `mass2` upper bracket. -/
theorem b2_clean_hi_s7 : mass2 ≤ (3366458722812923 : Cut) / 10000000000000000 := by
  have hb2hi : b2 ≤ (5802119201475373 : Cut) / 10000000000000000 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [wp_lo_s7, wr_hi_s7]
  have hb2pos : (0 : Cut) < b2 := b2_sharp_pos
  have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num)
  unfold mass2
  nlinarith [this]

/-- The deepened `1/mass2` bracket by reciprocal-monotonicity. -/
theorem invMass2_ext8 :
    (10000000000000000 : Cut) / 3366458722812923 ≤ 1 / mass2
      ∧ 1 / mass2 ≤ 10000000000000000 / 3366458722812920 := by
  have hpos : (0 : Cut) < mass2 := mass2_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [b2_clean_hi_s7]
  · rw [div_le_iff₀ hpos]; nlinarith [b2_clean_lo_s7]

set_option maxHeartbeats 2000000 in
/-- THE DEEPENED LIGHT SHAPE LOG: `−108872372522363/1e14 ≤ cutLog mass2 ≤ −108872372522362/1e14`
    (width `10⁻¹⁴`), read from `cutLog(1/mass2) ∈ [108872372522362/1e14, 108872372522363/1e14]`
    (exp indices 15/17) through `cutLog mass2 = −cutLog(1/mass2)`. -/
theorem cutLog_b2_ext8 :
    (-108872372522363 / 100000000000000 : Cut) ≤ cutLog mass2
      ∧ cutLog mass2 ≤ -108872372522362 / 100000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMass2_ext8
  have hinvpos : (0 : Cut) < 1 / mass2 := by positivity
  have hlog_lo : (108872372522362 : Cut) / 100000000000000 ≤ cutLog (1 / mass2) := by
    have hcert : (108872372522362 : Cut) / 100000000000000
        ≤ cutLog (10000000000000000 / 3366458722812923) := by
      apply cutLog_ge_certified (10000000000000000 / 3366458722812923)
        (108872372522362 / 100000000000000) 15 (by norm_num) (by norm_num)
      show partialExp (108872372522362 / 100000000000000 : Cut) 15
          + expRemBound (108872372522362 / 100000000000000 : Cut) 15
        ≤ (10000000000000000 : Cut) / 3366458722812923
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((10000000000000000 : Cut) / 3366458722812923) ≤ cutLog (1 / mass2) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mass2) ≤ (108872372522363 : Cut) / 100000000000000 := by
    have hmono : cutLog (1 / mass2) ≤ cutLog ((10000000000000000 : Cut) / 3366458722812920) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((10000000000000000 : Cut) / 3366458722812920)
        ≤ (108872372522363 : Cut) / 100000000000000 := by
      apply cutLog_le_certified (10000000000000000 / 3366458722812920)
        (108872372522363 / 100000000000000) 17 (by norm_num) (by norm_num)
      show (10000000000000000 : Cut) / 3366458722812920
          ≤ partialExp (108872372522363 / 100000000000000 : Cut) 17
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mass2) = - cutLog mass2 := cutLog_inv_pos mass2_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-- The deepened `q` bracket from the banked `q² = 1/2`, `0 < q`:
    `q ∈ [707106781186547/1e15, 707106781186548/1e15]` (reuse the Rung2 depth, width `10⁻¹⁵`). -/
theorem q_ext8_lo : (707106781186547 : Cut) / 1000000000000000 ≤ q := by nlinarith [q_sq, q_pos]
theorem q_ext8_hi : q ≤ (707106781186548 : Cut) / 1000000000000000 := by nlinarith [q_sq, q_pos]

/-- The deepened `mbRatioDerived = (1−q)²/(3(1+q))` bracket (decreasing in `q`):
    `mbRatioDerived ∈ [16750843898055717/1e18, 16750843898055843/1e18]`. -/
theorem mbRatio_ext8_lo : (16750843898055717 : Cut) / 1000000000000000000 ≤ mbRatioDerived := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [le_div_iff₀ h1]
  nlinarith [q_ext8_hi, q_pos, q_lt_one, q_sq]

theorem mbRatio_ext8_hi : mbRatioDerived ≤ (16750843898055843 : Cut) / 1000000000000000000 := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [div_le_iff₀ h1]
  nlinarith [q_ext8_lo, q_pos, q_lt_one, q_sq]

/-- The deepened `1/mbRatioDerived` bracket by reciprocal-monotonicity. -/
theorem invMbRatio_ext8 :
    (1000000000000000000 : Cut) / 16750843898055843 ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 1000000000000000000 / 16750843898055717 := by
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mbRatio_ext8_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mbRatio_ext8_lo]

set_option maxHeartbeats 2000000 in
/-- THE DEEPENED UP/DOWN RELATIVE LOG: `−408930664000672/1e14 ≤ cutLog mbRatioDerived ≤
    −408930664000670/1e14` (width `2×10⁻¹⁴`), read from `cutLog(1/mbRatioDerived) ∈
    [408930664000670/1e14, 408930664000672/1e14]` (exp indices 26/29) through
    `cutLog mbRatioDerived = −cutLog(1/mbRatioDerived)`. -/
theorem cutLog_mb_ext8 :
    (-408930664000672 / 100000000000000 : Cut) ≤ cutLog mbRatioDerived
      ∧ cutLog mbRatioDerived ≤ -408930664000670 / 100000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMbRatio_ext8
  have hinvpos : (0 : Cut) < 1 / mbRatioDerived := by positivity
  have hlog_lo : (408930664000670 : Cut) / 100000000000000 ≤ cutLog (1 / mbRatioDerived) := by
    have hcert : (408930664000670 : Cut) / 100000000000000
        ≤ cutLog (1000000000000000000 / 16750843898055843) := by
      apply cutLog_ge_certified (1000000000000000000 / 16750843898055843)
        (408930664000670 / 100000000000000) 26 (by norm_num) (by norm_num)
      show partialExp (408930664000670 / 100000000000000 : Cut) 26
          + expRemBound (408930664000670 / 100000000000000 : Cut) 26
        ≤ (1000000000000000000 : Cut) / 16750843898055843
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000000 : Cut) / 16750843898055843) ≤ cutLog (1 / mbRatioDerived) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mbRatioDerived) ≤ (408930664000672 : Cut) / 100000000000000 := by
    have hmono : cutLog (1 / mbRatioDerived) ≤ cutLog ((1000000000000000000 : Cut) / 16750843898055717) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000000 : Cut) / 16750843898055717)
        ≤ (408930664000672 : Cut) / 100000000000000 := by
      apply cutLog_le_certified (1000000000000000000 / 16750843898055717)
        (408930664000672 / 100000000000000) 29 (by norm_num) (by norm_num)
      show (1000000000000000000 : Cut) / 16750843898055717
          ≤ partialExp (408930664000672 / 100000000000000 : Cut) 29
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived := cutLog_inv_pos mbRatioDerived_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-- THE DEEPENED `L_b0` as the `bMass 0` shape used by the endpoint normal form. -/
theorem cutLog_bMass0_ext8 :
    (173372879495463 : Cut) / 100000000000000 ≤ cutLog (bMass 0)
      ∧ cutLog (bMass 0) ≤ 173372879495464 / 100000000000000 := by
  have h : bMass 0 = mass0 := rfl
  rw [h]; exact cutLog_b0_ext8

/-- THE DEEPENED `L_b2` as the `bMass 2` shape used by the endpoint normal form. -/
theorem cutLog_bMass2_ext8 :
    (-108872372522363 / 100000000000000 : Cut) ≤ cutLog (bMass 2)
      ∧ cutLog (bMass 2) ≤ -108872372522362 / 100000000000000 := by
  have h : bMass 2 = mass2 := rfl
  rw [h]; exact cutLog_b2_ext8

/-! ## (D) THE 1e14 ABSTRACT ARITHMETIC CORES (W9 — transcendentals OUT) + THE RE-ASSEMBLED
    RESTATEMENTS. -/

set_option maxHeartbeats 2000000 in
/-- THE 1e14 BARE ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the 1e14 bracket hypotheses):
    with `k` in the `1e14`-grid `κ` bracket, `L` in the split@7 `L_m01` window, and the three deepened
    edge logs in their `1e14` windows, `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈
    [13630718814055173/1e14, 13630718814055177/1e14]`. The inner combination is in
    `[74689759278213/5e12, 37344879639107/25e11]`. -/
theorem endpoint_core_r4 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (5000000000000 / 15707963267949 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000000 / 157079632679489 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-408930664000672 / 100000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -408930664000670 / 100000000000000)
    (hLb0 : (173372879495463 : Cut) / 100000000000000 ≤ Lb0 ∧ Lb0 ≤ 173372879495464 / 100000000000000)
    (hLb2 : (-108872372522363 / 100000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -108872372522362 / 100000000000000) :
    (13630718814055173 / 100000000000000 : Cut)
        ≤ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 13630718814055178 / 100000000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (149379518556426 / 10000000000000 : Cut)
      ≤ 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 149379518556429 / 10000000000000 := by nlinarith
  set C := 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((5000000000000 / 15707963267949 : Cut) / 3) * (149379518556426 / 10000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((5000000000000 / 15707963267949 : Cut) / 3) * (149379518556426 / 10000000000000)
        ≥ 13630718814055173 / 100000000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000000 / 157079632679489 : Cut) / 3) * (149379518556429 / 10000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000000 / 157079632679489 : Cut) / 3) * (149379518556429 / 10000000000000)
        ≤ 13630718814055178 / 100000000000000 - 2425 / 18 := by norm_num
    linarith

set_option maxHeartbeats 2000000 in
/-- THE 1e14 DRESSED ARITHMETIC CORE (W9 — the `(3/2)`-scaled coefficients): with the same 1e14
    hypotheses, `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈ [214218236093307/1562500000000,
    2741993421994331/2e13]`. The inner combination is in `[224069277834639/1e13, 224069277834643/1e13]`. -/
theorem dressed_core_r4 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (5000000000000 / 15707963267949 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000000 / 157079632679489 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-408930664000672 / 100000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -408930664000670 / 100000000000000)
    (hLb0 : (173372879495463 : Cut) / 100000000000000 ≤ Lb0 ∧ Lb0 ≤ 173372879495464 / 100000000000000)
    (hLb2 : (-108872372522363 / 100000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -108872372522362 / 100000000000000) :
    (13709967109971648 / 100000000000000 : Cut)
        ≤ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
      ∧ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
        ≤ 13709967109971655 / 100000000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (224069277834639 / 10000000000000 : Cut)
      ≤ 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 := by nlinarith
  have hcombo_hi : 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2
      ≤ 224069277834643 / 10000000000000 := by nlinarith
  set C := 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((5000000000000 / 15707963267949 : Cut) / 3) * (224069277834639 / 10000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((5000000000000 / 15707963267949 : Cut) / 3) * (224069277834639 / 10000000000000)
        ≥ 13709967109971648 / 100000000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000000 / 157079632679489 : Cut) / 3) * (224069277834643 / 10000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000000 / 157079632679489 : Cut) / 3) * (224069277834643 / 10000000000000)
        ≤ 13709967109971655 / 100000000000000 - 2425 / 18 := by norm_num
    linarith

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE BARE ENDPOINT AS `1/α(0)`: `recomposedEndpoint ∈
    [13630718814055173/1e14, 13630718814055177/1e14]` (`136.30718814055173 … 136.30718814055177`, width
    `4×10⁻¹⁴`, ≈ 15.5 significant digits). Assembled by `endpoint_core_r4` from the `1e14`-grid `κ`
    bracket (`kappa_bracket_ext8`), the split@7 `L_m01` (`⟨cutLog_lo_s7, cutLog_hi_s7⟩`), and the three
    deepened edge logs (`cutLog_mb_ext8`, `cutLog_bMass0_ext8`, `cutLog_bMass2_ext8`), through the banked
    bare normal form `recomposedEndpoint_cInner`. Nested STRICTLY inside the banked N583
    `[136.3071881405515, 136.3071881405528]`. -/
theorem recomposedEndpoint_restated_r4 :
    (13630718814055173 : Cut) / 100000000000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 13630718814055178 / 100000000000000 := by
  rw [recomposedEndpoint_cInner]
  unfold cInner
  obtain ⟨hklo, hkhi⟩ := kappa_bracket_ext8
  exact endpoint_core_r4 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi ⟨cutLog_lo_s7, cutLog_hi_s7⟩ cutLog_mb_ext8
    cutLog_bMass0_ext8 cutLog_bMass2_ext8

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE DEPTH-2-DRESSED ENDPOINT AS `1/α(0)`:
    `recomposedEndpointDressed ∈ [13709967109971648/1e14, 13709967109971655/1e14]`
    (`137.09967109971648 … 137.09967109971655`, width `7×10⁻¹⁴`, ≈ 15.3 sig digits). Assembled by
    `dressed_core_r4` from the same banked/deepened inputs, through the banked dressed normal form
    `recomposedEndpointDressed_normalform`. Nested STRICTLY inside the banked N583
    `[137.0996710997162, 137.0996710997180]`. -/
theorem recomposedEndpointDressed_restated_r4 :
    (13709967109971648 : Cut) / 100000000000000 ≤ recomposedEndpointDressed
      ∧ recomposedEndpointDressed ≤ 13709967109971655 / 100000000000000 := by
  rw [recomposedEndpointDressed_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket_ext8
  exact dressed_core_r4 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi ⟨cutLog_lo_s7, cutLog_hi_s7⟩ cutLog_mb_ext8
    cutLog_bMass0_ext8 cutLog_bMass2_ext8

/-! ## (E) THE SHARPER PREDICTIONS. -/

/-- ★★★ THE FOLD'S PREDICTION (bare, 1e14): `recomposedEndpoint < 137`, re-certified from the ≈15.5-digit
    bracket. The certified endpoint lies STRICTLY BELOW the measured `1/α(0) ≈ 137.036` (REMOVABLE
    ORIENTATION PROSE, in no proof). -/
theorem bare_lt_137_r4 : recomposedEndpoint < 137 := by
  have h := recomposedEndpoint_restated_r4.2
  have : (13630718814055178 / 100000000000000 : Cut) < 137 := by norm_num
  linarith

/-- ★★★ THE FOLD'S PREDICTION (dressed, 1e14): `137 < recomposedEndpointDressed`, re-certified from the
    ≈15.3-digit bracket. -/
theorem dressed_gt_137_r4 : 137 < recomposedEndpointDressed := by
  have h := recomposedEndpointDressed_restated_r4.1
  have : (137 : Cut) < 13709967109971648 / 100000000000000 := by norm_num
  linarith

/-! ## (F) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE BARE 1e14 BRACKET IS GENUINELY TWO-SIDED (width `5×10⁻¹⁴`, not a collapsed point). -/
theorem bare_r4_strict :
    (13630718814055173 / 100000000000000 : Cut) < 13630718814055178 / 100000000000000 := by norm_num

/-- W8 — THE DRESSED 1e14 BRACKET IS GENUINELY TWO-SIDED. -/
theorem dressed_r4_strict :
    (13709967109971648 / 100000000000000 : Cut) < 13709967109971655 / 100000000000000 := by norm_num

/-- W8 — THE BARE 1e14 BRACKET IS STRICTLY NARROWER THAN the banked N583 `[136.3071881405515,
    136.3071881405528]`: its width `5×10⁻¹⁴` is strictly below the N583 width `1.3×10⁻¹²`. -/
theorem bare_r4_width_lt :
    (13630718814055178 / 100000000000000 - 13630718814055173 / 100000000000000 : Cut)
      < 1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000 := by norm_num

/-- W8 — THE DRESSED 1e14 BRACKET IS STRICTLY NARROWER THAN the banked N583 `[137.0996710997162,
    137.0996710997180]`. -/
theorem dressed_r4_width_lt :
    (13709967109971655 / 100000000000000 - 13709967109971648 / 100000000000000 : Cut)
      < 1370996710997180 / 10000000000000 - 1370996710997162 / 10000000000000 := by norm_num

/-- W8 — THE BARE 1e14 BRACKET IS NESTED INSIDE the banked N583 `[136.3071881405515, 136.3071881405528]`:
    `136.3071881405515 ≤ 13630718814055173/1e14` (lower moved inward) and `13630718814055178/1e14 ≤
    136.3071881405528` (upper moved inward). -/
theorem bare_r4_nested :
    (1363071881405515 / 10000000000000 : Cut) ≤ 13630718814055173 / 100000000000000
      ∧ (13630718814055178 / 100000000000000 : Cut) ≤ 1363071881405528 / 10000000000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE DRESSED 1e14 BRACKET IS NESTED INSIDE the banked N583 `[137.0996710997162,
    137.0996710997180]`. -/
theorem dressed_r4_nested :
    (1370996710997162 / 10000000000000 : Cut) ≤ 13709967109971648 / 100000000000000
      ∧ (13709967109971655 / 100000000000000 : Cut) ≤ 1370996710997180 / 10000000000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (G) THE D7 RUNG-4 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, D7 RUNG 4 (arc-D THE DIGITS, welded landing). Succeeds N583. The dominant
    residual after ext7 was again `κ = 1/cutPi`; this node LIFTED the whole `1/cutPi` bracket onto a
    `1e14` grid via the SAME banked double-double-angle route (two applications of the fold's own
    `cutCos_double`, folding near-π/2 positivity to a well-conditioned near-π/8 one — LOWER by split@7
    positivity `le_leastCosZero_157079632679489`, UPPER by DDA negativity `leastCosZero_le_15707963267949`
    via IVT), reused the split@7 `L_m01`, AND deepened the three co-dominant edge logs one rung to the
    `1e14` grid (reading the SAME banked s7 amplitude / closed-form brackets through the exp instrument
    one index deeper), re-composing the D7 endpoint to a strictly narrower certified two-sided rational
    bracket of the derived `1/α(0)`, reaching ≥ 15 sig digits on BOTH endpoints:

    (1) THE `1e14`-GRID RESIDUAL: `1/cutPi ∈ [5000000000000/15707963267949,
        50000000000000/157079632679489]` (`inv_cutPi_bracket_ext8`), width `≈ 2.03×10⁻¹⁵`;
    (2) THE deepened edge logs: `cutLog mass0 ∈ [173372879495463/1e14, 173372879495464/1e14]`,
        `cutLog mass2 ∈ [−108872372522363/1e14, −108872372522362/1e14]`,
        `cutLog mbRatioDerived ∈ [−408930664000672/1e14, −408930664000670/1e14]` (widths `10⁻¹⁴`–`2×10⁻¹⁴`);
    (3) THE RE-COMPOSED BARE ENDPOINT: `recomposedEndpoint ∈ [13630718814055173/1e14,
        13630718814055178/1e14]` (`recomposedEndpoint_restated_r4`), width `5×10⁻¹⁴`, ≈ 15.4 sig digits;
    (4) THE RE-COMPOSED DRESSED ENDPOINT: `recomposedEndpointDressed ∈ [13709967109971648/1e14,
        13709967109971655/1e14]` (`recomposedEndpointDressed_restated_r4`), ≈ 15.3 sig digits;
    (5) THE PREDICTIONS: `recomposedEndpoint < 137` (`bare_lt_137_r4`) and `137 <
        recomposedEndpointDressed` (`dressed_gt_137_r4`);
    (6) TEETH: both brackets are strictly two-sided (`bare_r4_strict` / `dressed_r4_strict`), strictly
        narrower than the banked N583 (`bare_r4_width_lt` / `dressed_r4_width_lt`), nested inside it
        (`bare_r4_nested` / `dressed_r4_nested`); the residual bracket is strictly two-sided and nested
        (`inv_cutPi_ext8_strict` / `inv_cutPi_ext8_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). ≥ 15 sig digits on
    BOTH endpoints — the campaign target reached. ⚠ NO-FIT: every endpoint chosen by instrument
    certifiability at the chosen index (the split `7` / the π/2 grid `1e14` / the exp indices), not tuned
    to any measured value; the measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE ORIENTATION PROSE ONLY;
    no empirical number in any proof. -/
theorem d7NarrowingRung4_landing :
    -- (1) the `1e14`-grid residual bracket
    ((5000000000000 / 15707963267949 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 50000000000000 / 157079632679489)
    ∧ ((157079632679489 / 50000000000000 : Cut) ≤ cutPi ∧ cutPi ≤ 15707963267949 / 5000000000000)
    -- (2) the deepened edge logs
    ∧ ((173372879495463 / 100000000000000 : Cut) ≤ cutLog (bMass 0)
        ∧ cutLog (bMass 0) ≤ 173372879495464 / 100000000000000)
    ∧ ((-108872372522363 / 100000000000000 : Cut) ≤ cutLog (bMass 2)
        ∧ cutLog (bMass 2) ≤ -108872372522362 / 100000000000000)
    ∧ ((-408930664000672 / 100000000000000 : Cut) ≤ cutLog mbRatioDerived
        ∧ cutLog mbRatioDerived ≤ -408930664000670 / 100000000000000)
    -- (3) the re-composed bare endpoint
    ∧ ((13630718814055173 / 100000000000000 : Cut) ≤ recomposedEndpoint
        ∧ recomposedEndpoint ≤ 13630718814055178 / 100000000000000)
    -- (4) the re-composed dressed endpoint
    ∧ ((13709967109971648 / 100000000000000 : Cut) ≤ recomposedEndpointDressed
        ∧ recomposedEndpointDressed ≤ 13709967109971655 / 100000000000000)
    -- (5) the predictions
    ∧ recomposedEndpoint < 137
    ∧ 137 < recomposedEndpointDressed
    -- (6) teeth: strictly two-sided, strictly narrower than N583, nested inside it
    ∧ (13630718814055173 / 100000000000000 : Cut) < 13630718814055178 / 100000000000000
    ∧ (13709967109971648 / 100000000000000 : Cut) < 13709967109971655 / 100000000000000
    ∧ ((13630718814055178 / 100000000000000 - 13630718814055173 / 100000000000000 : Cut)
        < 1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000)
    ∧ ((5000000000000 / 15707963267949 : Cut) < 50000000000000 / 157079632679489) := by
  exact ⟨inv_cutPi_bracket_ext8, cutPi_bracket_ext8,
    cutLog_bMass0_ext8, cutLog_bMass2_ext8, cutLog_mb_ext8,
    recomposedEndpoint_restated_r4, recomposedEndpointDressed_restated_r4,
    bare_lt_137_r4, dressed_gt_137_r4,
    bare_r4_strict, dressed_r4_strict, bare_r4_width_lt, inv_cutPi_ext8_strict⟩

end

end Phys.Algebra.D7NarrowingRung4
