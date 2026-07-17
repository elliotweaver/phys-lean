/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 7 (D5-next-6)

  Directed successor of D5-next-5 (`Phys/Algebra/NarrowedBracket5.lean`). The seventh narrowing rung.

  ## The updated bottleneck (the anti-drift crux this node acts on)

  The parent's `1/cutPi` instrument ceiling was DISSOLVED by the fold's own double-angle identity
  `cutCos (2·y) = 2·(cutCos y)² − 1` (`cutCos_double`), leaving the assembled width DOMINATED by the
  `cutLog` residual (`≈ 3×10⁻⁶` vs `1/cutPi`'s `≈ 1.2×10⁻⁶` contribution). So THIS node's PRIMARY front
  is `cutLog`, attacked on BOTH orthogonal levers at once, and it also pushes `1/cutPi` further via the
  SAME banked double-angle route (which had large margin to spare).

  ## Front (1): the sharpened `cutLog` — the ACHIEVABLE `m01` floor at a deeper exp index

  The banked Born-square amplitude brackets (`b0`/`b1` at width `3×10⁻⁸`, `NarrowedBracket4`) genuinely
  pin `m01 = mass0/mass1 ∈ [3477.470772, 3477.476031]` (`mass0_lo/hi_sharp`, `mass1_lo/hi_sharp`). The
  parent read the rounded floor `[3477.470, 3477.477]`; this node reads the TIGHTER achievable rational
  floor `[34774707/10000, 34774761/10000] = [3477.4707, 3477.4761]` (the tightest 4-dp bracket the banked
  amplitude products certify, `nlinarith` margins `≈ 1.1×10⁻⁷`). Running the D1 exp instrument at
  partial-sum index `24` (lower) / `27` (upper) then gives

        cutLog(mass0/mass1) ∈ [81540604/1e7, 81540623/1e7]   (width `1.9×10⁻⁶`)

  — `≈ 1.6×` narrower than the parent's `[81540600/1e7, 81540630/1e7]` (width `3×10⁻⁶`) and NESTED inside
  it. (The true `cutLog(m01)` interval is `[8.15406052, 8.15406203]`, intrinsic width `1.5×10⁻⁶`; the
  reading is now within `≈ 4×10⁻⁷` of that floor at each end.)

  ## Front (2): `1/cutPi` pushed further via the SAME banked double-angle route

  The parent stopped `leastCosZero` at `[15707960/1e7, 15707964/1e7]` for balance, not because the route
  ran out. This node extends the well-conditioned near-`π/4` positivity lemma to `y < 7853981/1e7` (one
  more `1e7`-tick, `nlinarith` still closes with margin), giving `cutCos x > 0` for `x < 157079620/1e8`,
  and reads the split@6 upper sign at `157079635/1e8` (only `2.3×10⁻⁷` above the true `π/2 · 1e8 =
  157079632.7`). Hence

        leastCosZero ∈ [157079620/1e8, 157079635/1e8]         (width `1.5×10⁻⁷`)
        cutPi        ∈ [31415924/1e7, 31415927/1e7]           (width `3×10⁻⁷`)
        1/cutPi      ∈ [10000000/31415927, 10000000/31415924] (width `3×10⁻⁸`)

  — `≈ 2.7×` narrower than the parent's `1/cutPi` bracket, nested strictly inside it.

  ## The re-composed numeral

  Running the banked D4 pipeline (`endpoint_assembled_bracket` at census `d = chargeTraceDepth = 16/3`)
  with BOTH sharpened residuals:

        19211728054/282743343 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931662/70685829

  a certified two-sided rational bracket of `Cut` of width `≈ 1.52×10⁻⁶` — `≈ 1.90×` narrower than the
  parent's `≈ 2.87×10⁻⁶` and NESTED strictly inside it. The campaign's seventh rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision; the campaign continues. ★ THE UPDATED
  BOTTLENECK: after this node the `cutLog` and `1/cutPi` contributions are `≈ 1.08×10⁻⁶` and `≈ 4.4×10⁻⁷`
  respectively — `cutLog` remains the binding residual (its reading is now within `≈ 4×10⁻⁷` of its true
  floor at each end, so the next big win requires a still-tighter `m01`, i.e. deeper banked Born-square
  amplitude brackets `b0`/`b1`, not just a deeper exp index — the exp reading has nearly saturated the
  `m01` floor). The successor should push the `m01` floor (deeper amplitude brackets) and may push
  `leastCosZero` still nearer `π/2` via the same double-angle route.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index, NEVER by where the measured `1/α(0) ≈ 137.036` sits (the derived value lands `≈ 67.9476`,
  nowhere near it). The measured `1/α(0)` and `π` appear ONLY in this removable prose. Words-removable:
  every theorem below is a statement about certified rational brackets of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket5` only (transitively the whole banked chain). NO Mathlib ℝ/ℂ as content,
  NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO floats in production.
  Foundations-only.
-/
import Phys.Algebra.NarrowedBracket5

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) FRONT (2): `1/cutPi` pushed further via the fold's OWN double-angle identity.

    The parent stopped `leastCosZero` at `[15707960/1e7, 15707964/1e7]` for balance. This node extends
    the well-conditioned near-`π/4` positivity lemma by one `1e7`-tick and reads the split@6 upper sign
    one `1e8`-tick nearer the true zero — the same banked machinery (`cutCos_bracket` at split@6 +
    `cutCos_double`), no new instrument. -/

set_option maxHeartbeats 1200000 in
/-- EXTENDED near-`π/4` cosine lower bound: `cutCos y > 7071068/1e7` for `0 ≤ y < 7853981/1e7`
    (`= 157079620/2·1e8`). One `1e7`-tick beyond the parent's `cutCos_gt_invSqrt2_of_lt`; the
    well-conditioned split@6 `nlinarith` (cosine `≈ 0.707`, no cancellation) still closes with margin.
    The threshold `L = 7071068/1e7` still satisfies `L² − 1/2 = 2.66×10⁻⁸ > 0`, which the double-angle
    step needs. -/
theorem cutCos_gt_invSqrt2_ext (y : Cut) (hy0 : 0 ≤ y) (hy : y < 7853981 / 10000000) :
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

/-- THE EXTENDED STRUCTURAL LOWER POSITIVITY: `0 < cutCos x` for `0 ≤ x < 157079620/1e8`, via the
    double-angle identity `cutCos_double`. Sets `y = x/2 < 7853981/1e7`, gets `cutCos y > 7071068/1e7`
    (well-conditioned near `π/4`), then `cutCos x = 2·(cutCos y)² − 1 > 2·(7071068/1e7)² − 1 > 0`.
    Pushes the certified positivity out `≈ 1.3×10⁻⁷` beyond the parent's `15707960/1e7`. -/
theorem cutCos_pos_of_lt_157079620 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 157079620 / 100000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 2 := by linarith
  have hy : x / 2 < 7853981 / 10000000 := by linarith
  have hcy := cutCos_gt_invSqrt2_ext (x / 2) hy0 hy
  have hdbl := cutCos_double (x / 2)
  have hx2 : (2 : Cut) * (x / 2) = x := by ring
  rw [hx2] at hdbl
  rw [hdbl]
  nlinarith [hcy]

/-- THE SHARPER UPPER SIGN: `cutCos (157079635/1e8) < 0`. Read directly off the banked `cutCos_bracket`
    at split@6 (an EXACT rational near-cancellation `norm_num` handles). `157079635/1e8` is only
    `2.3×10⁻⁷` above the true `π/2` (parent's `15707964/1e7` was `6.7×10⁻⁷` above). -/
theorem cutCos_157079635_neg : cutCos (157079635 / 100000000 : Cut) < 0 := by
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

/-- `leastCosZero ≤ 157079635/1e8` (sharper UPPER bound): the IVT on `[0, 157079635/1e8]` supplies a
    cosine zero `≤ 157079635/1e8` (since `cutCos (157079635/1e8) < 0 ≤ cutCos 0`), and `csInf_le`. -/
theorem leastCosZero_le_157079635 : leastCosZero ≤ 157079635 / 100000000 := by
  have h02 : (0 : Cut) ≤ 157079635 / 100000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (157079635 / 100000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (157079635 / 100000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_157079635_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- `157079620/1e8 ≤ leastCosZero` (sharper LOWER bound): the cosine is strictly positive on
    `[0, 157079620/1e8)` (`cutCos_pos_of_lt_157079620`, via the double-angle route), so no zero lives
    below `157079620/1e8`, hence `157079620/1e8 ≤` the infimum (`le_csInf`). -/
theorem le_leastCosZero_157079620 : (157079620 / 100000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_157079620 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- THE FURTHER-SQUEEZED `cutPi` BRACKET: `cutPi ∈ [31415924/1e7, 31415927/1e7]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [157079620/1e8, 157079635/1e8]`. Width `3×10⁻⁷`.
    (`31415924/1e7 = 2·157079620/1e8`, `31415927/1e7 = 2·157079635/1e8`... `2·157079635/1e8 =
    31415927/1e7` exactly.) -/
theorem cutPi_bracket_ext : (31415924 / 10000000 : Cut) ≤ cutPi ∧ cutPi ≤ 31415927 / 10000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_157079620; linarith
  · have := leastCosZero_le_157079635; linarith

/-- THE FURTHER-SQUEEZED RESIDUAL BRACKET: `1/cutPi ∈ [10000000/31415927, 10000000/31415924]` — a
    certified two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 3×10⁻⁸`, nested
    strictly inside the parent's `[10000000/31415928, 1000000/3141592]` (`≈ 2.7×` narrower). -/
theorem inv_cutPi_bracket_ext :
    (10000000 / 31415927 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 10000000 / 31415924 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE FURTHER-SQUEEZED RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `10000000/31415927 <
    10000000/31415924` (a genuine reading of width `≈ 3×10⁻⁸`, not a collapsed point). -/
theorem inv_cutPi_ext_strict : (10000000 / 31415927 : Cut) < 10000000 / 31415924 := by norm_num

/-- W8 — THE further-squeezed `1/cutPi` BRACKET IS NESTED INSIDE the parent's double-angle bracket
    `[10000000/31415928, 1000000/3141592]`: `10000000/31415928 ≤ 10000000/31415927` and
    `10000000/31415924 ≤ 1000000/3141592` — the narrowing genuinely shrinks the bracket from BOTH ends. -/
theorem inv_cutPi_ext_nested :
    (10000000 / 31415928 : Cut) ≤ 10000000 / 31415927
      ∧ (10000000 / 31415924 : Cut) ≤ 1000000 / 3141592 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket6

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

/-! ## (B) FRONT (1): the sharpened `cutLog` content — the ACHIEVABLE `m01` floor at a deeper exp index.

    The banked Born-square amplitude brackets (`b0`/`b1` at width `3×10⁻⁸`, from `NarrowedBracket4`)
    genuinely pin `m01 = mass0/mass1 ∈ [3477.470772, 3477.476031]`; the parent read the rounded floor
    `[3477.470, 3477.477]`. This node reads the TIGHTER achievable rational floor
    `[34774707/10000, 34774761/10000]` and runs the D1 exp instrument at index `24`/`27`. -/

/-- THE ACHIEVABLE `m01` lower bracket: `34774707/10000 ≤ mass0/mass1` (i.e. `3477.4707 ≤`), from the
    SAME banked `mass0_lo_sharp` / `mass1_hi_sharp` (`nlinarith` margin `≈ 1.2×10⁻⁷`). Tighter than the
    parent's `3477470/1000 = 3477.470`. -/
theorem m01_lo_ach6 : (34774707 / 10000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_sharp, mass0_lo_sharp]

/-- THE ACHIEVABLE `m01` upper bracket: `mass0/mass1 ≤ 34774761/10000` (i.e. `≤ 3477.4761`), from the
    SAME banked `mass1_lo_sharp` / `mass0_hi_sharp` (`nlinarith` margin `≈ 1.1×10⁻⁷`). Width `5.4×10⁻³`
    — tighter than the parent's `7×10⁻³`. -/
theorem m01_hi_ach6 : mass0 / mass1 ≤ (34774761 / 10000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_sharp, mass0_hi_sharp]

set_option maxHeartbeats 800000 in
/-- THE SHARPENED `cutLog` CONTENT LOWER BRACKET: `81540604/1e7 ≤ cutLog(mass0/mass1)` (i.e.
    `8.1540604 ≤`). Composes `34774707/10000 ≤ mass0/mass1` (`m01_lo_ach6`) with `cutLog_ge_certified`
    at partial-sum index `24` through `cutLog_mono`. Tighter than the parent's `81540600/1e7`. -/
theorem cutLog_lo_ach6 : (81540604 / 10000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((34774707 : Cut) / 10000) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_ach6
  have hge : (81540604 / 10000000 : Cut) ≤ cutLog ((34774707 : Cut) / 10000) := by
    apply cutLog_ge_certified ((34774707 : Cut) / 10000) (81540604 / 10000000) 24 (by norm_num)
      (by norm_num)
    show partialExp (81540604 / 10000000) 24 + expRemBound (81540604 / 10000000) 24
      ≤ (34774707 : Cut) / 10000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

set_option maxHeartbeats 800000 in
/-- THE SHARPENED `cutLog` CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 81540623/1e7` (i.e.
    `≤ 8.1540623`). Composes `mass0/mass1 ≤ 34774761/10000` (`m01_hi_ach6`) with `cutLog_le_certified`
    at partial-sum index `27` through `cutLog_mono`. Width `1.9×10⁻⁶` — `≈ 1.6×` narrower than the
    parent's `3×10⁻⁶` and NESTED inside its `[81540600/1e7, 81540630/1e7]`. -/
theorem cutLog_hi_ach6 : cutLog (mass0 / mass1) ≤ (81540623 / 10000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 34774707 / 10000) m01_lo_ach6
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((34774761 : Cut) / 10000) :=
    cutLog_mono hpos m01_hi_ach6
  have hbnd : cutLog ((34774761 : Cut) / 10000) ≤ (81540623 / 10000000 : Cut) := by
    apply cutLog_le_certified ((34774761 : Cut) / 10000) (81540623 / 10000000) 27 (by norm_num)
      (by norm_num)
    show (34774761 : Cut) / 10000 ≤ partialExp (81540623 / 10000000) 27
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- W8 — THE SHARPENED `cutLog` BRACKET IS GENUINELY TWO-SIDED: `81540604/1e7 < 81540623/1e7` (a real
    reading of width `1.9×10⁻⁶`, not a collapsed point). -/
theorem cutLog_ach6_strict : (81540604 / 10000000 : Cut) < 81540623 / 10000000 := by norm_num

/-- W8 — THE SHARPENED `cutLog` BRACKET IS NESTED INSIDE the parent's `[81540600/1e7, 81540630/1e7]`:
    `81540600/1e7 ≤ 81540604/1e7` and `81540623/1e7 ≤ 81540630/1e7`. A monotone refinement. -/
theorem cutLog_ach6_nested :
    (81540600 / 10000000 : Cut) ≤ 81540604 / 10000000
      ∧ (81540623 / 10000000 : Cut) ≤ 81540630 / 10000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with BOTH
    residuals sharpened, at census `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [81540604/1e7, 81540623/1e7]` (`cutLog_lo_ach6` /
    `cutLog_hi_ach6`) and `1/cutPi ∈ [10000000/31415927, 10000000/31415924]` (`inv_cutPi_bracket_ext`):

        190/3 + (16/9)·(81540604/1e7)·(10000000/31415927)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(81540623/1e7)·(10000000/31415924),
        i.e.  19211728054/282743343 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931662/70685829.

    A certified two-sided rational bracket of `Cut` of width `≈ 1.52×10⁻⁶` — `≈ 1.90×` narrower than the
    parent's `[800488690/11780973, 80048852/1178097]` (width `≈ 2.87×10⁻⁶`) and NESTED strictly inside
    it. The campaign's seventh rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument
    certifiability, not tuned to a measured value. -/
theorem invAlphaZero_narrowed6_bracket :
    (19211728054 / 282743343 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931662 / 70685829 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (81540604 / 10000000) (81540623 / 10000000) (by norm_num) cutLog_lo_ach6 cutLog_hi_ach6
    (10000000 / 31415927) (10000000 / 31415924) (by norm_num)
    inv_cutPi_bracket_ext.1 inv_cutPi_bracket_ext.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (19211728054 / 282743343 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (81540604 / 10000000) * (10000000 / 31415927) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (81540623 / 10000000) * (10000000 / 31415924) : Cut)
        ≤ 4802931662 / 70685829 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with BOTH
    residuals sharpened, at `d = 16/3`:

        74 + (8/3)·(81540604/1e7)·(10000000/31415927) ≤ · ≤ 74 + (8/3)·(81540623/1e7)·(10000000/31415924),
        i.e.  7626660626/94247781 ≤ · ≤ 1906665028/23561943. -/
theorem dressed_narrowed6_bracket :
    (7626660626 / 94247781 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 1906665028 / 23561943 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (81540604 / 10000000) (81540623 / 10000000) (by norm_num) cutLog_lo_ach6 cutLog_hi_ach6
    (10000000 / 31415927) (10000000 / 31415924) (by norm_num)
    inv_cutPi_bracket_ext.1 inv_cutPi_bracket_ext.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (7626660626 / 94247781 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (81540604 / 10000000) * (10000000 / 31415927) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (81540623 / 10000000) * (10000000 / 31415924) : Cut)
        ≤ 1906665028 / 23561943 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `19211728054/282743343 < 4802931662/70685829`. -/
theorem invAlphaZero_narrowed6_strict :
    (19211728054 / 282743343 : Cut) < 4802931662 / 70685829 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-5): its width
    `4802931662/70685829 − 19211728054/282743343` is strictly below the parent's width
    `80048852/1178097 − 800488690/11780973`. This is the campaign's core progress tooth — the assembled
    bracket genuinely shrank a seventh time (BOTH fronts attacked: `cutLog` via the achievable `m01`
    floor at a deeper exp index, and `1/cutPi` via the fold's own double-angle identity pushed further). -/
theorem invAlphaZero_narrowed6_width_lt :
    (4802931662 / 70685829 - 19211728054 / 282743343 : Cut)
      < 80048852 / 1178097 - 800488690 / 11780973 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `800488690/11780973 ≤
    19211728054/282743343` and `4802931662/70685829 ≤ 80048852/1178097`. A monotone refinement — the new
    bracket sits entirely within the old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed6_nested :
    (800488690 / 11780973 : Cut) ≤ 19211728054 / 282743343
      ∧ (4802931662 / 70685829 : Cut) ≤ 80048852 / 1178097 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 19211728054/282743343` (the lepton tail runs `1/α` genuinely up at the physical census, not
    a collapse). -/
theorem invAlphaZero_narrowed6_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed6_bracket.1
  have hgt : (190 / 3 : Cut) < 19211728054 / 282743343 := by norm_num
  linarith

/-! ## (E) THE D5-next-6 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, SEVENTH RUNG (arc-D D5-next-6, welded landing). BOTH residual fronts
    sharpened again, and the D4 pipeline re-composed to a strictly narrower certified two-sided rational
    bracket of the derived `1/α(0)`:

    (1) THE FURTHER-SQUEEZED RESIDUAL: `1/cutPi ∈ [10000000/31415927, 10000000/31415924]`
        (`inv_cutPi_bracket_ext`), from `cutPi ∈ [31415924/1e7, 31415927/1e7]` (`cutPi_bracket_ext`),
        `leastCosZero ∈ [157079620/1e8, 157079635/1e8]` — the LOWER bound read via the fold's OWN
        double-angle identity `cutCos (2·y) = 2·(cutCos y)² − 1` (`cutCos_double`) with the near-`π/4`
        positivity lemma EXTENDED one tick (`cutCos_gt_invSqrt2_ext`); the UPPER bound from the split@6
        sign one tick nearer the true zero (`cutCos_157079635_neg`);
    (2) THE FURTHER-SHARPENED cutLog CONTENT: `cutLog(mass0/mass1) ∈ [81540604/1e7, 81540623/1e7]`
        (`cutLog_lo_ach6` / `cutLog_hi_ach6`) — read off the D1 exp instrument at partial-sum index `24`
        (lower) / `27` (upper) through the ACHIEVABLE DIRECT Born-square `m01` bracket
        `[34774707/10000, 34774761/10000]` (`m01_lo_ach6` / `m01_hi_ach6`) from the SAME banked amplitude
        brackets;
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `19211728054/282743343 ≤ invAlphaZero (completeBandList
        chargeTraceDepth) ≤ 4802931662/70685829` (`invAlphaZero_narrowed6_bracket`), width `≈ 1.52×10⁻⁶`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `7626660626/94247781 ≤ · ≤ 1906665028/23561943`
        (`dressed_narrowed6_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed6_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed6_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed6_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed6_gt_waypoint`); the residual and cutLog brackets are each strictly
        two-sided and nested (`inv_cutPi_ext_strict`/`inv_cutPi_ext_nested`,
        `cutLog_ach6_strict`/`cutLog_ach6_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is
    `≈ 1.90×` narrower than the parent's but still WIDE relative to the measured precision; the campaign
    continues. ★ THE UPDATED BOTTLENECK: `cutLog` remains the binding residual, but its reading is now
    within `≈ 4×10⁻⁷` of its true floor at each end — the exp instrument has nearly saturated the current
    `m01 = [3477.4707, 3477.4761]` floor, so the next big win requires a still-tighter `m01` (deeper
    banked Born-square amplitude brackets `b0`/`b1`), not just a deeper exp index; `leastCosZero` can
    still be pushed nearer `π/2` via the same double-angle route. The measured `1/α(0) ≈ 137.036` and `π`
    are REMOVABLE PROSE ONLY; no empirical number in any proof; explicit NO-FIT (the residual endpoints
    are chosen by instrument certifiability at the chosen index, not by the measured value; the derived
    value lands `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket6_landing :
    -- (1) the further-squeezed residual bracket (1/cutPi via the fold's own double-angle identity)
    ((10000000 / 31415927 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 10000000 / 31415924)
    ∧ ((31415924 / 10000000 : Cut) ≤ cutPi ∧ cutPi ≤ 31415927 / 10000000)
    -- (2) the further-sharpened cutLog content bracket (achievable m01 floor at deeper exp index)
    ∧ ((81540604 / 10000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 81540623 / 10000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((19211728054 / 282743343 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931662 / 70685829)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((7626660626 / 94247781 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 1906665028 / 23561943)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (19211728054 / 282743343 : Cut) < 4802931662 / 70685829
    ∧ ((4802931662 / 70685829 - 19211728054 / 282743343 : Cut)
        < 80048852 / 1178097 - 800488690 / 11780973)
    ∧ ((800488690 / 11780973 : Cut) ≤ 19211728054 / 282743343
        ∧ (4802931662 / 70685829 : Cut) ≤ 80048852 / 1178097)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext, cutPi_bracket_ext,
    ⟨cutLog_lo_ach6, cutLog_hi_ach6⟩,
    invAlphaZero_narrowed6_bracket, dressed_narrowed6_bracket,
    invAlphaZero_narrowed6_strict, invAlphaZero_narrowed6_width_lt,
    invAlphaZero_narrowed6_nested, invAlphaZero_narrowed6_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket6
