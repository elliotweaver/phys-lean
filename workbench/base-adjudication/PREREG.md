# PREREG — BASE-GEM CENSUS ADJUDICATION RECON (owner-ordered, first-principles, fold-native)
Date: 2026-08-08. Head: 3f4629e0. This is a RECON lane: NO repo modification, NO Lean
production. Deliverable = a written verdict + exact-rational support. N688 reserved for
the adjudication node that follows the verdict.

## THE QUESTION (the only question)
The base constant 2425/18 inside recomposedEndpointDressed decomposes (banked, N575) as
  2425/18 = 6923/54 [EW way-point] + 128/27 [conf band, census 16/3] + 16/9 [the GEM].
The GEM is κ · census · (8π/3) on the confinement rung. TWO banked counting frames give
the census two different values:
  FRAME 1 (production): censusLightBand = 2      → gem 16/9   → base 2425/18
  FRAME 2 (N574/N575 active-span): censusActiveLightSpan = 5/3 → gem 40/27 → base 7259/54
The difference is 8/27 ≈ 0.2963 on the endpoint — it destroys or preserves the current
137.0359990778 landing. THE FOLD CANNOT FORCE BOTH. Decide which counting the fold's own
banked descent structure forces, from first principles, with NO reference to the measured
value (NO-FIT is absolute: 137.036 must not appear in any inference step — the landing is
FORBIDDEN as an adjudicator).

## WHAT MUST BE RECONSTRUCTED (read the actual Lean, not the ledger prose)
1. Phys/Algebra/DecouplingCensusRemoval.lean — the descent/removal structure. What EXACTLY
   does the banked machinery say about which content screens across a band: the content
   ACTIVE THROUGHOUT the span, or the content RESOLVED at the upper edge? N575 claims
   theory_removes_decoupled_content forces active-span. Verify: is that theorem actually
   about the same object-type as the base gem, or about the staircase/tail?
2. Phys/Algebra/PerEdgeCensusRederived.lean (N574) — the active-span re-derivation. What
   is the actual span each corrected census governs? Is the gem's "light band" one of the
   three staircase edges N574 corrected, or a DIFFERENT object (a plateau/limit term)?
3. Phys/Algebra/BaseNormalFormAudit.lean (N575) — the base decomposition + the lockstep
   claim. Note its OWN tension: it says the base "contains NO independent defect" AND
   that the corrected base is 7259/54. Read the actual theorems: what does it prove vs
   what does its docstring editorialize?
4. Phys/Algebra/ComposedFreezeoutDissolved.lean — confinement_rung_rational: κ·2·(8π/3)
   = 16/9. WHERE does the 2 come from HERE? Trace censusLightBand's definition to its
   banked origin: what IS it (which object, which arc, what forced it)?
5. Phys/Algebra/HucDischargedFreezeoutEndpoint.lean (N579) — gem_is_light_band_screen:
   bandScreen censusActiveLightSpan confBandRatio = 40/27 — N579 calls 40/27 "the light
   gem" and resolves one-cause. Does N579's one-cause theorem commit the chain to the
   5/3 census for THE SAME object the base's 16/9 gem instantiates, or are these two
   DIFFERENT terms (e.g. the freeze-out staircase's light contribution vs the base's
   plateau constant) that BOTH legitimately exist with different censuses?
6. THE CRUX CANDIDATE (test it hard): is the resolution that the endpoint should contain
   BOTH a base plateau term AND a staircase term and the two frames are talking about
   different summands (no contradiction, composition complete), or that they are the SAME
   summand counted twice in two frames (contradiction, one must go)? The N575 docstring
   asserts lockstep (same object); N579's one-cause says one value read in two censuses
   is NOT a double count. Reconcile these AT THE THEOREM LEVEL.
7. The fold-native first principles: the descent removes decoupled content (banked). The
   gem sits on the confinement rung 8π/3 = cutLog confBandRatio, the (Λ,v) band. What
   content is ACTIVE across (Λ,v) per the chain's own decoupling edges? If the strange
   quark decouples INSIDE that band (at m_s ∈ (Λ,v)), the active-span census differs
   from the endpoints' censuses — where EXACTLY does the banked chain place m_s relative
   to the band, and which banked theorem pins it?

## THE VERDICT FORMAT (deliverable)
A file VERDICT.md containing:
  (a) THE ANSWER: which census the fold forces for the base gem (2, or 5/3, or "both
      terms exist as distinct summands with distinct censuses — the true base is X"),
      with the DISCRIMINATING banked theorem(s) named, and the chain of inference from
      the fold's own structure (descent/removal/one-cause) to the answer. If the honest
      answer is "the banked structure underdetermines it and a NEW theorem is needed",
      say exactly that and specify the theorem statement that would decide it.
  (b) THE CORRECTED COMPOSITION under the verdict (exact rationals): the base, the
      endpoint bracket shift, the F0 shift, and the fixed-point landing shift (solve the
      cubic with exact/high-precision rational arithmetic — Python Fraction, the residual
      a·F0 − (16/9)·κ·a³ − 1 with κ and F0 at their banked bracket midpoints; note the
      mirror coefficient 16/9 here is the DIFFERENT 16/9 = chargeTraceDepth·depthWeight,
      unrelated to the gem — do not conflate).
  (c) FALLOUT INVENTORY: every banked module whose statements mention 2425/18, 16/9-as-
      gem, censusLightBand, or the dressed endpoint bracket, classified: unaffected /
      needs restate / needs re-derivation.
  (d) SELF-CHECK: confirm NO step used the measured value; list every numeral that
      entered any inference and its banked source.

## HARD RULES
NO-FIT absolute (the measured 137.036 appears NOWHERE in the reasoning; if you find
yourself preferring a frame because of where the landing sits, STOP and flag it).
Read the Lean sources, not just docstrings — docstrings editorialize, theorems bind.
Exact rationals only (Python fractions), no floats in any load-bearing computation.
NO repo file modified. Work dir: C:/Users/ellio/phys-lean/workbench/base-adjudication/
(create it; VERDICT.md + any scripts live there).


## RE-DISPATCH ADDENDUM (after first agent timed out at 600s — READ THIS FIRST)
BUDGET DISCIPLINE: you have ~10 minutes of wall time. WRITE VERDICT.md EARLY (a skeleton
with sections after ~2 min) and REFINE it as you read — a timeout must never again leave
zero deliverable. Do NOT re-read whole files; use the exact targets below.

THE CRUX, SHARPENED (decide THIS, everything else is secondary):
Is the production base's 16/9 gem THE SAME SUMMAND as the freeze-out staircase's
light-edge contribution, or a DIFFERENT summand?
KNOWN MAP (from the first agent's reading — trust these locations):
  • ComposedFreezeoutDissolved.lean lines ~32-92: the freeze-out summand DISSOLVES to
    16/9 + kappa*[(7/3)L_mb + (11/3)L_b0 - (5/3)L_b2], where 16/9 = kappa*2*(8pi/3)
    (confinement_rung_rational). Note the census weights INSIDE this dissolution are the
    OLD (11/3, 10/3, 2) staircase weights (line ~36).
  • D7DepthTwoComposed.lean lines ~174-200: cInner := 2*L_m01 + (7/3)*L_mb + (11/3)*L_b0
    - (5/3)*L_b2; recomposedEndpointDressed := 2425/18 + dressed*cInner. The base
    2425/18 = 7179/54 + 16/9 (base_eq_waypoint_plus_gem in BaseNormalFormAudit).
  • SO: does the production endpoint's 2425/18 + kappa*cInner literally EQUAL
    [waypoints] + [the dissolved freeze-out summand] + [other tail]? I.e. is the base gem
    16/9 the dissolved staircase light term (SAME object, one summand, appearing once)?
    Check: PerChannelRecombination.lean ~240-330 (freezeoutStaircaseSummand: 16/9 +
    kappa*[...] — pos theorem at ~243) and how recomposedEndpoint (line 277) assembles it.
  • IF SAME SUMMAND: N574's active-span correction (censusActive weights (10/3,2,5/3)
    replacing (11/3,10/3,2)) applies to it directly — note the corrected dissolution in
    PerEdgeCensusRederived (freezeoutActive_summand_dissolved: 40/27 + kappa*[3L_mb +
    (10/3)L_b0 - (5/3)L_b2]) changes BOTH the gem (16/9->40/27) AND the cInner log
    WEIGHTS ((7/3,11/3,5/3) -> (3,10/3,5/3))! The auditor's -8/27 diagnostic is then
    INCOMPLETE — the full correction also moves the log combination. Compute the FULL
    corrected endpoint with Fractions (banked bracket midpoints: L_m01~0.0815406111272601,
    L_mb~-0.0408930664000671, L_b0~0.0173372879495463(5), L_b2~-0.0108872372522362(5),
    kappa mid from inv_cutPi ext8 bracket /3; these are ORIENTATION mids — cite the banked
    bracket theorems as the exact sources).
  • THE COUNTER-QUESTION (steelman frame 1): is there a banked theorem that the base gem
    is a DIFFERENT object-type (a plateau/below-Lambda term where the strange quark is
    ALREADY decoupled hence census 2 is... wait, census 2 = leptonCensus? NO —
    censusLightBand=2 is the LIGHT-QUARK {u,d} band census. Check what censusLightBand's
    banked definition/origin actually is and whether ANY banked theorem distinguishes the
    base gem's span from the staircase light edge's span (Lambda->m_s vs m_s->m_c etc).
    N579's one_cause (HucDischargedFreezeoutEndpoint ~161-200) proved gem-40/27 = band
    screen at 5/3 and full-128/27 at 16/3 are one value in two censuses — read whether
    that theorem speaks about the BASE gem or the STAIRCASE term.
DELIVERABLE unchanged (VERDICT.md, the prereg format). One agent, crux first, fallout
arithmetic second, self-check last.
