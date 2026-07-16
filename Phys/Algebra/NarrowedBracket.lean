/-
  # N### — ARC-D D5-next (SECOND NARROWING NODE, directed successor of D5/InvCutPiBracket): THE
    NARROWING CAMPAIGN, node 2 — TIGHTEN EVERY BRACKET and re-compose the assembled `1/α(0)` bracket
    to a STRICTLY NARROWER width over the derived ℝ `Cut`.

  ARC-D (THE DIGITS, docs/SEED_DIGITS.md §D5) is THE NARROWING CAMPAIGN — child as many narrowing
  nodes as it takes until the derived `1/α(0)` bracket is BELOW the measured uncertainty (the north
  star, D7). D5 (`InvCutPiBracket`) banked the FIRST fully-concrete numeral: at the derived census
  `d = chargeTraceDepth = 16/3`, the pipeline `endpoint_assembled_bracket` fed with the WIDE
  first-pass residual brackets `cutLog(mass0/mass1) ∈ [1,9]` (D4/D1) and `1/cutPi ∈ [5/17,5/14]`
  (D5 cos instrument) gave `1/α(0) ∈ [190/3 + 80/153, 190/3 + 180/7] = [63.86, 89.05]`, width `≈ 25.2`.
  THIS node tightens BOTH residuals and re-composes to a bracket `≈ 60×` narrower.

  ★ WHERE THE WIDTH ACTUALLY LIVES (the honest driver — not the ticket's headline residual). The
  assembled endpoint is `190/3 + (d/3)·cutLog(mass0/mass1)·(1/cutPi)`. Of the two residual factors,
  `cutLog(mass0/mass1)` DOMINATES the width: D5's lower bound `1` discards nearly all its content
  (the derived flavor ratio `mass0/mass1` is `≈ 3475`, so `cutLog ≈ 8.15` — a factor `~8` low). The
  `1/cutPi ∈ [5/17,5/14]` factor is only `~21%` wide. So the highest-ROI narrowing is BOTH, with the
  cutLog tightening carrying most of the collapse. This node tightens each on its own banked
  any-width instrument (`cosRemBound_lt` for `1/cutPi`, `expRemBound_lt`/`cutLog_le_certified` for
  `cutLog`) — the exact "aim the instrument deeper" step the campaign is made of.

  ★ THE TIGHTENED RESIDUALS (each read off a banked instrument at a DEEPER index):

    (1) `1/cutPi ∈ [5/16, 1/3]` (from `leastCosZero ∈ [3/2, 8/5]`, `cutPi ∈ [3, 16/5]`):
        • UPPER: `cutCos (8/5) < 0` (split@4, `partialCos_four = 1 − x²/2 + x⁴/24 − x⁶/720`, remainder
          `< 340144/11250000`), so the IVT supplies a cosine zero `≤ 8/5`, hence `leastCosZero ≤ 8/5`;
        • LOWER: `0 < cutCos x` for `0 ≤ x < 3/2` (split@3, `cosRemBound x 3 ≤ x⁶/360`, and
          `1 − x²/2 + x⁴/24 − x⁶/360 > 0` for `x² < 9/4`), so NO zero lives below `3/2`, hence
          `3/2 ≤ leastCosZero`. Tighter than D5's `[7/5, 17/10]` on both ends.

    (2) `cutLog(mass0/mass1) ∈ [8, 41/5]` (D1 exp instrument at a DEEPER partial-sum index):
        • LOWER `8 ≤ cutLog(mass0/mass1)`: compose the banked flavor bracket `1e9/288575 ≤ mass0/mass1`
          (`m01_bracket_lo`) with `cutLog_ge_certified` at index `10` (`partialExp 8 10 + expRemBound
          8 10 ≤ 1e9/288575` — a kernel-checkable rational inequality) through `cutLog_mono`;
        • UPPER `cutLog(mass0/mass1) ≤ 41/5`: compose `mass0/mass1 ≤ 1e9/286902` (`m01_bracket_hi`)
          with `cutLog_le_certified` at index `14` (`1e9/286902 ≤ partialExp (41/5) 14`) through
          `cutLog_mono`. Far tighter than D5's `[1, 9]` — the cutLog is pinned to width `1/5`.

  ★ THE RE-COMPOSED NARROWER NUMERAL. Feed BOTH tightened residuals into the banked D4
  `endpoint_assembled_bracket` at `d = chargeTraceDepth = 16/3`:

        190/3 + (16/9)·8·(5/16)  ≤  1/α(0)  ≤  190/3 + (16/9)·(41/5)·(1/3),
        i.e.  610/9  ≤  invAlphaZero (completeBandList chargeTraceDepth)  ≤  9206/135,

  a certified two-sided rational bracket of `Cut` of width `56/135 ≈ 0.415` — nested strictly inside
  D5's `[190/3+80/153, 190/3+180/7]` and `≈ 60×` narrower. The dressed endpoint at the derived weight
  `w = 1/3` lands `242/3 ≤ · ≤ 3658/45` the same way. This is the campaign's second rung; its
  successor tightens further (deeper cos/exp indices; a sharper `m01` flavor bracket).

  ★ NO-FIT (G2/G7 — the credibility guard). NO measured value steers ANY bracket. The cos endpoints
  `3/2`, `8/5` are chosen by where the derived cosine's SIGN is certifiable at the chosen split index,
  NOT by where `π/2` sits; the cutLog endpoints `8`, `41/5` are chosen by where the derived exp
  partial-sum brackets certify the derived flavor ratio's log, NOT by `137.036`. Truncating at the
  measured precision is FORBIDDEN — the campaign drives to MORE digits. The measured `1/α(0)` and `π`
  appear NOWHERE in any proof — removable prose only. The ANY-WIDTH guarantees (`cosRemBound_lt`,
  `expRemBound_lt`) prove the narrowing is a THEOREM path, not a hope.

  ★ THE ONE CAUSE (the trunk). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its `xⁿ/n!` and alternating `x²ⁿ/(2n)!` series converge, and forced `cutExp`/`cutLog`/`cutPi` now
  tightens every one of their rational brackets to any demanded width by taking one more term of the
  same series. One engine, one deeper reading — the exact instrument D5 built, aimed further.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in the content. Delete
  "coupling"/"fine-structure"/"census": the theorems are pure statements that a derived closed real of
  `Cut` (`invAlphaZero (completeBandList (16/3))`) is pinned between explicit rationals `610/9` and
  `9206/135`, read from certified two-sided rational brackets of `1/cutPi` and `cutLog(mass0/mass1)`.
  No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-compiled decision bypass, no bridge, NO
  Mathlib number-system content import, NO `Real.pi`/`Real.cos`/`Real.exp`, NO floats. The only Mathlib
  used is `tsum`/order/IVT/infimum/`norm_num` MACHINERY operating ON the derived `Cut`. Import guard:
  InvCutPiBracket (transitively AssembledBracket/D3/D2/D1/Z6/N325/N323) only; NEVER `Phys/OneAxiom/*`.
-/
import Phys.Algebra.InvCutPiBracket

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (A) THE TIGHTENED `1/cutPi` BRACKET — the D5 cos instrument aimed at a DEEPER split index and
    sharper rational endpoints. -/

/-- `partialCos x 4 = 1 − x²/2 + x⁴/24 − x⁶/720`. -/
theorem partialCos_four (x : Cut) : partialCos x 4 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

/-- ★ THE TIGHTER UPPER SIGN FACT: `cutCos (8/5) < 0`, split at index 4 (`partialCos (8/5) 4 =
    −340144/11250000`, remainder `< 340144/11250000`). Read off the cos instrument at a deeper index
    than D5's `cutCos (17/10) < 0`. -/
theorem cutCos_eight_fifths_neg : cutCos (8 / 5 : Cut) < 0 := by
  have hb := (cutCos_bracket (8 / 5) (by norm_num) 4 (by norm_num)).2
  rw [partialCos_four] at hb
  have hpart : (1 : Cut) - (8 / 5) ^ 2 / 2 + (8 / 5) ^ 4 / 24 - (8 / 5) ^ 6 / 720
      = -340144 / 11250000 := by norm_num
  rw [hpart] at hb
  have hrem : cosRemBound (8 / 5 : Cut) 4 < 340144 / 11250000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

/-- ★ THE TIGHTER LOWER POSITIVITY FACT: `0 < cutCos x` for `0 ≤ x < 3/2`, split at index 3
    (`cosRemBound x 3 ≤ x⁶/360`, and `1 − x²/2 + x⁴/24 − x⁶/360 > 0` for `x² < 9/4`). Extends D5's
    `< 7/5` positivity out to `< 3/2`. -/
theorem cutCos_pos_of_lt_three_halves (x : Cut) (hx0 : 0 ≤ x) (hx : x < 3 / 2) :
    0 < cutCos x := by
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

/-- ★ `leastCosZero ≤ 8/5` (tighter UPPER bound): the IVT on `[0,8/5]` supplies a cosine zero `≤ 8/5`
    (since `cutCos (8/5) < 0 ≤ cutCos 0`), and `csInf_le`. -/
theorem leastCosZero_le_eight_fifths : leastCosZero ≤ 8 / 5 := by
  have h02 : (0 : Cut) ≤ 8 / 5 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (8 / 5)) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (8 / 5)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_eight_fifths_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- ★ `3/2 ≤ leastCosZero` (tighter LOWER bound): the cosine is strictly positive on `[0,3/2)`, so no
    zero lives below `3/2`, hence `3/2 ≤` the infimum of the zero set (`le_csInf`). -/
theorem three_halves_le_leastCosZero : (3 / 2 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_three_halves b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- ★★ THE TIGHTER `cutPi` BRACKET: `cutPi ∈ [3, 16/5]`, from `cutPi = 2·leastCosZero` and
    `leastCosZero ∈ [3/2, 8/5]`. Nested strictly inside D5's `[14/5, 17/5]`. -/
theorem cutPi_bracket_tight : (3 : Cut) ≤ cutPi ∧ cutPi ≤ 16 / 5 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := three_halves_le_leastCosZero; linarith
  · have := leastCosZero_le_eight_fifths; linarith

/-- ★★★ THE TIGHTER RESIDUAL BRACKET: `1/cutPi ∈ [5/16, 1/3]` — a certified two-sided rational bracket
    of `Cut` for the derived `1/cutPi`, nested strictly inside D5's `[5/17, 5/14]`. -/
theorem inv_cutPi_bracket_tight : (5 / 16 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 1 / 3 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_tight
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- ★ W8 — THE TIGHTER RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `5/16 < 1/3` (the bounds do not cross;
    the tightened bracket is genuine, not collapsed). -/
theorem inv_cutPi_bracket_tight_strict : (5 / 16 : Cut) < 1 / 3 := by norm_num

/-- ★ W8 — THE TIGHTER `1/cutPi` BRACKET IS NESTED INSIDE D5's: `5/17 ≤ 5/16` and `1/3 ≤ 5/14` — the
    narrowing genuinely SHRINKS the bracket from both ends (a monotone-refinement tooth). -/
theorem inv_cutPi_tight_nested :
    (5 / 17 : Cut) ≤ 5 / 16 ∧ (1 / 3 : Cut) ≤ 5 / 14 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE TIGHTENED `cutLog` CONTENT BRACKET — the D1 exp instrument aimed at a DEEPER
    partial-sum index. -/

/-- ★★ THE TIGHTER cutLog CONTENT LOWER BRACKET: `8 ≤ cutLog(mass0/mass1)`. Composes the banked flavor
    bracket `1e9/288575 ≤ mass0/mass1` (`m01_bracket_lo`) with `cutLog_ge_certified` at partial-sum
    index `10` (the kernel-checkable rational inequality `partialExp 8 10 + expRemBound 8 10 ≤
    1e9/288575`) through `cutLog_mono`. Far tighter than D5's `1 ≤ cutLog` — this pins the DOMINANT
    width factor. -/
theorem cutLog_content_lo_tight : (8 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((1000000000 : Cut) / 288575) ≤ cutLog (mass0 / mass1) := by
    apply cutLog_mono (by norm_num)
    have := m01_bracket_lo; linarith
  have hge : (8 : Cut) ≤ cutLog ((1000000000 : Cut) / 288575) := by
    apply cutLog_ge_certified ((1000000000 : Cut) / 288575) 8 10 (by norm_num) (by norm_num)
    show partialExp 8 10 + expRemBound 8 10 ≤ (1000000000 : Cut) / 288575
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- ★★ THE TIGHTER cutLog CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 41/5`. Composes the banked
    flavor bracket `mass0/mass1 ≤ 1e9/286902` (`m01_bracket_hi`) with `cutLog_le_certified` at
    partial-sum index `14` (`1e9/286902 ≤ partialExp (41/5) 14`) through `cutLog_mono`. Far tighter
    than D5's `cutLog ≤ 9` — the cutLog is pinned to width `1/5`. -/
theorem cutLog_content_hi_tight : cutLog (mass0 / mass1) ≤ 41 / 5 := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 1000000000 / 288575) m01_bracket_lo
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono hpos m01_bracket_hi
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 41 / 5 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) (41 / 5) 14 (by norm_num) (by norm_num)
    show (1000000000 : Cut) / 286902 ≤ partialExp (41 / 5) 14
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- ★ W8 — THE TIGHTER cutLog CONTENT BRACKET IS GENUINELY TWO-SIDED: `8 < 41/5` (the bracket is a
    real reading of width `1/5`, not a collapsed point). -/
theorem cutLog_content_tight_strict : (8 : Cut) < 41 / 5 := by norm_num

/-- ★ W8 — THE TIGHTER cutLog BRACKET IS NESTED INSIDE D5's `[1,9]`: `1 ≤ 8` and `41/5 ≤ 9` — the
    narrowing genuinely shrinks the cutLog bracket from both ends. -/
theorem cutLog_content_tight_nested : (1 : Cut) ≤ 8 ∧ (41 / 5 : Cut) ≤ 9 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED NARROWER NUMERAL — the D4 assembled pipeline with BOTH tightened residuals,
    at the derived census `d = chargeTraceDepth = 16/3`. -/

/-- ★★★ THE NARROWED CONCRETE BRACKET of the derived `1/α(0)`. Feed BOTH tightened residuals —
    `cutLog(mass0/mass1) ∈ [8, 41/5]` and `1/cutPi ∈ [5/16, 1/3]` — into the banked D4
    `endpoint_assembled_bracket` at `d = chargeTraceDepth = 16/3`:

        190/3 + (16/9)·8·(5/16)  ≤  1/α(0)  ≤  190/3 + (16/9)·(41/5)·(1/3),
        i.e.  610/9  ≤  invAlphaZero (completeBandList chargeTraceDepth)  ≤  9206/135.

    A certified two-sided rational bracket of `Cut` of width `56/135 ≈ 0.415` — nested strictly inside
    D5's `[190/3+80/153, 190/3+180/7]` (width `≈ 25.2`) and `≈ 60×` narrower. The campaign's second
    rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument certifiability, not tuned to a
    measured value. -/
theorem invAlphaZero_narrowed_bracket :
    (610 / 9 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9206 / 135 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    8 (41 / 5) (by norm_num) cutLog_content_lo_tight cutLog_content_hi_tight
    (5 / 16) (1 / 3) (by norm_num) inv_cutPi_bracket_tight.1 inv_cutPi_bracket_tight.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (610 / 9 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * 8 * (5 / 16) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (41 / 5) * (1 / 3) : Cut)
        ≤ 9206 / 135 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- ★★ THE NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with BOTH
    residuals tightened, at `d = 16/3`:

        74 + (8/3)·8·(5/16)  ≤  ·  ≤  74 + (8/3)·(41/5)·(1/3),
        i.e.  242/3  ≤  ·  ≤  3658/45. -/
theorem dressed_narrowed_bracket :
    (242 / 3 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 3658 / 45 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    8 (41 / 5) (by norm_num) cutLog_content_lo_tight cutLog_content_hi_tight
    (5 / 16) (1 / 3) (by norm_num) inv_cutPi_bracket_tight.1 inv_cutPi_bracket_tight.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (242 / 3 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * 8 * (5 / 16) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (41 / 5) * (1 / 3) : Cut)
        ≤ 3658 / 45 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- ★ W8 — THE NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate): `610/9 < 9206/135`. -/
theorem invAlphaZero_narrowed_strict : (610 / 9 : Cut) < 9206 / 135 := by norm_num

/-- ★ W8 — THE NARROWED BRACKET IS STRICTLY NARROWER THAN D5's: its width `9206/135 − 610/9 = 56/135`
    is strictly below D5's width `(190/3+180/7) − (190/3+80/153) = 180/7 − 80/153`. This is the
    campaign's core progress tooth — the assembled bracket genuinely shrank. -/
theorem invAlphaZero_narrowed_width_lt :
    (9206 / 135 - 610 / 9 : Cut) < (190 / 3 + 180 / 7) - (190 / 3 + 80 / 153) := by norm_num

/-- ★ W8 — THE NARROWED BRACKET IS NESTED INSIDE D5's: `190/3+80/153 ≤ 610/9` and `9206/135 ≤
    190/3+180/7`. A monotone refinement — the new bracket sits entirely within the old, so no earlier
    reading is contradicted. -/
theorem invAlphaZero_narrowed_nested :
    (190 / 3 + 80 / 153 : Cut) ≤ 610 / 9 ∧ (9206 / 135 : Cut) ≤ 190 / 3 + 180 / 7 := by
  refine ⟨by norm_num, by norm_num⟩

/-- ★ W8 — THE NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT: `190/3 < 610/9`
    (the lepton tail runs `1/α` genuinely up at the physical census, not a collapse). -/
theorem invAlphaZero_narrowed_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed_bracket.1
  have hgt : (190 / 3 : Cut) < 610 / 9 := by norm_num
  linarith

/-! ## (E) THE D5-NEXT CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE NARROWING CAMPAIGN, SECOND RUNG (arc-D D5-next, welded landing). Both residuals tightened
    on their banked any-width instruments and the D4 pipeline re-composed to a strictly narrower
    certified two-sided rational bracket of the derived `1/α(0)`:

    (1) THE TIGHTER RESIDUAL: `1/cutPi ∈ [5/16, 1/3]` (`inv_cutPi_bracket_tight`), from
        `cutPi ∈ [3, 16/5]` (`cutPi_bracket_tight`), `leastCosZero ∈ [3/2, 8/5]` — read off the D5 cos
        instrument at split@4 (upper) / split@3 (lower);
    (2) THE TIGHTER cutLog CONTENT: `cutLog(mass0/mass1) ∈ [8, 41/5]` (`cutLog_content_lo_tight` /
        `_hi_tight`) — read off the D1 exp instrument at partial-sum index `10` (lower) / `14` (upper);
        the DOMINANT width factor, pinned to width `1/5`;
    (3) THE RE-COMPOSED NARROWER NUMERAL: `610/9 ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ≤ 9206/135` (`invAlphaZero_narrowed_bracket`), width `56/135 ≈ 0.415`;
    (4) THE DRESSED NARROWER BRACKET: `242/3 ≤ · ≤ 3658/45` (`dressed_narrowed_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed_strict`), strictly
        narrower than D5's (`invAlphaZero_narrowed_width_lt`), nested inside D5's
        (`invAlphaZero_narrowed_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed_gt_waypoint`); the residual and cutLog brackets are each strictly
        two-sided and nested (`inv_cutPi_bracket_tight_strict`/`inv_cutPi_tight_nested`,
        `cutLog_content_tight_strict`/`cutLog_content_tight_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is
    `≈ 60×` narrower than D5's but still WIDE relative to the measured precision; the campaign
    continues (this node's successor tightens further). The measured `1/α(0) ≈ 137.036` and `π` are
    REMOVABLE PROSE ONLY; no empirical number in any proof; explicit NO-FIT (the residual endpoints are
    chosen by instrument certifiability at the chosen index, not by the measured value). -/
theorem narrowedBracket_landing :
    -- (1) the tighter residual bracket
    ((5 / 16 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 1 / 3)
    ∧ ((3 : Cut) ≤ cutPi ∧ cutPi ≤ 16 / 5)
    -- (2) the tighter cutLog content bracket (the dominant width factor)
    ∧ ((8 : Cut) ≤ cutLog (mass0 / mass1) ∧ cutLog (mass0 / mass1) ≤ 41 / 5)
    -- (3) the re-composed narrower numeral
    ∧ ((610 / 9 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9206 / 135)
    -- (4) the dressed narrower bracket at the derived weight
    ∧ ((242 / 3 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 3658 / 45)
    -- (5) teeth: strictly two-sided, strictly narrower than D5, nested inside D5, screens above 190/3
    ∧ (610 / 9 : Cut) < 9206 / 135
    ∧ ((9206 / 135 - 610 / 9 : Cut) < (190 / 3 + 180 / 7) - (190 / 3 + 80 / 153))
    ∧ ((190 / 3 + 80 / 153 : Cut) ≤ 610 / 9 ∧ (9206 / 135 : Cut) ≤ 190 / 3 + 180 / 7)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_tight, cutPi_bracket_tight,
    ⟨cutLog_content_lo_tight, cutLog_content_hi_tight⟩,
    invAlphaZero_narrowed_bracket, dressed_narrowed_bracket,
    invAlphaZero_narrowed_strict, invAlphaZero_narrowed_width_lt,
    invAlphaZero_narrowed_nested, invAlphaZero_narrowed_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket
