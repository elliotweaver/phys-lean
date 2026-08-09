# PREREG — REPAIR PHASES 2–4 (N690 corrected composition, N691 corrected brackets,
# N692 corrected fixed point) — frozen 2026-08-08, head e7d5e473
Manager recon (exact Fractions from the BANKED 1e14 bracket endpoint rationals of
endpoint_core_r4/dressed_core_r4 and inv_cutPi ext8 — verbatim, no floats):
  corrected bare endpoint  ∈ [135.66031445784458, 135.66031445784460]
  corrected dressed        ∈ [136.27750872380390, 136.27750872380392]
  corrected F0'            ∈ [136.21384674656713, 136.21384674656716]
  corrected landing        ∈ [136.21383658024433, 136.21383658024436]
(Numbers are recon orientation; every production bracket must be RE-PROVED in Lean via
the same W9 abstract-core pattern. NO-FIT: these are reported, never targeted.)

## N690 — CorrectedEndpointComposition (PHASE 2, after N689 lands)
defs: cInnerCorrected := 2*L_m01 + 3*L_mb + (10/3)*L_b0 − (5/3)*L_b2;
  recomposedEndpointCorrected := 7259/54 + kappaLeading * cInnerCorrected;
  recomposedEndpointCorrectedDressed := 7259/54 + kappaLeadingDressed depthWeight * cInnerCorrected.
theorems: closed form (dressed = 7259/54 + (3/2)κ·cInnerCorrected — same
  kappaLeadingDressed_eq_div route as D7DepthTwoComposed); the weld to N689's corrected
  dissolution (the endpoint IS waypoints + corrected staircase + lepton tail — mirror
  PerChannelRecombination.recomposedEndpoint_closed's shape at the corrected weights);
  the difference identity vs the banked-frame endpoint (consume N688 full_correction_shape);
  depthTwo_dresses_corrected (dressed = bare + (1/2)κ·cInnerCorrected, strictly raises).
CONDITIONAL ON PHASE 0: if TENSION-VERDICT = H-B (missing summand), the composition
gains the derived summand term — HOLD N690 dispatch until the verdict; if H-A/H-C,
dispatch immediately after N689.

## N691 — CorrectedEndpointBrackets (PHASE 3)
Clone the D7NarrowingRung4 W9 core pattern at the corrected coefficients:
  endpoint_core_corrected (k L Lmb Lb0 Lb2, SAME banked 1e14 hypotheses verbatim):
    7259/54 + k*(2L + 3Lmb + (10/3)Lb0 − (5/3)Lb2) ∈ [rational bracket from recon,
    outward-rounded at 1e13: [271320628915689/2000000000000, 678301572289223/5000000000000]]
  dressed_core_corrected (coefficients ×3/2: 3L + (9/2)Lmb + 5Lb0 − (5/2)Lb2):
    ∈ [681387543619019/5000000000000, 34069377180951/250000000000]
  then recomposedEndpointCorrected_restated / ...Dressed_restated via the banked bracket
  theorems (inv_cutPi_bracket_ext8, cutLog_lo/hi_s7, cutLog_mb/b0/b2_ext8) — the SAME
  assembly as recomposedEndpoint_restated_r4, new constants. nlinarith with the combo
  bounds; keep the maxHeartbeats pattern of the Rung4 cores.

## N692 — CorrectedMirrorFixedPoint (PHASE 4)
F0Corrected := recomposedEndpointCorrectedDressed − obstructionTerm (the SAME banked
obstruction — N688: the obstruction is frame-independent).
residualCorrected a := a * F0Corrected − mirrorCoeff * kappaLeading * a^3 − 1
  (use the ASSEMBLED mirrorCoeff from the start — no 16/9 literal, N676 standard).
Theorems (clone the MirrorFixedPoint→MirrorRootGlobal→AlphaLandingCapstone pipeline):
  F0Corrected_bracket (from N691 + the banked obstruction bracket);
  sign change on a NEW certified window [aL', aR'] around 1/136.2138…: recon gives
  aL' = 7341/10^6 ≈ 1/136.2213, aR' = 7342/10^6 ≈ 1/136.2028 — VERIFY signs by exact
  arithmetic before freezing; residual_strictMono on the band (the SAME factorization —
  F0' − 3c(a²+ab+b²) still ≈ 135.6 > 0 on [−1,1]);
  IVT existence; uniqueness on Ioo 0 1; ChainAdmissible carry-over (1/a ≥ 136.2 > 42);
  root_inverse_form; solution_bracket_corrected: any admissible root has
  1/a ∈ [1362138365802/10^10, 1362138365803/10^10] (VERIFY + outward-round exactly);
  capstone alpha_landing_corrected (∃! admissible root ∧ bracket) — the corrected-frame
  replacement of invAlpha_certified_global/alpha_landing_capstone's numeric conjunct.
HONEST FRAME: the corrected landing ≈ 136.2138 IS the chain's current number — stated
as the theorem it is. No reference to the measured value anywhere.

## PHASE 5 (manager, after N692): capstone/claim excision — AlphaLandingCapstone/Final,
MirrorResidualWelded etc. restated over the corrected objects (the GRAMMAR half is
unaffected; only the numeric conjuncts move); the old-frame modules' landing-claim
docstrings rewritten to state their true content (certified brackets of the banked-frame
composition, adjudicated superseded by N688 — stated as FACT in the module docs and the
ledger, not as deprecation warnings); ChainTermGrammar's baseTerm updated to the
corrected base (it PARSES the endpoint — must parse the corrected one).
## PHASE 6: site/bundle/audit-map + auditor reply. PHASE 7: gate rail (unreconciled-
correction detector: greps ledger-declared corrections vs production consumption).
