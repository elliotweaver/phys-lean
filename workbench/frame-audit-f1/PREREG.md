# PREREG — FRAME AUDIT F1: THE RECOMBINATION ARCHITECTURE (owner redirect, t_80a7e457)

## THE OWNER MANDATE (comment on t_80a7e457, restart from top)
Narrowing is GATED. The dressed endpoint 137.0996710997 is a CONFIRMED DEFECTIVE value
(audited-everywhere + not-exact ⇒ a structural step is wrong). Every layer WITHIN the frame is
audited (huc campaign N574-580), so the defect lives in the frame's own two surviving structural
claims. ORDER: F1 first (it decides F2's arena).

(F1) THE RECOMBINATION ARCHITECTURE — the endpoint composes the second channel as the CONSTANT
+70 ceiling weld (RecombinedEndpoint). Re-derive AB INITIO: does the banked two-channel structure
(Z2 TwoChannelDescent — each channel with its OWN census including its OWN gather self-census, Z1
minus sign) force a RUN-BOTH-CHANNELS-THEN-RECOMBINE-AT-THE-READ-POINT composition rather than
one-tower-plus-constant? The discriminating theorem: compose BOTH architectures against the banked
exact way-points AND the banked derived readings (X7 genre) — way-points + channel readings
adjudicate, never 137.036 (removable prose).

## THE TWO ARCHITECTURES (both banked, this node ADJUDICATES — no new derivation)

ARCH-A (additive, one-tower-plus-constant) = `RecombinedEndpoint.invAlphaEM`:
  invAlphaEM bands = invAlphaZero bands + 70 = 112 + totalScreeningWith chargeTraceDepth bands.
  BOTH channels screen at the FULL charge census (isospin at bare matter census isoDepth = s=0).
  EW top-band way-point: invAlphaEM [(chargeTraceDepth, topBandRatio)] = 3472/27 (additive_EW_waypoint).

ARCH-B (run-both-then-recombine) = `RecomposedRunningEndpoint.recomposedInvAlphaEM`:
  = 112 + totalScreeningWith recomposedCharge bands, recomposedCharge = netIsoDepth s + hyperDepth
    = (isoDepth − s) + hyperDepth = chargeTraceDepth − s (census conserved).
  isospin runs at its NET (matter + Z1 gather self-census) census, hyper unreduced.
  EW top-band way-point: recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)] = 6923/54.

## THE DISCRIMINATING INSIGHT (the clean adjudication, fully banked)

Parametrize BOTH architectures by the SINGLE isospin reduction t:
  recombArch t bands := 112 + totalScreeningWith (netIsoDepth t + hyperDepth) bands.
  • recombArch 0        = invAlphaEM        (ARCH-A; netIsoDepth 0 + hyperDepth = chargeTraceDepth)
  • recombArch projectedS = recomposedInvAlphaEM (ARCH-B; def of recomposedCharge)

So ARCH-A IS ARCH-B evaluated at t=0 (the switch-off). But the fold's own structure FORBIDS t=0:
  (i)  Z1 channel_gather_asymmetry: the isospin gather self-census is strictly NEGATIVE
       (traceForm7 (imRep DI) (imRep DI) < 0, the fold's minus look=−id) while the abelian one is 0.
  (ii) CasimirProjectionSelectsS: the DERIVED reduction magnitude s = projectedS = 1/8 > 0
       (projectedS_admissible: 0 < projectedS), NEVER 0.
Therefore the forced architecture is recombArch projectedS = ARCH-B (run-both-recombine); ARCH-A
(the +70 constant weld) is the Z1-forbidden s=0 switch-off.

TWO independent banked adjudicators, both ⇒ ARCH-B (ONE CAUSE = the Z1 negative isospin self-census):
  (1) CENSUS/ENDPOINT: the two architectures differ at the top band by EXACTLY the Z1 anti-screening
      invAlphaEM − recomposedInvAlphaEM = bandScreen projectedS topBandRatio = 7/18
      (recomposed_shift_exact). ARCH-A over-counts the top-band census by the s slice Z1 removes.
  (2) MIXING/CHANNEL-READING: ARCH-A (s=0) FREEZES sin²θ_W = 3/8 (twoChannel_switchoff), but the
      banked forced reading is sin²θ_W < 3/8 below the octonion scale (twoChannel_mixing_departs).
      ARCH-B (s>0) reproduces the banked departing mixing; ARCH-A contradicts it.

The X7 EM way-point invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27 (em_waypoint_consistency)
is s-INDEPENDENT — the shared anchor both architectures build on. The discriminator lives ONLY in the
isospin gather self-census, nowhere in the single-channel EM reading; and the +70 = 42+70=112 ceiling
is COMMON to both architectures (recombArch t carries 112 for all t). So the defect is NOT the +70
ceiling — it is composing the isospin channel at its BARE matter census instead of its NET running census.

## THE VERDICT
RUN-BOTH-CHANNELS-THEN-RECOMBINE (ARCH-B) is FORCED. The +70-constant additive weld (ARCH-A,
RecombinedEndpoint) is the Z1-forbidden s=0 switch-off. F1 decides F2's arena: dressing applies
per-channel at each channel's OWN net running census (ARCH-B), the successor's audit.

RECONCILIATION (honest): the current endpoint being narrowed (recomposedEndpoint) ALREADY uses ARCH-B
above v (6923/54 has s=1/8 folded into iso). So F1 CONFIRMS the above-v architecture is the forced one
and REFUTES the +70-constant additive form as the s=0 switch-off. The endpoint's residual defect is
therefore NOT the above-v recombination architecture — it is handed to F2 (the dressing scope) as the
next node, with the arena now FIXED to per-channel net-census running.

## DELIVERABLE
Module Phys/Algebra/FrameAuditRecombinationArchitecture.lean, namespace
Phys.Algebra.FrameAuditRecombinationArchitecture. Import Phys.Algebra.RecomposedRunningEndpoint
(transitively: RecombinedEndpoint, TwoChannelDescent, CasimirProjectionSelectsS — all deps banked).

Theorems: recombArch (def + ceiling_common); netIsoDepth_zero_add_hyper; recombArch_zero_eq_additive;
recombArch_projectedS_eq_recomposed; archA_at_topBand (3472/27); archB_at_topBand (6923/54);
architectures_differ_at_topBand; architecture_shift_exact (= bandScreen projectedS topBandRatio);
forced_param_ne_zero; isospin_selfcensus_forces_reduction; archA_freezes_mixing; archB_departs_mixing;
mixing_adjudicates_archB; em_waypoint_shared_anchor (1582/27); archB_below_archA_topBand; teeth; capstone.

## GRADE (honest)
THEOREM-EXACT (closed reals / exact (in)equalities of Cut, foundations-only): the whole adjudication —
it is ASSEMBLY of banked exact way-points + banked channel readings. NO route-not-yet-found; the F1
verdict is a proved theorem. Measured 1/α(0) ≈ 137.036 / sin²θ_W ≈ 0.231 REMOVABLE PROSE ONLY; no
empirical number in any statement or proof; the architecture is adjudicated by the fold's own Z1
structure, NOT by where a measured value sits. Explicit NO-FIT.

## PHYSICS-WORDS-REMOVABLE
Delete every physics word: what remains over Cut is that the family recombArch t, at t=0, equals
invAlphaEM (= the additive object) and at t=projectedS equals recomposedInvAlphaEM; that these two
differ at the top band by bandScreen projectedS topBandRatio = 7/18; that projectedS = 1/8 ≠ 0
(so t=0 is a genuine boundary the derived parameter avoids); that the banked gather trace form is
< 0; that sinSqRun (netIsoDepth projectedS) < 3/8 = sinSqRun (netIsoDepth 0); that invAlphaZero
[(chargeTraceDepth, topBandRatio)] = 1582/27. Pure Cut arithmetic / order on banked objects. No
theorem STATEMENT needs a physics word.

## COST BUDGET / KILL (W9)
Every proof is rw/unfold through banked equalities + citation + norm_num on rationals — no heavy
normalizer, no coordinate expansion, no cutLog/cutPi unfolding into arithmetic. KILL: if any single
obligation needs >30s STOP and decompose (none should). Probe the two family lemmas + mixing
adjudicator FIRST (the only non-pure-citation steps).

## FORK GUARD
Exactly ONE forward successor: F2 (the dressing-scope audit in the ARCH-B arena). No generic SELECT
before the frame audit → recompose → re-attest → D7 exact-or-bug-report → D8 chain completes.
