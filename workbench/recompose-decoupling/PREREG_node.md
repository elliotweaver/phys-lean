# PREREG — t_c74b069f  RECOMPOSE-DECOUPLING (the recombination + the recomposed way-points)

## FRONT (theory-native)
Parent (t_552c142e / 89a1c6b) banked the FRAME: the additive fine-structure endpoint architecture
(`RecombinedEndpoint`, lands 137.9476, OVERSHOOT +0.91 vs measured 137.036) is WRONG — a ONE-LAW
signal. It forced a census-conserving correction and handed THIS node the actual recombination +
numeral. The theory-native beat: the fold's skew-adjoint gather forces a NEGATIVE isospin gather
self-census (Z1) of DERIVED magnitude `s = projectedS = (funCas/adjCas)·depthWeight = (3/8)·(1/3)
= 1/8` (banked `CasimirProjectionSelectsS.projectedS_eq`; "NO route-not-yet-found remains for s").
This is RUNNING content of the non-abelian isospin channel: it runs 42→v carrying NET census
`netIsoDepth s = isoDepth − s = 2 − 1/8 = 15/8` (banked `TwoChannelDescent.netIsoDepth`), while
the abelian hyper channel runs UNREDUCED (10/3). They recombine at v (banked weight 3/8).

## TARGET (magnitude, words-removable)
Bank `RecomposedRunningEndpoint`: the two-channel running descent recombined with the DERIVED s=1/8
FOLDED IN as the isospin net running census. NEW EXACT cutPi-free way-points:
  - recomposed EW way-point  `recomposedInvAlphaEM [(_,topBandRatio)] = 6923/54` (M→v, iso reduced)
  - recomposed conf way-point `6923/54 + bandScreen(16/3,confBandRatio) = 7179/54` (below v, full EM charge)
  - THE EXACT SHIFT (the crown): additive − recomposed on the top band = `bandScreen(projectedS,top)
    = 7/18` — the derived s=1/8 enters as an EXACT rational (cutPi cancels).
  - recomposedCharge = netIsoDepth projectedS + hyperDepth = 125/24 = chargeTraceDepth − projectedS
    (census conserved: 125/24 + 1/8 = 16/3).

## VERIFIED (Fraction + mpmath, workbench/recompose-decoupling/verify_exact.py)
  bandScreen(1/8,top) = 7/18 ✓; 112 + bandScreen(125/24,top) = 6923/54 ✓; chg−s = 125/24 ✓;
  6923/54 + 128/27 = 7179/54 ✓; recomposed (132.94) < additive conf way-point (133.33) ✓;
  high bands + lepton undershoot (135.06) → freeze-out screens UP toward 137.036 (ONE-LAW-correct).

## BLOCKER (named, NOT asserted — REPEATED-DEFERRAL signal)
The ≥15-digit numeral AS 1/α(0) needs the freeze-out edge ℝ-descent (rb,rc,rl — quark mass R-ratio
descent) to 15 digits; banked (Light/HeavyQuarkNumerals) only to ~6 sig digits. Per the
composition-completeness gate, a partial sum may NOT be declared 1/α(0). NOT a block (NO-BLOCK
MANDATE): bank the recompose + CHILD ONE route-finder successor toward the quark ℝ-descent.

## GATE (all ✓ — see kanban comment 498)
fold-causal; dissolution (field integrates measured RGE, fold COUNTS census + PROVES s=Casimir·depth,
exact rationals); words-removable (tower 112 + Σ bandScreen at per-channel censuses); temptation
named+refused (no fit, no assert of freeze-out edges); honest (s banked-derived, way-points exact).

## PLAN
RecomposedRunningEndpoint.lean, import RecombinedEndpoint + CasimirProjectionSelectsS (no cycle):
(A) recomposedCharge = 125/24 = chg − s; (B) recomposed channel split (linearity);
(C) recomposedIsoTower/recomposedInvAlphaEM defs + closed form; (D) exact way-points 6923/54, 7179/54;
(E) THE EXACT SHIFT 7/18 = bandScreen(projectedS,top); (F) ONE-LAW direction (recomposed<additive);
(G) census conservation; (H) completeness attestation naming the freeze-out ℝ-descent blocker;
(I) W8 teeth (s load-bearing: 125/24≠16/3; shift≠0; ≠ rejected whole-stack 3/2).
Cost: trivial (norm_num/ring/linarith on cutPi-cancelling rationals of Cut). No inflated heartbeats.
