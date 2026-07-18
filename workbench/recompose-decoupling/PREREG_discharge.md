# PREREG — t_1da5c7ba  FREEZE-OUT EDGE DESCENT DISCHARGED (the decoy front named + closed)

## FRONT (theory-native, redirected per S3 divergence)
The ≥3-node "freeze-out edge ℝ-descent (rb,rc,rl)" blocker is a DECOY. The sibling banked node
`ComposedFreezeoutDissolved` (eca9d1f) ALREADY dissolved the edges: at the pinned edges the freeze-out
summand = `16/9 + κ·[(7/3)·cutLog mbRatioDerived + (11/3)·cutLog(bMass0) − (5/3)·cutLog(bMass2)]` —
a DETERMINED closed form. And the cutLog bracket instrument (`cutLog_ge_certified`/`cutLog_le_certified`,
`ContinuumBracket`) is ALREADY BANKED and precision-unbounded (push N). So the edges are determined and
bracketable to any width: route COMPLETE, not route-not-yet-found.

## TARGET (magnitude, words-removable) — DISCHARGE the decoy with a theorem
Bank `FreezeoutEdgeDescentDischarged`:
  (1) re-export the charm-edge log identity: cutLog(1/mbRatioDerived) = −cutLog mbRatioDerived (cutLog_inv_pos).
  (2) A CERTIFIED two-sided rational bracket of the charm-edge log:
        4 ≤ cutLog(1/mbRatioDerived) ≤ 41/10
      built from the banked instrument (cutLog_ge_certified / cutLog_le_certified) + the banked
      invMbRatio_bracket (5969/100 ≤ 1/mbRatioDerived ≤ 5971/100). Lower via cutExp 4 ≤ 5969/100 ≤ edge;
      upper via edge ≤ 5971/100 ≤ cutExp(41/10) (partialExp lower bracket).
  (3) hence cutLog mbRatioDerived ∈ [−41/10, −4] (negative — the charm cross-ratio is a suppression).
  (4) The determined-form re-export (freezeout_summand_dissolved) — the edges' logs are a closed form.
  (5) teeth: bracket strictly two-sided (4 < 41/10); charm-log negative (cutLog mbRatioDerived < 0);
      16/9 ≠ 0; the instrument BITES (genuine narrow bracket, not [0,∞)).

## VERIFIED (mpmath / Fraction, workbench/recompose-decoupling/verify_discharge.py)
ln(59.69)≈4.0892, ln(59.71)≈4.0896; cutExp 4≈54.60 ≤ 59.69 ✓; cutExp 4.1≈60.34 ≥ 59.71 ✓.
partialExp(4,N)+expRemBound(4,N) ≤ 5969/100 for N≥? ; 5971/100 ≤ partialExp(41/10,N) for N≥? (compute).

## THE TRUE OPEN FRONT (named, handed to the ONE successor — NOT a freeze-out route-finder)
The genuine remaining gap to a ≥15-figure numeral AS 1/α(0) is NOT the edges — it is the +1.94 residual
of the determined `leadingCarrier ≈ 138.97` above the measured region, NAMED by
`AntiScreeningFrameUndressed` / `LeadingCarrierExhausted` as THE DEPTH-2 RUNNING CONTENT (census-in-census
at second depth as a band-varying running correction). The ONE directed successor targets that, NOT the
decoy edges. No fit; s stays derived 1/8; no truncation to hit 137.036.

## GATE (S4, comment 501): fold-causal ✓; dissolution (R-ratio descent wall does not exist) ✓;
words-removable ✓; temptation named+refused (R-ratio descent is the decoy) ✓; honest (redirect to depth-2) ✓.

## PLAN
FreezeoutEdgeDescentDischarged.lean, import ComposedFreezeoutDissolved + ContinuumBracket:
(A) charm-edge log = −cutLog mbRatioDerived (re-export cutLog_inv_pos at mbRatioDerived_pos);
(B) the two partialExp/expRemBound rational way-points (norm_num on explicit N-term sums);
(C) the certified lower + upper via cutLog_ge_certified/cutLog_le_certified + invMbRatio_bracket;
(D) the mbRatioDerived-log bracket [−41/10,−4]; (E) determined-form re-export; (F) W8 teeth; (G) capstone.
Cost: norm_num on finite exp partial sums (choose smallest N that certifies) — bounded, no grind.
