# RESOLUTION NOTE — DressingSeamResolved (t_c488fbdc): the dressing/recombination seam is BRANCH (a)

The parent (ComposedFreezeoutDissolved) NAMED the last barrier before D7: at the derived s=1/8 the
bare recombined leading-κ tower (112+totalScreening ≈ 137.95) and the D2c/D2d DEPTH-DRESSED object
(≈150, inflation ×1.46484375) DISAGREE. This node RESOLVED it from the trunk — NOT by fitting.

## THE RESOLUTION (theory-native, decided by the chain's OWN banked way-points)

The seam is decided WITHOUT any measured value, by the exact WAY-POINTS the assembled pipeline must
reproduce (SEED_DIGITS §D4/§D6 free instrument-check):

- The banked assembly composes with the LEADING κ₀ = kappaLeading = 1/(3·cutPi) and reproduces
  BOTH banked exact way-points:
    • electroweak  invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27  (X6, and the SAME
      1582/27 X7 FineStructureMZReadings builds the PHYSICAL 1/α(M_Z) upon);
    • confinement  invAlphaZero derivedBandList = 190/3  (Z4).
- The D2c/D2d DEPTH-DRESSING replaces κ₀ by κ(w)=κ₀/(1−w). At the DERIVED weight w=depthWeight=1/3
  (1/(1−w)=3/2), BOTH way-points MOVE:
    42 + (448/27)/(1−1/3) = 602/9 ≠ 1582/27   (dressed_topBand_moves)
    dressedInvAlphaZero (1/3) derivedBandList = 74 ≠ 190/3   (dressed_conf_moves, = D3's banked 74)
  A uniformly depth-dressed tower therefore FAILS the free instrument-check, and reproduces the
  way-points ONLY at w=0 (dressed_reproduces_only_at_w0).

Because the depth-tower factoring is UNIFORM across all bands (dressedTotalScreening_factor), there
is NO band-selective dressing available: the dressing is EITHER on every band (moving the way-points,
forbidden) OR on no band (w=0, leading-κ). The way-points FORCE the latter. Hence BRANCH (a): the
×1.465 dressing is DRIFT (the census-in-census content is already carried by the banked all-orders
transmutation scales that DEFINE the band edges, topBandRatio=cutExp(28·cutPi/3); re-applying /(1−w)
double-counts). Branch (b) (a compensating negative summand) is EXCLUDED: it would also have to
un-dress the way-points, which the assembly's own way-point theorems forbid.

⭐ ONE CAUSE: the SAME banked exact way-points 1582/27 and 190/3 that X7 built the physical 1/α(M_Z)
reading upon are the internal anchors that adjudicate the recombination-layer seam.

## WHAT THIS UNBLOCKS (the genuine composed 1/α(0) is now UNAMBIGUOUS — leading-κ)

The genuine composed object is the WAY-POINT-CONSISTENT leading-κ recombined tower
(D2b composed_endpoint: invAlphaEM(completeBandList chargeTraceDepth) = invAlphaZero(...) + 70,
certified 137.9475880261…) with the leading-κ isospin anti-screening (−s·totalScreeningWith 1, s=1/8)
and the banked determined freeze-out summand (parent freezeout_at_pinned_dissolved, 16/9 + κ·[…]).
The ×1.465 depth-dressed ~150 object is EXCLUDED; the composed_endpoint_determined's dressed D2d
endpoint is NOT the physical composed object (it carries the excluded /(1−w) dressing).

## THE SUCCESSOR'S TARGET (D7 restate AS 1/α(0), ≥15 sig digits)

Assemble the way-point-consistent LEADING-κ composed object as a determined closed form:
    composed_leading = 112 + totalScreeningWith chargeTraceDepth (completeBandList chargeTraceDepth)
                          − s · totalScreeningWith 1 (completeBandList chargeTraceDepth)     [s=1/8]
                       + totalScreening (freezeoutTail at pinned edges)                       [= 16/9+κ·[…]]
(all at LEADING κ₀ — NO /(1−w) dressing). This is invAlphaEM(...) − s·T + freezeout, or equivalently
the D2c dressedInvAlphaEM at w=0 + freezeout. Then establish the D7 COMPOSITION-COMPLETENESS
attestation as a THEOREM at leading κ (every banked summand — the two high bands, the lepton tail,
the recombination +70, the isospin anti-screening −s·T, the freeze-out — INCLUDED or proven zero),
and narrow the resulting derived Cut to ≥15 sig digits AS 1/α(0) (D7 → D8 capstone → hand M1).

NUMERIC ORIENTATION (removable prose, NO empirical number in any proof): the leading-κ recombined
tower (before s-anti-screening) is 137.9475880261…; the isospin anti-screening −s·T (s=1/8) lowers
it; the freeze-out summand (≈1.63) raises it. The successor DERIVES the assembled numeral; it does
NOT fit to 137.036. The measured value appears ONLY in the removable comparison line (G2). If the
certified bracket excludes the measured value, that is the fold's PREDICTION — state it, never bend.

## BANKED THIS NODE (Phys/Algebra/DressingSeamResolved.lean, commit 2fabd18; gate log 25af3ff)
leading_topBand, leading_conf, totalScreening_topBand, dressed_topBand_moves, dressed_conf_moves,
dressed_topBand_at_w0, dressed_conf_at_w0, dressed_reproduces_only_at_w0, resolved_composed_is_leading,
dressing_seam_resolved, teeth (dressed_topBand_ne, dressed_conf_ne, leading_ne_dressed,
derived_weight_nontrivial), dressingSeamResolved_landing. 15 decls foundations-only; C543 bites 1=543.
