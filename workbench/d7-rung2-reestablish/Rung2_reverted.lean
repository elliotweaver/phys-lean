/-
  # D7 NARROWING RUNG 2 — sharpen the three DERIVED edge logs to `≈ 10⁻¹²` → a ~12-significant-digit
  #   certified restatement of the recomposed census-conserving endpoint AS `1/α(0)`
  #   (arc-D THE DIGITS, docs/SEED_DIGITS.md §D5/§D7; D7NarrowingRung1 290cd30's named successor,
  #   owner R2 t_db0153ae)
  =================================================================================================

  OWNER-DIRECTED (t_db0153ae, R2 authorized, NO-BLOCK mandate). Directed successor of
  `D7NarrowingRung1` (which sharpened the three edge logs to `≈ 10⁻⁷` each and re-assembled a
  `≈ 9`-significant-digit bracket `[136.307188, 136.3071883]` AS `1/α(0)`). This node is the SECOND
  rung of the D5 NARROWING CAMPAIGN toward the ⛔ ≥15-significant-digit floor: it pushes EVERY edge
  log from `≈ 10⁻⁷` to `≈ 10⁻¹²` and re-assembles a `≈ 12`-significant-digit certified bracket.

  ## THE ONE-LAW RE-DIAGNOSIS (reading the banked platform + a mpmath aim-scan, NOT re-deriving)

  The recomposed endpoint's normal form (`recomposedEndpoint_normalform`, banked) is
      recomposedEndpoint = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2),
  with `κ = (1/cutPi)/3`, `L_m01 = cutLog(mass0/mass1)`, `L_mb = cutLog mbRatioDerived`,
  `L_b0 = cutLog mass0`, `L_b2 = cutLog mass2`. After rung 1 the three edge logs were the bottleneck
  at `≈ 10⁻⁷`. This rung sharpens them to `≈ 10⁻¹²` (the underlying `mass0`/`mass2`/`mbRatioDerived`
  numerals are banked to `≈ 10⁻¹⁴`, and rung 1 used only 7-digit rational log bounds — an
  instrument-index choice, not a limit). With the edge logs at `≈ 10⁻¹²`:
    • `L_b0` width `10⁻¹²` → endpoint contribution `≈ (11/3)·κ·10⁻¹² ≈ 4×10⁻¹³`;
    • `L_b2` width `10⁻¹²` → `≈ (5/3)·κ·10⁻¹² ≈ 2×10⁻¹³`;
    • `L_mb` width `2×10⁻¹²` → `≈ (7/3)·κ·2×10⁻¹² ≈ 5×10⁻¹³`;
    • `L_m01` width `10⁻¹¹` (NB11 s6 cap) → `≈ 2·κ·10⁻¹¹ ≈ 2×10⁻¹²`;
    • ★ `κ = (1/cutPi)/3` width `≈ 6.8×10⁻¹³` (from `inv_cutPi_bracket_ext6` width `2.03×10⁻¹²`) →
      `≈ 6.8×10⁻¹³·C ≈ 1.0×10⁻¹¹` — the NEW DOMINANT residual.
  So the assembled endpoint width is `≈ 1.3×10⁻¹¹`, giving a clean `[1363071881405/1e10,
  1363071881406/1e10] = [136.3071881405, 136.3071881406]` — `≈ 12 significant digits` (up from 9).
  ⛔ HONEST: this rung does NOT reach the ≥15-digit floor. After it, the DOMINANT residuals are
  `κ = 1/cutPi` (`≈ 2×10⁻¹²`) and `L_m01` (`10⁻¹¹`) — NOT the edge logs. The ≥15-digit floor
  therefore needs the NEXT rung: `1/cutPi` one decade deeper (a `NarrowedBracket13`-style deeper
  `cutCos` positivity grid) + `L_m01` at the `s7` mass grid. NAMED and handed to the ONE directed
  successor. This is the ticket's target-3 note made precise: κ, not the edge logs, is next.

  ## WHAT THIS NODE BANKS (all THEOREM-EXACT / CERTIFIED, foundations-only, no error bar)

    (1) THE SHARPENED HEAVY SHAPE LOG: `L_b0 = cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`
        (`cutLog_b0_r2`, width `10⁻¹²`), from the banked sharp `mass0 ∈ [5661726012625402/1e15,
        5661726012625422/1e15]` (NB11 `mass0_lo_s6`/`hi_s6`) through the banked exp instrument
        (`cutLog_ge_certified` N=21, `cutLog_le_certified` N=22) + `cutLog_mono`. ≈ 10⁵× tighter than
        rung 1's `[17337287/1e7, 17337288/1e7]`.
    (2) THE SHARPENED LIGHT SHAPE LOG: `L_b2 = cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`
        (`cutLog_b2_r2`, width `10⁻¹²`), from the sharp `mass2 = b2²` (NB11 `s6` products `wB·pB`,
        `wB·rB` → `b2 ∈ [580211920147532/1e15, 580211920147542/1e15]` → `mass2 ∈ [336645872281286/1e15,
        336645872281298/1e15]`) through the reciprocal `cutLog(1/mass2)` (N=17/18) + `cutLog_inv_pos`.
    (3) THE SHARPENED UP/DOWN RELATIVE LOG: `L_mb = cutLog mbRatioDerived ∈ [−4089306640008/1e12,
        −4089306640006/1e12]` (`cutLog_mb_r2`, width `2×10⁻¹²`), from the CLOSED FORM
        `(1−q)²/(3(1+q))` with the banked `q² = 1/2` sharpened to `q ∈ [7071067811865/1e13,
        7071067811866/1e13]` → `mbRatioDerived ∈ [16750843898049/1e15, 16750843898062/1e15]`, read
        through the reciprocal `cutLog(1/mbRatioDerived)` (N=29/30).
    (4) THE WIRED-IN SHARP `L_m01`: `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        (banked NB11 `cutLog_lo_s6`/`hi_s6`, width `10⁻¹¹`).
    (5) THE ABSTRACT ARITHMETIC CORE `endpoint_core_r2` (W9 — opaque `k, L, Lmb, Lb0, Lb2` with their
        `r2` bracket hypotheses; transcendentals OUT of the arithmetic): the endpoint normal form lands
        in `[1363071881405/1e10, 1363071881406/1e10]` via the inner combination `∈ [149379518556/1e10,
        149379518557/1e10]`.
    (6) ★★★ THE RE-ASSEMBLED RESTATEMENT AS `1/α(0)`: `1363071881405/1e10 ≤ recomposedEndpoint ≤
        1363071881406/1e10` (`recomposedEndpoint_restated_r2`, `[136.3071881405, 136.3071881406]`, width
        `10⁻¹⁰`, ≈ 12 significant digits `136.3071881405`) — nested strictly inside rung 1's
        `[136.307188, 136.3071883]` from both ends.
    (7) THE PREDICTION (sharper still): `recomposedEndpoint < 137` re-certified from the sharp upper
        bound (`recomposedEndpoint_lt_137_r2`) — the certified bracket lies STRICTLY BELOW the measured
        `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof). NO-FIT absolute.
    (8) W8 TEETH: each sharpened bracket is genuinely two-sided (`_strict`); the re-assembled bracket
        is two-sided; each rung-2 window strictly improves rung 1's from both ends
        (`rung2_improves_rung1`).

  ## THE HONEST GRADE / SCOPE (SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT / CERTIFIED NOW: (1)–(8) — exact inequalities / certified rational brackets of
  `Cut`/ℚ, foundations-only, no error bar. This rung takes the endpoint from ≈ 9 to ≈ 12 significant
  digits.

  ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted /
  NEVER fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. After this rung the DOMINANT residuals are
  `κ = 1/cutPi` (`≈ 2×10⁻¹²`, from the `1e11` `cutCos` positivity grid) and `L_m01` (`10⁻¹¹`, the
  NB11 `s6` mass grid). Rung 3: push `1/cutPi` one decade deeper (`NarrowedBracket13`-style `1e12`
  `cutCos` double-double-angle grid) + read `mass0/mass1` at an `s7` grid → endpoint `≈ 10⁻¹³–10⁻¹⁴`.
  NOT a block: forward autonomous structural work remains, and no path here fits a measured value or
  needs a new axiom.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete every physics word: what remains, over the derived ℝ `Cut`, is that
  `1733728794954/1e12 ≤ cutLog mass0 ≤ 1733728794955/1e12`; that `−1088723725224/1e12 ≤ cutLog mass2
  ≤ −1088723725223/1e12`; that `−4089306640008/1e12 ≤ cutLog mbRatioDerived ≤ −4089306640006/1e12`;
  that `1363071881405/1e10 ≤ recomposedEndpoint ≤ 1363071881406/1e10`; and that
  `recomposedEndpoint < 137`. Pure real / rational arithmetic on the banked derived objects.

  ## NOT FREE-FLOATING (seed / SOUL rail)

  Every production TYPE mentions the banked derived objects (`recomposedEndpoint` / `mass0` / `mass2`
  / `mbRatioDerived` / `bMass` / `kappaLeading` / `cutLog` / `cutPi`, over the derived ℝ `Cut`).

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — every sharpened bracket FALLS OUT of a banked numeral bracket + the banked
    `ContinuumBracket` exp instrument; no value premised.
  - G2 NO EMPIRICAL NUMBER — no `137.036`, no PDG, no measured `α`; the measured `1/α(0) ≈ 137.036` is
    removable orientation prose; NO bracket/index is selected BECAUSE of where the measured value sits.
    Explicit NO-FIT.
  - G3 EXACT / CERTIFIED — every landing is an exact inequality of `Cut`/ℚ; the ONE open front (the
    ≥15-digit floor) is NAMED and handed forward.
  - G4 DERIVED, NOT POSITED — every input is a banked derived object (see DEPENDENCIES).
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass. Ground field the DERIVED ℝ `Cut`; NO Mathlib
    `Real`/`Complex` as content — Mathlib is MACHINERY only; NO floats. `set_option maxHeartbeats
    2000000` is the banked NB11 convention for the exp-cert lemmas (NOT inflation; the deepest cert
    N=29/30 measured at 12s in a bounded probe, W9).
  - G7 ONE LAW — we did NOT grind the endpoint directly; we DIAGNOSED (banked platform + aim-scan) that
    after the edge logs the NEW bottleneck is `κ = 1/cutPi`, not the edge logs; sharpened the edge logs
    through the same banked instrument, wired in the banked sharp `L_m01` + `κ` FREE, and NAMED the κ
    push as the next rung. No fit, no weakened floor, no asserted digit. The endpoint bracket assembly
    stays in the abstract arithmetic core `endpoint_core_r2` (transcendentals out — W9).
  - G8 TEETH (W8) — each sharpened bracket is strictly two-sided; the re-assembled bracket is strictly
    two-sided; each rung-2 window strictly improves rung 1's from both ends.

  DEPENDENCIES (all banked, foundations-only): `D7NarrowingRung1` (the rung-1 pattern + `mass0_clean_*`,
  `b2_sharp_*`, `mass2_clean_*`); `D7CompositionAttestation` (`recomposedEndpoint_normalform`,
  `kappa_bracket`); `NarrowedBracket11` (`mass0_lo_s6`/`hi_s6`, `wp_lo_s6`/`hi_s6`, `wr_lo_s6`/`hi_s6`,
  `cutLog_lo_s6`/`hi_s6`); `GenerationMassRatiosNumeric` (`b2`, `mass0`, `mass2`, `mass0_pos`,
  `mass2_pos`, `pB`/`wB`/`rB`); `UpDownRelativeScaleFoldPhase` (`mbRatioDerived`, `mbRatioDerived_closed`,
  `mbRatioDerived_pos`, `q`, `q_sq`, `q_pos`, `q_lt_one`); `FreezeoutEdgeCrossSectorReduction` (`bMass`);
  `ComposedFreezeoutDissolved` (`cutLog_inv_pos`); `AssembledBracket` (`cutLog_mono`); `ContinuumBracket`
  (`cutLog_ge_certified`, `cutLog_le_certified`, `partialExp`, `expRemBound`); the derived `Cut`. Standard
  Mathlib `norm_num`/`ring`/`nlinarith`/`linarith`/`mul_le_mul` MACHINERY on the DERIVED objects
  (STANDARD §3). NO posited value as content, NO Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.D7NarrowingRung1
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
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE SHARPENED HEAVY SHAPE LOG `L_b0 = cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`. -/

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED HEAVY SHAPE LOG BRACKET (rung 2): `1733728794954/1e12 ≤ cutLog mass0 ≤
    1733728794955/1e12` (`≈ 1.733728794954…`). Width `10⁻¹²` — ≈ 10⁵× tighter than rung 1's
    `[17337287/1e7, 17337288/1e7]`. From the banked sharp `mass0 ∈ [5661726012625402/1e15,
    5661726012625422/1e15]` (NB11 `mass0_lo_s6`/`hi_s6`, reused via `mass0_clean_lo`/`hi`) through the
    exp instrument (`cutLog_ge_certified` N=21, `cutLog_le_certified` N=22) + `cutLog_mono`. -/
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
    The sharp `mass2` comes from the NB11 `s6` products `wB·pB`, `wB·rB` (one grid deeper than rung 1's NB4). -/

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
/-- ★★ THE SHARPENED LIGHT SHAPE LOG BRACKET (rung 2): `−1088723725224/1e12 ≤ cutLog mass2 ≤
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
    −4089306640006/1e12]` — from the CLOSED FORM `(1−q)²/(3(1+q))` with `q² = 1/2` sharpened one grid deeper. -/

/-- The sharp `q = cutCos(cutPi/4)` bracket (one grid deeper than rung 1) from the banked `q² = 1/2`,
    `0 < q`: `q ∈ [7071067811865/1e13, 7071067811866/1e13]`. -/
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
/-- ★★ THE SHARPENED UP/DOWN RELATIVE LOG BRACKET (rung 2): `−4089306640008/1e12 ≤ cutLog
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

/-! ## (D) THE `bMass`-shape restatements (as the normal form uses `cutLog (bMass 0)`, `cutLog (bMass 2)`). -/

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

/-! ## (E) THE SHARPENED ABSTRACT ARITHMETIC CORE (W9) + THE RE-ASSEMBLED RESTATEMENT. -/

set_option maxHeartbeats 2000000 in
/-- THE RUNG-2 ABSTRACT ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with rung-2 bracket
    hypotheses; the transcendentals stay OUT of the arithmetic): with `k` in the banked `κ` bracket,
    `L ∈ [815406111272/1e11, 815406111273/1e11]`, `Lmb ∈ [−4089306640008/1e12, −4089306640006/1e12]`,
    `Lb0 ∈ [1733728794954/1e12, 1733728794955/1e12]`, `Lb2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`,
    then `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈ [1363071881405/1e10, 1363071881406/1e10]`.
    The inner combination is in `[149379518556/1e10, 149379518557/1e10]`. -/
theorem endpoint_core_r2 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-4089306640008 / 1000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -4089306640006 / 1000000000000)
    (hLb0 : (1733728794954 : Cut) / 1000000000000 ≤ Lb0 ∧ Lb0 ≤ 1733728794955 / 1000000000000)
    (hLb2 : (-1088723725224 / 1000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -1088723725223 / 1000000000000) :
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

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT AS `1/α(0)` (rung 2): the recomposed census-conserving endpoint
    is bracketed by two explicit rationals of `Cut`, `1363071881405/1e10 ≤ recomposedEndpoint ≤
    1363071881406/1e10` (`136.3071881405 … 136.3071881406`, width `10⁻¹⁰`, ≈ 12 significant digits
    `136.3071881405`). Assembled by the rung-2 abstract core `endpoint_core_r2` from the banked sharp
    `cutLog(mass0/mass1)` (NB11, wired via `cutLog_m01_sharp`) and the three rung-2 edge logs
    (`cutLog_mb_r2`, `cutLog_bMass0_r2`, `cutLog_bMass2_r2`) and the banked `κ` bracket (`kappa_bracket`).
    ≈ 3000× narrower than rung 1's `[136.307188, 136.3071883]`. -/
theorem recomposedEndpoint_restated_r2 :
    (1363071881405 : Cut) / 10000000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 1363071881406 / 10000000000 := by
  rw [recomposedEndpoint_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket
  exact endpoint_core_r2 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi cutLog_m01_sharp cutLog_mb_r2
    cutLog_bMass0_r2 cutLog_bMass2_r2

/-! ## (F) THE SHARPER PREDICTION + NESTING IN RUNG 1. -/

/-- ★★★ THE FOLD'S PREDICTION (rung 2): `recomposedEndpoint < 137` re-certified from the sharp upper
    bound `≤ 1363071881406/1e10 = 136.3071881406 < 137`. The certified bracket lies STRICTLY BELOW the
    measured `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof); the derivation does NOT bend
    toward the measurement (G2 absolute NO-FIT). -/
theorem recomposedEndpoint_lt_137_r2 : recomposedEndpoint < 137 := by
  have h := recomposedEndpoint_restated_r2.2
  have : (1363071881406 / 10000000000 : Cut) < 137 := by norm_num
  linarith

/-- The rung-2 bracket is nested strictly inside rung 1's `[1363071880/1e7, 1363071883/1e7]` from BOTH
    ends: `1363071880/1e7 ≤ 1363071881405/1e10` and `1363071881406/1e10 ≤ 1363071883/1e7`. -/
theorem r2_nested_in_r1 :
    (1363071880 / 10000000 : Cut) ≤ 1363071881405 / 10000000000
      ∧ (1363071881406 / 10000000000 : Cut) ≤ 1363071883 / 10000000 :=
  ⟨by norm_num, by norm_num⟩

/-! ## (G) W8 NON-VACUITY WITH TEETH. -/

theorem cutLog_b0_r2_strict : (1733728794954 : Cut) / 1000000000000 < 1733728794955 / 1000000000000 := by norm_num
theorem cutLog_b2_r2_strict : (-1088723725224 / 1000000000000 : Cut) < -1088723725223 / 1000000000000 := by norm_num
theorem cutLog_mb_r2_strict : (-4089306640008 / 1000000000000 : Cut) < -4089306640006 / 1000000000000 := by norm_num
theorem restated_r2_strict : (1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000 := by norm_num

/-- ★ W8 — RUNG 2 GENUINELY IMPROVES RUNG 1's EDGE BRACKETS from both ends: the new `L_b0` window
    `[1733728794954/1e12, 1733728794955/1e12]` is strictly inside rung 1's `[17337287/1e7, 17337288/1e7]`;
    the new `L_b2` window is strictly inside rung 1's `[−10887238/1e7, −10887236/1e7]`; the new `L_mb`
    window is strictly inside rung 1's `[−40893067/1e7, −40893066/1e7]`. Each is a real tightening. -/
theorem rung2_improves_rung1 :
    ((17337287 / 10000000 : Cut) < 1733728794954 / 1000000000000
      ∧ (1733728794955 / 1000000000000 : Cut) < 17337288 / 10000000)
    ∧ ((-10887238 / 10000000 : Cut) < -1088723725224 / 1000000000000
      ∧ (-1088723725223 / 1000000000000 : Cut) < -10887236 / 10000000)
    ∧ ((-40893067 / 10000000 : Cut) < -4089306640008 / 1000000000000
      ∧ (-4089306640006 / 1000000000000 : Cut) < -40893066 / 10000000) :=
  ⟨⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩⟩

/-! ## (H) THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE D7 NARROWING RUNG 2 (arc-D THE DIGITS, welded landing).

    (1) THE SHARPENED EDGE LOGS: `cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]`
        (`cutLog_b0_r2`, width `10⁻¹²`), `cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]`
        (`cutLog_b2_r2`, width `10⁻¹²`), `cutLog mbRatioDerived ∈ [−4089306640008/1e12,
        −4089306640006/1e12]` (`cutLog_mb_r2`, width `2×10⁻¹²`) — each ≈ 10⁵× tighter than rung 1's,
        from the banked sharp `mass0`/`mass2`/`mbRatioDerived` numerals through the banked exp instrument
        (deepest N=29/30, measured 12s, W9);
    (2) THE WIRED-IN SHARP `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        (`cutLog_m01_sharp`, from NarrowedBracket11, width `10⁻¹¹`);
    (3) THE RE-ASSEMBLED D7 RESTATEMENT AS `1/α(0)`: `1363071881405/1e10 ≤ recomposedEndpoint ≤
        1363071881406/1e10` (`recomposedEndpoint_restated_r2`), a certified two-sided rational bracket
        (`136.3071881405 … 136.3071881406`, width `10⁻¹⁰`, ≈ 12 significant digits) of the DERIVED closed
        real, nested strictly inside rung 1's `[136.307188, 136.3071883]` from both ends (`r2_nested_in_r1`);
    (4) THE FOLD'S PREDICTION (sharper): `recomposedEndpoint < 137` (`recomposedEndpoint_lt_137_r2`) —
        the certified bracket EXCLUDES the measured `1/α(0) ≈ 137.036` (removable prose);
    (5) TEETH: every sharpened bracket is two-sided (`_strict`); the re-assembled bracket is two-sided;
        rung 2 genuinely improves rung 1's edge brackets from both ends (`rung2_improves_rung1`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) THEOREM-EXACT /
    CERTIFIED now (exact inequalities / a certified rational bracket of `Cut`/ℚ, foundations-only, no
    error bar). This node banks the SECOND NARROWING RUNG (≈ 9 → ≈ 12 significant digits).
    ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted / NEVER
    fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. The DOMINANT residuals are now `κ = 1/cutPi`
    (`≈ 2×10⁻¹²`, the `1e11` `cutCos` positivity grid) and `L_m01` (`10⁻¹¹`, the NB11 `s6` grid) — NOT
    the edge logs. Rung 3: push `1/cutPi` one decade deeper (a `NarrowedBracket13`-style `1e12` `cutCos`
    double-double-angle grid) + read `mass0/mass1` at an `s7` grid. The measured `1/α(0) ≈ 137.036` and
    the recomposed `≈ 136.3072` are REMOVABLE ORIENTATION PROSE ONLY. -/
theorem d7NarrowingRung2_landing :
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
    -- (3) the re-assembled restatement as 1/α(0)
    ∧ ((1363071881405 : Cut) / 10000000000 ≤ recomposedEndpoint
        ∧ recomposedEndpoint ≤ 1363071881406 / 10000000000)
    -- (4) the fold's prediction
    ∧ recomposedEndpoint < 137
    -- (5) teeth
    ∧ ((1733728794954 : Cut) / 1000000000000 < 1733728794955 / 1000000000000)
    ∧ ((1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000)
    ∧ (((17337287 / 10000000 : Cut) < 1733728794954 / 1000000000000
        ∧ (1733728794955 / 1000000000000 : Cut) < 17337288 / 10000000)
      ∧ ((-10887238 / 10000000 : Cut) < -1088723725224 / 1000000000000
        ∧ (-1088723725223 / 1000000000000 : Cut) < -10887236 / 10000000)
      ∧ ((-40893067 / 10000000 : Cut) < -4089306640008 / 1000000000000
        ∧ (-4089306640006 / 1000000000000 : Cut) < -40893066 / 10000000)) :=
  ⟨⟨cutLog_b0_r2, cutLog_b2_r2, cutLog_mb_r2⟩,
   cutLog_m01_sharp,
   recomposedEndpoint_restated_r2,
   recomposedEndpoint_lt_137_r2,
   cutLog_b0_r2_strict,
   restated_r2_strict,
   rung2_improves_rung1⟩

end

end Phys.Algebra.D7NarrowingRung2
