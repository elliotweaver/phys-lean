# TENSION-VERDICT — completeness-tension recon (repair campaign PHASE 0)
Date: 2026-08-08. Head: e7d5e473. Prereg: PREREG.md (this directory). Recon lane — no repo file modified.

## (a) VERDICT: **H-A** — the closure is a TELESCOPING invariance of step differences; it survives the N688 active-span correction VERBATIM. No missing summand.

### The discriminating theorems (theorems bind; docstrings orient)

1. **The closure object is built from STEP DIFFERENCES, not per-edge weights.**
   `CensusCompletenessClosure.freezeoutStaircaseCensus` (def, L169-171) is literally
   `2·((bandCensus[2,1,1,2,1] − bandCensus[2,1,1,2]) + (bandCensus[2,1,1,2] − bandCensus[2,1,1]))`
   — a TELESCOPE of the banked `bandCensus` plateaus: it collapses to
   `2·(bandCensus[2,1,1,2,1] − bandCensus[2,1,1]) = 2·(11/3 − 2) = 10/3`
   (`freezeoutStaircaseCensus_val`). It NEVER references the per-edge freeze-out
   WEIGHTS `(censusBottomBand, censusCharmBand, censusLightBand)` that N688/N574
   corrected. The corrected weights `(10/3, 2, 5/3)` live in a DIFFERENT object
   (`PerEdgeCensusRederived.freezeoutTailActive`, the census attached to each edge
   LOG in the screening summand). The closure and the weights are different layers.

2. **The step law is preserved under the correction — proven, not asserted.**
   `PerEdgeCensusRederived.active_step_charm` (L232):
   `censusActiveBottomSpan − censusActiveCharmSpan = colouredCensusTerm 2` (10/3 − 2 = 4/3),
   `active_step_strange` (L238):
   `censusActiveCharmSpan − censusActiveLightSpan = colouredCensusTerm 1` (2 − 5/3 = 1/3).
   These are EXACTLY the same two census terms as the banked steps
   (`freezeout_step_bottom = colouredCensusTerm 1`, `freezeout_step_charm =
   colouredCensusTerm 2`, D2 SubBandCompletion) — the multiset {1/3, 4/3} is invariant;
   only WHICH flavour labels each step shifts one rung (bottom,charm → charm,strange).
   N574's own docstring says it: "the census-split STEP law is preserved … only the
   absolute staircase level shifts down one rung." Verified at theorem level:
   banked telescope 2·(1/3 + 4/3) = 10/3; active telescope 2·(4/3 + 1/3) = 10/3.
   Fractions check (this recon): both frames' doubled step sum = 10/3 exactly.

3. **Therefore every closure conjunct survives verbatim.**
   - `staircase_resupplies_removed`: `staircase = colouredCensus` (10/3) — invariant,
     since the staircase telescope is weight-independent.
   - `census_completeness_closure`: `chargeTraceDepth = staircase + leptonCensus`
     (16/3 = 10/3 + 2) — invariant (it is `census_split` + the invariant telescope).
   - Teeth `staircase_ne_full` / `staircase_ne_singlet` / `partition_no_double_count` /
     `staircase_ne_zero` — all statements about the invariant 10/3; untouched.
   - `screening_completeness_closure` relates the REMOVAL (`decoupling_removal`,
     DecouplingCensusRemoval L192) to `bandScreen staircase (mass0/mass1)` — both sides
     are stated in the census-split objects (colouredCensus/leptonCensus/chargeTraceDepth),
     none of which N688 touched. Invariant.

4. **What `reattest_bare_census_complete` attests, and what actually breaks.**
   `FrameAuditedCompositionReattestation.reattest_bare_census_complete` (L225) is a
   CONJUNCTION: (i) a CLOSED FORM re-export carrying the OLD summand
   `16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]`; (ii) the census partition
   `chargeTraceDepth = staircase + leptonCensus`; (iii)-(iv) way-points; (v) enumeration
   exhaustiveness; (vi) termination. The COMPLETENESS content — conjuncts (ii), (v),
   (vi) — is invariant (H-A). Conjunct (i) is a NUMERIC RESTATEMENT that must be
   re-exported with the corrected summand `40/27 + κ·[3·L_mb + (10/3)L_b0 − (5/3)L_b2]`
   (`freezeoutActive_summand_dissolved`) and corrected base — a recomposition chore
   already inventoried (base-adjudication VERDICT fallout table), NOT a completeness
   break. The attestation does not break; its closed-form clause gets restated.

5. **Why H-B is excluded (the removal frame already accounts the strange content).**
   H-B posited the removed strange content must re-enter as its own below-m_s summand.
   But `DecouplingCensusRemoval.decoupling_removal` removes the coloured slice from the
   DESCENT (the lepton tail runs with `leptonCensus` only), and the closure proves that
   slice is resupplied by the STAIRCASE (invariant, point 3) — the ledger balances with
   no residue in EITHER frame. Moreover the base-adjudication verdict (N575/N579,
   `endpoint_conf_one_cause`) proved the light-edge gem at census 5/3 is ONE derived
   value with the conf band — one cause, no missing double. A new positive summand
   would be a DOUBLE-COUNT of `colouredCensusTerm 1`, contradicting
   `partition_no_double_count` (staircase + 2 = 16/3, exact). No banked theorem leaves
   an unaccounted positive slice. H-C is excluded because the closure IS about census
   content (the same bandCensus plateaus the weights are drawn from) — it is about the
   weight layer's DIFFERENCES, which is precisely why it is invariant (H-A, not "never
   about the weights").

**Consequence for the campaign: the recomposition proceeds with ONLY the N688/N574
weight correction (+ the N575 base correction). No new summand to derive. The residual
gap of the corrected endpoint to anything is future work, not a missing-summand signal.**

## (b) H-B missing summand — N/A (H-A). For the record: had H-B held, the forced form
would have been `bandScreen ((colouredCensusTerm 1 : ℚ) : Cut) (m_s-floor ratio)` — but
no banked theorem supplies such a span object, and `partition_no_double_count` forbids it.

## (c) Corrected endpoints at banked bracket mids (exact Fractions; full verdict = N688 weights + N575 base 7259/54)

Inputs (banked bracket theorems; orientation mids):
- κ mid = 785398163397447500000000000/7402203300817003703230194183
  (`inv_cutPi_bracket_ext8`, D7NarrowingRung4)
- L_m01 = 815406111272601/10^16 (`cutLog_m01`, D7NarrowingRung3)
- L_mb = −408930664000671/10^16, L_b0 = 1733728794954635/10^17,
  L_b2 = −1088723725223625/10^17 (D7NarrowingRung3/4 sharp edge-log bracket mids)
- corrected cInner = 2·L_m01 + 3·L_mb + (10/3)·L_b0 − (5/3)·L_b2
  = 6980302698392029/60000000000000000 (weights: `freezeoutActive_summand_dissolved`)
- dressing 3/2 (`kappaLeadingDressed_eq_div`); base 7259/54 (`base_corrected_value`,
  BaseGemCensusAdjudicated).

**BARE** endpoint = 7259/54 + κ·cInner_corr
= 884568359602600455861504942848533/6579736267392892180649061496000 ≈ **134.4382698112451**

**DRESSED** endpoint = 7259/54 + (3/2)·κ·cInner_corr
= 47768884345308134755116131670999173/355305758439216177755049320784000 ≈ **134.4444417539047**

Secondary (PREREG) confirmed: the bare correction is IDENTICAL IN SHAPE to the dressed
one — same base 7259/54, same corrected weights, differing only by the dressing factor
3/2 on κ·cInner (the `reattest_dressed_weld` increment (1/2)·κ·cInner is exactly
dressed − bare here). (Note: prose figures ~136.28/136.45 correspond to frames WITHOUT
the N575 base correction; under the full verdict at these mids the values are as above.)

## (d) NO-FIT SELF-CHECK

- No step used 137.036 or any measured value in any inference; it appears in this file
  nowhere outside this sentence. The H-A decision was reached purely from the theorem
  shapes: the telescope definition of `freezeoutStaircaseCensus`, `active_step_charm`/
  `active_step_strange`, `census_split`, `partition_no_double_count`.
- All arithmetic exact Fractions; bracket mids used for orientation numerals only,
  each cited to its banked bracket theorem.
- The verdict does NOT move the endpoint toward anything: H-A explicitly says the
  corrected endpoint is what the chain says, residual gap = future work, no summand
  invented to close a gap — the anti-fit outcome.
- No repo file modified; writes confined to workbench/completeness-tension/.
