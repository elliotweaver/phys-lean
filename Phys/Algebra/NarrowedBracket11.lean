/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 12 (D5-next-11)

  Directed successor of D5-next-10 (`Phys/Algebra/NarrowedBracket10.lean`). The twelfth narrowing rung.

  ## The bottleneck this node acts on (the anti-drift crux — the ONE LAW, read correctly)

  After D5-next-10 the `1/cutPi` residual was lifted onto a `1e10` grid and its contribution to the
  assembled width COLLAPSED to `≈ 2.9×10⁻¹⁰`, while the split@5 `cutLog ∈ [815406110/1e8, 815406115/1e8]`
  (contribution `≈ 2.83×10⁻⁸`, `≈ 100×` larger) became the SOLE binding residual. That is why the parent's
  assembled bracket only narrowed `≈ 1.09×`: all of the `1/cutPi` win now sits below the `cutLog` floor.
  The next win is a SHARPER `cutLog`, NOT a further `1/cutPi` grid lift (the parent's
  `inv_cutPi_bracket_ext5` is reused verbatim).

  ## The structural win: SHARPEN `cutLog` via a DEEPER Born-square `m01` bracket (split@6) at a deeper exp index.

  The `cutLog(mass0/mass1)` reading is `≈` the true value up to (a) the width of the `m01` bracket fed to
  the D1 exp instrument and (b) the exp remainder at the chosen partial-sum index. This node acts on BOTH:

    (1) `m01` FLOOR — read the SAME derived cycle-phase cosine numeral `cutCos(2/9)` ONE TERM DEEPER
        (split@6 via the banked `cutCos_bracket`, the ONE-CAUSE instrument that also reads `cutPi`'s least
        zero). `partialCos (2/9) 6 = 48209808201701/49425168884175`, remainder `cosRemBound (2/9) 6 ≈
        3.03×10⁻¹⁷`, giving `pB = cutCos(2/9) ∈ [975410085389447/1e15, 975410085389448/1e15]` (width
        `10⁻¹⁵`, was `10⁻¹⁰` at split@5). Re-propagating through the banked Born-square amplitude chain
        (`√2` sharpened to `10⁻¹⁵`, the conic root `r = √(3 − 3p²)` to `10⁻¹⁴`, products `w·p`, `w·r`,
        amplitudes `b0`, `b1`, Born-square masses `mass0 = b0²`, `mass1 = b1²`, direct quotient) gives

          m01 = mass0/mass1 ∈ [3477472837103/1e9, 3477472837106/1e9]  (width `3×10⁻⁶`, `≈ 40×` tighter
                                                                        than split@5's `1.2×10⁻⁴`)

    (2) exp INDEX — with the tighter `m01` the exp remainder at the parent's index `27/30` would dominate,
        so this node reads the D1 exp instrument at partial-sum index `36` (both ends). The exp remainder
        at `≈ 8.154` and index `36` is `≈ 2.2×10⁻⁹`, translating to a `cutLog`-gap `≈ 6.4×10⁻¹³` — well
        below the `m01`-induced width — so index `36` no longer limits.

  Together:

        cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]  (width `10⁻¹¹`)

  — `≈ 5000×` narrower than the parent's split@5 `[815406110/1e8, 815406115/1e8]` (width `5×10⁻⁸`) and
  NESTED strictly inside it. The `m01` floor was NOT irreducible: reading the SAME cosine numeral one
  term deeper (split@6) at a deeper exp index sharpens it.

  ## The re-composed numeral

  Running the banked D4 pipeline (`endpoint_assembled_bracket` at census `d = chargeTraceDepth = 16/3`)
  with this sharpened `cutLog` and the parent's `1e10`-grid `1/cutPi ∈ [1250000000/3926990817,
  5000000000/15707963267]` (reused verbatim):

    12007329939722/176714586765 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 16009773252014/235619449005

  a certified two-sided rational bracket of `Cut` of width `≈ 2.99×10⁻¹⁰` — `≈ 95×` narrower than the
  parent's `≈ 2.86×10⁻⁸` and NESTED strictly inside it (BOTH endpoints moved inward, since both `cutLog`
  bounds sharpened). The campaign's twelfth rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision (`≈ 2.99×10⁻¹⁰` vs the target `~2×10⁻¹⁰`
  relative — now within a small factor); the campaign continues.

  ★ THE UPDATED BOTTLENECK — A SHIFT BACK: with `cutLog` now sharpened to width `10⁻¹¹` its contribution
  to the assembled width has collapsed to `≈ 5.7×10⁻¹²`, and the `1e10`-grid `1/cutPi`
  (contribution `≈ 2.9×10⁻¹⁰`, `≈ 50×` larger) is ONCE AGAIN the sole binding residual. The NEXT rung's
  win is a SHARPER `1/cutPi` — a `1e11`-grid lift via the SAME banked double-double-angle route, re-aimed
  one digit deeper — not a further `cutLog` sharpening. The successor is directed at `1/cutPi` accordingly.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index (the split index / the exp partial-sum index), NEVER by where the measured `1/α(0) ≈
  137.036` sits (the derived value lands `≈ 67.9476`, nowhere near it). The measured `1/α(0)` and `π`
  appear ONLY in this removable prose. Words-removable: every theorem below is a statement about certified
  rational brackets of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket10` only (transitively the whole banked chain + the fold's own cosine
  bracket instrument `cutCos_bracket` and exp bracket instrument `cutLog_ge/le_certified`, `cutLog_mono`).
  NO Mathlib ℝ/ℂ as content, NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO
  floats in production. Foundations-only.
-/
import Phys.Algebra.NarrowedBracket10

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE split@6 read of the derived cycle-phase cosine `cutCos(2/9)` — one term deeper than the
    parent's split@5. The SAME `cutCos_bracket` instrument that reads `cutPi`'s least zero reads
    `cutCos(2/9)` to split@6, crushing its width from `10⁻¹⁰` to `10⁻¹⁵`. -/

/-- split@6 partial cosine at the cycle phase `2/9`: `partialCos (2/9) 6 = 48209808201701/49425168884175`
    (a pure ℚ computation, one term beyond the banked `partialCos_two_ninths_five`). -/
theorem partialCos_two_ninths_six :
    partialCos (2 / 9 : Cut) 6 = 48209808201701 / 49425168884175 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket11

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket10
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE SHARPENED `cutLog` CONTENT — the split@6 `cutCos(2/9)` read re-propagated through the
    banked Born-square amplitude chain to a `≈ 40×` tighter `m01`, fed to the D1 exp instrument at a
    deeper partial-sum index (`36`).

    The SAME `cutCos_bracket` instrument that reads `cutPi`'s least zero reads `cutCos(2/9)` to split@6,
    one term beyond `NarrowedBracket7`'s split@5. Everything below is the banked amplitude chain re-run
    with the sharper `pB`, a `√2` sharpened to `10⁻¹⁵`, and the conic root to `10⁻¹⁴` (the cos-mirror of
    `NarrowedBracket7`, one digit deeper). -/

/-- THE SHARPER `p = cutCos(2/9)` LOWER BRACKET at split@6: `975410085389447/1e15 ≤ cutCos(2/9)`
    (`partialCos (2/9) 6 − cosRemBound (2/9) 6 = 48209808201701/49425168884175 − ≤4×10⁻¹⁷ ≥
    975410085389447/1e15`). `≈ 10⁵×` tighter than `NarrowedBracket7`'s split@5 lower bound
    `9754100853/1e10`. -/
theorem pB_lo_s6 : (975410085389447 / 1000000000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 6 (by norm_num)).1
  rw [partialCos_two_ninths_six] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 6 ≤ 4 / 100000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (975410085389447 / 1000000000000000 : Cut)
      ≤ 48209808201701 / 49425168884175 - 4 / 100000000000000000 := by norm_num
  linarith

/-- THE SHARPER `p = cutCos(2/9)` UPPER BRACKET at split@6: `cutCos(2/9) ≤ 975410085389448/1e15`
    (`partialCos (2/9) 6 + cosRemBound (2/9) 6 ≤ 975410085389448/1e15`). Width `10⁻¹⁵` (was `10⁻¹⁰`). -/
theorem pB_hi_s6 : pB ≤ 975410085389448 / 1000000000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 6 (by norm_num)).2
  rw [partialCos_two_ninths_six] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 6 ≤ 4 / 100000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (48209808201701 / 49425168884175 + 4 / 100000000000000000 : Cut)
      ≤ 975410085389448 / 1000000000000000 := by norm_num
  linarith

/-- THE SHARPER `w = √2` LOWER BRACKET: `1414213562373095/1e15 ≤ wB` (from `wB·wB = 2`, `wB ≥ 0`). -/
theorem wB_lo_s6 : (1414213562373095 / 1000000000000000 : Cut) ≤ wB := by nlinarith [wB_ww, wB_nonneg]
/-- THE SHARPER `w = √2` UPPER BRACKET: `wB ≤ 1414213562373096/1e15` (from `wB·wB = 2`). Width `10⁻¹⁵`. -/
theorem wB_hi_s6 : wB ≤ 1414213562373096 / 1000000000000000 := by nlinarith [wB_ww, wB_nonneg]

/-- THE SHARPER CONIC ROOT LOWER BRACKET: `38174008953953/1e14 ≤ r` (from `r·r = 3 − 3p²`, the sharper
    `p` upper bound, `r ≥ 0`). -/
theorem rB_lo_s6 : (38174008953953 / 100000000000000 : Cut) ≤ rB := by
  have hp2hi : pB * pB ≤ (975410085389448 / 1000000000000000 : Cut) * (975410085389448 / 1000000000000000) :=
    mul_le_mul pB_hi_s6 pB_hi_s6 (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]
/-- THE SHARPER CONIC ROOT UPPER BRACKET: `r ≤ 19087004476977/5e13` (from `r·r = 3 − 3p²`, the sharper
    `p` lower bound). Width `10⁻¹⁴`. -/
theorem rB_hi_s6 : rB ≤ 19087004476977 / 50000000000000 := by
  have hp2lo : (975410085389447 / 1000000000000000 : Cut) * (975410085389447 / 1000000000000000) ≤ pB * pB :=
    mul_le_mul pB_lo_s6 pB_lo_s6 (by norm_num) (le_of_lt (by linarith [pB_lo_s6]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

/-- The sharper product `w·p` lower bracket. -/
theorem wp_lo_s6 : (689719085816627 / 500000000000000 : Cut) ≤ wB * pB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s6 pB_lo_s6 (by norm_num) (le_of_lt (by linarith [wB_lo_s6])))
/-- The sharper product `w·p` upper bracket. -/
theorem wp_hi_s6 : wB * pB ≤ (689719085816629 / 500000000000000 : Cut) :=
  le_trans (mul_le_mul wB_hi_s6 pB_hi_s6 (le_of_lt pB_pos) (by norm_num)) (by norm_num)
/-- The sharper product `w·r` lower bracket. -/
theorem wr_lo_s6 : (269931005964161 / 500000000000000 : Cut) ≤ wB * rB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s6 rB_lo_s6 (by norm_num) (le_of_lt (by linarith [wB_lo_s6])))
/-- The sharper product `w·r` upper bracket. -/
theorem wr_hi_s6 : wB * rB ≤ (269931005964169 / 500000000000000 : Cut) := by
  have hrpos : (0 : Cut) < rB := by linarith [rB_lo_s6]
  exact le_trans (mul_le_mul wB_hi_s6 rB_hi_s6 (le_of_lt hrpos) (by norm_num)) (by norm_num)

/-- The sharper amplitude `b0` lower bracket. -/
theorem b0_lo_s6 : (1189719085816627 / 500000000000000 : Cut) ≤ b0 := by unfold b0; linarith [wp_lo_s6]
/-- The sharper amplitude `b0` upper bracket. -/
theorem b0_hi_s6 : b0 ≤ (1189719085816629 / 500000000000000 : Cut) := by unfold b0; linarith [wp_hi_s6]
theorem b0_pos_s6 : (0 : Cut) < b0 := by have := b0_lo_s6; linarith
/-- The sharper amplitude `b1` lower bracket. -/
theorem b1_lo_s6 : (20174954109601 / 500000000000000 : Cut) ≤ b1 := by
  unfold b1; have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_hi_s6, wr_hi_s6]
/-- The sharper amplitude `b1` upper bracket. -/
theorem b1_hi_s6 : b1 ≤ (10087477054803 / 250000000000000 : Cut) := by
  unfold b1; have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_lo_s6, wr_lo_s6]
theorem b1_pos_s6 : (0 : Cut) < b1 := by have := b1_lo_s6; linarith

/-- The sharper Born-square mass `mass0 = b0²` lower bracket. -/
theorem mass0_lo_s6 :
    (1189719085816627 / 500000000000000 : Cut) * (1189719085816627 / 500000000000000) ≤ mass0 := by
  have := mul_le_mul b0_lo_s6 b0_lo_s6 (by norm_num) (le_of_lt b0_pos_s6)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass0 = b0²` upper bracket. -/
theorem mass0_hi_s6 :
    mass0 ≤ (1189719085816629 / 500000000000000 : Cut) * (1189719085816629 / 500000000000000) := by
  have := mul_le_mul b0_hi_s6 b0_hi_s6 (le_of_lt b0_pos_s6) (by norm_num)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` lower bracket. -/
theorem mass1_lo_s6 :
    (20174954109601 / 500000000000000 : Cut) * (20174954109601 / 500000000000000) ≤ mass1 := by
  have := mul_le_mul b1_lo_s6 b1_lo_s6 (by norm_num) (le_of_lt b1_pos_s6)
  unfold mass1; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` upper bracket. -/
theorem mass1_hi_s6 :
    mass1 ≤ (10087477054803 / 250000000000000 : Cut) * (10087477054803 / 250000000000000) := by
  have := mul_le_mul b1_hi_s6 b1_hi_s6 (le_of_lt b1_pos_s6) (by norm_num)
  unfold mass1; nlinarith [this]

/-- THE FURTHER-SHARPENED `m01` LOWER BRACKET: `3477472837103/1e9 ≤ mass0/mass1` (i.e. `3477.472837103 ≤`),
    from `mass0_lo_s6`/`mass1_hi_s6`. `≈ 40×` tighter than the split@5 `34774728371039/1e10`-scale floor. -/
theorem m01_lo_s6 : (3477472837103 / 1000000000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_s6, mass0_lo_s6]
/-- THE FURTHER-SHARPENED `m01` UPPER BRACKET: `mass0/mass1 ≤ 3477472837106/1e9` (i.e. `≤ 3477.472837106`),
    from `mass1_lo_s6`/`mass0_hi_s6`. Width `3×10⁻⁶` — `≈ 40×` tighter than split@5's `1.2×10⁻⁴`. -/
theorem m01_hi_s6 : mass0 / mass1 ≤ (3477472837106 / 1000000000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_s6, mass0_hi_s6]

set_option maxHeartbeats 2000000 in
/-- THE SHARPENED `cutLog` CONTENT LOWER BRACKET: `815406111272/1e11 ≤ cutLog(mass0/mass1)` (i.e.
    `8.15406111272 ≤`). Composes `3477472837103/1e9 ≤ mass0/mass1` (`m01_lo_s6`) with `cutLog_ge_certified`
    at partial-sum index `36` through `cutLog_mono`. Tighter than the parent's split@5
    `815406110/1e8 = 8.15406110`. -/
theorem cutLog_lo_s6 : (815406111272 / 100000000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((3477472837103 : Cut) / 1000000000) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_s6
  have hge : (815406111272 / 100000000000 : Cut) ≤ cutLog ((3477472837103 : Cut) / 1000000000) := by
    apply cutLog_ge_certified ((3477472837103 : Cut) / 1000000000) (815406111272 / 100000000000) 36
      (by norm_num) (by norm_num)
    show partialExp (815406111272 / 100000000000) 36 + expRemBound (815406111272 / 100000000000) 36
      ≤ (3477472837103 : Cut) / 1000000000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

set_option maxHeartbeats 2000000 in
/-- THE SHARPENED `cutLog` CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 815406111273/1e11` (i.e.
    `≤ 8.15406111273`). Composes `mass0/mass1 ≤ 3477472837106/1e9` (`m01_hi_s6`) with `cutLog_le_certified`
    at partial-sum index `36` through `cutLog_mono`. Width `10⁻¹¹` — `≈ 5000×` narrower than the parent's
    split@5 `5×10⁻⁸` and NESTED inside its `[815406110/1e8, 815406115/1e8]`. -/
theorem cutLog_hi_s6 : cutLog (mass0 / mass1) ≤ (815406111273 / 100000000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 3477472837103 / 1000000000) m01_lo_s6
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((3477472837106 : Cut) / 1000000000) :=
    cutLog_mono hpos m01_hi_s6
  have hbnd : cutLog ((3477472837106 : Cut) / 1000000000) ≤ (815406111273 / 100000000000 : Cut) := by
    apply cutLog_le_certified ((3477472837106 : Cut) / 1000000000) (815406111273 / 100000000000) 36
      (by norm_num) (by norm_num)
    show (3477472837106 : Cut) / 1000000000 ≤ partialExp (815406111273 / 100000000000) 36
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- W8 — THE SHARPENED `cutLog` BRACKET IS GENUINELY TWO-SIDED: `815406111272/1e11 < 815406111273/1e11`
    (a real reading of width `10⁻¹¹`, not a collapsed point). -/
theorem cutLog_s6_strict : (815406111272 / 100000000000 : Cut) < 815406111273 / 100000000000 := by
  norm_num

/-- W8 — THE SHARPENED `cutLog` BRACKET IS NESTED INSIDE the parent's split@5 `[815406110/1e8,
    815406115/1e8]`: `815406110/1e8 ≤ 815406111272/1e11` and `815406111273/1e11 ≤ 815406115/1e8`. A
    monotone refinement. -/
theorem cutLog_s6_nested :
    (815406110 / 100000000 : Cut) ≤ 815406111272 / 100000000000
      ∧ (815406111273 / 100000000000 : Cut) ≤ 815406115 / 100000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with the sharpened
    split@6 `cutLog` (now the binding win) and the parent's `1e10`-grid `1/cutPi` (reused verbatim), at
    census `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [815406111272/1e11, 815406111273/1e11]`
    (`cutLog_lo_s6` / `cutLog_hi_s6`) and `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]`
    (the parent's `inv_cutPi_bracket_ext5`, reused verbatim):

        190/3 + (16/9)·(815406111272/1e11)·(1250000000/3926990817)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(815406111273/1e11)·(5000000000/15707963267),
        i.e.  12007329939722/176714586765 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 16009773252014/235619449005.

    A certified two-sided rational bracket of `Cut` of width `≈ 2.99×10⁻¹⁰` — `≈ 95×` narrower than the
    parent's `[2401465987690/35342917353, 9605863954190/141371669403]` (width `≈ 2.86×10⁻⁸`) and NESTED
    strictly inside it (BOTH endpoints moved inward — both `cutLog` bounds sharpened via the split@6
    read). The campaign's twelfth rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument
    certifiability, not tuned to a measured value. ★ With `cutLog` now sharpened to `10⁻¹¹`, its
    contribution has dropped below the `1e10`-grid `1/cutPi` floor (`≈ 2.9×10⁻¹⁰`) — `1/cutPi` is once
    again the binding residual. -/
theorem invAlphaZero_narrowed11_bracket :
    (12007329939722 / 176714586765 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 16009773252014 / 235619449005 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (815406111272 / 100000000000) (815406111273 / 100000000000) (by norm_num) cutLog_lo_s6 cutLog_hi_s6
    (1250000000 / 3926990817) (5000000000 / 15707963267) (by norm_num)
    inv_cutPi_bracket_ext5.1 inv_cutPi_bracket_ext5.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (12007329939722 / 176714586765 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (815406111272 / 100000000000) * (1250000000 / 3926990817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (815406111273 / 100000000000) * (5000000000 / 15707963267) : Cut)
        ≤ 16009773252014 / 235619449005 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with the
    sharpened split@6 `cutLog` and the parent's `1e10`-grid `1/cutPi`, at `d = 16/3`:

        74 + (8/3)·(815406111272/1e11)·(1250000000/3926990817) ≤ · ≤ 74 + (8/3)·(815406111273/1e11)·(5000000000/15707963267),
        i.e.  4766662862506/58904862255 ≤ · ≤ 6355550482972/78539816335. -/
theorem dressed_narrowed11_bracket :
    (4766662862506 / 58904862255 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 6355550482972 / 78539816335 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (815406111272 / 100000000000) (815406111273 / 100000000000) (by norm_num) cutLog_lo_s6 cutLog_hi_s6
    (1250000000 / 3926990817) (5000000000 / 15707963267) (by norm_num)
    inv_cutPi_bracket_ext5.1 inv_cutPi_bracket_ext5.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (4766662862506 / 58904862255 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (815406111272 / 100000000000) * (1250000000 / 3926990817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (815406111273 / 100000000000) * (5000000000 / 15707963267) : Cut)
        ≤ 6355550482972 / 78539816335 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `12007329939722/176714586765 < 16009773252014/235619449005`. -/
theorem invAlphaZero_narrowed11_strict :
    (12007329939722 / 176714586765 : Cut) < 16009773252014 / 235619449005 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-10): its width
    `16009773252014/235619449005 − 12007329939722/176714586765` is strictly below the parent's width
    `9605863954190/141371669403 − 2401465987690/35342917353`. This is the campaign's core progress tooth
    — the assembled bracket genuinely shrank a twelfth time (`cutLog` sharpened `≈ 5000×` via the split@6
    cycle-phase cosine read re-propagated to a `≈ 40×` tighter `m01` at exp index `36`). -/
theorem invAlphaZero_narrowed11_width_lt :
    (16009773252014 / 235619449005 - 12007329939722 / 176714586765 : Cut)
      < 9605863954190 / 141371669403 - 2401465987690 / 35342917353 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `2401465987690/35342917353 ≤
    12007329939722/176714586765` (lower moved inward) and `16009773252014/235619449005 ≤
    9605863954190/141371669403` (upper moved inward). A monotone refinement from BOTH ends — the new
    bracket sits entirely within the old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed11_nested :
    (2401465987690 / 35342917353 : Cut) ≤ 12007329939722 / 176714586765
      ∧ (16009773252014 / 235619449005 : Cut) ≤ 9605863954190 / 141371669403 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 12007329939722/176714586765` (the lepton tail runs `1/α` genuinely up at the physical
    census, not a collapse). -/
theorem invAlphaZero_narrowed11_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed11_bracket.1
  have hgt : (190 / 3 : Cut) < 12007329939722 / 176714586765 := by norm_num
  linarith

/-! ## (E) THE D5-next-11 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, TWELFTH RUNG (arc-D D5-next-11, welded landing). The sole binding residual
    (after D5-next-10 lifted `1/cutPi` onto a `1e10` grid) was the split@5 `cutLog`; this node SHARPENED
    it `≈ 5000×` by reading the SAME cycle-phase cosine numeral `cutCos(2/9)` one term deeper (split@6),
    re-propagating through the banked Born-square amplitude chain to a `≈ 40×` tighter `m01`, and reading
    the D1 exp instrument at a deeper partial-sum index (`36`); the parent's `1e10`-grid `1/cutPi` is
    reused verbatim; and the D4 pipeline is re-composed to a strictly narrower certified two-sided
    rational bracket of the derived `1/α(0)`:

    (1) THE `1e10`-GRID RESIDUAL (reused verbatim from the parent):
        `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]` (`inv_cutPi_bracket_ext5`);
    (2) THE FURTHER-SHARPENED cutLog CONTENT (the binding win): `cutLog(mass0/mass1) ∈
        [815406111272/1e11, 815406111273/1e11]` (`cutLog_lo_s6` / `cutLog_hi_s6`) — read off the D1 exp
        instrument at partial-sum index `36` through the `≈ 40×` tighter Born-square `m01` bracket
        `[3477472837103/1e9, 3477472837106/1e9]` (`m01_lo_s6` / `m01_hi_s6`), itself from the split@6
        `cutCos(2/9)` read (`pB_lo_s6` / `pB_hi_s6`) re-propagated through the banked amplitude chain;
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `12007329939722/176714586765 ≤ invAlphaZero
        (completeBandList chargeTraceDepth) ≤ 16009773252014/235619449005` (`invAlphaZero_narrowed11_bracket`),
        width `≈ 2.99×10⁻¹⁰`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `4766662862506/58904862255 ≤ · ≤ 6355550482972/78539816335`
        (`dressed_narrowed11_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed11_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed11_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed11_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed11_gt_waypoint`); the cutLog bracket is strictly two-sided and nested
        (`cutLog_s6_strict` / `cutLog_s6_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is
    `≈ 95×` narrower than the parent's — now within a small factor of the measured precision — but the
    campaign continues. ★ THE UPDATED BOTTLENECK — A SHIFT BACK: with `cutLog` now at width `10⁻¹¹` its
    contribution to the assembled width collapsed to `≈ 5.7×10⁻¹²`; the `1e10`-grid `1/cutPi`
    (contribution `≈ 2.9×10⁻¹⁰`, `≈ 50×` larger) is ONCE AGAIN the sole binding residual. The next win is
    a SHARPER `1/cutPi` (a `1e11`-grid lift via the SAME banked double-double-angle route, one digit
    deeper), NOT a further `cutLog` sharpening. The measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE
    PROSE ONLY; no empirical number in any proof; explicit NO-FIT (the residual endpoints are chosen by
    instrument certifiability at the chosen index, not by the measured value; the derived value lands
    `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket11_landing :
    -- (1) the `1e10`-grid residual bracket (1/cutPi, reused verbatim from the parent)
    ((1250000000 / 3926990817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5000000000 / 15707963267)
    -- (2) the further-sharpened cutLog content bracket (split@6 m01 floor at exp index 36, the binding win)
    ∧ ((815406111272 / 100000000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406111273 / 100000000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((12007329939722 / 176714586765 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 16009773252014 / 235619449005)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((4766662862506 / 58904862255 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 6355550482972 / 78539816335)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (12007329939722 / 176714586765 : Cut) < 16009773252014 / 235619449005
    ∧ ((16009773252014 / 235619449005 - 12007329939722 / 176714586765 : Cut)
        < 9605863954190 / 141371669403 - 2401465987690 / 35342917353)
    ∧ ((2401465987690 / 35342917353 : Cut) ≤ 12007329939722 / 176714586765
        ∧ (16009773252014 / 235619449005 : Cut) ≤ 9605863954190 / 141371669403)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext5,
    ⟨cutLog_lo_s6, cutLog_hi_s6⟩,
    invAlphaZero_narrowed11_bracket, dressed_narrowed11_bracket,
    invAlphaZero_narrowed11_strict, invAlphaZero_narrowed11_width_lt,
    invAlphaZero_narrowed11_nested, invAlphaZero_narrowed11_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket11
