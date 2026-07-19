/-
  # D7 DRESSED NARROWING RUNG 1 — sharpen the DERIVED edge logs to `≈ 10⁻¹²` and re-assemble a
  #   `≈ 13-significant-digit` certified restatement of the TRULY-CLOSED COMPOSED (depth-2-running)
  #   census-conserving endpoint `recomposedEndpointDressed` AS `1/α(0)`
  #   (arc-D THE DIGITS, docs/SEED_DIGITS.md §D5/§D7; directed successor of N573 `D7AboveFloorExact`
  #   87be64e, owner R2 v4, NO-BLOCK mandate, t_2b137452)
  =================================================================================================

  OWNER-DIRECTED (t_2b137452, run 892; owner R2 v4, NO-BLOCK mandate). Directed successor of
  `D7AboveFloorExact` (which discharged owner step 2 — the hadronic above-floor occupancy contributes
  EXACTLY ZERO to the census-conserving endpoint, so the D7 composition-completeness ledger is TRULY
  CLOSED) and `D7DepthTwoComposed` (which composed the FOLD-FORCED all-orders depth-2 running into the
  endpoint, moving it to `recomposedEndpointDressed ≈ 137.0997` with the `≈ 5`-significant-digit bracket
  `[137.0984, 137.1006]`). This node is the FIRST NARROWING RUNG over the truly-closed COMPOSED endpoint:
  it sharpens EVERY dominant derived edge-log input from `≈ 10⁻⁷` (the `D7NarrowingRung1`-grade wired into
  `D7DepthTwoComposed`) to `≈ 10⁻¹²`, re-assembles through the DRESSED normal form, and lands a
  `≈ 13`-significant-digit certified two-sided rational bracket.

  ## RESUME (SOUL start-of-run mandate) — re-establishing KNOWN-GOOD deep instruments over the COMPLETE object

  The deep edge-log instruments used here (`cutLog_b0_r2`/`cutLog_b2_r2`/`cutLog_mb_r2`, width `≈ 10⁻¹²`)
  were fully worked and committed green TWICE (git `82d8aaa`, `11c746d`; 22–23 decls foundations-only,
  deepest cert `N = 29/30`) but REVERTED BOTH TIMES for a COMPLETENESS concern — narrowing the endpoint
  then would have polished a provably INCOMPLETE sum (the depth-2 running was not yet composed, the
  above-floor was only a bound). That concern is NOW RESOLVED: `D7DepthTwoComposed` composed the fold-forced
  depth-2 running (the endpoint is the COMPLETE `recomposedEndpointDressed`), and `D7AboveFloorExact` closed
  the above-floor ledger to an EXACT ZERO. So the deep instruments are legitimately re-established NOW,
  applied to the COMPOSED (dressed) endpoint — a RESUME of the furthest banked-and-reverted probe, not a
  re-derivation.

  ## THE ONE-LAW SENSITIVITY DIAGNOSIS (banked platform + exact-ℚ probe, NOT re-deriving)

  The composed endpoint's dressed normal form (`recomposedEndpointDressed_normalform`, banked) is
      recomposedEndpointDressed = 2425/18 + κ·(3·L_m01 + (7/2)·L_mb + (11/2)·L_b0 − (5/2)·L_b2),
  with `κ = (1/cutPi)/3`, `L_m01 = cutLog(mass0/mass1)`, `L_mb = cutLog mbRatioDerived`,
  `L_b0 = cutLog (bMass 0) = cutLog mass0`, `L_b2 = cutLog (bMass 2) = cutLog mass2` (the `(3/2)`-scaled
  coefficients of the depth-2-running composition). With the edge logs at `≈ 10⁻¹²`, `L_m01` at the banked
  `s6` grid `≈ 10⁻¹¹`, and `κ` at the banked `ext6` window (width `≈ 6.75×10⁻¹³`):
    • `L_b0` width `10⁻¹²` → endpoint contribution `≈ (11/2)·κ·10⁻¹² ≈ 5.8×10⁻¹³`;
    • `L_b2` width `10⁻¹²` → `≈ (5/2)·κ·10⁻¹² ≈ 2.7×10⁻¹³`;
    • `L_mb` width `2×10⁻¹²` → `≈ (7/2)·κ·2×10⁻¹² ≈ 7.4×10⁻¹³`;
    • `L_m01` width `10⁻¹¹` (`s6` cap) → `≈ 3·κ·10⁻¹¹ ≈ 3.2×10⁻¹²`;
    • ★ `κ = (1/cutPi)/3` width `≈ 6.75×10⁻¹³` (from `inv_cutPi_bracket_ext6`) → `≈ 6.75×10⁻¹³·C ≈ 1.5×10⁻¹¹`
      — the NEW DOMINANT residual.
  So the assembled endpoint width is `≈ 2.0×10⁻¹¹`, giving a clean `[1370996710997/1e10, 1370996710998/1e10]
  = [137.0996710997, 137.0996710998]` — `≈ 13 significant digits` (up from `≈ 5`).
  ⛔ HONEST: this rung does NOT reach the `≥15`-digit floor. After it, the DOMINANT residual is
  `κ = 1/cutPi` (`≈ 1.5×10⁻¹¹`, from the `1e11` `cutCos` positivity grid `ext6`), then `L_m01` (`≈ 3×10⁻¹²`,
  the `s6` mass grid) — NOT the edge logs. The `≥15`-digit floor therefore needs the NEXT rung: `1/cutPi`
  ONE DECADE DEEPER (a `1e12` `cutCos` double-double-angle grid, one past the banked `ext6` in
  `NarrowedBracket12`) + `L_m01` at an `s7` grid. NAMED and handed to the ONE directed successor.

  ## WHAT THIS NODE BANKS (all THEOREM-EXACT / CERTIFIED, foundations-only, no error bar)

    (1) THE SHARPENED HEAVY SHAPE LOG: `L_b0 = cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`
        (`cutLog_b0_r2`, width `10⁻¹²`), from the banked sharp `mass0 ∈ [5661726012625402/1e15,
        5661726012625422/1e15]` (`D7NarrowingRung1.mass0_clean_lo`/`hi`, from NB11 `s6`) through the banked
        exp instrument (`cutLog_ge_certified` N=21, `cutLog_le_certified` N=22) + `cutLog_mono`.
    (2) THE SHARPENED LIGHT SHAPE LOG: `L_b2 = cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`
        (`cutLog_b2_r2`, width `10⁻¹²`), from the sharp `mass2 = b2²` (NB11 `s6` products `wB·pB`, `wB·rB`
        → `b2 ∈ [580211920147532/1e15, 580211920147542/1e15]` → `mass2 ∈ [336645872281286/1e15,
        336645872281298/1e15]`) through the reciprocal `cutLog(1/mass2)` (N=17/18) + `cutLog_inv_pos`.
    (3) THE SHARPENED UP/DOWN RELATIVE LOG: `L_mb = cutLog mbRatioDerived ∈ [−4089306640008/1e12,
        −4089306640006/1e12]` (`cutLog_mb_r2`, width `2×10⁻¹²`), from the CLOSED FORM `(1−q)²/(3(1+q))`
        with the banked `q² = 1/2` sharpened to `q ∈ [7071067811865/1e13, 7071067811866/1e13]` →
        `mbRatioDerived ∈ [16750843898049/1e15, 16750843898062/1e15]`, read through the reciprocal
        `cutLog(1/mbRatioDerived)` (N=29/30).
    (4) THE `bMass`-shape restatements `cutLog_bMass0_r2`/`cutLog_bMass2_r2` (as the dressed normal form
        uses `cutLog (bMass 0)`, `cutLog (bMass 2)`; `bMass 0 = mass0`, `bMass 2 = mass2` by `rfl`).
    (5) THE DRESSED ABSTRACT ARITHMETIC CORE `dressed_core_r2` (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the
        deep bracket hypotheses; transcendentals OUT of the arithmetic): the DRESSED normal form
        `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2)` lands in `[1370996710997/1e10,
        1370996710998/1e10]` via the inner combination `∈ [224069277834/1e10, 224069277835/1e10]`.
    (6) ★★★ THE RE-ASSEMBLED RESTATEMENT AS `1/α(0)`: `1370996710997/1e10 ≤ recomposedEndpointDressed ≤
        1370996710998/1e10` (`recomposedEndpointDressed_restated_r2`, `[137.0996710997, 137.0996710998]`,
        width `10⁻¹⁰`, ≈ 13 significant digits `137.0996710997`) — nested strictly inside the banked
        `D7DepthTwoComposed` `[137.0984, 137.1006]` from both ends.
    (7) THE PREDICTION (sharper still): `137 < recomposedEndpointDressed` re-certified from the sharp lower
        bound (`recomposedEndpointDressed_gt_137_r2`). The composed endpoint sits `≈ 0.064` ABOVE the
        measured `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof). NO-FIT absolute.
    (8) W8 TEETH: each sharpened bracket is genuinely two-sided (`_strict`); the re-assembled bracket is
        two-sided; each `r2` window strictly improves the banked `D7DepthTwoComposed`-grade endpoint bracket
        from both ends (`dressed_r2_improves_banked`).

  ## THE HONEST GRADE / SCOPE (SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT / CERTIFIED NOW: (1)–(8) — exact inequalities / certified rational brackets of `Cut`/ℚ,
  foundations-only, no error bar. This rung takes the COMPOSED endpoint from `≈ 5` to `≈ 13` significant
  digits.

  ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted /
  NEVER fitted): the ⛔ OWNER `≥15`-SIGNIFICANT-DIGIT FLOOR. The DOMINANT residual is now `κ = 1/cutPi`
  (`≈ 1.5×10⁻¹¹`, the `1e11` `cutCos` positivity grid `ext6`), then `L_m01` (`≈ 3×10⁻¹²`, the `s6` mass
  grid) — NOT the edge logs. Rung 2: push `1/cutPi` one decade deeper (a `1e12` `cutCos` double-double-angle
  grid, one past the banked `ext6`) + read `mass0/mass1` at an `s7` grid → endpoint `≈ 10⁻¹³`. NOT a block:
  forward autonomous structural work remains, and no path here fits a measured value or needs a new axiom.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete every physics word: what remains, over the derived ℝ `Cut`, is that
  `1733728794954/1e12 ≤ cutLog mass0 ≤ 1733728794955/1e12`; that `−1088723725224/1e12 ≤ cutLog mass2 ≤
  −1088723725223/1e12`; that `−4089306640008/1e12 ≤ cutLog mbRatioDerived ≤ −4089306640006/1e12`; that
  `1370996710997/1e10 ≤ recomposedEndpointDressed ≤ 1370996710998/1e10`; and that
  `137 < recomposedEndpointDressed`. Pure real / rational arithmetic on the banked derived objects. No
  theorem STATEMENT needs a physics word.

  ## NOT FREE-FLOATING (seed / SOUL rail)

  Every production TYPE mentions the banked derived objects (`recomposedEndpointDressed` / `mass0` / `mass2`
  / `mbRatioDerived` / `bMass` / `kappaLeading` / `cutLog` / `cutPi`, over the derived ℝ `Cut`). The brackets
  are certified readings of the banked objects; FALSE over an algebra without the banked two-channel /
  census / depth-tower / Born-square-mass / fold-phase / continuum stack — not generic.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — every sharpened bracket FALLS OUT of a banked numeral bracket (`mass0_clean_*`,
    the NB11 `s6` products, `q_sq`, `mbRatioDerived_closed`) + the banked `ContinuumBracket` exp instrument;
    the endpoint bracket is COMPUTED by `dressed_core_r2`, not premised.
  - G2 NO EMPIRICAL NUMBER — no `137.036`, no PDG, no measured `α` in any statement or proof; the measured
    `1/α(0) ≈ 137.036` is removable orientation prose; NO bracket / index is selected BECAUSE of where the
    measured value sits. The exclusion `137 < ·` is a certified consequence of the DERIVATION. Explicit NO-FIT.
  - G3 EXACT / CERTIFIED — every landing is an exact inequality of `Cut`/ℚ or a certified rational bracket;
    the ONE open front (the `κ ext7` `≥15`-digit floor) is NAMED and handed forward.
  - G4 DERIVED, NOT POSITED — `recomposedEndpointDressed` (`D7DepthTwoComposed`), `kappaLeading`, `mass0`/
    `mass2`/`mbRatioDerived`, the `κ` bracket (NB12 `ext6`), all banked derived over the derived ℝ `Cut`.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass. Ground field the DERIVED ℝ `Cut`; NO Mathlib `Real`/
    `Complex` as content — Mathlib is MACHINERY only; NO floats. `set_option maxHeartbeats 2000000` is the
    banked NB11 exp-cert convention (NOT inflation; the deepest cert `N = 29/30` measured `≈ 12s` in a
    bounded probe at `82d8aaa`, W9).
  - G7 ONE LAW — we did NOT grind the endpoint directly; we DIAGNOSED (banked platform + exact-ℚ probe) that
    after the edge logs the NEW bottleneck is `κ = 1/cutPi`, not the edge logs; sharpened the edge logs
    through the same banked instrument (re-establishing the KNOWN-GOOD reverted deep lemmas over the now-COMPLETE
    object), wired in the banked sharp `L_m01` + `κ` FREE, and NAMED the `κ ext7` push as the next rung. No
    fit, no weakened floor, no asserted digit. The endpoint bracket assembly stays in the abstract arithmetic
    core `dressed_core_r2` (transcendentals out — W9).
  - G8 TEETH (W8) — each sharpened bracket is strictly two-sided; the re-assembled bracket is strictly
    two-sided; each `r2` window strictly improves the banked `D7DepthTwoComposed`-grade bracket from both ends.

  DEPENDENCIES (all banked, foundations-only): `D7DepthTwoComposed` (`recomposedEndpointDressed`,
  `recomposedEndpointDressed_normalform`, `cInner`); `D7NarrowingRung1` (`mass0_clean_lo`/`hi`,
  `cutLog_m01_sharp` context, the rung-1 pattern); `D7CompositionAttestation` (`kappa_bracket`);
  `NarrowedBracket11` (`wp_lo_s6`/`hi_s6`, `wr_lo_s6`/`hi_s6`); `GenerationMassRatios` (`b2`, `mass0`,
  `mass2`, `mass0_pos`, `mass2_pos`); `UpDownRelativeScaleFoldPhase` (`mbRatioDerived`,
  `mbRatioDerived_closed`, `mbRatioDerived_pos`, `q`, `q_sq`, `q_pos`, `q_lt_one`);
  `FreezeoutEdgeCrossSectorReduction` (`bMass`); `ComposedFreezeoutDissolved` (`cutLog_inv_pos`);
  `AssembledBracket` (`cutLog_mono`); `ContinuumBracket` (`cutLog_ge_certified`, `cutLog_le_certified`,
  `partialExp`, `expRemBound`); the derived `Cut`. Standard Mathlib `norm_num`/`ring`/`nlinarith`/`linarith`/
  `mul_le_mul` MACHINERY on the DERIVED objects (STANDARD §3). NO posited value as content, NO Mathlib ℝ as
  content, NO bridge.
-/
import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.D7DressedNarrowingRung1

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.AssembledBracket
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7CompositionAttestation
open Phys.Algebra.D7NarrowingRung1
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE SHARPENED HEAVY SHAPE LOG `L_b0 = cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`. -/

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED HEAVY SHAPE LOG BRACKET (deep, `r2`): `1733728794954/1e12 ≤ cutLog mass0 ≤
    1733728794955/1e12` (`≈ 1.733728794954…`). Width `10⁻¹²` — ≈ 10⁵× tighter than the
    `D7NarrowingRung1`-grade `[17337287/1e7, 17337288/1e7]`. From the banked sharp `mass0 ∈
    [5661726012625402/1e15, 5661726012625422/1e15]` (`mass0_clean_lo`/`hi`, from NB11 `s6`) through the exp
    instrument (`cutLog_ge_certified` N=21, `cutLog_le_certified` N=22) + `cutLog_mono`. -/
theorem cutLog_b0_r2 :
    (1733728794954 : Cut) / 1000000000000 ≤ cutLog mass0
      ∧ cutLog mass0 ≤ 1733728794955 / 1000000000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  refine ⟨?_, ?_⟩
  · have hcert : (1733728794954 : Cut) / 1000000000000
        ≤ cutLog (5661726012625402 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625402 / 1000000000000000) (1733728794954 / 1000000000000) 21
        (by norm_num) (by norm_num)
      show partialExp (1733728794954 / 1000000000000 : Cut) 21
          + expRemBound (1733728794954 / 1000000000000 : Cut) 21
        ≤ (5661726012625402 : Cut) / 1000000000000000
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((5661726012625402 : Cut) / 1000000000000000) ≤ cutLog mass0 :=
      cutLog_mono (by norm_num) mass0_clean_lo
    linarith
  · have hmono : cutLog mass0 ≤ cutLog ((5661726012625422 : Cut) / 1000000000000000) :=
      cutLog_mono hpos mass0_clean_hi
    have hcert : cutLog ((5661726012625422 : Cut) / 1000000000000000)
        ≤ (1733728794955 : Cut) / 1000000000000 := by
      apply cutLog_le_certified (5661726012625422 / 1000000000000000) (1733728794955 / 1000000000000) 22
        (by norm_num) (by norm_num)
      show (5661726012625422 : Cut) / 1000000000000000
        ≤ partialExp (1733728794955 / 1000000000000 : Cut) 22
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

/-! ## (B) THE SHARPENED LIGHT SHAPE LOG `L_b2 = cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`.
    The sharp `mass2` comes from the NB11 `s6` products `wB·pB`, `wB·rB`. -/

/-- The `s6` `b2` bracket from the banked NB11 `s6` products: `b2 = 1 − (wB·pB − wB·rB)/2 ∈
    [580211920147532/1e15, 580211920147542/1e15]`. -/
theorem b2_r2_lo : (580211920147532 : Cut) / 1000000000000000 ≤ b2 := by
  unfold b2
  have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
  rw [he]
  linarith [Phys.Algebra.NarrowedBracket11.wp_hi_s6, Phys.Algebra.NarrowedBracket11.wr_lo_s6]

theorem b2_r2_hi : b2 ≤ (580211920147542 : Cut) / 1000000000000000 := by
  unfold b2
  have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
  rw [he]
  linarith [Phys.Algebra.NarrowedBracket11.wp_lo_s6, Phys.Algebra.NarrowedBracket11.wr_hi_s6]

theorem b2_r2_pos : (0 : Cut) < b2 := by have := b2_r2_lo; linarith

/-- The sharp `mass2 = b2²` bracket: `mass2 ∈ [336645872281286/1e15, 336645872281298/1e15]`. -/
theorem mass2_r2_lo : (336645872281286 : Cut) / 1000000000000000 ≤ mass2 := by
  have := mul_le_mul b2_r2_lo b2_r2_lo (by norm_num) (le_of_lt b2_r2_pos)
  unfold mass2; nlinarith [this]

theorem mass2_r2_hi : mass2 ≤ (336645872281298 : Cut) / 1000000000000000 := by
  have := mul_le_mul b2_r2_hi b2_r2_hi (le_of_lt b2_r2_pos) (by norm_num)
  unfold mass2; nlinarith [this]

/-- The sharp `1/mass2` bracket by reciprocal-monotonicity:
    `1/mass2 ∈ [1e15/336645872281298, 1e15/336645872281286]`. -/
theorem invMass2_r2 :
    (1000000000000000 : Cut) / 336645872281298 ≤ 1 / mass2
      ∧ 1 / mass2 ≤ 1000000000000000 / 336645872281286 := by
  have hpos : (0 : Cut) < mass2 := mass2_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mass2_r2_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mass2_r2_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED LIGHT SHAPE LOG BRACKET (deep, `r2`): `−1088723725224/1e12 ≤ cutLog mass2 ≤
    −1088723725223/1e12` (`≈ −1.088723725223…`). Read from the reciprocal `cutLog(1/mass2) ∈
    [1088723725223/1e12, 1088723725224/1e12]` (certified via the exp instrument, N=17/18) through
    `cutLog mass2 = − cutLog(1/mass2)`. Width `10⁻¹²`. -/
theorem cutLog_b2_r2 :
    (-1088723725224 / 1000000000000 : Cut) ≤ cutLog mass2
      ∧ cutLog mass2 ≤ -1088723725223 / 1000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMass2_r2
  have hinvpos : (0 : Cut) < 1 / mass2 := by positivity
  have hlog_lo : (1088723725223 : Cut) / 1000000000000 ≤ cutLog (1 / mass2) := by
    have hcert : (1088723725223 : Cut) / 1000000000000
        ≤ cutLog (1000000000000000 / 336645872281298) := by
      apply cutLog_ge_certified (1000000000000000 / 336645872281298) (1088723725223 / 1000000000000) 17
        (by norm_num) (by norm_num)
      show partialExp (1088723725223 / 1000000000000 : Cut) 17
          + expRemBound (1088723725223 / 1000000000000 : Cut) 17
        ≤ (1000000000000000 : Cut) / 336645872281298
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000 : Cut) / 336645872281298) ≤ cutLog (1 / mass2) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mass2) ≤ (1088723725224 : Cut) / 1000000000000 := by
    have hmono : cutLog (1 / mass2) ≤ cutLog ((1000000000000000 : Cut) / 336645872281286) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000 : Cut) / 336645872281286)
        ≤ (1088723725224 : Cut) / 1000000000000 := by
      apply cutLog_le_certified (1000000000000000 / 336645872281286) (1088723725224 / 1000000000000) 18
        (by norm_num) (by norm_num)
      show (1000000000000000 : Cut) / 336645872281286
        ≤ partialExp (1088723725224 / 1000000000000 : Cut) 18
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mass2) = - cutLog mass2 := cutLog_inv_pos mass2_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (C) THE SHARPENED UP/DOWN RELATIVE LOG `L_mb = cutLog mbRatioDerived ∈ [−4089306640008/1e12,
    −4089306640006/1e12]` — from the CLOSED FORM `(1−q)²/(3(1+q))` with `q² = 1/2` sharpened. -/

/-- The sharp `q = cutCos(cutPi/4)` bracket from the banked `q² = 1/2`, `0 < q`:
    `q ∈ [7071067811865/1e13, 7071067811866/1e13]`. -/
theorem q_r2_lo : (7071067811865 : Cut) / 10000000000000 ≤ q := by nlinarith [q_sq, q_pos]
theorem q_r2_hi : q ≤ (7071067811866 : Cut) / 10000000000000 := by nlinarith [q_sq, q_pos]

/-- The sharp `mbRatioDerived = (1−q)²/(3(1+q))` bracket (decreasing in `q` on `(0,1)`):
    `mbRatioDerived ∈ [16750843898049/1e15, 16750843898062/1e15]`. -/
theorem mbRatio_r2_lo : (16750843898049 : Cut) / 1000000000000000 ≤ mbRatioDerived := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [le_div_iff₀ h1]
  nlinarith [q_r2_hi, q_pos, q_lt_one, q_sq]

theorem mbRatio_r2_hi : mbRatioDerived ≤ (16750843898062 : Cut) / 1000000000000000 := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [div_le_iff₀ h1]
  nlinarith [q_r2_lo, q_pos, q_lt_one, q_sq]

/-- The sharp `1/mbRatioDerived` bracket by reciprocal-monotonicity:
    `1/mbRatioDerived ∈ [1e15/16750843898062, 1e15/16750843898049]`. -/
theorem invMbRatio_r2 :
    (1000000000000000 : Cut) / 16750843898062 ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 1000000000000000 / 16750843898049 := by
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mbRatio_r2_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mbRatio_r2_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED UP/DOWN RELATIVE LOG BRACKET (deep, `r2`): `−4089306640008/1e12 ≤ cutLog
    mbRatioDerived ≤ −4089306640006/1e12` (`≈ −4.089306640006…`). Read from the reciprocal
    `cutLog(1/mbRatioDerived) ∈ [4089306640006/1e12, 4089306640008/1e12]` (certified via the exp
    instrument, N=29/30) through `cutLog mbRatioDerived = − cutLog(1/mbRatioDerived)`. Width `2×10⁻¹²`. -/
theorem cutLog_mb_r2 :
    (-4089306640008 / 1000000000000 : Cut) ≤ cutLog mbRatioDerived
      ∧ cutLog mbRatioDerived ≤ -4089306640006 / 1000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMbRatio_r2
  have hinvpos : (0 : Cut) < 1 / mbRatioDerived := by positivity
  have hlog_lo : (4089306640006 : Cut) / 1000000000000 ≤ cutLog (1 / mbRatioDerived) := by
    have hcert : (4089306640006 : Cut) / 1000000000000
        ≤ cutLog (1000000000000000 / 16750843898062) := by
      apply cutLog_ge_certified (1000000000000000 / 16750843898062) (4089306640006 / 1000000000000) 29
        (by norm_num) (by norm_num)
      show partialExp (4089306640006 / 1000000000000 : Cut) 29
          + expRemBound (4089306640006 / 1000000000000 : Cut) 29
        ≤ (1000000000000000 : Cut) / 16750843898062
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000 : Cut) / 16750843898062) ≤ cutLog (1 / mbRatioDerived) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mbRatioDerived) ≤ (4089306640008 : Cut) / 1000000000000 := by
    have hmono : cutLog (1 / mbRatioDerived) ≤ cutLog ((1000000000000000 : Cut) / 16750843898049) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000 : Cut) / 16750843898049)
        ≤ (4089306640008 : Cut) / 1000000000000 := by
      apply cutLog_le_certified (1000000000000000 / 16750843898049) (4089306640008 / 1000000000000) 30
        (by norm_num) (by norm_num)
      show (1000000000000000 : Cut) / 16750843898049
        ≤ partialExp (4089306640008 / 1000000000000 : Cut) 30
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived := cutLog_inv_pos mbRatioDerived_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (D) THE `bMass`-shape restatements (the dressed normal form uses `cutLog (bMass 0)`, `cutLog (bMass 2)`). -/

theorem cutLog_bMass0_r2 :
    (1733728794954 : Cut) / 1000000000000 ≤ cutLog (bMass 0)
      ∧ cutLog (bMass 0) ≤ 1733728794955 / 1000000000000 := by
  have h : bMass 0 = mass0 := rfl
  rw [h]; exact cutLog_b0_r2

theorem cutLog_bMass2_r2 :
    (-1088723725224 / 1000000000000 : Cut) ≤ cutLog (bMass 2)
      ∧ cutLog (bMass 2) ≤ -1088723725223 / 1000000000000 := by
  have h : bMass 2 = mass2 := rfl
  rw [h]; exact cutLog_b2_r2

/-! ## (E) THE DRESSED ABSTRACT ARITHMETIC CORE (W9) + THE RE-ASSEMBLED RESTATEMENT. -/

set_option maxHeartbeats 2000000 in
/-- THE DRESSED `r2` ABSTRACT ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the deep `r2` bracket
    hypotheses; the transcendentals stay OUT of the arithmetic): with `k` in the banked `κ` bracket,
    `L ∈ [815406111272/1e11, 815406111273/1e11]`, `Lmb ∈ [−4089306640008/1e12, −4089306640006/1e12]`,
    `Lb0 ∈ [1733728794954/1e12, 1733728794955/1e12]`, `Lb2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`,
    then the DRESSED normal form `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈
    [1370996710997/1e10, 1370996710998/1e10]`. The inner combination is in
    `[224069277834/1e10, 224069277835/1e10]`. -/
theorem dressed_core_r2 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-4089306640008 / 1000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -4089306640006 / 1000000000000)
    (hLb0 : (1733728794954 : Cut) / 1000000000000 ≤ Lb0 ∧ Lb0 ≤ 1733728794955 / 1000000000000)
    (hLb2 : (-1088723725224 / 1000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -1088723725223 / 1000000000000) :
    (1370996710997 / 10000000000 : Cut)
        ≤ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
      ∧ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
        ≤ 1370996710998 / 10000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (224069277834 / 10000000000 : Cut)
      ≤ 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 := by nlinarith
  have hcombo_hi : 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2
      ≤ 224069277835 / 10000000000 := by nlinarith
  set C := 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((1250000000 / 3926990817 : Cut) / 3) * (224069277834 / 10000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((1250000000 / 3926990817 : Cut) / 3) * (224069277834 / 10000000000)
        ≥ 1370996710997 / 10000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000 / 157079632679 : Cut) / 3) * (224069277835 / 10000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000 / 157079632679 : Cut) / 3) * (224069277835 / 10000000000)
        ≤ 1370996710998 / 10000000000 - 2425 / 18 := by norm_num
    linarith

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE COMPOSED ENDPOINT AS `1/α(0)` (deep, `r2`): the
    census-conserving endpoint WITH the fold-forced all-orders depth-2 running composed is bracketed by
    two explicit rationals of `Cut`, `1370996710997/1e10 ≤ recomposedEndpointDressed ≤ 1370996710998/1e10`
    (`137.0996710997 … 137.0996710998`, width `10⁻¹⁰`, ≈ 13 significant digits `137.0996710997`). Assembled
    by the dressed `r2` abstract core `dressed_core_r2` from the banked sharp `cutLog(mass0/mass1)` (NB11,
    wired via `cutLog_m01_sharp`) and the three deep edge logs (`cutLog_mb_r2`, `cutLog_bMass0_r2`,
    `cutLog_bMass2_r2`) and the banked `κ` bracket (`kappa_bracket`), through the DRESSED normal form
    `recomposedEndpointDressed_normalform`. ≈ 2×10⁷× narrower than the banked `D7DepthTwoComposed`
    `[137.0984, 137.1006]`. -/
theorem recomposedEndpointDressed_restated_r2 :
    (1370996710997 : Cut) / 10000000000 ≤ recomposedEndpointDressed
      ∧ recomposedEndpointDressed ≤ 1370996710998 / 10000000000 := by
  rw [recomposedEndpointDressed_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket
  exact dressed_core_r2 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi cutLog_m01_sharp cutLog_mb_r2
    cutLog_bMass0_r2 cutLog_bMass2_r2

/-! ## (F) THE SHARPER PREDICTION + NESTING IN THE BANKED D7DepthTwoComposed BRACKET. -/

/-- ★★★ THE COMPOSED ENDPOINT EXCEEDS `137` (deep, `r2`): `137 < recomposedEndpointDressed` re-certified
    from the sharp lower bound `≥ 1370996710997/1e10 = 137.0996710997 > 137`. The composed endpoint sits
    `≈ 0.064` ABOVE the measured `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof); the
    derivation does NOT bend toward the measurement (G2 absolute NO-FIT). -/
theorem recomposedEndpointDressed_gt_137_r2 : 137 < recomposedEndpointDressed := by
  have h := recomposedEndpointDressed_restated_r2.1
  have : (137 : Cut) < 1370996710997 / 10000000000 := by norm_num
  linarith

/-- The `r2` bracket is nested strictly inside the banked `D7DepthTwoComposed` `[1370984/1e4, 1371006/1e4]`
    (`137.0984 … 137.1006`) from BOTH ends: `1370984/1e4 ≤ 1370996710997/1e10` and
    `1370996710998/1e10 ≤ 1371006/1e4`. -/
theorem r2_nested_in_banked :
    (1370984 / 10000 : Cut) ≤ 1370996710997 / 10000000000
      ∧ (1370996710998 / 10000000000 : Cut) ≤ 1371006 / 10000 :=
  ⟨by norm_num, by norm_num⟩

/-! ## (G) W8 NON-VACUITY WITH TEETH. -/

theorem cutLog_b0_r2_strict : (1733728794954 : Cut) / 1000000000000 < 1733728794955 / 1000000000000 := by norm_num
theorem cutLog_b2_r2_strict : (-1088723725224 / 1000000000000 : Cut) < -1088723725223 / 1000000000000 := by norm_num
theorem cutLog_mb_r2_strict : (-4089306640008 / 1000000000000 : Cut) < -4089306640006 / 1000000000000 := by norm_num
theorem restated_r2_strict : (1370996710997 : Cut) / 10000000000 < 1370996710998 / 10000000000 := by norm_num

/-- ★ W8 — THE DEEP RUNG GENUINELY IMPROVES THE BANKED `D7DepthTwoComposed` ENDPOINT BRACKET from both
    ends: the re-assembled window `[1370996710997/1e10, 1370996710998/1e10]` is strictly inside the banked
    `[1370984/1e4, 1371006/1e4]` from both ends, and each deep edge-log window strictly improves the
    `D7NarrowingRung1`-grade edge windows wired into `D7DepthTwoComposed`. Each is a real tightening. -/
theorem dressed_r2_improves_banked :
    ((1370984 / 10000 : Cut) < 1370996710997 / 10000000000
      ∧ (1370996710998 / 10000000000 : Cut) < 1371006 / 10000)
    ∧ ((17337287 / 10000000 : Cut) < 1733728794954 / 1000000000000
      ∧ (1733728794955 / 1000000000000 : Cut) < 17337288 / 10000000)
    ∧ ((-10887238 / 10000000 : Cut) < -1088723725224 / 1000000000000
      ∧ (-1088723725223 / 1000000000000 : Cut) < -10887236 / 10000000)
    ∧ ((-40893067 / 10000000 : Cut) < -4089306640008 / 1000000000000
      ∧ (-4089306640006 / 1000000000000 : Cut) < -40893066 / 10000000) :=
  ⟨⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩,
   ⟨by norm_num, by norm_num⟩⟩

/-! ## (H) THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE D7 DRESSED NARROWING RUNG 1 (arc-D THE DIGITS, welded landing).

    (1) THE SHARPENED EDGE LOGS (deep, `≈ 10⁻¹²`): `cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`
        (`cutLog_b0_r2`), `cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]` (`cutLog_b2_r2`),
        `cutLog mbRatioDerived ∈ [−4089306640008/1e12, −4089306640006/1e12]` (`cutLog_mb_r2`) — each ≈ 10⁵×
        tighter than the `D7NarrowingRung1`-grade edge brackets wired into `D7DepthTwoComposed`, from the
        banked sharp `mass0`/`mass2`/`mbRatioDerived` numerals through the banked exp instrument
        (deepest N=29/30);
    (2) THE WIRED-IN SHARP `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        (`cutLog_m01_sharp`, from NarrowedBracket11, width `10⁻¹¹`);
    (3) THE RE-ASSEMBLED D7 RESTATEMENT AS `1/α(0)`: `1370996710997/1e10 ≤ recomposedEndpointDressed ≤
        1370996710998/1e10` (`recomposedEndpointDressed_restated_r2`), a certified two-sided rational
        bracket (`137.0996710997 … 137.0996710998`, width `10⁻¹⁰`, ≈ 13 significant digits) of the DERIVED
        COMPOSED closed real, nested strictly inside the banked `D7DepthTwoComposed` `[137.0984, 137.1006]`
        from both ends (`r2_nested_in_banked`);
    (4) THE PREDICTION (sharper): `137 < recomposedEndpointDressed` (`recomposedEndpointDressed_gt_137_r2`)
        — the composed endpoint sits `≈ 0.064` above the measured `1/α(0) ≈ 137.036` (removable prose);
    (5) TEETH: every sharpened bracket is two-sided (`_strict`); the re-assembled bracket is two-sided; the
        deep rung genuinely improves the banked `D7DepthTwoComposed` bracket + the edge windows from both
        ends (`dressed_r2_improves_banked`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) THEOREM-EXACT /
    CERTIFIED now (exact inequalities / a certified rational bracket of `Cut`/ℚ, foundations-only, no
    error bar). This node banks the FIRST NARROWING RUNG over the TRULY-CLOSED COMPOSED endpoint
    (≈ 5 → ≈ 13 significant digits).
    ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted / NEVER
    fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. The DOMINANT residual is now `κ = 1/cutPi`
    (`≈ 1.5×10⁻¹¹`, the `1e11` `cutCos` positivity grid `ext6`) and then `L_m01` (`≈ 3×10⁻¹²`, the NB11
    `s6` grid) — NOT the edge logs. Rung 2: push `1/cutPi` one decade deeper (a `1e12` `cutCos`
    double-double-angle grid, one past the banked `ext6`) + read `mass0/mass1` at an `s7` grid. The measured
    `1/α(0) ≈ 137.036` and the composed `≈ 137.0997` are REMOVABLE ORIENTATION PROSE ONLY. -/
theorem d7DressedNarrowingRung1_landing :
    -- (1) the sharpened edge logs
    (((1733728794954 : Cut) / 1000000000000 ≤ cutLog mass0
        ∧ cutLog mass0 ≤ 1733728794955 / 1000000000000)
      ∧ ((-1088723725224 / 1000000000000 : Cut) ≤ cutLog mass2
          ∧ cutLog mass2 ≤ -1088723725223 / 1000000000000)
      ∧ ((-4089306640008 / 1000000000000 : Cut) ≤ cutLog mbRatioDerived
          ∧ cutLog mbRatioDerived ≤ -4089306640006 / 1000000000000))
    -- (2) the wired-in sharp cutLog(mass0/mass1)
    ∧ ((815406111272 : Cut) / 100000000000 ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406111273 / 100000000000)
    -- (3) the re-assembled restatement of the composed endpoint as 1/α(0)
    ∧ ((1370996710997 : Cut) / 10000000000 ≤ recomposedEndpointDressed
        ∧ recomposedEndpointDressed ≤ 1370996710998 / 10000000000)
    -- (4) the prediction
    ∧ (137 < recomposedEndpointDressed)
    -- (5) teeth
    ∧ ((1733728794954 : Cut) / 1000000000000 < 1733728794955 / 1000000000000)
    ∧ ((1370996710997 : Cut) / 10000000000 < 1370996710998 / 10000000000)
    ∧ (((1370984 / 10000 : Cut) < 1370996710997 / 10000000000
          ∧ (1370996710998 / 10000000000 : Cut) < 1371006 / 10000)
        ∧ ((17337287 / 10000000 : Cut) < 1733728794954 / 1000000000000
          ∧ (1733728794955 / 1000000000000 : Cut) < 17337288 / 10000000)
        ∧ ((-10887238 / 10000000 : Cut) < -1088723725224 / 1000000000000
          ∧ (-1088723725223 / 1000000000000 : Cut) < -10887236 / 10000000)
        ∧ ((-40893067 / 10000000 : Cut) < -4089306640008 / 1000000000000
          ∧ (-4089306640006 / 1000000000000 : Cut) < -40893066 / 10000000)) :=
  ⟨⟨cutLog_b0_r2, cutLog_b2_r2, cutLog_mb_r2⟩,
   cutLog_m01_sharp,
   recomposedEndpointDressed_restated_r2,
   recomposedEndpointDressed_gt_137_r2,
   cutLog_b0_r2_strict,
   restated_r2_strict,
   dressed_r2_improves_banked⟩

end

end Phys.Algebra.D7DressedNarrowingRung1
