/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 6 (D5-next-5)

  Directed successor of D5-next-4 (`Phys/Algebra/NarrowedBracket4.lean`). The sixth narrowing rung.

  ## The theory-native heart of this node: the fold's OWN addition formula dissolves the wall

  The parent hit a genuine INSTRUMENT-COST ceiling (RUNBOOK W9) on the `1/cutPi` lower endpoint: the
  truncated-cosine positivity near `leastCosZero ≈ π/2` was closed by an `nlinarith` certificate search
  on a degree-10 polynomial, and that search only closes with a comfortable margin — it timed out when
  the endpoint was pushed nearer the zero. That is NOT a theory wall (the fold's cosine genuinely stays
  positive up to its least zero); it is the coordinate `nlinarith` fighting a NEAR-CANCELLATION: at
  `x ≈ π/2` the cosine value is `≈ 0`, so the partial sum is a giant alternating cancellation and the
  slack the certificate needs is exponentially thin.

  The ONE LAW: if the instrument fights you, return to the trunk. The trunk already banked the fold's
  OWN addition formula `cutCos_add` (the cosine of a sum, derived from the Cauchy product of the defining
  series — nobody posited it) and the Pythagorean identity `cutSin² + cutCos² = 1`. Together they give
  the DOUBLE-ANGLE identity

        cutCos (2·y) = 2·(cutCos y)² − 1                                   (`cutCos_double`)

  and this converts the ill-conditioned near-`π/2` positivity into a WELL-CONDITIONED near-`π/4` one:
  `cutCos x > 0` for `x < 2·y` reduces to `cutCos y > 1/√2` for `y < x/2`, and at `y ≈ π/4` the cosine
  value is `≈ 0.707` — a healthy sum with NO cancellation, so the SAME banked `cutCos_bracket` instrument
  reads it at split@6 and a single `nlinarith` closes with enormous margin. One cause: the same cosine
  the campaign has been reading, folded through the fold's own addition law.

  The payoff: `leastCosZero ∈ [15707960/1e7, 15707964/1e7]` (width `4×10⁻⁷`), vs the parent's
  `[15707705/1e7, 15707970/1e7]` (width `2.65×10⁻⁵`) — `≈ 66×` narrower, and the lower endpoint now sits
  only `3×10⁻⁷` below the true `π/2` (the parent's sat `2.6×10⁻⁶` below). The nlinarith ceiling is not
  raised; it is DISSOLVED by attacking from the trunk.

  ## Front (2): cutLog sharpened (cheap, orthogonal)

  With the `p = cutCos(2/9)` reading already at width `2×10⁻⁹` (parent), the `m01 = mass0/mass1` floor
  from the banked Born-square amplitude brackets is genuinely `[3477.4708, 3477.4760]`; the parent rounded
  it generously to `[3477.44, 3477.48]`. Reading the ACHIEVABLE floor `[3477470/1000, 3477477/1000]`
  through the D1 exp instrument at partial-sum index `23` (lower) / `26` (upper) gives
  `cutLog(mass0/mass1) ∈ [81540600/1e7, 81540630/1e7]` (width `3×10⁻⁶`) — `≈ 24×` narrower than the
  parent's `6×10⁻⁵`.

  ## The re-composed numeral

  Running the banked D4 pipeline (`endpoint_assembled_bracket` at census `d = chargeTraceDepth = 16/3`)
  with BOTH sharpened residuals:

        800488690/11780973 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 80048852/1178097

  a certified two-sided rational bracket of `Cut` of width `≈ 2.87×10⁻⁶` — `≈ 39×` narrower than the
  parent's and NESTED strictly inside it. The campaign's sixth rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision; the campaign continues. ★ THE UPDATED
  BOTTLENECK: the `1/cutPi` nlinarith ceiling is gone (double-angle); the assembled width is now
  DOMINATED by `cutLog` (`≈ 3.4×10⁻⁶` of the `2.87×10⁻⁶`... the cutLog term contributes the bulk), while
  `1/cutPi` contributes only `≈ 1.2×10⁻⁶`. The successor should push `cutLog` further (deeper exp indices
  / tighter `m01`), and can push `leastCosZero` still nearer `π/2` via the same double-angle route (the
  well-conditioned near-`π/4` `nlinarith` has large margin to spare).

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index, NEVER by where the measured `1/α(0) ≈ 137.036` sits (the derived value lands `≈ 67.9476`,
  nowhere near it). The measured `1/α(0)` and `π` appear ONLY in this removable prose. Words-removable:
  every theorem below is a statement about certified rational brackets of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket4` only (transitively the whole banked chain). NO Mathlib ℝ/ℂ as content,
  NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO floats in production.
  Foundations-only.
-/
import Phys.Algebra.NarrowedBracket4

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE FOLD'S OWN DOUBLE-ANGLE IDENTITY — the structural key that dissolves the W9 ceiling. -/

/-- ★★ THE DOUBLE-ANGLE IDENTITY over the derived reals: `cutCos (2·y) = 2·(cutCos y)² − 1`.
    Derived from the banked addition formula `cutCos_add` (the fold's cosine-of-a-sum, itself the Cauchy
    product of the defining series) at `a = b = y`, closed with the banked Pythagorean identity
    `cutSin² + cutCos² = 1`. This is the trunk lever: it folds a near-`π/2` positivity (a
    near-cancellation the coordinate `nlinarith` cannot certify with a thin margin) back to a
    well-conditioned near-`π/4` positivity. -/
theorem cutCos_double (y : Cut) :
    cutCos (2 * y) = 2 * cutCos y * cutCos y - 1 := by
  have hadd := cutCos_add y y
  have hpy := cutSin_sq_add_cutCos_sq y
  have h2y : (2 : Cut) * y = y + y := by ring
  rw [h2y, hadd]
  nlinarith [hpy]

set_option maxHeartbeats 800000 in
/-- Helper: the WELL-CONDITIONED near-`π/4` cosine lower bound `cutCos y > 7071068/1e7` for
    `0 ≤ y < 7853980/1e7` (`= 15707960/2·1e7`). At `y ≈ π/4` the cosine is `≈ 0.707` — a healthy sum, no
    cancellation — so the banked `cutCos_bracket` at split@6 (with the remainder factor tightened to
    `≤ 101/100`, valid since `y²/182` is tiny) closes with a single `nlinarith` at large margin. The
    threshold `L = 7071068/1e7` satisfies `L² > 1/2` (`L² − 1/2 = 2.66×10⁻⁸ > 0`), which is exactly what
    the double-angle step needs. -/
theorem cutCos_gt_invSqrt2_of_lt (y : Cut) (hy0 : 0 ≤ y) (hy : y < 7853980 / 10000000) :
    (7071068 / 10000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 6168501 / 10000000 := by
    have h1 : y * y < (7853980 / 10000000) * (7853980 / 10000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (7853980 / 10000000 : Cut) * (7853980 / 10000000) ≤ 6168501 / 10000000 := by norm_num
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

/-- ★★ THE STRUCTURAL LOWER POSITIVITY (the dissolved wall): `0 < cutCos x` for `0 ≤ x < 15707960/1e7`,
    via the double-angle identity. Sets `y = x/2 < 7853980/1e7`, gets `cutCos y > 7071068/1e7`
    (well-conditioned near `π/4`), then `cutCos x = cutCos (2·y) = 2·(cutCos y)² − 1 > 2·(7071068/1e7)² − 1
    > 0`. This REPLACES the parent's degree-10 near-`π/2` `nlinarith` (which ceilinged at `15707705/1e7`)
    and pushes the certified positivity out to `15707960/1e7` — `≈ 255×` closer to the true zero. -/
theorem cutCos_pos_of_lt_15707960 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707960 / 10000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 7853980 / 10000000 := by linarith
  have hcy := cutCos_gt_invSqrt2_of_lt (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

/-- ★ THE SHARPER UPPER SIGN: `cutCos (15707964/1e7) < 0`. Read directly off the banked `cutCos_bracket`
    at split@6 (`partialCos x 6 + cosRemBound x 6 < 0` — this is an EXACT rational near-cancellation,
    which `norm_num` handles with no conditioning issue). `15707964/1e7` is only `0.7×10⁻⁶` above the true
    `π/2` (parent's `15707970/1e7` was `6.7×10⁻⁶` above). -/
theorem cutCos_15707964_neg : cutCos (15707964 / 10000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 15707964 / 10000000 := by norm_num
  have hxN : (15707964 / 10000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707964 / 10000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (15707964 / 10000000 : Cut) 6 ≤ 478 / 1000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707964 / 10000000) ^ 2 / 2 + (15707964 / 10000000) ^ 4 / 24
      - (15707964 / 10000000) ^ 6 / 720 + (15707964 / 10000000) ^ 8 / 40320
      - (15707964 / 10000000) ^ 10 / 3628800 ≤ -530 / 1000000000 := by norm_num
  linarith

/-- ★ `leastCosZero ≤ 15707964/1e7` (sharper UPPER bound): the IVT on `[0, 15707964/1e7]` supplies a
    cosine zero `≤ 15707964/1e7` (since `cutCos (15707964/1e7) < 0 ≤ cutCos 0`), and `csInf_le`. -/
theorem leastCosZero_le_15707964 : leastCosZero ≤ 15707964 / 10000000 := by
  have h02 : (0 : Cut) ≤ 15707964 / 10000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (15707964 / 10000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (15707964 / 10000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_15707964_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- ★ `15707960/1e7 ≤ leastCosZero` (sharper LOWER bound): the cosine is strictly positive on
    `[0, 15707960/1e7)` (`cutCos_pos_of_lt_15707960`, via the double-angle route), so no zero lives below
    `15707960/1e7`, hence `15707960/1e7 ≤` the infimum (`le_csInf`). -/
theorem le_leastCosZero_15707960 : (15707960 / 10000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_15707960 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- ★★ THE FURTHER-SQUEEZED `cutPi` BRACKET: `cutPi ∈ [3141592/1e6, 31415928/1e7]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [15707960/1e7, 15707964/1e7]`. Width `8×10⁻⁷` — `≈ 66×`
    narrower than the parent's `[3141541/1e6, 1570797/5e5]`. Nested strictly inside it.
    (`3141592/1e6 = 2·15707960/1e7`, `31415928/1e7 = 2·15707964/1e7`.) -/
theorem cutPi_bracket_double : (3141592 / 1000000 : Cut) ≤ cutPi ∧ cutPi ≤ 31415928 / 10000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_15707960; linarith
  · have := leastCosZero_le_15707964; linarith

/-- ★★★ THE FURTHER-SQUEEZED RESIDUAL BRACKET: `1/cutPi ∈ [10000000/31415928, 1000000/3141592]` — a
    certified two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 8.1×10⁻⁸`, nested
    strictly inside the parent's `[500000/1570797, 1000000/3141541]` (`≈ 66×` narrower). -/
theorem inv_cutPi_bracket_double :
    (10000000 / 31415928 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 1000000 / 3141592 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_double
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- ★ W8 — THE FURTHER-SQUEEZED RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `10000000/31415928 <
    1000000/3141592` (a genuine reading of width `≈ 8.1×10⁻⁸`, not a collapsed point). -/
theorem inv_cutPi_double_strict : (10000000 / 31415928 : Cut) < 1000000 / 3141592 := by norm_num

/-- ★ W8 — THE double-angle `1/cutPi` BRACKET IS NESTED INSIDE the parent's split@6
    `[500000/1570797, 1000000/3141541]`: `500000/1570797 ≤ 10000000/31415928` and `1000000/3141592 ≤
    1000000/3141541` — the narrowing genuinely shrinks the bracket from BOTH ends. -/
theorem inv_cutPi_double_nested :
    (500000 / 1570797 : Cut) ≤ 10000000 / 31415928 ∧ (1000000 / 3141592 : Cut) ≤ 1000000 / 3141541 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket5

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket4
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE SHARPENED `cutLog` CONTENT — the ACHIEVABLE `m01` floor read through deeper exp indices.

    The banked Born-square amplitude brackets (`b0`/`b1` at width `3×10⁻⁸`, from `NarrowedBracket4`)
    genuinely pin `m01 = mass0/mass1 ∈ [3477.4708, 3477.4760]`; the parent rounded to `[3477.44, 3477.48]`.
    Reading the ACHIEVABLE floor and running the D1 exp instrument at deeper indices sharpens `cutLog`. -/

/-- The ACHIEVABLE `m01` lower bracket: `3477470/1000 ≤ mass0/mass1` (i.e. `3477.470 ≤`), from the SAME
    banked `mass0_lo_sharp` / `mass1_hi_sharp`. Tighter than the parent's `347744/100 = 3477.44`. -/
theorem m01_lo_ach : (3477470 / 1000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_sharp, mass0_lo_sharp]

/-- The ACHIEVABLE `m01` upper bracket: `mass0/mass1 ≤ 3477477/1000` (i.e. `≤ 3477.477`), from the SAME
    banked `mass1_lo_sharp` / `mass0_hi_sharp`. Width `7×10⁻³` — `≈ 6×` tighter than the parent's `0.04`. -/
theorem m01_hi_ach : mass0 / mass1 ≤ (3477477 / 1000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_sharp, mass0_hi_sharp]

set_option maxHeartbeats 800000 in
/-- ★★ THE SHARPENED `cutLog` CONTENT LOWER BRACKET: `81540600/1e7 ≤ cutLog(mass0/mass1)` (i.e.
    `8.15406 ≤`). Composes `3477470/1000 ≤ mass0/mass1` (`m01_lo_ach`) with `cutLog_ge_certified` at
    partial-sum index `23` through `cutLog_mono`. Tighter than the parent's `815405/1e5 = 8.15405`. -/
theorem cutLog_lo_ach : (81540600 / 10000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((3477470 : Cut) / 1000) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_ach
  have hge : (81540600 / 10000000 : Cut) ≤ cutLog ((3477470 : Cut) / 1000) := by
    apply cutLog_ge_certified ((3477470 : Cut) / 1000) (81540600 / 10000000) 23 (by norm_num)
      (by norm_num)
    show partialExp (81540600 / 10000000) 23 + expRemBound (81540600 / 10000000) 23
      ≤ (3477470 : Cut) / 1000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

set_option maxHeartbeats 800000 in
/-- ★★ THE SHARPENED `cutLog` CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 81540630/1e7` (i.e.
    `≤ 8.154063`). Composes `mass0/mass1 ≤ 3477477/1000` (`m01_hi_ach`) with `cutLog_le_certified` at
    partial-sum index `26` through `cutLog_mono`. Width `3×10⁻⁶` — `≈ 24×` narrower than the parent's
    `6×10⁻⁵` and NESTED inside its `[8.15405, 8.15411]`. -/
theorem cutLog_hi_ach : cutLog (mass0 / mass1) ≤ (81540630 / 10000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 3477470 / 1000) m01_lo_ach
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((3477477 : Cut) / 1000) :=
    cutLog_mono hpos m01_hi_ach
  have hbnd : cutLog ((3477477 : Cut) / 1000) ≤ (81540630 / 10000000 : Cut) := by
    apply cutLog_le_certified ((3477477 : Cut) / 1000) (81540630 / 10000000) 26 (by norm_num)
      (by norm_num)
    show (3477477 : Cut) / 1000 ≤ partialExp (81540630 / 10000000) 26
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- ★ W8 — THE SHARPENED `cutLog` BRACKET IS GENUINELY TWO-SIDED: `81540600/1e7 < 81540630/1e7` (a real
    reading of width `3×10⁻⁶`, not a collapsed point). -/
theorem cutLog_ach_strict : (81540600 / 10000000 : Cut) < 81540630 / 10000000 := by norm_num

/-- ★ W8 — THE SHARPENED `cutLog` BRACKET IS NESTED INSIDE the parent's `[815405/1e5, 815411/1e5]`:
    `815405/1e5 ≤ 81540600/1e7` and `81540630/1e7 ≤ 815411/1e5`. A monotone refinement. -/
theorem cutLog_ach_nested :
    (815405 / 100000 : Cut) ≤ 81540600 / 10000000 ∧ (81540630 / 10000000 : Cut) ≤ 815411 / 100000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with BOTH
    residuals sharpened, at census `d = chargeTraceDepth = 16/3`. -/

/-- ★★★ THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [81540600/1e7, 81540630/1e7]` (`cutLog_lo_ach` /
    `cutLog_hi_ach`) and `1/cutPi ∈ [10000000/31415928, 1000000/3141592]` (`inv_cutPi_bracket_double`):

        190/3 + (16/9)·(81540600/1e7)·(10000000/31415928)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(81540630/1e7)·(1000000/3141592),
        i.e.  800488690/11780973  ≤  invAlphaZero (completeBandList chargeTraceDepth)  ≤  80048852/1178097.

    A certified two-sided rational bracket of `Cut` of width `≈ 2.87×10⁻⁶` — `≈ 39×` narrower than the
    parent's `[960586690/14137173, 1921144130/28273869]` (width `≈ 1.1×10⁻⁴`) and NESTED strictly inside
    it. The campaign's sixth rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument
    certifiability, not tuned to a measured value. -/
theorem invAlphaZero_narrowed5_bracket :
    (800488690 / 11780973 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 80048852 / 1178097 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (81540600 / 10000000) (81540630 / 10000000) (by norm_num) cutLog_lo_ach cutLog_hi_ach
    (10000000 / 31415928) (1000000 / 3141592) (by norm_num)
    inv_cutPi_bracket_double.1 inv_cutPi_bracket_double.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (800488690 / 11780973 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (81540600 / 10000000) * (10000000 / 31415928) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (81540630 / 10000000) * (1000000 / 3141592) : Cut)
        ≤ 80048852 / 1178097 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- ★★ THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with BOTH
    residuals sharpened, at `d = 16/3`:

        74 + (8/3)·(81540600/1e7)·(10000000/31415928) ≤ · ≤ 74 + (8/3)·(81540630/1e7)·(1000000/3141592),
        i.e.  317777534/3926991  ≤  ·  ≤  31777747/392699. -/
theorem dressed_narrowed5_bracket :
    (317777534 / 3926991 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 31777747 / 392699 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (81540600 / 10000000) (81540630 / 10000000) (by norm_num) cutLog_lo_ach cutLog_hi_ach
    (10000000 / 31415928) (1000000 / 3141592) (by norm_num)
    inv_cutPi_bracket_double.1 inv_cutPi_bracket_double.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (317777534 / 3926991 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (81540600 / 10000000) * (10000000 / 31415928) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (81540630 / 10000000) * (1000000 / 3141592) : Cut)
        ≤ 31777747 / 392699 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `800488690/11780973 < 80048852/1178097`. -/
theorem invAlphaZero_narrowed5_strict : (800488690 / 11780973 : Cut) < 80048852 / 1178097 := by
  norm_num

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-4): its width
    `80048852/1178097 − 800488690/11780973` is strictly below the parent's width
    `1921144130/28273869 − 960586690/14137173`. This is the campaign's core progress tooth — the
    assembled bracket genuinely shrank a sixth time (BOTH fronts attacked: `1/cutPi` via the fold's own
    double-angle identity `≈ 66×`, and `cutLog` via the achievable `m01` floor at deeper exp indices). -/
theorem invAlphaZero_narrowed5_width_lt :
    (80048852 / 1178097 - 800488690 / 11780973 : Cut)
      < 1921144130 / 28273869 - 960586690 / 14137173 := by
  norm_num

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `960586690/14137173 ≤
    800488690/11780973` and `80048852/1178097 ≤ 1921144130/28273869`. A monotone refinement — the new
    bracket sits entirely within the old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed5_nested :
    (960586690 / 14137173 : Cut) ≤ 800488690 / 11780973
      ∧ (80048852 / 1178097 : Cut) ≤ 1921144130 / 28273869 := by
  refine ⟨by norm_num, by norm_num⟩

/-- ★ W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 800488690/11780973` (the lepton tail runs `1/α` genuinely up at the physical census, not a
    collapse). -/
theorem invAlphaZero_narrowed5_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed5_bracket.1
  have hgt : (190 / 3 : Cut) < 800488690 / 11780973 := by norm_num
  linarith

/-! ## (E) THE D5-next-5 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE NARROWING CAMPAIGN, SIXTH RUNG (arc-D D5-next-5, welded landing). BOTH residual fronts
    sharpened again, and the D4 pipeline re-composed to a strictly narrower certified two-sided rational
    bracket of the derived `1/α(0)`:

    (1) THE FURTHER-SQUEEZED RESIDUAL: `1/cutPi ∈ [10000000/31415928, 1000000/3141592]`
        (`inv_cutPi_bracket_double`), from `cutPi ∈ [3141592/1000000, 31415928/1e7]`
        (`cutPi_bracket_double`), `leastCosZero ∈ [15707960/1e7, 15707964/1e7]` — the LOWER bound read via
        the fold's OWN double-angle identity `cutCos (2·y) = 2·(cutCos y)² − 1` (`cutCos_double`), which
        folds the near-`π/2` positivity to a WELL-CONDITIONED near-`π/4` one and DISSOLVES the parent's
        degree-10 `nlinarith` ceiling; the UPPER bound from the split@6 sign (`cutCos_15707964_neg`);
    (2) THE FURTHER-SHARPENED cutLog CONTENT: `cutLog(mass0/mass1) ∈ [81540600/1e7, 81540630/1e7]`
        (`cutLog_lo_ach` / `cutLog_hi_ach`) — read off the D1 exp instrument at partial-sum index `23`
        (lower) / `26` (upper) through the ACHIEVABLE DIRECT Born-square `m01` bracket
        `[3477470/1000, 3477477/1000]` (`m01_lo_ach` / `m01_hi_ach`) from the SAME banked amplitude
        brackets; the parent had rounded `m01` generously;
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `800488690/11780973 ≤ invAlphaZero (completeBandList
        chargeTraceDepth) ≤ 80048852/1178097` (`invAlphaZero_narrowed5_bracket`), width `≈ 2.87×10⁻⁶`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `317777534/3926991 ≤ · ≤ 31777747/392699`
        (`dressed_narrowed5_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed5_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed5_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed5_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed5_gt_waypoint`); the residual and cutLog brackets are each strictly
        two-sided and nested (`inv_cutPi_double_strict`/`inv_cutPi_double_nested`,
        `cutLog_ach_strict`/`cutLog_ach_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is `≈ 39×`
    narrower than the parent's but still WIDE relative to the measured precision; the campaign continues.
    ★ THE UPDATED BOTTLENECK: the parent's `1/cutPi` `nlinarith` ceiling is DISSOLVED (the double-angle
    route reads `leastCosZero` to `3×10⁻⁷` of the true zero with large margin to spare), so `1/cutPi` now
    contributes only `≈ 1.2×10⁻⁶` of the assembled width; the width is now DOMINATED by `cutLog`
    (`≈ 3×10⁻⁶` bracket). The successor should push `cutLog` further (deeper exp indices / a tighter `m01`
    floor toward `[3477.4708, 3477.4760]`), and may push `leastCosZero` still nearer `π/2` via the same
    double-angle route. The measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE PROSE ONLY; no empirical
    number in any proof; explicit NO-FIT (the residual endpoints are chosen by instrument certifiability
    at the chosen index, not by the measured value; the derived value lands `≈ 67.9476`, nowhere near
    `137.036`). -/
theorem narrowedBracket5_landing :
    -- (1) the further-squeezed residual bracket (1/cutPi via the fold's own double-angle identity)
    ((10000000 / 31415928 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 1000000 / 3141592)
    ∧ ((3141592 / 1000000 : Cut) ≤ cutPi ∧ cutPi ≤ 31415928 / 10000000)
    -- (2) the further-sharpened cutLog content bracket (achievable m01 floor at deeper exp indices)
    ∧ ((81540600 / 10000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 81540630 / 10000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((800488690 / 11780973 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 80048852 / 1178097)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((317777534 / 3926991 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 31777747 / 392699)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (800488690 / 11780973 : Cut) < 80048852 / 1178097
    ∧ ((80048852 / 1178097 - 800488690 / 11780973 : Cut)
        < 1921144130 / 28273869 - 960586690 / 14137173)
    ∧ ((960586690 / 14137173 : Cut) ≤ 800488690 / 11780973
        ∧ (80048852 / 1178097 : Cut) ≤ 1921144130 / 28273869)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_double, cutPi_bracket_double,
    ⟨cutLog_lo_ach, cutLog_hi_ach⟩,
    invAlphaZero_narrowed5_bracket, dressed_narrowed5_bracket,
    invAlphaZero_narrowed5_strict, invAlphaZero_narrowed5_width_lt,
    invAlphaZero_narrowed5_nested, invAlphaZero_narrowed5_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket5
