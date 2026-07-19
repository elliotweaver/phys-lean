/-
  # ARC-D REMAINDER — THE PER-EDGE FREEZE-OUT CENSUS WEIGHTS, RE-DERIVED AB INITIO
  #   (owner decision B: the localized defect is C — the staircase census weights)
  # ==============================================================================

  OWNER-DIRECTED (t_374df70b, manager comment 549, decision B). With the dressing FIXED at its
  fold-forced all-orders `3/2` (banked fixed-point theorem `kappaLeadingDressed_eq_div`) and the
  way-point base exact, the manager's exact-rational audit localized the residual defect to C — the
  FREEZE-OUT STAIRCASE CENSUS WEIGHTS attached to the three derived edge logs in
  `ComposedFreezeoutDissolved` (the dissolved coefficients `7/3, 11/3, −5/3` on `L_mb, L_b0, L_b2`,
  which descend from the per-edge weights `11/3, 10/3, 2` on `rb, rc, rl`). These weights were banked
  mid-frame-turmoil and never independently re-derived, unlike every other layer. THE TASK: RE-DERIVE
  THE PER-EDGE CENSUS WEIGHTS AB INITIO from the banked census/decoupling structure — for each derived
  edge, COUNT which banked content is ACTIVE across that edge's span, and what census its log therefore
  carries. NO-FIT absolute: the audit is counting, never solving-for-`137.036`; the corrected weights
  land where counting lands them.

  ## THE AB-INITIO COUNTING (X3's OWN active-content rule, on the three derived edge spans)

  X3 (`FineStructureCensusBands`) DEFINES the running census: "at a given resolution scale only the
  flavours whose band edge lies below the scale are active/resolved, and the local census content of a
  band is the coloured occupation sub-census over those ACTIVE flavours." A band screening increment is
  `κ·census·cutLog(ratio)`, where `census` is the content active THROUGHOUT the band whose scale ratio is
  `ratio` (D2 `freezeoutTail_screening`, the high bands `derivedBandList` both carry the full `16/3` — no
  decoupling above `v/Λ`). The three freeze-out edges are RATIOS = band SPANS
  (`FreezeoutEdgeCrossSectorReduction`):

    • `rb = edgeBottom = m_b/m_c`  → span `(m_c, m_b)`  → active `{u,d,s,c}` = `bandCensus [2,1,1,2] = 10/3`
    • `rc = edgeCharm  = m_c/m_s`  → span `(m_s, m_c)`  → active `{u,d,s}`   = `bandCensus [2,1,1]   = 2`
    • `rl = edgeLight  = m_s/Λ`    → span `(Λ,   m_s)`  → active `{u,d}`     = `bandCensus [2,1]     = 5/3`

  Across `(m_c, m_b)` the bottom quark has DECOUPLED (its edge `m_b` is the span's UPPER end, so `b` is
  active only for `μ > m_b`), so the census is the 4-content `10/3`, NOT the 5-content `11/3`. Likewise
  `(m_s, m_c)` carries `2` (charm decoupled), `(Λ, m_s)` carries `5/3` (strange decoupled). The banked
  assignment `(11/3, 10/3, 2)` paired each span with the census resolved AT its UPPER edge (pre-decoupling)
  — the content of the region ABOVE the band, one threshold too high. The ab-initio counting corrects the
  per-edge weights to `(10/3, 2, 5/3)`.

  ## THE DEFECT IS AN EXACT ONE-THRESHOLD OVER-COUNT (the counting characterization, not a fit)

  For each edge the banked weight EXCEEDS the ab-initio active census by EXACTLY the census term of the
  flavour that DECOUPLED at the span's upper edge (`freezeout_overcount_*`):
      `11/3 − 10/3 = 1/3 = colouredCensusTerm 1` (the down-type bottom, level 1),
      `10/3 − 2   = 4/3 = colouredCensusTerm 2` (the up-type charm, level 2),
      `2   − 5/3  = 1/3 = colouredCensusTerm 1` (the down-type strange, level 1).
  The banked staircase kept the just-decoupled flavour's census in each band — a systematic off-by-one in
  the resolution direction. The census-SPLIT structure is otherwise PRESERVED: the corrected staircase
  STEPS still equal the frozen flavour census terms (`active_step_charm`, `active_step_strange`), so the
  census conservation the fold demands (each threshold step = one frozen flavour) is intact; only the
  absolute staircase level shifts down one rung.

  ## THE CORRECTED RECOMPOSITION (the dissolved summand and the composed endpoint)

  With the corrected per-edge weights, the freeze-out summand at the pinned edges dissolves (same
  log-dissolution + confinement-rung π-cancellation as the banked node) to a determined closed form:
      `κ·(10/3)·cutLog rb + κ·2·cutLog rc + κ·(5/3)·cutLog rl`
        = `40/27 + κ·[ 3·L_mb + (10/3)·L_b0 − (5/3)·L_b2 ]`   (`freezeoutActive_summand_dissolved`),
  where the corrected GEM `κ·(5/3)·(8·cutPi/3) = 40/27` (`gem_active`, the light band's `5/3` census on
  the confinement rung, π cancelling against `κ = 1/(3·cutPi)`; cf. the banked `16/9`). The composed
  endpoint at the derived parameters is a determined closed form
  (`composed_endpoint_active_determined`), no free parameter.

  ⚠ THE HONEST OUTCOME (removable ORIENTATION prose, NO empirical number in any proof): the corrected
  summand `≈ 0.9855` (banked `≈ 1.6324`), so the corrected composed endpoint `≈ 136.45` — FURTHER from
  the measured `1/α(0) ≈ 137.036` than the banked `≈ 137.0997` (which sat `+0.064` above). The manager's
  hypothesis (that C is over-counted and reducing it lands near the measured value) is FALSIFIED by the
  exact counting: the honest census correction OVERSHOOTS downward. This is a NEW certified defect report,
  not an arc exit — per the owner exactness standard (exact-or-unfinished) the disagreement is a bug
  report and the defect hunt continues to the next earlier layer (the base normal-form constant or the
  edge-log arguments), handed to the ONE directed successor. The counting did not bend toward the measured
  value; it landed where the fold's active-content rule forced it. This is the ONE LAW: the counting
  (theory) is right; the premise that correcting C lands at measured (framing) is wrong.

  ## GRADE (honest, per piece)

  THEOREM-EXACT NOW (exact identities of ℚ / `Cut`, foundations-only): the ab-initio active-span censuses
  and their values; the exact one-threshold over-count characterization; the preserved staircase steps;
  the corrected gem `40/27`; the corrected dissolved summand; the corrected composed endpoint. The
  measured `137.036`, the `≈ 0.9855` summand, the `≈ 136.45` endpoint are REMOVABLE ORIENTATION PROSE
  ONLY; no empirical number in any statement or proof; NO-FIT (the correction moves AWAY from the measured
  value — the strongest no-fit witness).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "freeze-out / decouple / active / quark / flavour / charm / bottom / strange / census / band /
  screening / coupling": over ℚ and the derived ℝ `Cut`, `bandCensus [2,1,1,2] = 10/3`, `bandCensus [2,1,1]
  = 2`, `bandCensus [2,1] = 5/3`; the successive differences are `colouredCensusTerm 2`, `colouredCensusTerm
  1`; the banked plateau minus the active census equals a `colouredCensusTerm`; and
  `κ·(10/3)·cutLog(a·(b/c)) + κ·2·cutLog(1/a) + κ·(5/3)·cutLog((a/e)·c) = 40/27 + κ·[3·cutLog a + (10/3)·cutLog
  b − (5/3)·cutLog c]` with `40/27 = κ·(5/3)·(8·cutPi/3)`, `κ = 1/(3·cutPi)`. Pure ℚ / `cutLog` / `cutPi`
  arithmetic on the banked `bandCensus`/`colouredCensusTerm`/`mbRatioDerived`/`confBundle`/`bMass`/
  `kappaLeading`. No theorem STATEMENT needs a physics word.

  ## NOT FREE-FLOATING (SOUL rail)

  Every production TYPE mentions the banked derived objects: `bandCensus`/`colouredCensusTerm` (X3),
  `censusBottomBand`/`censusCharmBand`/`censusLightBand`/`freezeoutTail`/`totalScreening`/`bandScreen` (D2/X6),
  `kappaLeading`/`kappaLeading_eq` (N460), `cutLog`/`cutPi`/`cutLog_mul`/`cutLog_cutExp` (derived ℝ),
  `mbRatioDerived` (parent), `confBundle`/`downConfBundle`/`edgeBottom`/`edgeCharm`/`edgeLight`/`bMass`
  (grandparent + `DownConfinementRelativeScale`), and the banked dissolution helpers of
  `ComposedFreezeoutDissolved`. `freezeoutTailActive` is literally the banked `freezeoutTail` shape with the
  ab-initio active-span censuses. FALSE over an algebra without the banked census/edge rungs.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — the active-span censuses FALL OUT of X3's `bandCensus` on the resolved-content
    lists; the over-count characterization and the gem FALL OUT of the banked `colouredCensusTerm` / `κ`;
    no weight is premised.
  - G2 NO EMPIRICAL NUMBER — no `137`, no measured `α`, no PDG mass / `Λ_QCD` in any statement or proof;
    the `0.9855` / `136.45` / `137.036` numerics are removable prose; explicit NO-FIT (correction moves
    AWAY from the measured value).
  - G3 EXACT — every counting identity, the over-count, the steps, the gem, the dissolved summand, and the
    composed endpoint are EXACT facts of ℚ / `Cut`.
  - G4 DERIVED, NOT POSITED — `bandCensus`/`colouredCensusTerm` (X3), the edges (grandparent), the pins
    (`DownConfinementRelativeScale`), `kappaLeading` (N460), the dissolution helpers
    (`ComposedFreezeoutDissolved`) — all banked.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation. Ground field ℚ and the DERIVED ℝ
    `Cut`; NO Mathlib `Real`/`Complex` as content. IMPORT GUARD: `ComposedFreezeoutDissolved` (parent, and
    transitively X3/D2/X6/N460/grandparent) — all foundations-only; NO `foldRetention`; NEVER
    `MassGapOne`/`OneAxiom`.
  - G7 ONE LAW — the derivation did not fight; the banked `bandCensus_*`/`colouredCensusTerm_*`/
    `cutLog_mul`/`cutLog_downConfBundle`/`edge{Bottom,Charm,Light}_pinned`/`kappaLeading_eq` close every
    step. That the honest correction moves AWAY from the measured value is the fold telling us the defect
    is NOT (only) in C — the hunt continues; the counting is NOT bent to land at the measured value.
  - G8 TEETH (W8) — `active_total_ne_banked_total` (the corrected staircase total `7 ≠ 9`, the banked
    total — the correction is real); `active_step_charm`/`active_step_strange` (the census-split step law
    is preserved — the correction shifts the level, not the steps); `gem_active_lt_banked` (the corrected
    gem `40/27 < 16/9` — the light band's smaller `5/3` census genuinely reduces the confinement-rung
    rational, so the summand genuinely shrinks — the NO-FIT witness).

  DEPENDENCIES (all banked, foundations-only): `ComposedFreezeoutDissolved` (`cutLog_inv_pos`/
  `cutLog_div_pos`/`cutLog_downConfBundle`/`confinement_rung_rational`/`bMass0_pos`/`bMass2_pos`),
  transitively `DownConfinementRelativeScale` (`downConfBundle`/`downConfBundle_pos`/`edgeBottom_pinned`/
  `edgeCharm_pinned`/`edgeLight_pinned`), `FreezeoutEdgeCrossSectorReduction` (`edgeBottom`/`edgeCharm`/
  `edgeLight`/`bMass`), `SubBandCompletion` (`freezeoutTail`/`freezeoutTail_screening`/`censusBottomBand_val`/
  `censusCharmBand_val`/`censusLightBand_val`), `FineStructureCensusBands` (`bandCensus`/`colouredCensusTerm`/
  `bandCensus_light`/`bandCensus_charm`/`bandCensus_bottom`/`colouredCensusTerm_one`/`colouredCensusTerm_two`),
  X6 (`bandScreen`/`totalScreening`), N460 (`kappaLeading`/`kappaLeading_eq`), the derived `Cut`
  (`cutLog`/`cutPi`/`cutLog_mul`/`cutLog_one`/`cutLog_cutExp`); standard Mathlib `field_simp`/`ring`/
  `norm_num`/`List` MACHINERY on the DERIVED objects (STANDARD §3). NO posited value as content, NO Mathlib
  ℝ as content, NO bridge.
-/
import Phys.Algebra.ComposedFreezeoutDissolved
import Mathlib.Tactic

namespace Phys.Algebra.PerEdgeCensusRederived

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.ComposedNumeralSPinned
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.JoinSplitRatioDerived
open Phys.Algebra.JoinContent
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE AB-INITIO ACTIVE-SPAN CENSUSES — X3's active-content rule on the three derived spans. -/

/-- THE BOTTOM-EDGE ACTIVE-SPAN CENSUS: the content active across the span `(m_c, m_b)` whose ratio is
    `rb = edgeBottom = m_b/m_c` is `{u,d,s,c}` (bottom has DECOUPLED below `m_b`), the derived plateau
    `bandCensus [2,1,1,2] = 10/3`. The banked assignment used `11/3` (the region ABOVE `m_b`, where `b`
    is active) — one threshold too high. -/
def censusActiveBottomSpan : Cut := ((bandCensus [2, 1, 1, 2] : ℚ) : Cut)

/-- THE CHARM-EDGE ACTIVE-SPAN CENSUS: the content active across `(m_s, m_c)` (`rc = edgeCharm = m_c/m_s`)
    is `{u,d,s}` (charm decoupled below `m_c`), `bandCensus [2,1,1] = 2`. -/
def censusActiveCharmSpan : Cut := ((bandCensus [2, 1, 1] : ℚ) : Cut)

/-- THE LIGHT-EDGE ACTIVE-SPAN CENSUS: the content active across `(Λ, m_s)` (`rl = edgeLight = m_s/Λ`)
    is `{u,d}` (strange decoupled below `m_s`), `bandCensus [2,1] = 5/3` — the "coloured quark part"
    the banked X3 already names (`colouredCensusTerm 2 + colouredCensusTerm 1`). The banked assignment
    used `2` ({u,d,s}) — one threshold too high. -/
def censusActiveLightSpan : Cut := ((bandCensus [2, 1] : ℚ) : Cut)

/-- The bottom-edge active-span census is the derived plateau `10/3`. -/
theorem censusActiveBottomSpan_val : censusActiveBottomSpan = 10 / 3 := by
  unfold censusActiveBottomSpan; rw [bandCensus_charm]; norm_num

/-- The charm-edge active-span census is the derived plateau `2`. -/
theorem censusActiveCharmSpan_val : censusActiveCharmSpan = 2 := by
  unfold censusActiveCharmSpan; rw [bandCensus_light]; norm_num

/-- The light-edge active-span census is the derived `{u,d}` count `5/3`. -/
theorem censusActiveLightSpan_val : censusActiveLightSpan = 5 / 3 := by
  unfold censusActiveLightSpan
  simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    colouredCensusTerm_two, colouredCensusTerm_one]
  norm_num

/-! ## (B) THE EXACT ONE-THRESHOLD OVER-COUNT — the banked weight − the active census = the frozen term. -/

/-- ★★ THE BOTTOM OVER-COUNT: the banked `censusBottomBand = 11/3` exceeds the ab-initio
    `censusActiveBottomSpan = 10/3` by EXACTLY `colouredCensusTerm 1 = 1/3` — the down-type bottom (level
    1) that decoupled at the span's upper edge. The banked assignment kept the just-decoupled flavour. -/
theorem overcount_bottom :
    censusBottomBand - censusActiveBottomSpan = ((colouredCensusTerm 1 : ℚ) : Cut) := by
  rw [censusBottomBand_val, censusActiveBottomSpan_val, colouredCensusTerm_one]; norm_num

/-- ★★ THE CHARM OVER-COUNT: banked `censusCharmBand = 10/3` exceeds active `2` by `colouredCensusTerm
    2 = 4/3` — the up-type charm (level 2) decoupled at `m_c`. -/
theorem overcount_charm :
    censusCharmBand - censusActiveCharmSpan = ((colouredCensusTerm 2 : ℚ) : Cut) := by
  rw [censusCharmBand_val, censusActiveCharmSpan_val, colouredCensusTerm_two]; norm_num

/-- ★★ THE LIGHT OVER-COUNT: banked `censusLightBand = 2` exceeds active `5/3` by `colouredCensusTerm
    1 = 1/3` — the down-type strange (level 1) decoupled at `m_s`. -/
theorem overcount_light :
    censusLightBand - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut) := by
  rw [censusLightBand_val, censusActiveLightSpan_val, colouredCensusTerm_one]; norm_num

/-! ## (C) THE CENSUS-SPLIT STEP LAW IS PRESERVED — the corrected staircase steps = frozen terms. -/

/-- ★★ THE CORRECTED STAIRCASE STEP (bottom→charm span) = THE CHARM CENSUS TERM: `censusActiveBottomSpan −
    censusActiveCharmSpan = 10/3 − 2 = 4/3 = colouredCensusTerm 2`. The census-split conservation the fold
    demands (each threshold step = one frozen flavour's census term) is PRESERVED under the correction —
    only the absolute staircase level shifts down one rung. -/
theorem active_step_charm :
    censusActiveBottomSpan - censusActiveCharmSpan = ((colouredCensusTerm 2 : ℚ) : Cut) := by
  rw [censusActiveBottomSpan_val, censusActiveCharmSpan_val, colouredCensusTerm_two]; norm_num

/-- ★★ THE CORRECTED STAIRCASE STEP (charm→light span) = THE STRANGE CENSUS TERM: `censusActiveCharmSpan −
    censusActiveLightSpan = 2 − 5/3 = 1/3 = colouredCensusTerm 1`. -/
theorem active_step_strange :
    censusActiveCharmSpan - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut) := by
  rw [censusActiveCharmSpan_val, censusActiveLightSpan_val, colouredCensusTerm_one]; norm_num

/-! ## (D) THE CORRECTED FREEZE-OUT TAIL AND ITS CLOSED FORM. -/

/-- ★★★ THE CORRECTED FREEZE-OUT TAIL: the banked `freezeoutTail` shape with the AB-INITIO active-span
    censuses `(10/3, 2, 5/3)` on the three derived edges — each census the content active THROUGHOUT the
    edge's span (post-decoupling), by X3's active-content rule. -/
def freezeoutTailActive (rb rc rl : Cut) : List (Cut × Cut) :=
  [(censusActiveBottomSpan, rb), (censusActiveCharmSpan, rc), (censusActiveLightSpan, rl)]

/-- The corrected tail reads band by band into its three census-weighted screenings (mirrors D2
    `freezeoutTail_screening`). -/
theorem freezeoutTailActive_screening (rb rc rl : Cut) :
    totalScreening (freezeoutTailActive rb rc rl)
      = bandScreen censusActiveBottomSpan rb + bandScreen censusActiveCharmSpan rc
        + bandScreen censusActiveLightSpan rl := by
  unfold freezeoutTailActive totalScreening
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]
  ring

/-- ★★ THE CORRECTED FREEZE-OUT SUMMAND CLOSED FORM: `κ·(10/3)·cutLog rb + κ·2·cutLog rc +
    κ·(5/3)·cutLog rl` — the ab-initio active-span censuses unfolded (mirrors D8 `freezeout_closed`, with
    the corrected weights). -/
theorem freezeoutActive_closed (rb rc rl : Cut) :
    totalScreening (freezeoutTailActive rb rc rl)
      = kappaLeading * (10 / 3) * cutLog rb + kappaLeading * 2 * cutLog rc
        + kappaLeading * (5 / 3) * cutLog rl := by
  rw [freezeoutTailActive_screening]
  unfold bandScreen
  rw [censusActiveBottomSpan_val, censusActiveCharmSpan_val, censusActiveLightSpan_val]

/-! ## (E) THE CORRECTED GEM — the light band's `5/3` census on the confinement rung → `40/27`. -/

/-- ★★★ THE CORRECTED GEM: `κ·(5/3)·(8·cutPi/3) = 40/27` EXACTLY. The ab-initio light-span census `5/3`
    (not the banked `2`) on the confinement rung `8·cutPi/3` meets `κ = 1/(3·cutPi)` (N460), and the
    `cutPi` CANCELS, leaving the pure rational `40/27` (cf. the banked `16/9`). -/
theorem gem_active : kappaLeading * (5 / 3) * (8 * cutPi / 3) = 40 / 27 := by
  rw [kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

/-! ## (F) THE CORRECTED DISSOLUTION — freeze-out summand at the pinned edges = determined closed form. -/

/-- ★★★ THE CORRECTED FREEZE-OUT SUMMAND DISSOLVES: with the ab-initio per-edge weights `(10/3, 2, 5/3)`,
    the summand at the pinned edges `rb = mbRatioDerived·(bMass0/bMass2)`, `rc = 1/mbRatioDerived`, `rl =
    downConfBundle·bMass2` DISSOLVES to
        `40/27 + κ·[ 3·L_mb + (10/3)·L_b0 − (5/3)·L_b2 ]`
    — the corrected pure rational `40/27` (the light-span census on the confinement rung, π cancelled)
    plus a κ-weighted log-combination. (The banked node had `16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]`.) -/
theorem freezeoutActive_summand_dissolved :
    kappaLeading * (10 / 3) * cutLog (mbRatioDerived * (bMass 0 / bMass 2))
      + kappaLeading * 2 * cutLog (1 / mbRatioDerived)
      + kappaLeading * (5 / 3) * cutLog (downConfBundle * bMass 2)
    = 40 / 27
      + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
        - (5 / 3) * cutLog (bMass 2)) := by
  have hmb := mbRatioDerived_pos
  have hb0 := bMass0_pos
  have hb2 := bMass2_pos
  have hdcb := downConfBundle_pos
  rw [cutLog_mul hmb (by positivity), cutLog_div_pos hb0 hb2, cutLog_inv_pos hmb,
      cutLog_mul hdcb hb2, cutLog_downConfBundle, kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

/-- ★★★ THE WELDED CORRECTED PINNED DISSOLUTION: the corrected freeze-out summand at the grandparent tower
    edges, with `rb, rc` pinned from the up/down leg and `rl` from the down/confinement leg (as HYPOTHESES
    — the two banked relative-scale identifications), DISSOLVES to the determined corrected closed form. -/
theorem freezeoutActive_at_pinned (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    totalScreening (freezeoutTailActive (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
      = 40 / 27
        + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2)) := by
  rw [freezeoutActive_closed,
      edgeBottom_pinned Mu Md hu hd hud,
      edgeCharm_pinned Mu Md hu hd hud,
      edgeLight_pinned Mu Md Mlam hu hl hud huc]
  exact freezeoutActive_summand_dissolved

/-! ## (G) THE CORRECTED COMPOSED ENDPOINT — no free parameter remains. -/

/-- ★★ THE CORRECTED COMPOSED ENDPOINT AT THE DERIVED PARAMETERS IS A DETERMINED POINT. With `s =
    projectedS = 1/8`, `j = joinSplitRatio = 1`, `w = depthWeight = 1/3`, and the pinned edges, the
    composed endpoint (the D2d dressed recombined endpoint PLUS the ab-initio-corrected freeze-out
    summand) is a fully determined closed form — mirrors the banked `composed_endpoint_determined` with
    the corrected `40/27` gem and `(3, 10/3, −5/3)` log-coefficients. ⚠ NOT claimed to be `1/α(0)` (the
    composition-completeness attestation still stands; and the corrected endpoint moves FURTHER from the
    measured value — a new certified defect, not an arc exit). -/
theorem composed_endpoint_active_determined (Mu Md Mlam : Cut)
    (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    dressedInvAlphaEMJoin depthWeight projectedS joinSplitRatio (completeBandList chargeTraceDepth)
        + totalScreening
            (freezeoutTailActive (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
      = 112
        + ((chargeTraceDepth - projectedS)
            * totalScreeningWith 1 (completeBandList chargeTraceDepth)) / (1 - depthWeight)
        + (40 / 27
          + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
            - (5 / 3) * cutLog (bMass 2))) := by
  rw [composed_at_pinnedS_closed depthWeight joinSplitRatio (le_of_lt depthWeight_pos)
        depthWeight_lt_one (completeBandList chargeTraceDepth),
      joinContent_at_derived_eq_zero depthWeight,
      freezeoutActive_at_pinned Mu Md Mlam hu hd hl hud huc]
  ring

/-! ## (H) W8 NON-VACUITY WITH TEETH. -/

/-- ★ W8 — THE CORRECTION IS REAL: the corrected staircase total `10/3 + 2 + 5/3 = 7` differs from the
    banked total `11/3 + 10/3 + 2 = 9`. The ab-initio counting genuinely changes the weights. -/
theorem active_total_ne_banked_total :
    censusActiveBottomSpan + censusActiveCharmSpan + censusActiveLightSpan
      ≠ censusBottomBand + censusCharmBand + censusLightBand := by
  rw [censusActiveBottomSpan_val, censusActiveCharmSpan_val, censusActiveLightSpan_val,
      censusBottomBand_val, censusCharmBand_val, censusLightBand_val]
  norm_num

/-- ★★ W8 — THE NO-FIT WITNESS: the corrected gem `40/27` is STRICTLY LESS than the banked gem `16/9`.
    The light band's smaller ab-initio census `5/3 < 2` genuinely REDUCES the confinement-rung rational,
    so the corrected freeze-out summand shrinks — the correction moves the endpoint AWAY from (below) the
    measured value, not toward it. A fit would move toward it; this is the counting, not a fit. -/
theorem gem_active_lt_banked : (40 / 27 : Cut) < 16 / 9 := by norm_num

/-- ★ W8 — THE CENSUS-SPLIT STEPS ARE GENUINELY DISTINCT (as in the banked staircase): the corrected
    bottom→charm step `4/3` and charm→light step `1/3` differ — the up/down flavour distinction is
    load-bearing, preserved under the correction. -/
theorem active_steps_differ :
    censusActiveBottomSpan - censusActiveCharmSpan ≠ censusActiveCharmSpan - censusActiveLightSpan := by
  rw [active_step_charm, active_step_strange, colouredCensusTerm_one, colouredCensusTerm_two]
  norm_num

/-! ## (I) THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE PER-EDGE FREEZE-OUT CENSUS WEIGHTS RE-DERIVED AB INITIO (arc-D remainder, welded landing).
    The owner-directed (decision B) independent re-derivation of the staircase census weights:

    (1) THE AB-INITIO COUNTING: the content active across each derived edge span, by X3's active-content
        rule, is `(10/3, 2, 5/3)` (`censusActiveBottomSpan_val`, `censusActiveCharmSpan_val`,
        `censusActiveLightSpan_val`) — NOT the banked `(11/3, 10/3, 2)`;
    (2) THE EXACT OVER-COUNT: each banked weight exceeds the ab-initio active census by EXACTLY the
        just-decoupled flavour's census term (`overcount_bottom/charm/light`) — a systematic off-by-one;
    (3) THE PRESERVED STEP LAW: the corrected staircase steps still equal the frozen census terms
        (`active_step_charm`, `active_step_strange`) — the census-split conservation is intact, only the
        absolute level shifts;
    (4) THE CORRECTED RECOMPOSITION: the corrected gem `40/27` (`gem_active`), the corrected dissolved
        summand `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]` (`freezeoutActive_summand_dissolved`,
        welded through the pins in `freezeoutActive_at_pinned`), and the determined composed endpoint
        (`composed_endpoint_active_determined`);
    (5) TEETH: the correction is real (`active_total_ne_banked_total`, total `7 ≠ 9`); the NO-FIT witness
        (`gem_active_lt_banked`, `40/27 < 16/9` — the correction shrinks the summand, moving AWAY from the
        measured value); the steps genuinely distinct (`active_steps_differ`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) THEOREM-EXACT now (exact
    facts of ℚ / `Cut`, no error bar, foundations-only; the two relative-scale identifications enter as
    HYPOTHESES). REMOVABLE ORIENTATION PROSE ONLY (no empirical number in any statement or proof): the
    measured `1/α(0) ≈ 137.036`, the corrected summand `≈ 0.9855`, and the corrected composed endpoint
    `≈ 136.45`. The correction moves FURTHER from the measured value (below it) — the manager's hypothesis
    that C is over-counted-toward-measured is FALSIFIED by the exact counting; this is a NEW certified
    defect report, NOT an arc exit, and the defect hunt continues to the next earlier layer (the base
    normal-form constant / the edge-log arguments), handed to the ONE directed successor. NO-FIT: the
    counting landed where the fold's active-content rule forced it, never bent toward the measured value. -/
theorem perEdgeCensusRederived_landing (Mu Md Mlam : Cut)
    (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    -- (1) the ab-initio counting
    censusActiveBottomSpan = 10 / 3
    ∧ censusActiveCharmSpan = 2
    ∧ censusActiveLightSpan = 5 / 3
    -- (2) the exact one-threshold over-count
    ∧ censusBottomBand - censusActiveBottomSpan = ((colouredCensusTerm 1 : ℚ) : Cut)
    ∧ censusCharmBand - censusActiveCharmSpan = ((colouredCensusTerm 2 : ℚ) : Cut)
    ∧ censusLightBand - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut)
    -- (3) the preserved step law
    ∧ censusActiveBottomSpan - censusActiveCharmSpan = ((colouredCensusTerm 2 : ℚ) : Cut)
    ∧ censusActiveCharmSpan - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut)
    -- (4) the corrected recomposition
    ∧ kappaLeading * (5 / 3) * (8 * cutPi / 3) = 40 / 27
    ∧ totalScreening
        (freezeoutTailActive (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
        = 40 / 27
          + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
            - (5 / 3) * cutLog (bMass 2))
    ∧ dressedInvAlphaEMJoin depthWeight projectedS joinSplitRatio (completeBandList chargeTraceDepth)
          + totalScreening
              (freezeoutTailActive (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
        = 112
          + ((chargeTraceDepth - projectedS)
              * totalScreeningWith 1 (completeBandList chargeTraceDepth)) / (1 - depthWeight)
          + (40 / 27
            + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
              - (5 / 3) * cutLog (bMass 2)))
    -- (5) teeth
    ∧ (censusActiveBottomSpan + censusActiveCharmSpan + censusActiveLightSpan
        ≠ censusBottomBand + censusCharmBand + censusLightBand)
    ∧ (40 / 27 : Cut) < 16 / 9 :=
  ⟨censusActiveBottomSpan_val, censusActiveCharmSpan_val, censusActiveLightSpan_val,
   overcount_bottom, overcount_charm, overcount_light,
   active_step_charm, active_step_strange,
   gem_active,
   freezeoutActive_at_pinned Mu Md Mlam hu hd hl hud huc,
   composed_endpoint_active_determined Mu Md Mlam hu hd hl hud huc,
   active_total_ne_banked_total,
   gem_active_lt_banked⟩

end

end Phys.Algebra.PerEdgeCensusRederived
