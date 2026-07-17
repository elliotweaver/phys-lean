/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 9 (D5-next-8)

  Directed successor of D5-next-7 (`Phys/Algebra/NarrowedBracket7.lean`). The ninth narrowing rung.

  ## The bottleneck this node acts on (the anti-drift crux — the ONE LAW, read correctly)

  After D5-next-7 the `cutLog` residual's contribution to the assembled width collapsed to `≈ 2.8×10⁻⁹`,
  while `1/cutPi`'s was `≈ 4.4×10⁻⁷` — so `1/cutPi` became the SOLE binding residual. Its LOWER bound was
  set by `leastCosZero`'s LOWER bound `157079620/1e8` (banked `le_leastCosZero_157079620`), which came from
  the SINGLE-application double-angle positivity route `cutCos x = 2·(cutCos(x/2))²−1` with a near-`π/4`
  lower bound on `cutCos(x/2)`. The parent MEASURED that this route was at a hard `nlinarith`-margin ceiling:
  pushing the threshold past `157079620/1e8` fails the degree-10 positivity certificate — the near-`π/2`
  truncated cosine is an ill-conditioned near-cancellation, so the coordinate `nlinarith` search dies as the
  margin shrinks to `≈ 10⁻⁸`. (`ProbeD7a`/`ProbeD7b`/`ProbeHpoly` all confirmed the dead lower push.)

  ## Front (1): the DOUBLE-DOUBLE-ANGLE structural positivity route (the dissolved ceiling)

  The ONE LAW: the instrument is fighting, so return to the trunk. The fix is to apply the fold's OWN
  double-angle identity `cutCos_double` TWICE, reducing the near-`π/2` positivity to a well-conditioned
  positivity near `π/8` (`x/4`), where the cosine value is `≈ 0.924` — a healthy sum, no cancellation:

        cutCos x = cutCos (2·(x/2)) = 2·(cutCos (x/2))² − 1
                 = 2·(2·(cutCos (x/4))² − 1)² − 1                    (two applications of `cutCos_double`)

  So `0 < cutCos x` reduces to a lower bound on `cutCos (x/4)` at `x/4 ≈ π/8`, and the final positivity
  `2·(2C²−1)²−1 > 0` holds precisely when `C > cos(π/8)`. The near-`π/8` lower bound
  `cutCos y > 144356177/156250000` for `0 ≤ y < 9817477/25000000` is certified by the banked `cutCos_bracket`
  at split@6, and — critically — because the argument is `≈ 0.393` (not `≈ 0.785`), the truncated series is
  dominated by its low-order terms and the `nlinarith` positivity closes with a robust margin even where the
  single-double-angle route died. This pushes `leastCosZero`'s certified LOWER bound from `157079620/1e8` all
  the way to `157079632/1e8` — only `0.68×10⁻⁸` below the true `π/2 · 1e8 = 157079632.68`, i.e. the tightest
  achievable value at the `1e8` grid (`4·(π/8) = π/2`, so `x < 157079632` is the integer floor of the true
  half-period). A `≈ 12×10⁻⁸` improvement over the parent, obtained purely structurally.

  ## The re-composed numeral

  Keeping the parent's split@6 upper sign (`cutCos_157079634_neg` via `NarrowedBracket7`) and the
  parent's split@5 `cutLog` content (no longer binding), the `1/cutPi` bracket sharpens from the upper end:

        leastCosZero ∈ [157079632/1e8, 157079634/1e8]         (width `2×10⁻⁸`, was `1.4×10⁻⁷`)
        cutPi        ∈ [39269908/12500000, 78539817/25000000]
        1/cutPi      ∈ [25000000/78539817, 3125000/9817477]   (width `≈ 4.05×10⁻⁹`, was `≈ 2.8×10⁻⁸`)

  Running the banked D4 pipeline (`endpoint_assembled_bracket` at census `d = chargeTraceDepth = 16/3`) with
  the sharpened `1/cutPi` and the parent's `cutLog ∈ [815406110/1e8, 815406115/1e8]`:

        48029320130/706858353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 12007329895/176714586

  a certified two-sided rational bracket of `Cut` of width `≈ 8.70×10⁻⁸` — `≈ 5.05×` narrower than the
  parent's `≈ 4.40×10⁻⁷` and NESTED strictly inside it (lower endpoint reused — only the upper `leastCosZero`
  bound moved, so the narrowing is entirely from the upper end). The campaign's ninth rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision; the campaign continues. ★ THE UPDATED
  BOTTLENECK: `1/cutPi`'s LOWER bound is now at the `π/2` grid ceiling (`leastCosZero_lo = 157079632/1e8` is
  the integer floor of the true half-period, so no further `1e8`-tick is possible without a finer grid); its
  UPPER endpoint (from `leastCosZero`'s upper bound `157079634/1e8`) can still be sharpened by reading the
  split@6/split@7 upper sign one tick nearer the true zero, and `cutLog` can be sharpened cheaply (split@6
  `pB`). The successor should sharpen `leastCosZero`'s UPPER bound (a finer grid: `157079633/1e8` needs
  split@7, or a `1e9`-grid lower bound via the same double-double-angle route) and/or `cutLog`.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the chosen
  index, NEVER by where the measured `1/α(0) ≈ 137.036` sits (the derived value lands `≈ 67.9476`, nowhere
  near it). The measured `1/α(0)` and `π` appear ONLY in this removable prose. Words-removable: every theorem
  below is a statement about certified rational brackets of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket7` only (transitively the whole banked chain + the fold's own double-angle
  identity `cutCos_double`). NO Mathlib ℝ/ℂ as content, NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval
  decision procedures, NO floats in production. Foundations-only.
-/
import Phys.Algebra.NarrowedBracket7

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE DOUBLE-DOUBLE-ANGLE STRUCTURAL POSITIVITY — the dissolved near-`π/2` ceiling.

    Two applications of the fold's own `cutCos_double` fold the ill-conditioned near-`π/2` positivity
    (a near-cancellation the coordinate `nlinarith` cannot certify with a thin margin) back to a
    WELL-CONDITIONED near-`π/8` positivity (cosine `≈ 0.924`, a healthy sum). This is the trunk lever the
    ONE LAW demands: the instrument was fighting, so we returned to the fold's own trig machinery rather
    than grinding a deeper `nlinarith`. -/

set_option maxHeartbeats 2000000 in
/-- THE WELL-CONDITIONED near-`π/8` cosine lower bound: `cutCos y > 144356177/156250000` for
    `0 ≤ y < 9817477/25000000` (`= 157079632/4·1e8`). At `y ≈ π/8` the cosine is `≈ 0.924` — a healthy
    sum, no cancellation — so the banked `cutCos_bracket` at split@6 (remainder factor tightened to
    `≤ 101/100`, valid since `y²/182` is tiny) closes with a single `nlinarith` at robust margin even
    though the certification window `cos(y) − C ≈ 3.6×10⁻¹⁰` is thin: the small argument `≈ 0.393` makes
    the truncated series low-order-dominated, so the positivity is not a near-cancellation. The threshold
    `C = 144356177/156250000` satisfies `2·(2C²−1)²−1 > 0` (the double-double-angle closure), which is
    exactly what the two `cutCos_double` steps need. -/
theorem cutCos_gt_pi8_632 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 9817477 / 25000000) :
    (144356177 / 156250000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 1542127 / 10000000 := by
    have h1 : y * y < (9817477 / 25000000) * (9817477 / 25000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (9817477 / 25000000 : Cut) * (9817477 / 25000000) ≤ 1542127 / 10000000 := by norm_num
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
  have hpoly : (144356177 / 156250000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

/-- THE DOUBLE-DOUBLE-ANGLE STRUCTURAL LOWER POSITIVITY (the dissolved wall): `0 < cutCos x` for
    `0 ≤ x < 157079632/1e8`, via TWO applications of `cutCos_double`. Sets `y = x/4 < 9817477/25000000`,
    gets `cutCos y > 144356177/156250000` (well-conditioned near `π/8`), then
      `cutCos x = 2·(2·(cutCos y)² − 1)² − 1 > 0`
    since `144356177/156250000 > cos(π/8)`. This REPLACES the parent's single-double-angle near-`π/4`
    route (which ceilinged at `157079620/1e8`) and pushes the certified positivity out to `157079632/1e8`
    — the integer floor of the true `π/2 · 1e8 = 157079632.68`, i.e. the tightest achievable value at the
    `1e8` grid. -/
theorem cutCos_pos_of_lt_157079632 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 157079632 / 100000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 9817477 / 25000000 := by linarith
  have hcy := cutCos_gt_pi8_632 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  -- c = cutCos(x/4) > C > 0. u := 2c²−1 > 2C²−1 (near cos π/4). Final 2u²−1 > 0. Staged (well-conditioned).
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (144356177 / 156250000 : Cut) * (144356177 / 156250000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (8631674588055329 / 12207031250000000 : Cut) < 2 * c * c - 1 := by nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (8631674588055329 / 12207031250000000 : Cut) * (8631674588055329 / 12207031250000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

/-- THE DOUBLE-DOUBLE-ANGLE LOWER BOUND: `157079632/1e8 ≤ leastCosZero`. The cosine is strictly positive
    on `[0, 157079632/1e8)` (`cutCos_pos_of_lt_157079632`), so no zero lives below `157079632/1e8`, hence
    `157079632/1e8 ≤` the infimum (`le_csInf`). `≈ 12×10⁻⁸` sharper than the parent's `157079620/1e8`. -/
theorem le_leastCosZero_157079632 : (157079632 / 100000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_157079632 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- THE FURTHER-SQUEEZED `cutPi` BRACKET: `cutPi ∈ [39269908/12500000, 78539817/25000000]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [157079632/1e8, 157079634/1e8]` (the LOWER bound the new
    double-double-angle `le_leastCosZero_157079632`, the UPPER the banked `leastCosZero_le_157079634` from
    `NarrowedBracket7`). Width `4×10⁻⁸`. (`39269908/12500000 = 2·157079632/1e8`,
    `78539817/25000000 = 2·157079634/1e8`.) -/
theorem cutPi_bracket_ext3 :
    (39269908 / 12500000 : Cut) ≤ cutPi ∧ cutPi ≤ 78539817 / 25000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_157079632; linarith
  · have := leastCosZero_le_157079634; linarith

/-- THE FURTHER-SQUEEZED RESIDUAL BRACKET: `1/cutPi ∈ [25000000/78539817, 3125000/9817477]` — a certified
    two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 4.05×10⁻⁹`, nested strictly
    inside the parent's `[25000000/78539817, 2500000/7853981]` (`≈ 7×` narrower, from the upper end). -/
theorem inv_cutPi_bracket_ext3 :
    (25000000 / 78539817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 3125000 / 9817477 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext3
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE FURTHER-SQUEEZED RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `25000000/78539817 <
    3125000/9817477` (a genuine reading of width `≈ 4.05×10⁻⁹`, not a collapsed point). -/
theorem inv_cutPi_ext3_strict : (25000000 / 78539817 : Cut) < 3125000 / 9817477 := by norm_num

/-- W8 — THE further-squeezed `1/cutPi` BRACKET IS NESTED INSIDE the parent's `[25000000/78539817,
    2500000/7853981]`: `25000000/78539817 ≤ 25000000/78539817` (lower reused) and
    `3125000/9817477 ≤ 2500000/7853981` — the narrowing genuinely shrinks the bracket from the upper end. -/
theorem inv_cutPi_ext3_nested :
    (25000000 / 78539817 : Cut) ≤ 25000000 / 78539817
      ∧ (3125000 / 9817477 : Cut) ≤ 2500000 / 7853981 := by
  refine ⟨le_refl _, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket8

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket7
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with the
    double-double-angle-sharpened `1/cutPi` and the parent's split@5 `cutLog` (no longer binding), at
    census `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [815406110/1e8, 815406115/1e8]` (the parent's
    `cutLog_lo_s5` / `cutLog_hi_s5`) and `1/cutPi ∈ [25000000/78539817, 3125000/9817477]`
    (`inv_cutPi_bracket_ext3`):

        190/3 + (16/9)·(815406110/1e8)·(25000000/78539817)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(815406115/1e8)·(3125000/9817477),
        i.e.  48029320130/706858353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 12007329895/176714586.

    A certified two-sided rational bracket of `Cut` of width `≈ 8.70×10⁻⁸` — `≈ 5.05×` narrower than the
    parent's `[48029320130/706858353, 4802931616/70685829]` (width `≈ 4.40×10⁻⁷`) and NESTED strictly
    inside it (lower endpoint reused — only the upper `leastCosZero` bound moved). The campaign's ninth
    rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument certifiability, not tuned to a measured
    value. -/
theorem invAlphaZero_narrowed8_bracket :
    (48029320130 / 706858353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 12007329895 / 176714586 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (25000000 / 78539817) (3125000 / 9817477) (by norm_num)
    inv_cutPi_bracket_ext3.1 inv_cutPi_bracket_ext3.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (48029320130 / 706858353 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (815406110 / 100000000) * (25000000 / 78539817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (815406115 / 100000000) * (3125000 / 9817477) : Cut)
        ≤ 12007329895 / 176714586 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with the
    double-double-angle-sharpened `1/cutPi` and the parent's `cutLog`, at `d = 16/3`:

        74 + (8/3)·(815406110/1e8)·(25000000/78539817) ≤ · ≤ 74 + (8/3)·(815406115/1e8)·(3125000/9817477),
        i.e.  19066651594/235619451 ≤ · ≤ 9533325691/117809724. -/
theorem dressed_narrowed8_bracket :
    (19066651594 / 235619451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 9533325691 / 117809724 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (25000000 / 78539817) (3125000 / 9817477) (by norm_num)
    inv_cutPi_bracket_ext3.1 inv_cutPi_bracket_ext3.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (19066651594 / 235619451 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (815406110 / 100000000) * (25000000 / 78539817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (815406115 / 100000000) * (3125000 / 9817477) : Cut)
        ≤ 9533325691 / 117809724 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (C) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `48029320130/706858353 < 12007329895/176714586`. -/
theorem invAlphaZero_narrowed8_strict :
    (48029320130 / 706858353 : Cut) < 12007329895 / 176714586 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-7): its width
    `12007329895/176714586 − 48029320130/706858353` is strictly below the parent's width
    `4802931616/70685829 − 48029320130/706858353`. This is the campaign's core progress tooth — the
    assembled bracket genuinely shrank a ninth time (`1/cutPi` via the double-double-angle route pushing
    `leastCosZero`'s lower bound to the `π/2` grid ceiling, `≈ 5.05×`). -/
theorem invAlphaZero_narrowed8_width_lt :
    (12007329895 / 176714586 - 48029320130 / 706858353 : Cut)
      < 4802931616 / 70685829 - 48029320130 / 706858353 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `48029320130/706858353 ≤
    48029320130/706858353` (lower reused) and `12007329895/176714586 ≤ 4802931616/70685829`. A monotone
    refinement from the upper end — the new bracket sits entirely within the old, so no earlier reading is
    contradicted. -/
theorem invAlphaZero_narrowed8_nested :
    (48029320130 / 706858353 : Cut) ≤ 48029320130 / 706858353
      ∧ (12007329895 / 176714586 : Cut) ≤ 4802931616 / 70685829 := by
  refine ⟨le_refl _, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 48029320130/706858353` (the lepton tail runs `1/α` genuinely up at the physical census, not a
    collapse). -/
theorem invAlphaZero_narrowed8_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed8_bracket.1
  have hgt : (190 / 3 : Cut) < 48029320130 / 706858353 := by norm_num
  linarith

/-! ## (D) THE D5-next-8 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, NINTH RUNG (arc-D D5-next-8, welded landing). The sole binding residual
    `1/cutPi`'s LOWER bound was at a `nlinarith`-margin ceiling near `π/2`; this node dissolved that
    ceiling with the fold's OWN double-angle identity applied TWICE (`cutCos_double` ∘ `cutCos_double`),
    reducing the ill-conditioned near-`π/2` positivity to a well-conditioned near-`π/8` one and pushing
    `leastCosZero`'s certified LOWER bound to the `π/2` grid ceiling `157079632/1e8`; and the D4 pipeline
    re-composed to a strictly narrower certified two-sided rational bracket of the derived `1/α(0)`:

    (1) THE FURTHER-SQUEEZED RESIDUAL: `1/cutPi ∈ [25000000/78539817, 3125000/9817477]`
        (`inv_cutPi_bracket_ext3`), from `cutPi ∈ [39269908/12500000, 78539817/25000000]`
        (`cutPi_bracket_ext3`), `leastCosZero ∈ [157079632/1e8, 157079634/1e8]` — the LOWER bound the new
        double-double-angle `le_leastCosZero_157079632`, the UPPER the banked `leastCosZero_le_157079634`;
    (2) THE cutLog CONTENT (reused from the parent, no longer binding):
        `cutLog(mass0/mass1) ∈ [815406110/1e8, 815406115/1e8]` (`cutLog_lo_s5` / `cutLog_hi_s5`);
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `48029320130/706858353 ≤ invAlphaZero (completeBandList
        chargeTraceDepth) ≤ 12007329895/176714586` (`invAlphaZero_narrowed8_bracket`), width `≈ 8.70×10⁻⁸`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `19066651594/235619451 ≤ · ≤ 9533325691/117809724`
        (`dressed_narrowed8_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed8_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed8_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed8_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed8_gt_waypoint`); the residual bracket is strictly two-sided and nested
        (`inv_cutPi_ext3_strict` / `inv_cutPi_ext3_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is `≈ 5.05×`
    narrower than the parent's but still WIDE relative to the measured precision; the campaign continues.
    ★ THE UPDATED BOTTLENECK: `1/cutPi`'s LOWER bound is now at the `π/2` `1e8`-grid ceiling
    (`leastCosZero_lo = 157079632/1e8` is the integer floor of the true half-period `157079632.68`); its
    UPPER endpoint (from `leastCosZero`'s upper bound `157079634/1e8`) and `cutLog` can still be sharpened.
    The measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE PROSE ONLY; no empirical number in any proof;
    explicit NO-FIT (the residual endpoints are chosen by instrument certifiability at the chosen index, not
    by the measured value; the derived value lands `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket8_landing :
    -- (1) the further-squeezed residual bracket (1/cutPi via the double-double-angle lower bound)
    ((25000000 / 78539817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 3125000 / 9817477)
    ∧ ((39269908 / 12500000 : Cut) ≤ cutPi ∧ cutPi ≤ 78539817 / 25000000)
    -- (2) the cutLog content bracket (reused from the parent, no longer binding)
    ∧ ((815406110 / 100000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406115 / 100000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((48029320130 / 706858353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 12007329895 / 176714586)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((19066651594 / 235619451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 9533325691 / 117809724)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (48029320130 / 706858353 : Cut) < 12007329895 / 176714586
    ∧ ((12007329895 / 176714586 - 48029320130 / 706858353 : Cut)
        < 4802931616 / 70685829 - 48029320130 / 706858353)
    ∧ ((48029320130 / 706858353 : Cut) ≤ 48029320130 / 706858353
        ∧ (12007329895 / 176714586 : Cut) ≤ 4802931616 / 70685829)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext3, cutPi_bracket_ext3,
    ⟨cutLog_lo_s5, cutLog_hi_s5⟩,
    invAlphaZero_narrowed8_bracket, dressed_narrowed8_bracket,
    invAlphaZero_narrowed8_strict, invAlphaZero_narrowed8_width_lt,
    invAlphaZero_narrowed8_nested, invAlphaZero_narrowed8_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket8
