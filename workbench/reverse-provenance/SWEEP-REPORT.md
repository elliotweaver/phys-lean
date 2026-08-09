# SWEEP-REPORT — Reverse-Provenance Sweep (auditor deep item 2)
Date: 2026-08-08. Head: 3f4629e0. Per PREREG.md (frozen). Second-dispatch agent; reused first agent's artifacts (closure.txt 310 modules, edges.json, nav_hits.json 36 hits, hits_statements.txt, trace.py). No repo file modified.

Method note (documented deviation, scope-preserving): nav_hits.json contains 10 AppleDouble
metadata entries (`Phys.Algebra.._X`, 0 decls) — excluded as scan artifacts, leaving 26 real
modules. Hits whose statements, on reading, prove NO replacement/refinement of any ancestor
value (pure structural theorems that matched navigation terms like "defect"/"drop"/"one_cause")
are dispositioned NAV-NOISE; they carry INTEGRATED if in-closure (their theorems are consumed
as-is) and NAV-NOISE/out-of-graph otherwise, with no exemption theorem demanded since there is
no correction to exempt.

## 1. Classification table

| module | theorem(s) | what it corrects/refines | production consumer | status | endpoint-relevant? | discrepancy (exact) |
|---|---|---|---|---|---|---|
| **BaseNormalFormAudit** (IN closure) | `base_corrected` (6923/54+128/27+40/27 = **7259/54**), `base_corrected_eq`, `base_drop_val`, `base_drop_is_strange_overcount`, `base_drop_rational` (=8/27), `base_corrected_lt_base`, `gem_overcount_ne_zero` | Corrects the production base 2425/18 → 7259/54 by replacing gem 16/9 with active-span census 40/27 (strange-quark overcount 8/27 removed, proved = κ·colouredCensusTerm 1·(8π/3)) | D7DepthTwoComposed / ChainTermGrammar / FrameAuditedCompositionReattestation all still compute with **2425/18** and **16/9** (`baseTerm := ⟨2425/18,…⟩`, `mirrorParsed := ⟨16/9,…⟩`, `reattest_base_is_resummed : 2425/18 = 7179/54 + 16/9`). 7259/54 appears in NO file outside BaseNormalFormAudit (grep confirms; other "7259" hits are substrings of 815406111272599). Module is imported into the closure (via EdgeLogArgAudit) but its corrected VALUE is never consumed or restated by any ancestor. | **UNRECONCILED** (calibration case ✓) | **YES** — the base is the leading term of F0/the landing | base: 2425/18 − 7259/54 = **8/27**; gem: 16/9 − 40/27 = **8/27** |
| **PerEdgeCensusRederived** (IN closure) | `overcount_bottom/charm/light`, `censusActiveBottomSpan_val` (=10/3), `freezeoutActive_summand_dissolved` (dissolved weights **3, 10/3, 5/3** over L_mb, L_b0, L_b2, constant **40/27**), `perEdgeCensusRederived_landing` (active spans 10/3, 2, 5/3) | Ab-initio recount of the per-edge census; corrects the dissolved freeze-out summand from 16/9 + κ[(7/3)L_mb+(11/3)L_b0−(5/3)L_b2] to 40/27 + κ[3·L_mb+(10/3)L_b0−(5/3)L_b2] | Production consumes the OLD form: `ComposedFreezeoutDissolved.freezeout_summand_dissolved` (weights 7/3, 11/3, 5/3), re-exported verbatim by `FreezeoutEdgeDescentDischarged` (L210–222) and restated inside `reattest_bare_census_complete` (FrameAuditedCompositionReattestation L225) with 16/9 and (7/3, 11/3, 5/3). The corrected weights appear only in PerEdgeCensusRederived + EdgeLogArgAudit header prose. | **UNRECONCILED** (second known pair ✓) | **YES** — the freeze-out summand feeds the recomposed endpoint | Δ(old−new) = 8/27 + κ·(−(2/3)·L_mb + (1/3)·L_b0); weight deltas exact: ΔW_mb = 7/3−3 = **−2/3**, ΔW_b0 = 11/3−10/3 = **+1/3**, ΔW_b2 = **0**; constant Δ = **8/27** |
| **EdgeLogArgAudit** (IN closure; imported by HucBornSquareAnchor) | `edgeLogArgAudit_landing` (edge-log decomposition identities for edgeBottom/edgeCharm/edgeLight) | Log-argument identities (weight-independent); consumed downstream. BUT its header (N576) asserts the dissolved summand IS the active-span 40/27 form ("N574 freezeoutActive_summand_dissolved") — while every consumed production theorem downstream restates the OLD 16/9/(7/3,11/3,5/3) form. The active-span alignment exists only as prose. | HucBornSquareAnchor → TopAnchorInsertionPinning → … → MirrorFixedPoint | theorems: **INTEGRATED**; active-span claim: **EXEMPT-BY-PROSE-ONLY** (the dangerous kind) | YES (orients the audit trail; masks the two UNRECONCILED rows above) | n/a (identity theorems exact); prose claim discrepancy = the two rows above |
| CKMTwoSectorPhase (OUT of alpha closure — prediction lane) | `jarlskogSqCorrected` (=½·jarlskogSq), `jarlskogCorrected_lo/hi` ([189/1e6, 193/1e6]) | Corrects Jarlskog invariant by CP factor ½ (J² halved, J → J/√2) | PredictionRegistry `ckm_jarlskog_bracket` consumes the corrected form. NOTE: FlavorGaugePredictionTable still banks the OLD bracket [268/1e6, 273/1e6] via `generation_jarlskog_numeric`; PredictionRegistry supersedes it in prose ("corrected non-maximal invariant"). | **INTEGRATED** (into PredictionRegistry); FGPT old bracket: SUPERSEDED-BY(PredictionRegistry) but see self-check ambiguity | NO (does not feed F0/alpha landing) | J²: old−new = jarlskogSq/2; brackets: old [268,273]/1e6 vs new [189,193]/1e6 |
| DressingSeamResolved (IN; imported by FrameAuditDressingScope) | `resolved_composed_is_leading` (+70), `dressing_seam_resolved`, landing | Resolves the dressing seam: leading tower reproduces both way-points; the depth-dressed variant (602/9, 74) proved ≠ way-points → killed branch exempted by theorem | FrameAuditDressingScope → FrameAuditedCompositionReattestation → ChainTermGrammar | **INTEGRATED**; killed dressed branch: **EXEMPT-BY-THEOREM**(dressing_seam_resolved: 602/9 ≠ 1582/27 ∧ 74 ≠ 190/3) | YES (dressing scope of the endpoint) | 602/9 − 1582/27 = 224/27; 74 − 190/3 = 32/3 (exempted deltas) |
| FrameAuditDressingScope (IN) | `frameAuditDressingScope_landing` | Restates seam resolution; scopes the F2 dressing over the frame-audited object | FrameAuditedCompositionReattestation | INTEGRATED | YES | n/a |
| FrameAuditRecombinationArchitecture (IN) | `ceiling_common_not_defect`, landing | Fixes ARCH-B recombination architecture; forced projectedS ≠ 0 | FrameAuditedCompositionReattestation | INTEGRATED | YES | shift = bandScreen projectedS topBandRatio (exact per theorem) |
| FrameAuditedCompositionReattestation (IN; imported by ChainTermGrammar) | `reattest_scopeC_closed`, `reattest_base_exempt`, `reattest_base_is_resummed`, `reattest_architecture_shift`, `reattest_weight_tie`, `reattest_bare_census_complete`, landing | Re-attests the composed endpoint over the frame-audited object — but restates the OLD base (2425/18 = 7179/54 + 16/9) and OLD weights (7/3, 11/3, 5/3): this is the module where the corrections of rows 1–2 were bypassed | ChainTermGrammar → … → AlphaLandingFinal | INTEGRATED (itself); it is the production-side witness of the two UNRECONCILED rows | YES | see rows 1–2 |
| FreezeoutEdgeDescentDischarged (IN) | `freezeoutEdgeDescentDischarged_landing` + re-export of `freezeout_summand_dissolved` | Discharges edge-descent brackets; re-exports OLD-weight summand | FreezeoutEdgeNumerals | INTEGRATED (old-weight chain) | YES | n/a (brackets exact) |
| HucDischargedFreezeoutEndpoint (IN; imported by D7NarrowingRung2) | `light_log_rung_huc_discharged`, `endpoint_conf_one_cause` (bandScreen censusActiveLightSpan confBandRatio = **40/27**), landing | Discharges the huc; NOTE `endpoint_conf_one_cause` proves the ACTIVE-SPAN gem 40/27 inside the production closure — corroborates that production's own ancestor knows 40/27 while ChainTermGrammar's mirror parses 16/9 | D7NarrowingRung2 → … → MirrorFixedPoint | INTEGRATED (its landing); 40/27 restatement strengthens row-1 UNRECONCILED finding | YES | see row 1 |
| CensusCompletenessClosure (IN) | `partition_no_double_count` (census + 2 = 16/3) | Completeness theorem, not a correction | CensusEnumerationTermination, PerChannelRecombination | INTEGRATED (nav-noise: "double_count") | YES (census feeds endpoint) | n/a |
| CensusEnumerationTermination (IN) | `one_cause_tie` | Structural tie theorem, no correction | closure | INTEGRATED (nav-noise) | indirectly | n/a |
| MirrorFixedPoint (IN — root) | `mirror_correction_resolved` | Numeric inequality at the fixed point; IS the endpoint root | (root) | INTEGRATED | YES | n/a |
| HermitianJordan.PieceA (IN) | `gmat_drop_abstract` | Abstract Gmat invariance ("drop" nav-noise) | closure | INTEGRATED (nav-noise) | NO | n/a |
| TowerGatherObstruction / ObstructionInvariant / ObstructionRep7 / ColourChargeOneCause (all IN) | gluingDefect defs + structural theorems | Definitions/structure, no corrections | closure | INTEGRATED (nav-noise) | NO (structural layer) | n/a |
| TowerWorldMapWeakDoubletLeftRegular (IN) | `leftReg_defect_eq_associator` | Structural, no correction | closure | INTEGRATED (nav-noise) | NO | n/a |
| TowerGatherBarMonad (OUT) | `barMultDefect_*` | Reformulation of gluingDefect as bar-monad; no ancestor value refined | none | NAV-NOISE / out-of-graph (no correction to exempt) | NO | n/a |
| TowerGatherCocycle (OUT) | cocycle identities for gluingDefect | Structural extension; no value correction | none | NAV-NOISE / out-of-graph | NO | n/a |
| TowerGatherPhysicalState (OUT) | `gluesGlobally_iff_*` | Structural; no correction | none | NAV-NOISE / out-of-graph | NO | n/a |
| TowerWorldMapWeakDoubletTwoHandedSO4 (OUT) | `rightReg_defect_eq_associator`, two-handed so(4) | Completes two-handed structure; exploration lane, no ancestor value refined | none | NAV-NOISE / out-of-graph | NO | n/a |
| EmergentMatterLadderConsolidation (OUT) | `ladder_one_cause_nonassociativity` | Consolidation restating criticalExponent = 1/assoc3NormSq; no correction | none | NAV-NOISE / out-of-graph | NO | n/a |
| LorentzContinuumGenerationSO8RankDropRestriction (OUT) | `rankdrop_witness_*` | Structural witness ("RankDrop" nav-noise) | none | NAV-NOISE / out-of-graph | NO | n/a |
| XArcValidationCapstone (OUT) | `quark_texture_not_discharged` | Ledger-membership statement (validation lane); records quark texture NOT discharged — a residual, not a correction | none | NAV-NOISE / out-of-graph (residual honestly ledgered by theorem) | NO | n/a |
| (10× `Phys.Algebra.._X` entries) | — | AppleDouble scan artifacts, 0 decls | — | ARTIFACT (excluded) | — | — |

## 2. Ranked UNRECONCILED + EXEMPT-BY-PROSE-ONLY by endpoint impact

1. **BaseNormalFormAudit — UNRECONCILED** (highest impact). The corrected base 7259/54 sits banked
   INSIDE the production import closure while every endpoint composition (ChainTermGrammar baseTerm,
   D7DepthTwoComposed recomposedEndpointDressed, reattest_base_is_resummed) computes with 2425/18.
   Direct additive impact on the F0 base: **8/27 ≈ 0.2963** inverse-alpha units — orders of magnitude
   above the D7 narrowing bracket widths (~1e-14 on L_m01). This is the largest un-consumed proven
   correction in the alpha ancestry.
2. **PerEdgeCensusRederived — UNRECONCILED**. Corrected dissolved freeze-out summand
   40/27 + κ[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2] vs production's 16/9 + κ[(7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2]
   (ComposedFreezeoutDissolved, re-exported by FreezeoutEdgeDescentDischarged, restated by
   reattest_bare_census_complete). Impact: 8/27 constant shift plus κ·(−(2/3)·L_mb + (1/3)·L_b0)
   log-weight shift feeding the recomposed endpoint. Same physical cluster as item 1 (both trace to
   the strange-quark overcount), but the weight component is an independent discrepancy channel.
3. **EdgeLogArgAudit — EXEMPT-BY-PROSE-ONLY**. Its N576 header asserts the dissolved summand IS the
   active-span (corrected) form; the theorems production actually consumes downstream restate the OLD
   form. No banked theorem ties the production endpoint to the active-span summand. Impact: it does
   not itself shift the endpoint, but it is the prose that makes the graph LOOK reconciled while
   rows 1–2 remain unconsumed — the exact failure mode the prereg calls "the dangerous kind."

## 3. Self-check

**Calibration: PASSED.** BaseNormalFormAudit (7259/54) vs D7DepthTwoComposed (2425/18) classifies
UNRECONCILED by the method (corrected value consumed by zero ancestors; grep for 7259/54 outside the
audit module returns nothing; production landings restate 2425/18). Note the subtlety the method had
to handle: BaseNormalFormAudit IS in the import closure — membership alone is not integration; the
test is whether any ancestor consumes or restates the corrected VALUE. The second known pair
(PerEdgeCensusRederived vs ComposedFreezeoutDissolved) also came out UNRECONCILED, as predicted by
the first agent's trail.

**Ambiguous modules + disambiguating questions:**
- FlavorGaugePredictionTable (old Jarlskog bracket [268/1e6, 273/1e6] still banked as a landing while
  PredictionRegistry consumes jarlskogCorrected [189/1e6, 193/1e6]): is FGPT formally superseded (a
  theorem or ledger entry naming PredictionRegistry as its replacement), or do two live prediction
  landings now disagree by a factor √2? Disambiguator: is there a banked theorem relating
  `generation_jarlskog_numeric`'s bracket to `jarlskogCorrected`, or only the registry's prose table?
- HucDischargedFreezeoutEndpoint's `endpoint_conf_one_cause` proves gem = 40/27 inside the closure
  while ChainTermGrammar's mirrorParsed carries 16/9: is the 16/9 mirror term DEFINED to be the
  pre-correction census on purpose (a different object than the gem), or the same object uncorrected?
  Disambiguator: does any theorem equate mirrorParsed's 16/9 with bandScreen censusActiveLightSpan
  confBandRatio, or with censusLightBand's band screen (the overcounted one)?
- XArcValidationCapstone `quark_texture_not_discharged`: residual ledgered by theorem (`decide`), but
  outside the closure — question: is the xResidualLedger cross-referenced by any production gate, or
  purely validation-lane?

## 4. UNAUDITED production values (never re-derived ab initio)

Audit coverage found: base/gem (BaseNormalFormAudit), per-edge census + dissolved weights
(PerEdgeCensusRederived), edge-log identities (EdgeLogArgAudit), dressing scope + recombination
architecture + composed re-attestation (FrameAudit* trio), seam (DressingSeamResolved), edge descent
brackets (FreezeoutEdgeDescentDischarged), census completeness (CensusCompletenessClosure).
Production values with NO later audit module re-deriving them (not wrong — never independently
re-checked):
- **kappaLeading** (the leading κ weight multiplying every log term) — consumed by 51 modules; no `*Audit`/`*Rederived` module re-derives its value.
- **cInner** (C_inner composition entering recomposedEndpointDressed = 2425/18 + (3/2)·κ·cInner) — assembled in the D7 chain, no independent recount.
- **mbRatioDerived** and the **bMass** numerals (edge-log arguments; EdgeLogArgAudit audits the log
  IDENTITIES over them, not the values themselves).
- **depthWeight = 1/3** — tied by `reattest_weight_tie` (restatement, in-band), but no ab-initio rederivation module.
- **topBandRatio / confBandRatio / confBundle** pinnings — restated across landings, never re-derived by a dedicated audit.
- **6923/54** (recomposedInvAlphaEM at the trace depth) — restated by `reattest_bare_census_complete`; restatement only, no independent recount of the 6923 census.

## 5. Totals

- Navigation hits swept: **36** (26 real modules + 10 scan artifacts excluded)
- UNRECONCILED: **2** | EXEMPT-BY-PROSE-ONLY: **1** | EXEMPT-BY-THEOREM: **1** (DressingSeamResolved killed branch) | INTEGRATED: **15** (incl. nav-noise in-closure) | NAV-NOISE/out-of-graph: **7** | ARTIFACT: **10**
- UNAUDITED production values (direction-2 sweep): **6** listed above
