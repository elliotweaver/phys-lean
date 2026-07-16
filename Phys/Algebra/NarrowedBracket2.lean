/-
  # N### — ARC-D D5-next-2 (THIRD NARROWING NODE, directed successor of D5-next/NarrowedBracket):
    THE NARROWING CAMPAIGN, node 3 — TIGHTEN FURTHER and re-compose the assembled `1/α(0)` bracket
    to a STRICTLY NARROWER width over the derived ℝ `Cut`.

  ARC-D (THE DIGITS, docs/SEED_DIGITS.md §D5) is THE NARROWING CAMPAIGN — child as many narrowing
  nodes as it takes until the derived `1/α(0)` bracket is BELOW the measured uncertainty (the north
  star, D7). D5-next (`NarrowedBracket`) banked the second rung: at the derived census
  `d = chargeTraceDepth = 16/3`, the pipeline `endpoint_assembled_bracket` fed with
  `cutLog(mass0/mass1) ∈ [8, 41/5]` (D1 exp instrument index 10/14) and `1/cutPi ∈ [5/16, 1/3]`
  (D5 cos instrument split@4/@3) gave `610/9 ≤ 1/α(0) ≤ 9206/135`, width `56/135 ≈ 0.415`. THIS node
  aims BOTH instruments deeper and re-composes to a bracket `≈ 9.2×` narrower still.

  ★ WHERE THE WIDTH ACTUALLY LIVES NOW (the honest driver — the crux that decides WHAT to tighten and
  WHAT the successor must attack). The assembled endpoint is
  `190/3 + (d/3)·cutLog(mass0/mass1)·(1/cutPi)`. After D5-next the two residuals contributed
  comparably. This node pins `cutLog` essentially to its IRREDUCIBLE FLOOR: the banked flavor ratio
  `mass0/mass1` is only known to `[1e9/288575, 1e9/286902]` (the N340 `massRatio` brackets,
  `288575 = 485·595`, `286902 = 483·594`), whose `cutLog` spans a true range of width `≈ 0.0058`
  (`[8.1506, 8.1564]`). This node's `cutLog ∈ [163/20, 8157/1000] = [8.150, 8.157]` (width `0.007`) is
  AT that floor — `cutLog` is now SPENT against the current `m01` bracket, and cannot narrow further
  without a SHARPER `m01` (a job for the successor, per the seed's REPEATED-DEFERRAL note). `1/cutPi`
  has NO such floor (`cosRemBound_lt` guarantees any width), so it becomes the sole freely-squeezable
  residual from here on — this node already tightens it to `[25/79, 250/783]` and the successor keeps
  aiming the cos instrument deeper.

  ★ THE TIGHTENED RESIDUALS (each read off a banked instrument at a DEEPER/SHARPER reading):

    (1) `1/cutPi ∈ [25/79, 250/783]` (from `leastCosZero ∈ [783/500, 79/50]`, `cutPi ∈ [783/250, 79/25]`):
        • UPPER: `cutCos (79/50) < 0` (split@4, `partialCos (79/50) 4 = −114081380521/11250000000000`,
          remainder `< 114081380521/11250000000000`), so the IVT supplies a cosine zero `≤ 79/50`,
          hence `leastCosZero ≤ 79/50`;
        • LOWER: `0 < cutCos x` for `0 ≤ x < 783/500` (split@4, `cosRemBound x 4 ≤ x⁸/20160`, and
          `1 − x²/2 + x⁴/24 − x⁶/720 − x⁸/20160 > 0` for `x² < 613089/250000`), so NO zero lives below
          `783/500`, hence `783/500 ≤ leastCosZero`. Tighter than D5-next's `[3/2, 8/5]` on both ends.

    (2) `cutLog(mass0/mass1) ∈ [163/20, 8157/1000] = [8.150, 8.157]` (D1 exp instrument at a DEEPER
        partial-sum index — pinned to the `m01` floor):
        • LOWER `163/20 ≤ cutLog(mass0/mass1)`: compose `1e9/288575 ≤ mass0/mass1` (`m01_bracket_lo`)
          with `cutLog_ge_certified` at index `16` (`partialExp (163/20) 16 + expRemBound (163/20) 16
          ≤ 1e9/288575`) through `cutLog_mono`;
        • UPPER `cutLog(mass0/mass1) ≤ 8157/1000`: compose `mass0/mass1 ≤ 1e9/286902` (`m01_bracket_hi`)
          with `cutLog_le_certified` at index `20` (`1e9/286902 ≤ partialExp (8157/1000) 20`) through
          `cutLog_mono`. Width `7/1000` — essentially the `m01` floor `≈ 0.0058`.

  ★ THE RE-COMPOSED NARROWER NUMERAL. Feed BOTH tightened residuals into the banked D4
  `endpoint_assembled_bracket` at `d = chargeTraceDepth = 16/3`:

        190/3 + (16/9)·(163/20)·(25/79)  ≤  1/α(0)  ≤  190/3 + (16/9)·(8157/1000)·(250/783),
        i.e.  48290/711  ≤  invAlphaZero (completeBandList chargeTraceDepth)  ≤  159646/2349,

  a certified two-sided rational bracket of `Cut` of width `8344/185571 ≈ 0.0450` — nested strictly
  inside D5-next's `[610/9, 9206/135]` (width `≈ 0.415`) and `≈ 9.2×` narrower. The dressed endpoint at
  the derived weight `w = 1/3` lands `19168/237 ≤ · ≤ 63380/783` the same way. This is the campaign's
  third rung; its successor must SHARPEN THE `m01` FLAVOR BRACKET (the now-binding floor on `cutLog`)
  and keep aiming the cos instrument deeper for `1/cutPi`.

  ★ NO-FIT (G2/G7 — the credibility guard). NO measured value steers ANY bracket. The cos endpoints
  `783/500`, `79/50` are chosen by where the derived cosine's SIGN is certifiable at split@4, NOT by
  where `π/2` sits; the cutLog endpoints `163/20`, `8157/1000` are chosen by where the derived exp
  partial-sum brackets certify the derived flavor ratio's log against the banked `m01` bracket, NOT by
  `137.036`. Truncating at the measured precision is FORBIDDEN — the campaign drives to MORE digits.
  The measured `1/α(0) ≈ 137.036` (the derived value lands `≈ 68`, nowhere near it) and `π` appear
  NOWHERE in any proof — removable prose only. The ANY-WIDTH guarantees (`cosRemBound_lt`,
  `expRemBound_lt`) prove the narrowing is a THEOREM path, not a hope.

  ★ THE ONE CAUSE (the trunk). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its `xⁿ/n!` and alternating `x²ⁿ/(2n)!` series converge, and forced `cutExp`/`cutLog`/`cutPi` now
  tightens every one of their rational brackets to any demanded width by taking one more term of the
  same series. One engine, one deeper reading — the exact instrument D5 built, aimed further.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in the content. Delete
  "coupling"/"fine-structure"/"census": the theorems are pure statements that a derived closed real of
  `Cut` (`invAlphaZero (completeBandList (16/3))`) is pinned between explicit rationals `48290/711` and
  `159646/2349`, read from certified two-sided rational brackets of `1/cutPi` and `cutLog(mass0/mass1)`.
  No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-compiled decision bypass, no bridge, NO
  Mathlib number-system content import, NO `Real.pi`/`Real.cos`/`Real.exp`, NO floats. The only Mathlib
  used is `tsum`/order/IVT/infimum/`norm_num` MACHINERY operating ON the derived `Cut`. Import guard:
  NarrowedBracket (transitively InvCitPiBracket/AssembledBracket/D3/D2/D1/Z6/N325/N323) only; NEVER
  `Phys/OneAxiom/*`.
-/
import Phys.Algebra.NarrowedBracket

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (A) THE FURTHER-TIGHTENED `1/cutPi` BRACKET — the D5 cos instrument aimed at split@4 on BOTH
    ends with sharper rational endpoints. -/

/-- ★ THE TIGHTER UPPER SIGN FACT: `cutCos (79/50) < 0`, split at index 4 (`partialCos (79/50) 4 =
    −114081380521/11250000000000`, remainder `< 114081380521/11250000000000`). Read off the cos
    instrument at a sharper endpoint than D5-next's `cutCos (8/5) < 0`. -/
theorem cutCos_seventynine_fiftieths_neg : cutCos (79 / 50 : Cut) < 0 := by
  have hb := (cutCos_bracket (79 / 50) (by norm_num) 4 (by norm_num)).2
  rw [partialCos_four] at hb
  have hpart : (1 : Cut) - (79 / 50) ^ 2 / 2 + (79 / 50) ^ 4 / 24 - (79 / 50) ^ 6 / 720
      = -114081380521 / 11250000000000 := by norm_num
  rw [hpart] at hb
  have hrem : cosRemBound (79 / 50 : Cut) 4 < 114081380521 / 11250000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

/-- ★ THE TIGHTER LOWER POSITIVITY FACT: `0 < cutCos x` for `0 ≤ x < 783/500`, split at index 4
    (`cosRemBound x 4 ≤ x⁸/20160`, and `1 − x²/2 + x⁴/24 − x⁶/720 − x⁸/20160 > 0` for
    `x² < 613089/250000`). Extends D5-next's `< 3/2` positivity out to `< 783/500`. -/
theorem cutCos_pos_of_lt_seven_eight_three_five_hundredths (x : Cut) (hx0 : 0 ≤ x)
    (hx : x < 783 / 500) : 0 < cutCos x := by
  have hx2 : x ^ 2 < 613089 / 250000 := by nlinarith [hx0, hx]
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

/-- ★ `leastCosZero ≤ 79/50` (tighter UPPER bound): the IVT on `[0,79/50]` supplies a cosine zero
    `≤ 79/50` (since `cutCos (79/50) < 0 ≤ cutCos 0`), and `csInf_le`. -/
theorem leastCosZero_le_seventynine_fiftieths : leastCosZero ≤ 79 / 50 := by
  have h02 : (0 : Cut) ≤ 79 / 50 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (79 / 50)) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (79 / 50)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_seventynine_fiftieths_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- ★ `783/500 ≤ leastCosZero` (tighter LOWER bound): the cosine is strictly positive on `[0,783/500)`,
    so no zero lives below `783/500`, hence `783/500 ≤` the infimum of the zero set (`le_csInf`). -/
theorem seven_eight_three_five_hundredths_le_leastCosZero : (783 / 500 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_seven_eight_three_five_hundredths b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- ★★ THE FURTHER-TIGHTER `cutPi` BRACKET: `cutPi ∈ [783/250, 79/25]`, from `cutPi = 2·leastCosZero`
    and `leastCosZero ∈ [783/500, 79/50]`. Nested strictly inside D5-next's `[3, 16/5]`. -/
theorem cutPi_bracket_tighter : (783 / 250 : Cut) ≤ cutPi ∧ cutPi ≤ 79 / 25 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := seven_eight_three_five_hundredths_le_leastCosZero; linarith
  · have := leastCosZero_le_seventynine_fiftieths; linarith

/-- ★★★ THE FURTHER-TIGHTER RESIDUAL BRACKET: `1/cutPi ∈ [25/79, 250/783]` — a certified two-sided
    rational bracket of `Cut` for the derived `1/cutPi`, nested strictly inside D5-next's `[5/16, 1/3]`. -/
theorem inv_cutPi_bracket_tighter : (25 / 79 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 250 / 783 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_tighter
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- ★ W8 — THE FURTHER-TIGHTER RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `25/79 < 250/783` (the bounds do
    not cross; the tightened bracket is genuine, not collapsed). -/
theorem inv_cutPi_bracket_tighter_strict : (25 / 79 : Cut) < 250 / 783 := by norm_num

/-- ★ W8 — THE FURTHER-TIGHTER `1/cutPi` BRACKET IS NESTED INSIDE D5-next's: `5/16 ≤ 25/79` and
    `250/783 ≤ 1/3` — the narrowing genuinely SHRINKS the bracket from both ends (a monotone-refinement
    tooth). -/
theorem inv_cutPi_tighter_nested :
    (5 / 16 : Cut) ≤ 25 / 79 ∧ (250 / 783 : Cut) ≤ 1 / 3 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket2

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE FURTHER-TIGHTENED `cutLog` CONTENT BRACKET — the D1 exp instrument aimed at a DEEPER
    partial-sum index, pinned to the `m01` flavor floor. -/

/-- ★★ THE FURTHER-TIGHTER cutLog CONTENT LOWER BRACKET: `163/20 ≤ cutLog(mass0/mass1)` (i.e.
    `8.150 ≤`). Composes the banked flavor bracket `1e9/288575 ≤ mass0/mass1` (`m01_bracket_lo`) with
    `cutLog_ge_certified` at partial-sum index `16` (the kernel-checkable rational inequality
    `partialExp (163/20) 16 + expRemBound (163/20) 16 ≤ 1e9/288575`) through `cutLog_mono`. Tighter
    than D5-next's `8 ≤ cutLog` — this pins the residual to the `m01` floor. -/
theorem cutLog_content_lo_tighter : (163 / 20 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((1000000000 : Cut) / 288575) ≤ cutLog (mass0 / mass1) := by
    apply cutLog_mono (by norm_num)
    have := m01_bracket_lo; linarith
  have hge : (163 / 20 : Cut) ≤ cutLog ((1000000000 : Cut) / 288575) := by
    apply cutLog_ge_certified ((1000000000 : Cut) / 288575) (163 / 20) 16 (by norm_num) (by norm_num)
    show partialExp (163 / 20) 16 + expRemBound (163 / 20) 16 ≤ (1000000000 : Cut) / 288575
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- ★★ THE FURTHER-TIGHTER cutLog CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 8157/1000` (i.e.
    `≤ 8.157`). Composes the banked flavor bracket `mass0/mass1 ≤ 1e9/286902` (`m01_bracket_hi`) with
    `cutLog_le_certified` at partial-sum index `20` (`1e9/286902 ≤ partialExp (8157/1000) 20`) through
    `cutLog_mono`. Tighter than D5-next's `cutLog ≤ 41/5` — the cutLog is pinned to width `7/1000`,
    essentially the `m01` floor `≈ 0.0058`. -/
theorem cutLog_content_hi_tighter : cutLog (mass0 / mass1) ≤ 8157 / 1000 := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 1000000000 / 288575) m01_bracket_lo
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono hpos m01_bracket_hi
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 8157 / 1000 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) (8157 / 1000) 20 (by norm_num) (by norm_num)
    show (1000000000 : Cut) / 286902 ≤ partialExp (8157 / 1000) 20
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- ★ W8 — THE FURTHER-TIGHTER cutLog CONTENT BRACKET IS GENUINELY TWO-SIDED: `163/20 < 8157/1000`
    (the bracket is a real reading of width `7/1000`, not a collapsed point). -/
theorem cutLog_content_tighter_strict : (163 / 20 : Cut) < 8157 / 1000 := by norm_num

/-- ★ W8 — THE FURTHER-TIGHTER cutLog BRACKET IS NESTED INSIDE D5-next's `[8, 41/5]`: `8 ≤ 163/20` and
    `8157/1000 ≤ 41/5` — the narrowing genuinely shrinks the cutLog bracket from both ends. -/
theorem cutLog_content_tighter_nested : (8 : Cut) ≤ 163 / 20 ∧ (8157 / 1000 : Cut) ≤ 41 / 5 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED FURTHER-NARROWER NUMERAL — the D4 assembled pipeline with BOTH tightened
    residuals, at the derived census `d = chargeTraceDepth = 16/3`. -/

/-- ★★★ THE FURTHER-NARROWED CONCRETE BRACKET of the derived `1/α(0)`. Feed BOTH tightened residuals —
    `cutLog(mass0/mass1) ∈ [163/20, 8157/1000]` and `1/cutPi ∈ [25/79, 250/783]` — into the banked D4
    `endpoint_assembled_bracket` at `d = chargeTraceDepth = 16/3`:

        190/3 + (16/9)·(163/20)·(25/79)  ≤  1/α(0)  ≤  190/3 + (16/9)·(8157/1000)·(250/783),
        i.e.  48290/711  ≤  invAlphaZero (completeBandList chargeTraceDepth)  ≤  159646/2349.

    A certified two-sided rational bracket of `Cut` of width `8344/185571 ≈ 0.0450` — nested strictly
    inside D5-next's `[610/9, 9206/135]` (width `≈ 0.415`) and `≈ 9.2×` narrower. The campaign's third
    rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument certifiability, not tuned to a
    measured value. -/
theorem invAlphaZero_narrowed2_bracket :
    (48290 / 711 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 159646 / 2349 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (163 / 20) (8157 / 1000) (by norm_num) cutLog_content_lo_tighter cutLog_content_hi_tighter
    (25 / 79) (250 / 783) (by norm_num) inv_cutPi_bracket_tighter.1 inv_cutPi_bracket_tighter.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (48290 / 711 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (163 / 20) * (25 / 79) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (8157 / 1000) * (250 / 783) : Cut)
        ≤ 159646 / 2349 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- ★★ THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with BOTH
    residuals tightened, at `d = 16/3`:

        74 + (8/3)·(163/20)·(25/79)  ≤  ·  ≤  74 + (8/3)·(8157/1000)·(250/783),
        i.e.  19168/237  ≤  ·  ≤  63380/783. -/
theorem dressed_narrowed2_bracket :
    (19168 / 237 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 63380 / 783 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (163 / 20) (8157 / 1000) (by norm_num) cutLog_content_lo_tighter cutLog_content_hi_tighter
    (25 / 79) (250 / 783) (by norm_num) inv_cutPi_bracket_tighter.1 inv_cutPi_bracket_tighter.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (19168 / 237 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (163 / 20) * (25 / 79) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (8157 / 1000) * (250 / 783) : Cut)
        ≤ 63380 / 783 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate): `48290/711 <
    159646/2349`. -/
theorem invAlphaZero_narrowed2_strict : (48290 / 711 : Cut) < 159646 / 2349 := by norm_num

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN D5-next's: its width
    `159646/2349 − 48290/711 = 8344/185571` is strictly below D5-next's width `9206/135 − 610/9 =
    56/135`. This is the campaign's core progress tooth — the assembled bracket genuinely shrank
    again. -/
theorem invAlphaZero_narrowed2_width_lt :
    (159646 / 2349 - 48290 / 711 : Cut) < 9206 / 135 - 610 / 9 := by norm_num

/-- ★ W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE D5-next's: `610/9 ≤ 48290/711` and
    `159646/2349 ≤ 9206/135`. A monotone refinement — the new bracket sits entirely within the old, so
    no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed2_nested :
    (610 / 9 : Cut) ≤ 48290 / 711 ∧ (159646 / 2349 : Cut) ≤ 9206 / 135 := by
  refine ⟨by norm_num, by norm_num⟩

/-- ★ W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT: `190/3 <
    48290/711` (the lepton tail runs `1/α` genuinely up at the physical census, not a collapse). -/
theorem invAlphaZero_narrowed2_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed2_bracket.1
  have hgt : (190 / 3 : Cut) < 48290 / 711 := by norm_num
  linarith

/-! ## (E) THE D5-next-2 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE NARROWING CAMPAIGN, THIRD RUNG (arc-D D5-next-2, welded landing). Both residuals tightened
    on their banked any-width instruments and the D4 pipeline re-composed to a strictly narrower
    certified two-sided rational bracket of the derived `1/α(0)`:

    (1) THE FURTHER-TIGHTER RESIDUAL: `1/cutPi ∈ [25/79, 250/783]` (`inv_cutPi_bracket_tighter`), from
        `cutPi ∈ [783/250, 79/25]` (`cutPi_bracket_tighter`), `leastCosZero ∈ [783/500, 79/50]` — read
        off the D5 cos instrument at split@4 on BOTH ends;
    (2) THE FURTHER-TIGHTER cutLog CONTENT: `cutLog(mass0/mass1) ∈ [163/20, 8157/1000]`
        (`cutLog_content_lo_tighter` / `_hi_tighter`) — read off the D1 exp instrument at partial-sum
        index `16` (lower) / `20` (upper); pinned to the `m01` flavor floor (width `7/1000`);
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `48290/711 ≤ invAlphaZero (completeBandList
        chargeTraceDepth) ≤ 159646/2349` (`invAlphaZero_narrowed2_bracket`), width `8344/185571 ≈ 0.045`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `19168/237 ≤ · ≤ 63380/783` (`dressed_narrowed2_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed2_strict`), strictly
        narrower than D5-next's (`invAlphaZero_narrowed2_width_lt`), nested inside D5-next's
        (`invAlphaZero_narrowed2_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed2_gt_waypoint`); the residual and cutLog brackets are each strictly
        two-sided and nested (`inv_cutPi_bracket_tighter_strict`/`inv_cutPi_tighter_nested`,
        `cutLog_content_tighter_strict`/`cutLog_content_tighter_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is
    `≈ 9.2×` narrower than D5-next's but still WIDE relative to the measured precision; the campaign
    continues. ★ THE NEW BOTTLENECK, NAMED: `cutLog` is now pinned to the `m01` flavor-bracket FLOOR
    (its irreducible width `≈ 0.0058`), so the successor MUST SHARPEN THE `m01` BRACKET
    (`massRatio_1_2`/`massRatio_2_0` in `GenerationMassRatiosNumeric`) to narrow `cutLog` further;
    `1/cutPi` has no floor and keeps squeezing via deeper cos indices. The measured `1/α(0) ≈ 137.036`
    and `π` are REMOVABLE PROSE ONLY; no empirical number in any proof; explicit NO-FIT (the residual
    endpoints are chosen by instrument certifiability at the chosen index, not by the measured value). -/
theorem narrowedBracket2_landing :
    -- (1) the further-tighter residual bracket
    ((25 / 79 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 250 / 783)
    ∧ ((783 / 250 : Cut) ≤ cutPi ∧ cutPi ≤ 79 / 25)
    -- (2) the further-tighter cutLog content bracket (pinned to the m01 floor)
    ∧ ((163 / 20 : Cut) ≤ cutLog (mass0 / mass1) ∧ cutLog (mass0 / mass1) ≤ 8157 / 1000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((48290 / 711 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 159646 / 2349)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((19168 / 237 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 63380 / 783)
    -- (5) teeth: strictly two-sided, strictly narrower than D5-next, nested inside D5-next, screens above 190/3
    ∧ (48290 / 711 : Cut) < 159646 / 2349
    ∧ ((159646 / 2349 - 48290 / 711 : Cut) < 9206 / 135 - 610 / 9)
    ∧ ((610 / 9 : Cut) ≤ 48290 / 711 ∧ (159646 / 2349 : Cut) ≤ 9206 / 135)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_tighter, cutPi_bracket_tighter,
    ⟨cutLog_content_lo_tighter, cutLog_content_hi_tighter⟩,
    invAlphaZero_narrowed2_bracket, dressed_narrowed2_bracket,
    invAlphaZero_narrowed2_strict, invAlphaZero_narrowed2_width_lt,
    invAlphaZero_narrowed2_nested, invAlphaZero_narrowed2_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket2
