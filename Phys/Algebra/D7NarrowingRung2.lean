/-
  # D7 NARROWING RUNG 2 — sharpen the THREE dominant edge-log inputs one rung deeper → a
  #   ~12-significant-digit certified restatement of BOTH the bare census-conserving endpoint AND the
  #   fold-forced depth-2-dressed endpoint AS `1/α(0)`
  #   (arc-M/O2 keystone; owner-authorized huc-derivation campaign node 4; directed successor of N579
  #   HucDischargedFreezeoutEndpoint, commit f384f00, t_9ec9d521)
  =================================================================================================

  OWNER-DIRECTED (huc campaign node 4, decision (a), t_ad38fbfc comment 552; NO-FIT, NO-BLOCK mandate).
  Directed successor of N579 (which DISCHARGED `huc` from the endpoint and re-exported the banked D7
  restatement intact: `recomposedEndpoint ∈ [136.307188, 136.3071883]`, ≈ 9 sig digits — a
  continue-the-hunt signal, since the residual width is bottlenecked by the DERIVED inputs' current
  numeral widths, NOT the now-discharged confinement rung). This node NARROWS those inputs one rung
  deeper and re-assembles the endpoint bracket at MORE sig digits.

  ## THE DIAGNOSIS — MEASURE FIRST (W9; workbench/d7-endpoint-narrow/measure.py)

  The bare endpoint normal form (banked `D7DepthTwoComposed.recomposedEndpoint_cInner`) is
      recomposedEndpoint = 2425/18 + kappaLeading · (2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2),
  with `κ = (1/cutPi)/3`, `L_m01 = cutLog(mass0/mass1)`, `L_mb = cutLog mbRatioDerived`,
  `L_b0 = cutLog (bMass 0) = cutLog mass0`, `L_b2 = cutLog (bMass 2) = cutLog mass2`. The endpoint width
  is `Σ |coeff|·κ·(input width)`. Reading the banked Rung1 brackets, each input's contribution to the
  endpoint width is:
    • `L_b0`  (width `10⁻⁷`) → `3.9×10⁻⁸`   (DOMINANT)
    • `L_b2`  (width `2×10⁻⁷`) → `3.5×10⁻⁸`
    • `L_mb`  (width `10⁻⁷`) → `2.5×10⁻⁸`
    • `κ`     (ext6, width `2×10⁻¹²`) → `1.0×10⁻¹¹`   (negligible for now)
    • `L_m01` (NB11, width `10⁻¹¹`) → `2.1×10⁻¹²`   (already negligible)
  Sum `≈ 9.9×10⁻⁸` ⇒ ≈ 9 sig digits. THE DOMINANT RESIDUAL is the THREE EDGE LOGS, all `≈ 10⁻⁷` and
  COMPARABLE — sharpening only `L_b0` would leave `≈ 6×10⁻⁸`. So the correct rung SHARPENS ALL THREE
  edge logs one rung deeper (to `≈ 10⁻¹³`, below the `κ` floor), through the SAME banked instrument
  ladder, and re-assembles. That drops the endpoint width from `≈ 9.9×10⁻⁸` to `≈ 10⁻¹⁰` — from ≈ 9 to
  ≈ 12 significant digits, now `κ`-floor-limited.

  ## WHAT THIS NODE BANKS (all THEOREM-EXACT / CERTIFIED, foundations-only, no error bar)

    (1) THE DEEPENED HEAVY SHAPE LOG: `L_b0 = cutLog mass0 ∈ [17337287949546/1e13, 17337287949547/1e13]`
        (`cutLog_b0_deep`, width `10⁻¹³`), from the banked NB11 s6 Born-square `mass0 ∈
        [5661726012625402/1e15, 5661726012625422/1e15]` (Rung1 `mass0_clean_lo`/`mass0_clean_hi`) through
        the `ContinuumBracket` exp instrument at indices 18/19 + `cutLog_mono`. ≈ 10⁶× tighter than
        Rung1's `10⁻⁷`.
    (2) THE DEEPENED LIGHT SHAPE LOG: `L_b2 = cutLog mass2 ∈ [−10887237252238/1e13, −10887237252235/1e13]`
        (`cutLog_b2_deep`, width `3×10⁻¹³`), from the banked NB11 s6 products `wB·pB`, `wB·rB` → `b2 =
        1 − (wB·pB − wB·rB)/2 ∈ [58021192014752/1e14, 58021192014755/1e14]` → `mass2 = b2² ∈
        [336645872281271/1e15, 336645872281307/1e15]`, read through the reciprocal `cutLog(1/mass2)`
        + the exp instrument (indices 14/16) and `cutLog mass2 = −cutLog(1/mass2)`.
    (3) THE DEEPENED UP/DOWN RELATIVE LOG: `L_mb = cutLog mbRatioDerived ∈ [−40893066400068/1e13,
        −40893066400067/1e13]` (`cutLog_mb_deep`, width `10⁻¹³`), from the CLOSED FORM
        `mbRatioDerived = (1−q)²/(3(1+q))` (`mbRatioDerived_closed`) with the banked `q² = 1/2` (`q_sq`)
        sharpened to `q ∈ [707106781186547/1e15, 707106781186548/1e15]`, giving a sharp RATIONAL bracket
        `mbRatioDerived ∈ [16750843898055717/1e18, 16750843898055843/1e18]`, read through the reciprocal
        + the exp instrument (indices 25/27).
    (4) THE WIRED-IN SHARP `L_m01 = cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        (re-exported from Rung1 `cutLog_m01_sharp` / NB11; banked, width `10⁻¹¹`) and the `κ` bracket
        (ext6, `kappa_bracket`).
    (5) THE DEEPENED ABSTRACT ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the deepened
        bracket hypotheses; transcendentals OUT of the arithmetic):
        - BARE `endpoint_core_r2`: `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈
          [1363071881405/1e10, 1363071881406/1e10]`;
        - DRESSED `dressed_core_r2`: `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈
          [1370996710997/1e10, 1370996710998/1e10]`.
    (6) ★★★ THE RE-ASSEMBLED RESTATEMENTS AS `1/α(0)`:
        - BARE `recomposedEndpoint_restated_r2`: `recomposedEndpoint ∈ [1363071881405/1e10,
          1363071881406/1e10]` (`[136.3071881405, 136.3071881406]`, width `10⁻¹⁰`, ≈ 12 sig digits),
          nested STRICTLY inside the banked ≈9-digit `[136.307188, 136.3071883]`;
        - DRESSED `recomposedEndpointDressed_restated_r2`: `recomposedEndpointDressed ∈
          [1370996710997/1e10, 1370996710998/1e10]` (`[137.0996710997, 137.0996710998]`, width `10⁻¹⁰`,
          ≈ 12 sig digits), nested STRICTLY inside the banked `[137.0984, 137.1006]`.
    (7) THE PREDICTIONS (sharper): `recomposedEndpoint < 137` (`bare_lt_137_r2`) and
        `137 < recomposedEndpointDressed` (`dressed_gt_137_r2`), re-certified from the deepened brackets —
        the bare certified bracket lies STRICTLY BELOW, and the dressed STRICTLY ABOVE, the measured
        `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof).
    (8) W8 TEETH: each deepened bracket is genuinely two-sided (`_strict`); both re-assembled brackets
        are two-sided; the deepening genuinely improves the Rung1 brackets from both ends
        (`deepening_improves_edge`), and both endpoints nest strictly inside the banked ≈9-digit / ≈4-digit
        brackets (`bare_nested_strict` / `dressed_nested_strict`).

  ## THE HONEST GRADE / SCOPE (SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT / CERTIFIED NOW: (1)–(8) — exact identities / inequalities / certified rational brackets
  of `Cut`/ℚ, foundations-only, no error bar. This rung takes the endpoint from ≈ 9 to ≈ 12 significant
  digits (bare) and from ≈ 4 to ≈ 12 (dressed).

  ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted / NEVER
  fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. After this rung the DOMINANT residual is no longer
  the edge logs (now `≈ 10⁻¹³`) but `κ = 1/cutPi` (ext6, width `≈ 2×10⁻¹²`), whose `1×10⁻¹¹` endpoint
  contribution is the new bottleneck. The next rung SHARPENS `1/cutPi` one grid deeper (a deeper
  `cutCos` read of `leastCosZero`, the same instrument that read `cutCos(2/9)` to s6 here), plus the
  edge logs another rung — exactly the same instrument ladder, one more turn. That is the next narrowing
  rung. NOT a block: forward autonomous structural work remains, and no path here fits a measured value
  or needs a new posited foundation.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "coupling / running / band / census / freeze-out / flavour / lepton / quark / mass / generation
  / edge / fine-structure / prediction": what remains, over the derived ℝ `Cut`, is that
  `17337287949546/1e13 ≤ cutLog mass0 ≤ 17337287949547/1e13`; that `−10887237252238/1e13 ≤ cutLog mass2
  ≤ −10887237252235/1e13`; that `−40893066400068/1e13 ≤ cutLog mbRatioDerived ≤ −40893066400067/1e13`;
  that `1363071881405/1e10 ≤ recomposedEndpoint ≤ 1363071881406/1e10`; that `1370996710997/1e10 ≤
  recomposedEndpointDressed ≤ 1370996710998/1e10`; and the two `< 137` / `> 137` order facts. Pure real /
  rational arithmetic on the banked derived objects. No theorem STATEMENT needs a physics word.

  ## NOT FREE-FLOATING (SOUL rail)

  Every production TYPE mentions the banked derived objects (`recomposedEndpoint` /
  `recomposedEndpointDressed` / `mass0` / `mass2` / `mbRatioDerived` / `bMass` / `kappaLeading` / `cutLog`
  / `cutPi` / `q`, over the derived ℝ `Cut`). The brackets are deeper certified readings of the banked
  objects; FALSE over an algebra without the banked two-channel / census / Born-square-mass / fold-phase
  / continuum stack — not generic.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — every deepened bracket FALLS OUT of a banked numeral bracket (NB11 s6
    `mass0`/`wB·pB`/`wB·rB`, `q_sq`, `mbRatioDerived_closed`) + the banked `ContinuumBracket` exp
    instrument; no value premised.
  - G2 NO EMPIRICAL NUMBER — no `137.036`, no PDG, no measured `α` in any statement or proof; the
    measured `1/α(0) ≈ 137.036` is removable orientation prose; NO bracket/index is selected BECAUSE of
    where the measured value sits. The `< 137` (bare) / `> 137` (dressed) exclusions are certified
    consequences of the DERIVATION. Explicit NO-FIT.
  - G3 EXACT / CERTIFIED — every landing is an exact inequality of `Cut`/ℚ or a certified rational
    bracket; the ONE open front (the ≥15-digit floor, now `κ`-limited) is NAMED and handed forward.
  - G4 DERIVED, NOT POSITED — every input is a banked derived object (see DEPENDENCIES).
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation beyond the banked exp-instrument
    ceiling. Ground field the DERIVED ℝ `Cut`; NO Mathlib `Real`/`Complex` as content — Mathlib is
    MACHINERY only; NO floats.
  - G7 ONE LAW — we did NOT grind the endpoint directly; we MEASURED (from the banked platform) that the
    three edge logs are the comparable live bottleneck, deepened ALL THREE through the same banked
    instrument, and wired in the already-banked `L_m01`/`κ` free. No fit, no weakened floor, no asserted
    digit. The endpoint bracket assembly stays in the abstract arithmetic cores `endpoint_core_r2` /
    `dressed_core_r2` (transcendentals out of the tableau — W9).
  - G8 TEETH (W8) — each deepened bracket is strictly two-sided; both re-assembled brackets are strictly
    two-sided; the deepening strictly improves the Rung1 brackets from both ends; both endpoints nest
    strictly inside the banked brackets.

  DEPENDENCIES (all banked, foundations-only): `D7DepthTwoComposed` (`recomposedEndpoint_cInner`,
  `recomposedEndpointDressed_normalform`, transitively `recomposedEndpoint_normalform`, `kappa_bracket`,
  `recomposedEndpointDressed`); `D7NarrowingRung1` (`mass0_clean_lo`/`mass0_clean_hi`, `cutLog_m01_sharp`,
  `q_sharp`/`b2_sharp_pos`, the Rung1 edge brackets to nest against); `NarrowedBracket11`
  (`mass0_lo_s6`/`mass0_hi_s6`, `wp_lo_s6`/`wp_hi_s6`/`wr_lo_s6`/`wr_hi_s6`); `GenerationMassRatios`
  (`b2`, `mass0`, `mass2`, `mass0_pos`, `mass2_pos`); `UpDownRelativeScaleFoldPhase` (`mbRatioDerived`,
  `mbRatioDerived_closed`, `mbRatioDerived_pos`, `q`, `q_sq`, `q_pos`, `q_lt_one`);
  `FreezeoutEdgeCrossSectorReduction` (`bMass`); `ComposedFreezeoutDissolved` (`cutLog_inv_pos`);
  `AssembledBracket` (`cutLog_mono`); `ContinuumBracket` (`cutLog_ge_certified`, `cutLog_le_certified`,
  `partialExp`, `expRemBound`); the derived `Cut`. Standard Mathlib `norm_num`/`ring`/`nlinarith`/
  `linarith`/`mul_le_mul` MACHINERY on the DERIVED objects (STANDARD §3). NO posited value as content,
  NO Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.HucDischargedFreezeoutEndpoint
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.D7NarrowingRung2

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

/-! ## (1) THE DEEPENED HEAVY SHAPE LOG `L_b0 = cutLog mass0 ∈ [17337287949546/1e13, 17337287949547/1e13]`
    (width `10⁻¹³`), from the banked Rung1 clean `mass0` bracket through the exp instrument (18/19). -/

set_option maxHeartbeats 2000000 in
/-- ★★ THE DEEPENED HEAVY SHAPE LOG BRACKET: `17337287949546/1e13 ≤ cutLog mass0 ≤ 17337287949547/1e13`
    (`≈ 1.7337287949546…`). Width `10⁻¹³` — ≈ 10⁶× tighter than the banked Rung1 `[17337287/1e7,
    17337288/1e7]`. From the banked clean `mass0 ∈ [5661726012625402/1e15, 5661726012625422/1e15]`
    (Rung1 `mass0_clean_lo`/`mass0_clean_hi`, NB11 s6 Born squares) through `cutLog_ge/le_certified`
    at partial-sum indices 18/19 + `cutLog_mono`. -/
theorem cutLog_b0_deep :
    (17337287949546 : Cut) / 10000000000000 ≤ cutLog mass0
      ∧ cutLog mass0 ≤ 17337287949547 / 10000000000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  refine ⟨?_, ?_⟩
  · have hcert : (17337287949546 : Cut) / 10000000000000
        ≤ cutLog (5661726012625402 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625402 / 1000000000000000) (17337287949546 / 10000000000000) 18
        (by norm_num) (by norm_num)
      show partialExp (17337287949546 / 10000000000000 : Cut) 18
          + expRemBound (17337287949546 / 10000000000000 : Cut) 18
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
        ≤ (17337287949547 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (5661726012625422 / 1000000000000000) (17337287949547 / 10000000000000) 19
        (by norm_num) (by norm_num)
      show (5661726012625422 : Cut) / 1000000000000000
          ≤ partialExp (17337287949547 / 10000000000000 : Cut) 19
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

/-! ## (2) THE DEEPENED LIGHT SHAPE LOG `L_b2 = cutLog mass2 ∈ [−10887237252238/1e13, −10887237252235/1e13]`
    (width `3×10⁻¹³`), from the NB11 s6 products through `b2` → `mass2 = b2²` → reciprocal exp read. -/

/-- The deepened clean `mass2` lower bracket from the NB11 s6 products (`b2 = 1 − (wB·pB − wB·rB)/2 ≥
    58021192014752/1e14`, `mass2 = b2² ≥ 336645872281271/1e15`). -/
theorem b2_clean_lo : (336645872281271 : Cut) / 1000000000000000 ≤ mass2 := by
  have hb2lo : (58021192014752 : Cut) / 100000000000000 ≤ b2 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [Phys.Algebra.NarrowedBracket11.wp_hi_s6, Phys.Algebra.NarrowedBracket11.wr_lo_s6]
  have hb2pos : (0 : Cut) < b2 := by linarith
  have := mul_le_mul hb2lo hb2lo (by norm_num) (le_of_lt hb2pos)
  unfold mass2
  nlinarith [this]

/-- The deepened clean `mass2` upper bracket (`b2 ≤ 58021192014755/1e14`, `mass2 = b2² ≤
    336645872281307/1e15`). -/
theorem b2_clean_hi : mass2 ≤ (336645872281307 : Cut) / 1000000000000000 := by
  have hb2hi : b2 ≤ (58021192014755 : Cut) / 100000000000000 := by
    unfold b2
    have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
    rw [he]
    linarith [Phys.Algebra.NarrowedBracket11.wp_lo_s6, Phys.Algebra.NarrowedBracket11.wr_hi_s6]
  have hb2pos : (0 : Cut) < b2 := b2_sharp_pos
  have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num)
  unfold mass2
  nlinarith [this]

/-- The deepened `1/mass2` bracket by reciprocal-monotonicity. -/
theorem invMass2_deep :
    (1000000000000000 : Cut) / 336645872281307 ≤ 1 / mass2
      ∧ 1 / mass2 ≤ 1000000000000000 / 336645872281271 := by
  have hpos : (0 : Cut) < mass2 := mass2_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [b2_clean_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [b2_clean_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE DEEPENED LIGHT SHAPE LOG BRACKET: `−10887237252238/1e13 ≤ cutLog mass2 ≤ −10887237252235/1e13`
    (`≈ −1.0887237252236…`). Read from the reciprocal `cutLog(1/mass2) ∈ [10887237252235/1e13,
    10887237252238/1e13]` (certified via the exp instrument at indices 14/16) through
    `cutLog mass2 = −cutLog(1/mass2)`. Width `3×10⁻¹³`. -/
theorem cutLog_b2_deep :
    (-10887237252238 / 10000000000000 : Cut) ≤ cutLog mass2
      ∧ cutLog mass2 ≤ -10887237252235 / 10000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMass2_deep
  have hinvpos : (0 : Cut) < 1 / mass2 := by positivity
  have hlog_lo : (10887237252235 : Cut) / 10000000000000 ≤ cutLog (1 / mass2) := by
    have hcert : (10887237252235 : Cut) / 10000000000000
        ≤ cutLog (1000000000000000 / 336645872281307) := by
      apply cutLog_ge_certified (1000000000000000 / 336645872281307) (10887237252235 / 10000000000000) 14
        (by norm_num) (by norm_num)
      show partialExp (10887237252235 / 10000000000000 : Cut) 14
          + expRemBound (10887237252235 / 10000000000000 : Cut) 14
        ≤ (1000000000000000 : Cut) / 336645872281307
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000 : Cut) / 336645872281307) ≤ cutLog (1 / mass2) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mass2) ≤ (10887237252238 : Cut) / 10000000000000 := by
    have hmono : cutLog (1 / mass2) ≤ cutLog ((1000000000000000 : Cut) / 336645872281271) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000 : Cut) / 336645872281271)
        ≤ (10887237252238 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (1000000000000000 / 336645872281271) (10887237252238 / 10000000000000) 16
        (by norm_num) (by norm_num)
      show (1000000000000000 : Cut) / 336645872281271
          ≤ partialExp (10887237252238 / 10000000000000 : Cut) 16
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mass2) = - cutLog mass2 := cutLog_inv_pos mass2_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (3) THE DEEPENED UP/DOWN RELATIVE LOG `L_mb = cutLog mbRatioDerived ∈ [−40893066400068/1e13,
    −40893066400067/1e13]` (width `10⁻¹³`), from the CLOSED FORM `(1−q)²/(3(1+q))` with `q² = 1/2`
    deepened. -/

/-- The deepened `q = cutCos(cutPi/4)` bracket from the banked `q² = 1/2`, `0 < q`:
    `q ∈ [707106781186547/1e15, 707106781186548/1e15]`. -/
theorem q_deep_lo : (707106781186547 : Cut) / 1000000000000000 ≤ q := by nlinarith [q_sq, q_pos]
theorem q_deep_hi : q ≤ (707106781186548 : Cut) / 1000000000000000 := by nlinarith [q_sq, q_pos]

/-- The deepened `mbRatioDerived = (1−q)²/(3(1+q))` bracket (decreasing in `q` on `(0,1)`):
    `mbRatioDerived ∈ [16750843898055717/1e18, 16750843898055843/1e18]`. -/
theorem mbRatio_deep_lo : (16750843898055717 : Cut) / 1000000000000000000 ≤ mbRatioDerived := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [le_div_iff₀ h1]
  nlinarith [q_deep_hi, q_pos, q_lt_one, q_sq]

theorem mbRatio_deep_hi : mbRatioDerived ≤ (16750843898055843 : Cut) / 1000000000000000000 := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [div_le_iff₀ h1]
  nlinarith [q_deep_lo, q_pos, q_lt_one, q_sq]

/-- The deepened `1/mbRatioDerived` bracket by reciprocal-monotonicity. -/
theorem invMbRatio_deep :
    (1000000000000000000 : Cut) / 16750843898055843 ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 1000000000000000000 / 16750843898055717 := by
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mbRatio_deep_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mbRatio_deep_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE DEEPENED UP/DOWN RELATIVE LOG BRACKET: `−40893066400068/1e13 ≤ cutLog mbRatioDerived ≤
    −40893066400067/1e13` (`≈ −4.0893066400067…`). Read from the reciprocal `cutLog(1/mbRatioDerived) ∈
    [40893066400067/1e13, 40893066400068/1e13]` (certified via the exp instrument at indices 25/27)
    through `cutLog mbRatioDerived = −cutLog(1/mbRatioDerived)`. Width `10⁻¹³`. -/
theorem cutLog_mb_deep :
    (-40893066400068 / 10000000000000 : Cut) ≤ cutLog mbRatioDerived
      ∧ cutLog mbRatioDerived ≤ -40893066400067 / 10000000000000 := by
  obtain ⟨hlo, hhi⟩ := invMbRatio_deep
  have hinvpos : (0 : Cut) < 1 / mbRatioDerived := by positivity
  have hlog_lo : (40893066400067 : Cut) / 10000000000000 ≤ cutLog (1 / mbRatioDerived) := by
    have hcert : (40893066400067 : Cut) / 10000000000000
        ≤ cutLog (1000000000000000000 / 16750843898055843) := by
      apply cutLog_ge_certified (1000000000000000000 / 16750843898055843) (40893066400067 / 10000000000000) 25
        (by norm_num) (by norm_num)
      show partialExp (40893066400067 / 10000000000000 : Cut) 25
          + expRemBound (40893066400067 / 10000000000000 : Cut) 25
        ≤ (1000000000000000000 : Cut) / 16750843898055843
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000000000 : Cut) / 16750843898055843) ≤ cutLog (1 / mbRatioDerived) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mbRatioDerived) ≤ (40893066400068 : Cut) / 10000000000000 := by
    have hmono : cutLog (1 / mbRatioDerived) ≤ cutLog ((1000000000000000000 : Cut) / 16750843898055717) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000000000 : Cut) / 16750843898055717)
        ≤ (40893066400068 : Cut) / 10000000000000 := by
      apply cutLog_le_certified (1000000000000000000 / 16750843898055717) (40893066400068 / 10000000000000) 27
        (by norm_num) (by norm_num)
      show (1000000000000000000 : Cut) / 16750843898055717
          ≤ partialExp (40893066400068 / 10000000000000 : Cut) 27
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived := cutLog_inv_pos mbRatioDerived_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (4) THE WIRED-IN SHARP `L_m01` (Rung1/NB11, width `10⁻¹¹`), stated as `bMass` shape. -/

/-- The deepened `L_b0` as the `bMass 0` shape used by the endpoint normal form. -/
theorem cutLog_bMass0_deep :
    (17337287949546 : Cut) / 10000000000000 ≤ cutLog (bMass 0)
      ∧ cutLog (bMass 0) ≤ 17337287949547 / 10000000000000 := by
  have h : bMass 0 = mass0 := rfl
  rw [h]; exact cutLog_b0_deep

/-- The deepened `L_b2` as the `bMass 2` shape used by the endpoint normal form. -/
theorem cutLog_bMass2_deep :
    (-10887237252238 / 10000000000000 : Cut) ≤ cutLog (bMass 2)
      ∧ cutLog (bMass 2) ≤ -10887237252235 / 10000000000000 := by
  have h : bMass 2 = mass2 := rfl
  rw [h]; exact cutLog_b2_deep

/-! ## (5) THE DEEPENED ABSTRACT ARITHMETIC CORES (W9) + (6) THE RE-ASSEMBLED RESTATEMENTS. -/

set_option maxHeartbeats 2000000 in
/-- THE DEEPENED BARE ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the deepened bracket
    hypotheses; transcendentals OUT of the arithmetic): with `k` in the banked `κ` bracket and the four
    deepened logs in their windows, `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈
    [1363071881405/1e10, 1363071881406/1e10]`. The inner combination is in `[149379518556/1e10,
    149379518557/1e10]`. -/
theorem endpoint_core_r2 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-40893066400068 / 10000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066400067 / 10000000000000)
    (hLb0 : (17337287949546 : Cut) / 10000000000000 ≤ Lb0 ∧ Lb0 ≤ 17337287949547 / 10000000000000)
    (hLb2 : (-10887237252238 / 10000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887237252235 / 10000000000000) :
    (1363071881405 / 10000000000 : Cut)
        ≤ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 1363071881406 / 10000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (149379518556 / 10000000000 : Cut)
      ≤ 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 149379518557 / 10000000000 := by nlinarith
  set C := 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((1250000000 / 3926990817 : Cut) / 3) * (149379518556 / 10000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((1250000000 / 3926990817 : Cut) / 3) * (149379518556 / 10000000000)
        ≥ 1363071881405 / 10000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000 / 157079632679 : Cut) / 3) * (149379518557 / 10000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000 / 157079632679 : Cut) / 3) * (149379518557 / 10000000000)
        ≤ 1363071881406 / 10000000000 - 2425 / 18 := by norm_num
    linarith

set_option maxHeartbeats 2000000 in
/-- THE DEEPENED DRESSED ARITHMETIC CORE (W9 — the `(3/2)`-scaled coefficients): with the same deepened
    hypotheses, `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈ [1370996710997/1e10,
    1370996710998/1e10]`. The inner combination is in `[224069277834/1e10, 224069277835/1e10]`. -/
theorem dressed_core_r2 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-40893066400068 / 10000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066400067 / 10000000000000)
    (hLb0 : (17337287949546 : Cut) / 10000000000000 ≤ Lb0 ∧ Lb0 ≤ 17337287949547 / 10000000000000)
    (hLb2 : (-10887237252238 / 10000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887237252235 / 10000000000000) :
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

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE BARE ENDPOINT AS `1/α(0)`: `recomposedEndpoint ∈
    [1363071881405/1e10, 1363071881406/1e10]` (`136.3071881405 … 136.3071881406`, width `10⁻¹⁰`,
    ≈ 12 significant digits). Assembled by `endpoint_core_r2` from the banked `κ` bracket
    (`kappa_bracket`), the wired-in sharp `L_m01` (`cutLog_m01_sharp`), and the three DEEPENED edge logs
    (`cutLog_mb_deep`, `cutLog_bMass0_deep`, `cutLog_bMass2_deep`), through the banked bare normal form
    `recomposedEndpoint_cInner`. Nested STRICTLY inside the banked ≈9-digit `[136.307188, 136.3071883]`. -/
theorem recomposedEndpoint_restated_r2 :
    (1363071881405 : Cut) / 10000000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 1363071881406 / 10000000000 := by
  rw [recomposedEndpoint_cInner]
  unfold cInner
  obtain ⟨hklo, hkhi⟩ := kappa_bracket
  exact endpoint_core_r2 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi cutLog_m01_sharp cutLog_mb_deep
    cutLog_bMass0_deep cutLog_bMass2_deep

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE DEPTH-2-DRESSED ENDPOINT AS `1/α(0)`:
    `recomposedEndpointDressed ∈ [1370996710997/1e10, 1370996710998/1e10]` (`137.0996710997 …
    137.0996710998`, width `10⁻¹⁰`, ≈ 12 significant digits). Assembled by `dressed_core_r2` from the
    same banked/deepened inputs, through the banked dressed normal form
    `recomposedEndpointDressed_normalform`. Nested STRICTLY inside the banked `[137.0984, 137.1006]`. -/
theorem recomposedEndpointDressed_restated_r2 :
    (1370996710997 : Cut) / 10000000000 ≤ recomposedEndpointDressed
      ∧ recomposedEndpointDressed ≤ 1370996710998 / 10000000000 := by
  rw [recomposedEndpointDressed_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket
  exact dressed_core_r2 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi cutLog_m01_sharp cutLog_mb_deep
    cutLog_bMass0_deep cutLog_bMass2_deep

/-! ## (7) THE SHARPER PREDICTIONS. -/

/-- ★★★ THE FOLD'S PREDICTION (bare, deepened): `recomposedEndpoint < 137`, re-certified from the
    deepened sharp upper bound `≤ 1363071881406/1e10 = 136.3071881406 < 137`. The certified bracket lies
    STRICTLY BELOW the measured `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof); the
    derivation does NOT bend toward the measurement (G2 absolute NO-FIT). -/
theorem bare_lt_137_r2 : recomposedEndpoint < 137 := by
  have h := recomposedEndpoint_restated_r2.2
  have : (1363071881406 / 10000000000 : Cut) < 137 := by norm_num
  linarith

/-- ★★★ THE FOLD'S PREDICTION (dressed, deepened): `137 < recomposedEndpointDressed`, re-certified from
    the deepened sharp lower bound `≥ 1370996710997/1e10 = 137.0996710997 > 137`. -/
theorem dressed_gt_137_r2 : 137 < recomposedEndpointDressed := by
  have h := recomposedEndpointDressed_restated_r2.1
  have : (137 : Cut) < 1370996710997 / 10000000000 := by norm_num
  linarith

/-! ## (8) W8 NON-VACUITY WITH TEETH. -/

theorem cutLog_b0_deep_strict : (17337287949546 : Cut) / 10000000000000 < 17337287949547 / 10000000000000 := by norm_num
theorem cutLog_b2_deep_strict : (-10887237252238 / 10000000000000 : Cut) < -10887237252235 / 10000000000000 := by norm_num
theorem cutLog_mb_deep_strict : (-40893066400068 / 10000000000000 : Cut) < -40893066400067 / 10000000000000 := by norm_num
theorem bare_restated_r2_strict : (1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000 := by norm_num
theorem dressed_restated_r2_strict : (1370996710997 : Cut) / 10000000000 < 1370996710998 / 10000000000 := by norm_num

/-- ★ W8 — THE DEEPENING GENUINELY IMPROVES THE BANKED RUNG1 EDGE BRACKETS from both ends: the new
    `L_b0` window `[17337287949546/1e13, 17337287949547/1e13]` is strictly inside Rung1's
    `[17337287/1e7, 17337288/1e7]`; the new `L_b2` window `[−10887237252238/1e13, −10887237252235/1e13]`
    is strictly inside `[−10887238/1e7, −10887236/1e7]`; the new `L_mb` window `[−40893066400068/1e13,
    −40893066400067/1e13]` is strictly inside `[−40893067/1e7, −40893066/1e7]`. Each is a real
    tightening. -/
theorem deepening_improves_edge :
    ((17337287 / 10000000 : Cut) < 17337287949546 / 10000000000000
        ∧ (17337287949547 / 10000000000000 : Cut) < 17337288 / 10000000)
    ∧ ((-10887238 / 10000000 : Cut) < -10887237252238 / 10000000000000
        ∧ (-10887237252235 / 10000000000000 : Cut) < -10887236 / 10000000)
    ∧ ((-40893067 / 10000000 : Cut) < -40893066400068 / 10000000000000
        ∧ (-40893066400067 / 10000000000000 : Cut) < -40893066 / 10000000) :=
  ⟨⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩⟩

/-- ★ W8 — THE BARE ENDPOINT NESTS STRICTLY inside the banked N579/Rung1 ≈9-digit bracket
    `[136.307188, 136.3071883]` from BOTH ends: `1363071880/1e7 < 1363071881405/1e10` and
    `1363071881406/1e10 < 1363071883/1e7`. A real tightening (≈ 9 → ≈ 12 sig digits). -/
theorem bare_nested_strict :
    (1363071880 / 10000000 : Cut) < 1363071881405 / 10000000000
      ∧ (1363071881406 / 10000000000 : Cut) < 1363071883 / 10000000 :=
  ⟨by norm_num, by norm_num⟩

/-- ★ W8 — THE DRESSED ENDPOINT NESTS STRICTLY inside the banked N579 bracket `[137.0984, 137.1006]`
    from BOTH ends: `1370984/1e4 < 1370996710997/1e10` and `1370996710998/1e10 < 1371006/1e4`. -/
theorem dressed_nested_strict :
    (1370984 / 10000 : Cut) < 1370996710997 / 10000000000
      ∧ (1370996710998 / 10000000000 : Cut) < 1371006 / 10000 :=
  ⟨by norm_num, by norm_num⟩

/-! ## THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE D7 NARROWING RUNG 2 (arc-M/O2 keystone, huc campaign node 4, welded landing).

    (1)–(3) THE DEEPENED EDGE LOGS: `cutLog mass0 ∈ [17337287949546/1e13, 17337287949547/1e13]`
        (`cutLog_b0_deep`), `cutLog mass2 ∈ [−10887237252238/1e13, −10887237252235/1e13]`
        (`cutLog_b2_deep`), `cutLog mbRatioDerived ∈ [−40893066400068/1e13, −40893066400067/1e13]`
        (`cutLog_mb_deep`) — each ≈ 10⁶× tighter than the banked Rung1 edge brackets, from the banked
        NB11 s6 numerals through the banked exp instrument;
    (4) THE WIRED-IN SHARP `cutLog(mass0/mass1)` (Rung1/NB11) + `κ` (ext6);
    (6) THE RE-ASSEMBLED RESTATEMENTS AS `1/α(0)`: `recomposedEndpoint ∈ [1363071881405/1e10,
        1363071881406/1e10]` (`recomposedEndpoint_restated_r2`) and `recomposedEndpointDressed ∈
        [1370996710997/1e10, 1370996710998/1e10]` (`recomposedEndpointDressed_restated_r2`) — certified
        two-sided rational brackets (`136.3071881405 …` and `137.0996710997 …`, width `10⁻¹⁰`, ≈ 12
        significant digits), each nested STRICTLY inside the banked N579 bracket;
    (7) THE PREDICTIONS (sharper): `recomposedEndpoint < 137` (`bare_lt_137_r2`) and
        `137 < recomposedEndpointDressed` (`dressed_gt_137_r2`) — the certified brackets EXCLUDE the
        measured `1/α(0) ≈ 137.036` (removable prose) from either side;
    (8) TEETH: every deepened bracket is two-sided (`_strict`); both re-assembled brackets are two-sided;
        the deepening genuinely improves the Rung1 edge brackets from both ends
        (`deepening_improves_edge`); both endpoints nest strictly inside the banked brackets
        (`bare_nested_strict` / `dressed_nested_strict`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(8) THEOREM-EXACT /
    CERTIFIED now (exact inequalities / certified rational brackets of `Cut`/ℚ, foundations-only, no
    error bar). This node banks the second NARROWING RUNG (≈ 9 → ≈ 12 significant digits, bare; ≈ 4 →
    ≈ 12, dressed). ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER
    asserted / NEVER fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. The DOMINANT residual is now
    `κ = 1/cutPi` (ext6, endpoint contribution `≈ 10⁻¹¹`), sharpenable one grid deeper (a deeper `cutCos`
    read of `leastCosZero`), plus the edge logs another rung — the same instrument ladder, one more turn.
    The measured `1/α(0) ≈ 137.036` and the recomposed `≈ 136.307` / dressed `≈ 137.0997` are REMOVABLE
    ORIENTATION PROSE ONLY. -/
theorem d7NarrowingRung2_landing :
    -- (1)–(3) the deepened edge logs
    (((17337287949546 : Cut) / 10000000000000 ≤ cutLog mass0
        ∧ cutLog mass0 ≤ 17337287949547 / 10000000000000)
      ∧ ((-10887237252238 / 10000000000000 : Cut) ≤ cutLog mass2
          ∧ cutLog mass2 ≤ -10887237252235 / 10000000000000)
      ∧ ((-40893066400068 / 10000000000000 : Cut) ≤ cutLog mbRatioDerived
          ∧ cutLog mbRatioDerived ≤ -40893066400067 / 10000000000000))
    -- (6) the re-assembled restatements as 1/α(0)
    ∧ ((1363071881405 : Cut) / 10000000000 ≤ recomposedEndpoint
        ∧ recomposedEndpoint ≤ 1363071881406 / 10000000000)
    ∧ ((1370996710997 : Cut) / 10000000000 ≤ recomposedEndpointDressed
        ∧ recomposedEndpointDressed ≤ 1370996710998 / 10000000000)
    -- (7) the predictions
    ∧ (recomposedEndpoint < 137)
    ∧ (137 < recomposedEndpointDressed)
    -- (8) teeth
    ∧ ((17337287949546 : Cut) / 10000000000000 < 17337287949547 / 10000000000000)
    ∧ ((1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000)
    ∧ ((1370996710997 : Cut) / 10000000000 < 1370996710998 / 10000000000)
    ∧ (((17337287 / 10000000 : Cut) < 17337287949546 / 10000000000000
          ∧ (17337287949547 / 10000000000000 : Cut) < 17337288 / 10000000)
        ∧ ((-10887238 / 10000000 : Cut) < -10887237252238 / 10000000000000
            ∧ (-10887237252235 / 10000000000000 : Cut) < -10887236 / 10000000)
        ∧ ((-40893067 / 10000000 : Cut) < -40893066400068 / 10000000000000
            ∧ (-40893066400067 / 10000000000000 : Cut) < -40893066 / 10000000))
    ∧ ((1363071880 / 10000000 : Cut) < 1363071881405 / 10000000000
        ∧ (1363071881406 / 10000000000 : Cut) < 1363071883 / 10000000)
    ∧ ((1370984 / 10000 : Cut) < 1370996710997 / 10000000000
        ∧ (1370996710998 / 10000000000 : Cut) < 1371006 / 10000) :=
  ⟨⟨cutLog_b0_deep, cutLog_b2_deep, cutLog_mb_deep⟩,
   recomposedEndpoint_restated_r2,
   recomposedEndpointDressed_restated_r2,
   bare_lt_137_r2,
   dressed_gt_137_r2,
   cutLog_b0_deep_strict,
   bare_restated_r2_strict,
   dressed_restated_r2_strict,
   deepening_improves_edge,
   bare_nested_strict,
   dressed_nested_strict⟩

end

end Phys.Algebra.D7NarrowingRung2
