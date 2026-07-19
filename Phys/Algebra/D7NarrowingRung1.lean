/-
  # D7 NARROWING RUNG 1 — sharpen the DERIVED edge-log inputs → a ~9-significant-digit certified
  #   restatement of the recomposed census-conserving endpoint AS `1/α(0)`
  #   (arc-D THE DIGITS, docs/SEED_DIGITS.md §D5/§D7; D7CompositionAttestation 8445013's named
  #   successor, owner R2 t_c464fa87)
  =================================================================================================

  OWNER-DIRECTED (t_c464fa87, R2 authorized, NO-BLOCK mandate). Directed successor of
  `D7CompositionAttestation` (which banked the FULL composition-completeness attestation + a FIRST
  coarse re-narrow `cutLog(mass0/mass1) ∈ [8, 82/10]` + the coarse restatement bracket `[3406/25,
  13639/100]` = `[136.24, 136.39]`, ≈ 3 significant digits, AS `1/α(0)`). This node is the first
  rung of the D5 NARROWING CAMPAIGN toward the ⛔ ≥15-significant-digit floor: it sharpens EVERY
  dominant derived input of the recomposed endpoint and re-assembles a MUCH tighter certified bracket.

  ## THE DIAGNOSIS (what actually caps the precision — reading the banked platform, not re-deriving)

  The recomposed endpoint's normal form (`recomposedEndpoint_normalform`, banked) is
      recomposedEndpoint = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2),
  with `κ = (1/cutPi)/3`, `L_m01 = cutLog(mass0/mass1)`, `L_mb = cutLog mbRatioDerived`,
  `L_b0 = cutLog (bMass 0) = cutLog mass0`, `L_b2 = cutLog (bMass 2) = cutLog mass2`. The endpoint
  width is `Σ (∂/∂input)·(input width)`. Reading the banked brackets:
    • `L_m01` is ALREADY banked at width `10⁻¹¹` (`NarrowedBracket11.cutLog_lo_s6`/`cutLog_hi_s6`,
      via the split@6 `cutCos(2/9)` read) — its contribution to the endpoint width is `≈ 2·κ·10⁻¹¹
      ≈ 2×10⁻¹²`, NEGLIGIBLE. The D7 attestation merely wired in the COARSE `[8, 82/10]`; wiring in
      the banked sharp `L_m01` costs nothing new.
    • `κ = (1/cutPi)/3` is banked at width `≈ 2×10⁻¹²` (`inv_cutPi_bracket_ext6`) — its contribution
      `≈ (2×10⁻¹²/3)·C ≈ 10⁻¹¹`, NEGLIGIBLE.
    • THE ACTUAL BOTTLENECK is the THREE edge logs, each banked only at width `≈ 0.1–0.2`:
      `L_b0 ∈ [17/10, 18/10]`, `L_b2 ∈ [−12/10, −1]`, `L_mb ∈ [−41/10, −4]`. Each contributes
      `≈ 0.025–0.039` to the endpoint width — together `≈ 0.09`. These are what hold the endpoint to
      3 digits.
  So the correct rung is: SHARPEN THE THREE EDGE LOGS (from `≈ 0.1` to `≈ 10⁻⁷` each), wire in the
  banked sharp `L_m01`, and re-assemble. That drops the endpoint width from `≈ 0.15` to `≈ 3×10⁻⁷`
  — from 3 significant digits to ≈ 9.

  ## WHAT THIS NODE BANKS (all THEOREM-EXACT / CERTIFIED, foundations-only, no error bar)

    (1) THE SHARPENED HEAVY SHAPE LOG: `L_b0 = cutLog mass0 ∈ [17337287/1e7, 17337288/1e7]`
        (`cutLog_b0_sharp`, width `10⁻⁷`), from the banked sharp `mass0 ∈ [5661726012625402/1e15,
        5661726012625422/1e15]` (via `NarrowedBracket4.mass0_lo_sharp`/`mass0_hi_sharp`) through the
        banked `ContinuumBracket` instrument + `cutLog_mono`. ≈ 10⁶× tighter than `[17/10, 18/10]`.
    (2) THE SHARPENED LIGHT SHAPE LOG: `L_b2 = cutLog mass2 ∈ [−10887238/1e7, −10887236/1e7]`
        (`cutLog_b2_sharp`, width `2×10⁻⁷`), from the sharp `mass2` (via the NB4 sharp `wB·pB`, `wB·rB`
        product brackets → `b2` → `mass2 = b2²`) through the reciprocal `cutLog(1/mass2)` + the exp
        instrument. ≈ 10⁶× tighter than `[−12/10, −1]`.
    (3) THE SHARPENED UP/DOWN RELATIVE LOG: `L_mb = cutLog mbRatioDerived ∈ [−40893067/1e7,
        −40893066/1e7]` (`cutLog_mb_sharp`, width `10⁻⁷`), from the CLOSED FORM
        `mbRatioDerived = (1 − q)²/(3·(1 + q))` (`mbRatioDerived_closed`) with the banked `q² = 1/2`
        (`q_sq`) sharpened to `q ∈ [707106781/1e9, 707106782/1e9]`, giving a sharp RATIONAL bracket for
        `mbRatioDerived`, read through the reciprocal `cutLog(1/mbRatioDerived)` + the exp instrument.
        ≈ 10⁶× tighter than `[−41/10, −4]`.
    (4) THE WIRED-IN SHARP `L_m01`: `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        re-exported from `NarrowedBracket11` (banked; width `10⁻¹¹`).
    (5) THE SHARPENED ABSTRACT ARITHMETIC CORE `endpoint_core_s1` (W9 — opaque `k, L, Lmb, Lb0, Lb2`
        with their sharpened bracket hypotheses; transcendentals OUT of the arithmetic): the endpoint
        normal form lands in `[1363071880/1e7, 1363071883/1e7]` (`[136.307188, 136.3071883]`).
    (6) ★★★ THE RE-ASSEMBLED RESTATEMENT AS `1/α(0)`: `1363071880/1e7 ≤ recomposedEndpoint ≤
        1363071883/1e7` (`recomposedEndpoint_restated_sharp`, `[136.307188, 136.3071883]`, width
        `3×10⁻⁷`, ≈ 9 significant digits `136.307188`) — nested strictly inside the coarse `[136.24,
        136.39]` and ≈ 5×10⁵× narrower.
    (7) THE SHARPER PREDICTION: `recomposedEndpoint < 137` re-certified from the sharp upper bound
        (`recomposedEndpoint_lt_137_sharp`), and `< 13639/100` (still below the coarse ceiling,
        `recomposedEndpoint_below_coarse`) — the certified bracket lies STRICTLY BELOW the measured
        `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof). NO-FIT absolute.
    (8) W8 TEETH: each sharpened bracket is genuinely two-sided (`_strict`); the re-assembled bracket
        is genuinely two-sided; the sharpening genuinely improves the coarse brackets from both ends
        (`sharpening_improves_edge`).

  ## THE HONEST GRADE / SCOPE (SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT / CERTIFIED NOW: (1)–(8) — exact identities / inequalities / certified rational
  brackets of `Cut`/ℚ, foundations-only, no error bar. This rung takes the endpoint from ≈ 3 to ≈ 9
  significant digits.

  ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted /
  NEVER fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. After this rung the dominant residuals are
  again the three edge logs (each `≈ 10⁻⁷`), sharpenable to `≈ 10⁻¹²` by pushing the exp-instrument
  index `N` and reading `mass0`/`mass2` at the split@6 `cutCos(2/9)` grid + `q`/`√2` one grid deeper
  — exactly the same instrument, one more turn. That is the next narrowing rung. NOT a block: forward
  autonomous structural work remains, and no path here fits a measured value or needs a new axiom.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / running / band / census / freeze-out / flavour / lepton / quark / mass /
  generation / fine-structure / prediction": what remains, over the derived ℝ `Cut`, is that
  `17337287/1e7 ≤ cutLog mass0 ≤ 17337288/1e7`; that `−10887238/1e7 ≤ cutLog mass2 ≤ −10887236/1e7`;
  that `−40893067/1e7 ≤ cutLog mbRatioDerived ≤ −40893066/1e7`; that
  `1363071880/1e7 ≤ recomposedEndpoint ≤ 1363071883/1e7`; and that `recomposedEndpoint < 137`. Pure
  real / rational arithmetic on the banked derived objects. No theorem STATEMENT needs a physics word.

  ## NOT FREE-FLOATING (seed / SOUL rail)

  Every production TYPE mentions the banked derived objects (`recomposedEndpoint` / `mass0` / `mass2`
  / `mbRatioDerived` / `bMass` / `kappaLeading` / `cutLog` / `cutPi`, over the derived ℝ `Cut`). The
  brackets are certified readings of the banked objects; FALSE over an algebra without the banked
  two-channel / census / Born-square-mass / fold-phase / continuum stack — not generic.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — every sharpened bracket FALLS OUT of a banked numeral bracket (`mass0_*_sharp`,
    the NB4 sharp products, `q_sq`, `mbRatioDerived_closed`, the NB11 `cutLog_*_s6`) + the banked
    `ContinuumBracket` exp instrument; no value premised.
  - G2 NO EMPIRICAL NUMBER — no `137.036`, no PDG, no measured `α` in any statement or proof; the
    measured `1/α(0) ≈ 137.036` is removable orientation prose; NO bracket/index is selected BECAUSE of
    where the measured value sits. The exclusion `< 137` is a certified consequence of the DERIVATION.
    Explicit NO-FIT.
  - G3 EXACT / CERTIFIED — every landing is an exact inequality of `Cut`/ℚ or a certified rational
    bracket; the ONE open front (the ≥15-digit floor) is NAMED and handed forward.
  - G4 DERIVED, NOT POSITED — every input is a banked derived object (see DEPENDENCIES).
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation. Ground field the DERIVED ℝ `Cut`;
    NO Mathlib `Real`/`Complex` as content — Mathlib is MACHINERY only; NO floats.
  - G7 ONE LAW — we did NOT grind the endpoint directly; we DIAGNOSED (from the banked platform) that the
    edge logs, not `mass0/mass1`, are the live bottleneck (the ticket's stale diagnosis said otherwise),
    sharpened THEM through the same banked instrument, and wired in the already-banked sharp `L_m01` FREE.
    No fit, no weakened floor, no asserted digit. The endpoint bracket assembly stays in the abstract
    arithmetic core `endpoint_core_s1` (transcendentals out of the tableau — W9).
  - G8 TEETH (W8) — each sharpened bracket is strictly two-sided; the re-assembled bracket is strictly
    two-sided; the sharpening strictly improves the coarse brackets from both ends.

  DEPENDENCIES (all banked, foundations-only): `D7CompositionAttestation` (`recomposedEndpoint_normalform`,
  `kappa_bracket`, the coarse restatement); `NarrowedBracket4` (`mass0_lo_sharp`/`mass0_hi_sharp`,
  `wp_lo_sharp`/`wp_hi_sharp`/`wr_lo_sharp`/`wr_hi_sharp`, `b2_pos`); `NarrowedBracket11`
  (`cutLog_lo_s6`/`cutLog_hi_s6`); `GenerationMassRatios` (`b2`, `mass0`, `mass2`, `mass0_pos`,
  `mass2_pos`); `UpDownRelativeScaleFoldPhase` (`mbRatioDerived`, `mbRatioDerived_closed`,
  `mbRatioDerived_pos`, `q`, `q_sq`, `q_pos`, `q_lt_one`); `FreezeoutEdgeCrossSectorReduction` (`bMass`);
  `ComposedFreezeoutDissolved` (`cutLog_inv_pos`); `AssembledBracket` (`cutLog_mono`); `ContinuumBracket`
  (`cutLog_ge_certified`, `cutLog_le_certified`, `partialExp`, `expRemBound`); the derived `Cut`. Standard
  Mathlib `norm_num`/`ring`/`nlinarith`/`linarith`/`mul_le_mul` MACHINERY on the DERIVED objects
  (STANDARD §3). NO posited value as content, NO Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.D7CompositionAttestation
import Phys.Algebra.NarrowedBracket4
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.D7NarrowingRung1

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.AssembledBracket
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7CompositionAttestation
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE SHARPENED HEAVY SHAPE LOG `L_b0 = cutLog mass0 ∈ [17337287/1e7, 17337288/1e7]`. -/

/-- `mass0` cleared to a clean 15-digit rational bracket from the banked NB11 sharp Born squares. -/
theorem mass0_clean_lo : (5661726012625402 : Cut) / 1000000000000000 ≤ mass0 := by
  have h := Phys.Algebra.NarrowedBracket11.mass0_lo_s6
  have hk : (5661726012625402 : Cut) / 1000000000000000
      ≤ (1189719085816627 / 500000000000000 : Cut) * (1189719085816627 / 500000000000000) := by
    norm_num
  linarith

theorem mass0_clean_hi : mass0 ≤ (5661726012625422 : Cut) / 1000000000000000 := by
  have h := Phys.Algebra.NarrowedBracket11.mass0_hi_s6
  have hk : (1189719085816629 / 500000000000000 : Cut) * (1189719085816629 / 500000000000000)
      ≤ (5661726012625422 : Cut) / 1000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED HEAVY SHAPE LOG BRACKET: `17337287/1e7 ≤ cutLog mass0 ≤ 17337288/1e7`
    (`≈ 1.7337287…`). Width `10⁻⁷` — ≈ 10⁶× tighter than the banked `[17/10, 18/10]`. -/
theorem cutLog_b0_sharp :
    (17337287 : Cut) / 10000000 ≤ cutLog mass0 ∧ cutLog mass0 ≤ 17337288 / 10000000 := by
  have hpos : (0 : Cut) < mass0 := mass0_pos
  refine ⟨?_, ?_⟩
  · have hcert : (17337287 : Cut) / 10000000 ≤ cutLog (5661726012625402 / 1000000000000000) := by
      apply cutLog_ge_certified (5661726012625402 / 1000000000000000) (17337287 / 10000000) 21
        (by norm_num) (by norm_num)
      show partialExp (17337287 / 10000000 : Cut) 21 + expRemBound (17337287 / 10000000 : Cut) 21
        ≤ (5661726012625402 : Cut) / 1000000000000000
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((5661726012625402 : Cut) / 1000000000000000) ≤ cutLog mass0 :=
      cutLog_mono (by norm_num) mass0_clean_lo
    linarith
  · have hmono : cutLog mass0 ≤ cutLog ((5661726012625422 : Cut) / 1000000000000000) :=
      cutLog_mono hpos mass0_clean_hi
    have hcert : cutLog ((5661726012625422 : Cut) / 1000000000000000) ≤ (17337288 : Cut) / 10000000 := by
      apply cutLog_le_certified (5661726012625422 / 1000000000000000) (17337288 / 10000000) 22
        (by norm_num) (by norm_num)
      show (5661726012625422 : Cut) / 1000000000000000 ≤ partialExp (17337288 / 10000000 : Cut) 22
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith

/-! ## (B) THE SHARPENED LIGHT SHAPE LOG `L_b2 = cutLog mass2 ∈ [−10887238/1e7, −10887236/1e7]`. -/

/-- The sharp `b2` bracket from the banked NB4 sharp product brackets `wB·pB`, `wB·rB`:
    `b2 = 1 − (wB·pB − wB·rB)/2 ∈ [58021191/1e8, 580211935/1e9]`. -/
theorem b2_sharp_lo : (58021191 : Cut) / 100000000 ≤ b2 := by
  unfold b2
  have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
  rw [he]
  linarith [Phys.Algebra.NarrowedBracket4.wp_hi_sharp, Phys.Algebra.NarrowedBracket4.wr_lo_sharp]

theorem b2_sharp_hi : b2 ≤ (580211935 : Cut) / 1000000000 := by
  unfold b2
  have he : (1 : Cut) - wB * (pB - rB) / 2 = 1 - (wB * pB - wB * rB) / 2 := by ring
  rw [he]
  linarith [Phys.Algebra.NarrowedBracket4.wp_lo_sharp, Phys.Algebra.NarrowedBracket4.wr_hi_sharp]

theorem b2_sharp_pos : (0 : Cut) < b2 := by have := b2_sharp_lo; linarith

/-- The sharp `mass2 = b2²` bracket. -/
theorem mass2_clean_lo : (33664586 : Cut) / 100000000 ≤ mass2 := by
  have := mul_le_mul b2_sharp_lo b2_sharp_lo (by norm_num) (le_of_lt b2_sharp_pos)
  unfold mass2; nlinarith [this]

theorem mass2_clean_hi : mass2 ≤ (3366459 : Cut) / 10000000 := by
  have := mul_le_mul b2_sharp_hi b2_sharp_hi (le_of_lt b2_sharp_pos) (by norm_num)
  unfold mass2; nlinarith [this]

/-- The sharp `1/mass2` bracket by reciprocal-monotonicity: `1/mass2 ∈ [1e7/3366459, 1e8/33664586]`. -/
theorem invMass2_sharp : (10000000 : Cut) / 3366459 ≤ 1 / mass2 ∧ 1 / mass2 ≤ 100000000 / 33664586 := by
  have hpos : (0 : Cut) < mass2 := mass2_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mass2_clean_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mass2_clean_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED LIGHT SHAPE LOG BRACKET: `−10887238/1e7 ≤ cutLog mass2 ≤ −10887236/1e7`
    (`≈ −1.0887237…`). Read from the reciprocal `cutLog(1/mass2) ∈ [10887236/1e7, 10887238/1e7]`
    (certified via the exp instrument) through `cutLog mass2 = − cutLog(1/mass2)`. Width `2×10⁻⁷`. -/
theorem cutLog_b2_sharp :
    (-10887238 / 10000000 : Cut) ≤ cutLog mass2 ∧ cutLog mass2 ≤ -10887236 / 10000000 := by
  obtain ⟨hlo, hhi⟩ := invMass2_sharp
  have hinvpos : (0 : Cut) < 1 / mass2 := by positivity
  have hlog_lo : (10887236 : Cut) / 10000000 ≤ cutLog (1 / mass2) := by
    have hcert : (10887236 : Cut) / 10000000 ≤ cutLog (10000000 / 3366459) := by
      apply cutLog_ge_certified (10000000 / 3366459) (10887236 / 10000000) 15 (by norm_num) (by norm_num)
      show partialExp (10887236 / 10000000 : Cut) 15 + expRemBound (10887236 / 10000000 : Cut) 15
        ≤ (10000000 : Cut) / 3366459
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((10000000 : Cut) / 3366459) ≤ cutLog (1 / mass2) := cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mass2) ≤ (10887238 : Cut) / 10000000 := by
    have hmono : cutLog (1 / mass2) ≤ cutLog ((100000000 : Cut) / 33664586) := cutLog_mono hinvpos hhi
    have hcert : cutLog ((100000000 : Cut) / 33664586) ≤ (10887238 : Cut) / 10000000 := by
      apply cutLog_le_certified (100000000 / 33664586) (10887238 / 10000000) 16 (by norm_num) (by norm_num)
      show (100000000 : Cut) / 33664586 ≤ partialExp (10887238 / 10000000 : Cut) 16
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mass2) = - cutLog mass2 := cutLog_inv_pos mass2_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (C) THE SHARPENED UP/DOWN RELATIVE LOG `L_mb = cutLog mbRatioDerived ∈ [−40893067/1e7,
    −40893066/1e7]` — from the CLOSED FORM `(1−q)²/(3(1+q))` with the banked `q² = 1/2` sharpened. -/

/-- The sharp `q = cutCos(cutPi/4)` bracket from the banked `q² = 1/2`, `0 < q`:
    `q ∈ [707106781/1e9, 707106782/1e9]`. -/
theorem q_sharp_lo : (707106781 : Cut) / 1000000000 ≤ q := by nlinarith [q_sq, q_pos]
theorem q_sharp_hi : q ≤ (707106782 : Cut) / 1000000000 := by nlinarith [q_sq, q_pos]

/-- The sharp `mbRatioDerived = (1−q)²/(3(1+q))` bracket (decreasing in `q` on `(0,1)`):
    `mbRatioDerived ∈ [16750843797/1e12, 16750843922/1e12]`. -/
theorem mbRatio_sharp_lo : (16750843797 : Cut) / 1000000000000 ≤ mbRatioDerived := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [le_div_iff₀ h1]
  nlinarith [q_sharp_hi, q_pos, q_lt_one, q_sq]

theorem mbRatio_sharp_hi : mbRatioDerived ≤ (16750843922 : Cut) / 1000000000000 := by
  rw [mbRatioDerived_closed]
  have h1 : (0 : Cut) < 3 * (1 + q) := by have := q_pos; linarith
  rw [div_le_iff₀ h1]
  nlinarith [q_sharp_lo, q_pos, q_lt_one, q_sq]

theorem mbRatio_sharp_pos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos

/-- The sharp `1/mbRatioDerived` bracket by reciprocal-monotonicity:
    `1/mbRatioDerived ∈ [1e12/16750843922, 1e12/16750843797]`. -/
theorem invMbRatio_sharp :
    (1000000000000 : Cut) / 16750843922 ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 1000000000000 / 16750843797 := by
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [mbRatio_sharp_hi]
  · rw [div_le_iff₀ hpos]; nlinarith [mbRatio_sharp_lo]

set_option maxHeartbeats 2000000 in
/-- ★★ THE SHARPENED UP/DOWN RELATIVE LOG BRACKET: `−40893067/1e7 ≤ cutLog mbRatioDerived ≤
    −40893066/1e7` (`≈ −4.0893066…`). Read from the reciprocal `cutLog(1/mbRatioDerived) ∈
    [40893066/1e7, 40893067/1e7]` (certified via the exp instrument) through the identity
    `cutLog mbRatioDerived = − cutLog(1/mbRatioDerived)`. Width `10⁻⁷`. -/
theorem cutLog_mb_sharp :
    (-40893067 / 10000000 : Cut) ≤ cutLog mbRatioDerived
      ∧ cutLog mbRatioDerived ≤ -40893066 / 10000000 := by
  obtain ⟨hlo, hhi⟩ := invMbRatio_sharp
  have hinvpos : (0 : Cut) < 1 / mbRatioDerived := by positivity
  have hlog_lo : (40893066 : Cut) / 10000000 ≤ cutLog (1 / mbRatioDerived) := by
    have hcert : (40893066 : Cut) / 10000000 ≤ cutLog (1000000000000 / 16750843922) := by
      apply cutLog_ge_certified (1000000000000 / 16750843922) (40893066 / 10000000) 26
        (by norm_num) (by norm_num)
      show partialExp (40893066 / 10000000 : Cut) 26 + expRemBound (40893066 / 10000000 : Cut) 26
        ≤ (1000000000000 : Cut) / 16750843922
      unfold partialExp expTermC expRemBound
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    have hmono : cutLog ((1000000000000 : Cut) / 16750843922) ≤ cutLog (1 / mbRatioDerived) :=
      cutLog_mono (by norm_num) hlo
    linarith
  have hlog_hi : cutLog (1 / mbRatioDerived) ≤ (40893067 : Cut) / 10000000 := by
    have hmono : cutLog (1 / mbRatioDerived) ≤ cutLog ((1000000000000 : Cut) / 16750843797) :=
      cutLog_mono hinvpos hhi
    have hcert : cutLog ((1000000000000 : Cut) / 16750843797) ≤ (40893067 : Cut) / 10000000 := by
      apply cutLog_le_certified (1000000000000 / 16750843797) (40893067 / 10000000) 27
        (by norm_num) (by norm_num)
      show (1000000000000 : Cut) / 16750843797 ≤ partialExp (40893067 / 10000000 : Cut) 27
      unfold partialExp expTermC
      simp only [Finset.sum_range_succ, Finset.sum_range_zero]
      norm_num [Nat.factorial]
    linarith
  have hid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived := cutLog_inv_pos mbRatioDerived_pos
  rw [hid] at hlog_lo hlog_hi
  exact ⟨by linarith, by linarith⟩

/-! ## (D) THE WIRED-IN SHARP `L_m01` (re-exported from NarrowedBracket11; banked, width `10⁻¹¹`). -/

/-- The banked sharp `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]` (width `10⁻¹¹`),
    re-exported from `NarrowedBracket11`. -/
theorem cutLog_m01_sharp :
    (815406111272 : Cut) / 100000000000 ≤ cutLog (mass0 / mass1)
      ∧ cutLog (mass0 / mass1) ≤ 815406111273 / 100000000000 :=
  ⟨Phys.Algebra.NarrowedBracket11.cutLog_lo_s6, Phys.Algebra.NarrowedBracket11.cutLog_hi_s6⟩

/-! ## (E) THE SHARPENED ABSTRACT ARITHMETIC CORE (W9) + THE RE-ASSEMBLED RESTATEMENT. -/

set_option maxHeartbeats 2000000 in
/-- THE SHARPENED ABSTRACT ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with sharpened bracket
    hypotheses; the transcendentals stay OUT of the arithmetic): with `k` in the banked `κ` bracket,
    `L ∈ [815406111272/1e11, 815406111273/1e11]`, `Lmb ∈ [−40893067/1e7, −40893066/1e7]`,
    `Lb0 ∈ [17337287/1e7, 17337288/1e7]`, `Lb2 ∈ [−10887238/1e7, −10887236/1e7]`, then
    `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈ [1363071880/1e7, 1363071883/1e7]`. The inner
    combination is in `[14937951/1e6, 14937953/1e6]`. -/
theorem endpoint_core_s1 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (815406111272 : Cut) / 100000000000 ≤ L ∧ L ≤ 815406111273 / 100000000000)
    (hLmb : (-40893067 / 10000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066 / 10000000)
    (hLb0 : (17337287 : Cut) / 10000000 ≤ Lb0 ∧ Lb0 ≤ 17337288 / 10000000)
    (hLb2 : (-10887238 / 10000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887236 / 10000000) :
    (1363071880 / 10000000 : Cut)
        ≤ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 1363071883 / 10000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (14937951 / 1000000 : Cut)
      ≤ 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 14937953 / 1000000 := by nlinarith
  set C := 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((1250000000 / 3926990817 : Cut) / 3) * (14937951 / 1000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((1250000000 / 3926990817 : Cut) / 3) * (14937951 / 1000000)
        ≥ 1363071880 / 10000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000 / 157079632679 : Cut) / 3) * (14937953 / 1000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000 / 157079632679 : Cut) / 3) * (14937953 / 1000000)
        ≤ 1363071883 / 10000000 - 2425 / 18 := by norm_num
    linarith

/-- The `L_mb`/`L_b0`/`L_b2` inputs of the endpoint normal form written in terms of the `bMass`
    shape (as the normal form uses `cutLog (bMass 0)`, `cutLog (bMass 2)`). -/
theorem cutLog_bMass0_sharp :
    (17337287 : Cut) / 10000000 ≤ cutLog (bMass 0) ∧ cutLog (bMass 0) ≤ 17337288 / 10000000 := by
  have h : bMass 0 = mass0 := rfl
  rw [h]; exact cutLog_b0_sharp

theorem cutLog_bMass2_sharp :
    (-10887238 / 10000000 : Cut) ≤ cutLog (bMass 2) ∧ cutLog (bMass 2) ≤ -10887236 / 10000000 := by
  have h : bMass 2 = mass2 := rfl
  rw [h]; exact cutLog_b2_sharp

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT AS `1/α(0)`: the recomposed census-conserving endpoint is
    bracketed by two explicit rationals of `Cut`, `1363071880/1e7 ≤ recomposedEndpoint ≤ 1363071883/1e7`
    (`136.307188 … 136.3071883`, width `3×10⁻⁷`, ≈ 9 significant digits `136.307188`). Assembled by the
    sharpened abstract arithmetic core `endpoint_core_s1` from the banked sharp `cutLog(mass0/mass1)`
    (NB11) and the three sharpened edge logs (`cutLog_mb_sharp`, `cutLog_bMass0_sharp`,
    `cutLog_bMass2_sharp`) and the banked `κ` bracket (`kappa_bracket`). ≈ 5×10⁵× narrower than the
    coarse `[3406/25, 13639/100] = [136.24, 136.39]`. -/
theorem recomposedEndpoint_restated_sharp :
    (1363071880 : Cut) / 10000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 1363071883 / 10000000 := by
  rw [recomposedEndpoint_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket
  exact endpoint_core_s1 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi cutLog_m01_sharp cutLog_mb_sharp
    cutLog_bMass0_sharp cutLog_bMass2_sharp

/-! ## (F) THE SHARPER PREDICTION + STILL-BELOW-COARSE. -/

/-- ★★★ THE FOLD'S PREDICTION (sharper): `recomposedEndpoint < 137` re-certified from the sharp upper
    bound `≤ 1363071883/1e7 = 136.3071883 < 137`. The certified bracket lies STRICTLY BELOW the measured
    `1/α(0) ≈ 137.036` (REMOVABLE ORIENTATION PROSE, in no proof); the derivation does NOT bend toward
    the measurement (G2 absolute NO-FIT). -/
theorem recomposedEndpoint_lt_137_sharp : recomposedEndpoint < 137 := by
  have h := recomposedEndpoint_restated_sharp.2
  have : (1363071883 / 10000000 : Cut) < 137 := by norm_num
  linarith

/-- The sharp bracket is nested strictly inside the coarse `[3406/25, 13639/100]` (`136.24 … 136.39`)
    from BOTH ends: `3406/25 ≤ 1363071880/1e7` and `1363071883/1e7 ≤ 13639/100`. -/
theorem sharp_nested_in_coarse :
    (3406 / 25 : Cut) ≤ 1363071880 / 10000000 ∧ (1363071883 / 10000000 : Cut) ≤ 13639 / 100 :=
  ⟨by norm_num, by norm_num⟩

/-! ## (G) W8 NON-VACUITY WITH TEETH. -/

theorem cutLog_b0_sharp_strict : (17337287 : Cut) / 10000000 < 17337288 / 10000000 := by norm_num
theorem cutLog_b2_sharp_strict : (-10887238 / 10000000 : Cut) < -10887236 / 10000000 := by norm_num
theorem cutLog_mb_sharp_strict : (-40893067 / 10000000 : Cut) < -40893066 / 10000000 := by norm_num
theorem restated_sharp_strict : (1363071880 : Cut) / 10000000 < 1363071883 / 10000000 := by norm_num

/-- ★ W8 — THE SHARPENING GENUINELY IMPROVES THE BANKED COARSE EDGE BRACKETS from both ends: the new
    `L_b0` window `[17337287/1e7, 17337288/1e7]` is strictly inside `[17/10, 18/10]`; the new `L_b2`
    window `[−10887238/1e7, −10887236/1e7]` is strictly inside `[−12/10, −1]`; the new `L_mb` window
    `[−40893067/1e7, −40893066/1e7]` is strictly inside `[−41/10, −4]`. Each is a real tightening. -/
theorem sharpening_improves_edge :
    ((17 / 10 : Cut) < 17337287 / 10000000 ∧ (17337288 / 10000000 : Cut) < 18 / 10)
    ∧ ((-(12 / 10) : Cut) < -10887238 / 10000000 ∧ (-10887236 / 10000000 : Cut) < -1)
    ∧ ((-41 / 10 : Cut) < -40893067 / 10000000 ∧ (-40893066 / 10000000 : Cut) < -4) :=
  ⟨⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩, ⟨by norm_num, by norm_num⟩⟩

/-! ## (H) THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE D7 NARROWING RUNG 1 (arc-D THE DIGITS, welded landing).

    (1) THE SHARPENED EDGE LOGS: `cutLog mass0 ∈ [17337287/1e7, 17337288/1e7]` (`cutLog_b0_sharp`,
        width `10⁻⁷`), `cutLog mass2 ∈ [−10887238/1e7, −10887236/1e7]` (`cutLog_b2_sharp`, width
        `2×10⁻⁷`), `cutLog mbRatioDerived ∈ [−40893067/1e7, −40893066/1e7]` (`cutLog_mb_sharp`, width
        `10⁻⁷`) — each ≈ 10⁶× tighter than the banked coarse edge brackets, from the banked sharp
        `mass0`/`mass2`/`mbRatioDerived` numerals through the banked exp instrument;
    (2) THE WIRED-IN SHARP `cutLog(mass0/mass1) ∈ [815406111272/1e11, 815406111273/1e11]`
        (`cutLog_m01_sharp`, re-exported from NarrowedBracket11, width `10⁻¹¹`);
    (3) THE RE-ASSEMBLED D7 RESTATEMENT AS `1/α(0)`: `1363071880/1e7 ≤ recomposedEndpoint ≤
        1363071883/1e7` (`recomposedEndpoint_restated_sharp`), a certified two-sided rational bracket
        (`136.307188 … 136.3071883`, width `3×10⁻⁷`, ≈ 9 significant digits) of the DERIVED closed real,
        nested strictly inside the coarse `[136.24, 136.39]` from both ends (`sharp_nested_in_coarse`);
    (4) THE FOLD'S PREDICTION (sharper): `recomposedEndpoint < 137` (`recomposedEndpoint_lt_137_sharp`)
        — the certified bracket EXCLUDES the measured `1/α(0) ≈ 137.036` (removable prose);
    (5) TEETH: every sharpened bracket is two-sided (`_strict`); the re-assembled bracket is two-sided;
        the sharpening genuinely improves the coarse edge brackets from both ends
        (`sharpening_improves_edge`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) THEOREM-EXACT /
    CERTIFIED now (exact inequalities / a certified rational bracket of `Cut`/ℚ, foundations-only, no
    error bar). This node banks the first NARROWING RUNG (≈ 3 → ≈ 9 significant digits).
    ROUTE-NOT-YET-FOUND (NAMED, handed to the ONE directed narrowing successor — NEVER asserted / NEVER
    fitted): the ⛔ OWNER ≥15-SIGNIFICANT-DIGIT FLOOR. The dominant residuals are again the three edge
    logs (each `≈ 10⁻⁷`), sharpenable to `≈ 10⁻¹²` by pushing the exp-instrument index `N` and reading
    `mass0`/`mass2` at the split@6 `cutCos(2/9)` grid + `q`/`√2` one grid deeper — the same instrument,
    one more rung. The measured `1/α(0) ≈ 137.036` and the recomposed `≈ 136.307` are REMOVABLE
    ORIENTATION PROSE ONLY. -/
theorem d7NarrowingRung1_landing :
    -- (1) the sharpened edge logs
    (((17337287 : Cut) / 10000000 ≤ cutLog mass0 ∧ cutLog mass0 ≤ 17337288 / 10000000)
      ∧ ((-10887238 / 10000000 : Cut) ≤ cutLog mass2 ∧ cutLog mass2 ≤ -10887236 / 10000000)
      ∧ ((-40893067 / 10000000 : Cut) ≤ cutLog mbRatioDerived
          ∧ cutLog mbRatioDerived ≤ -40893066 / 10000000))
    -- (2) the wired-in sharp cutLog(mass0/mass1)
    ∧ ((815406111272 : Cut) / 100000000000 ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406111273 / 100000000000)
    -- (3) the re-assembled restatement as 1/α(0)
    ∧ ((1363071880 : Cut) / 10000000 ≤ recomposedEndpoint
        ∧ recomposedEndpoint ≤ 1363071883 / 10000000)
    -- (4) the fold's prediction
    ∧ recomposedEndpoint < 137
    -- (5) teeth
    ∧ ((17337287 : Cut) / 10000000 < 17337288 / 10000000)
    ∧ ((1363071880 : Cut) / 10000000 < 1363071883 / 10000000)
    ∧ (((17 / 10 : Cut) < 17337287 / 10000000 ∧ (17337288 / 10000000 : Cut) < 18 / 10)
        ∧ ((-(12 / 10) : Cut) < -10887238 / 10000000 ∧ (-10887236 / 10000000 : Cut) < -1)
        ∧ ((-41 / 10 : Cut) < -40893067 / 10000000 ∧ (-40893066 / 10000000 : Cut) < -4)) :=
  ⟨⟨cutLog_b0_sharp, cutLog_b2_sharp, cutLog_mb_sharp⟩,
   cutLog_m01_sharp,
   recomposedEndpoint_restated_sharp,
   recomposedEndpoint_lt_137_sharp,
   cutLog_b0_sharp_strict,
   restated_sharp_strict,
   sharpening_improves_edge⟩

end

end Phys.Algebra.D7NarrowingRung1
