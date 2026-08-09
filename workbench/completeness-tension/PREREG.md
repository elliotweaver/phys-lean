# PREREG — COMPLETENESS-TENSION RECON (repair campaign PHASE 0) — frozen
Date: 2026-08-08. Head: e7d5e473. Recon lane, NO repo modification.
Work dir: C:/Users/ellio/phys-lean/workbench/completeness-tension/ (create).

## THE QUESTION (the one thing to decide)
N688 adjudicated: the freeze-out staircase census weights are the ACTIVE-SPAN ones
(10/3, 2, 5/3), not the banked (11/3, 10/3, 2). But CensusCompletenessClosure proves
(OLD weights) the staircase census exactly resupplies the coloured census:
  freezeoutStaircaseCensus = 2·((11/3−10/3) + (10/3−2) + (2−5/3))? — READ THE ACTUAL
  DEFINITION AND THEOREM (CensusCompletenessClosure.lean ~40-60: census_completeness_closure,
  staircase_resupplies_removed, chargeTraceDepth = staircase + leptonCensus).
UNDER THE ACTIVE WEIGHTS: does this closure still hold, fail, or transform?
Three hypotheses to adjudicate (fold-native, NO-FIT):
  H-A: the closure is about the STEP DIFFERENCES (the per-threshold drops), and the
       active-span correction shifts each edge's weight but PRESERVES the differences
       (a telescoping invariance) → closure survives verbatim, no missing summand, the
       corrected endpoint at ~136.28 is simply what the chain says (the residual gap to
       anything is future work, NOT a missing-summand signal).
  H-B: the closure sum CHANGES under active weights → the completeness attestation
       (reattest_bare_census_complete) genuinely breaks → the removed strange content
       must re-enter as its OWN summand (a below-m_s sub-band term with the strange
       census, positive) → the corrected composition has a NEW term to derive; compute
       its forced form: bandScreen (colouredCensusTerm 1) (WHICH ratio?) — the fold's
       own removal frame says decoupled content is REMOVED from the DESCENT, but the
       descent's LEDGER (the total screening from the cap to the floor) must still
       conserve the cap census: find the banked theorem that says where the strange
       term's screening lives after it decouples (candidates: DecouplingCensusRemoval's
       decoupling_removal — read what it removes FROM and TO; SubBandCompletion's
       freezeoutTail structure; CensusEnumerationTermination).
  H-C: the closure was never about the summand weights at all (different object) →
       no tension, recomposition proceeds with just the N688 correction.
DECIDE by reading the theorems. The deliverable states which hypothesis the banked
structure forces and WHY (theorem names), and if H-B: the exact forced form + exact
rational value of the missing summand.

## SECONDARY (only if time remains)
The corrected bare endpoint must also be recomputed for the BARE (undressed) form:
recomposedEndpoint = 2425/18 + κ·cInner (bare κ, not 3/2κ). Confirm the correction is
identical in shape (base 7259/54 + corrected weights) for the bare object.

## VERDICT FORMAT: TENSION-VERDICT.md — (a) H-A/H-B/H-C with theorem citations;
(b) if H-B the missing summand's forced form + exact value at banked bracket mids
(Fractions); (c) the corrected bare + dressed endpoint values at banked mids under the
full verdict (Fractions, cite each bracket theorem); (d) NO-FIT self-check.
## HARD RULES: skeleton within 2 tool calls; save incrementally; theorems bind; exact
Fractions; NO 137.036 in any inference; no repo file modified.
