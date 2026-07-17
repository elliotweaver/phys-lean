# PREREG — ARC-D D7: THE NUMERAL (TheNumeral)

## Node
D7, directed successor of D6 (WayPointBracket). Module: `Phys/Algebra/TheNumeral.lean`,
namespace `Phys.Algebra.TheNumeral`. Costume C521.

## THE NORTH STAR + THE COMPOSITION-COMPLETENESS GATE (the crux — anti-bullshit gate applied)
D7 STATES the certified two-sided rational bracket for the derived endpoint numeral to MORE
significant digits than the measured value carries. BUT the composition-completeness gate is a
HARD PREREQUISITE to calling that bracket `1/α(0)`.

FINDING (decisive, from the banked chain):
 • The narrowing campaign (D4–D5-next-12) certified a 12-sig-digit bracket for
   `invAlphaZero (completeBandList chargeTraceDepth)` where (Z6) `completeBandList = derivedBandList
   ++ leptonTail` — the PARTIAL tower (two high bands + lepton tail). Value ≈ 67.9476.
 • Z6's OWN docstring: "the partial-tower reading here (high bands + lepton tail) is a DERIVED
   closed real of Cut, a partial sum SQUEEZED between the octonion ceiling and the full 1/α(0),
   not a claim to the measured value."
 • D2 (SubBandCompletion) enumerated the light-quark/hadronic FREEZE-OUT sub-bands
   (`freezeoutTail`) and PROVED they screen STRICTLY POSITIVE for screening edge ratios
   (`freezeoutTail_screens`). They are NOT composed into `completeBandList`, and they are NOT
   zero-contribution.

THEREFORE the composition is PARTIAL. Per seed §D7 / task front (1): the bracket is a WAY-POINT,
NOT `1/α(0)`. D7 STATES the numeral as the PARTIAL SUM it is, BUILDS the composition-completeness
attestation as a THEOREM showing the composition is partial (freeze-out summand present + non-zero),
and CHILDREN the missing summand. Do NOT state the bracket as `1/α(0)`. Do NOT hand D8 (D8's digit
target — the FULL `1/α(0)` numeral — is unmet while the composition is partial).

THEORY-NATIVE HEART / ONE CAUSE: the composition-completeness gate is the fold's OWN honesty. The
narrowing campaign narrowed a way-point; the fold KNOWS it is partial because it ALSO derived (D2)
the freeze-out sub-bands that sit between, whose strictly-positive screening (running 1/α UP through
the dominant hadronic sector) is the missing summand. The gate PREVENTS the credibility-killing
move: declaring a 12-digit way-point to be `1/α(0)` and then "predicting" a disagreement with the
measured value — which would be a FAKE prediction from an incomplete sum (seed §D7: "A disagreement
from a composition WITHOUT the attestation is NOT a prediction — it is an incomplete sum").

## DESIGN (all citations banked; nothing posited)
Reuse D5-next-12 sharp bracket + D2 freeze-out structure + Z6 endpoint split + the additive-append
lemma.

(A) THE NUMERAL — certified two-sided rational bracket, pinned to 12 significant digits.
  - `theNumeral_bracket` : re-export `NarrowedBracket12.invAlphaZero_narrowed12_bracket`
      12007329939722/176714586765 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 32019546505738/471238898037.
  - `theNumeral_pinned` : the 12-sig-digit decimal window
      679475880261/10000000000 < invAlphaZero (completeBandList chargeTraceDepth) < 679475880262/10000000000,
      i.e. 67.9475880261... — pinned to 12 significant digits (measured ~9–10 digits; the
      beyond-measurement digits are the chain's standing PREDICTION FOR THE WAY-POINT).

(B) THE COMPOSITION-COMPLETENESS ATTESTATION (theorem, honestly PARTIAL).
  - `attestation_tower_split (rb rc rl d)` : invAlphaZero (completeFreezeoutList rb rc rl d)
      = invAlphaZero (completeBandList d) + totalScreening (freezeoutTail rb rc rl)
      (via `freezeout_confWaypoint_free` + `totalScreening_append` + `confWaypoint_in_complete` + ring).
  - `attestation_freezeout_nonzero (rb rc rl) (1<rb,rc,rl)` : 0 < totalScreening (freezeoutTail rb rc rl)
      (D2 `freezeoutTail_screens`) — the missing summand is NON-ZERO.
  - `attestation_partial (rb rc rl) (1<rb,rc,rl)` : invAlphaZero (completeBandList chargeTraceDepth)
      < invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth) — the numeral bracket is a
      WAY-POINT strictly below the complete tower. The composition is PARTIAL.

(C) W8 TEETH.
  - `theNumeral_window_strict` : 679475880261/1e10 < 679475880262/1e10 (numeral non-hollow).
  - `attestation_load_bearing (rb rc rl) (1<rb,rc,rl)` : the partial sum ≠ the complete tower — the
    attestation is not vacuous (a partial composition is genuinely NOT the endpoint).
  - `theNumeral_gt_conf` : 190/3 < invAlphaZero (completeBandList chargeTraceDepth) (the numeral
    genuinely screens; `invAlphaZero_narrowed12_gt_waypoint`).

(D) CAPSTONE `theNumeral_landing` : welds (A)–(C), non-hollow.

## HONEST GRADE
- CERTIFIED NOW: the 12-sig-digit numeral bracket for the PARTIAL-SUM WAY-POINT (more digits than
  measured); the composition-completeness attestation (the tower split is exact; the freeze-out
  summand is strictly positive; the partial sum is strictly below the complete tower — the
  composition is PARTIAL); teeth.
- ROUTE-NOT-YET-FOUND (never asserted/fitted): the missing summand — the freeze-out sub-band edge
  ratios `rb, rc, rl` as closed reals of Cut (their ℝ-descent, forced ratios of derived edge scales,
  absolute scale cancelling as in the lepton tail). Composing them into `completeFreezeoutList` and
  re-evaluating is the ONE directed successor. Physically: the freeze-out tail is the DOMINANT
  hadronic contribution to the running of 1/α(0) — the ~69 gap from 67.9476 toward the measured
  value is the missing summand, not a theory failure. The measured 1/α(0) appears ONLY in removable
  prose (G2); NEVER steers any bracket; truncating at measured precision FORBIDDEN.

## GUARDS
foundations-only #print axioms ⊆ {propext,Classical.choice,Quot.sound}; derived ℝ Cut only; NO
Mathlib ℝ/ℂ as content; NO Real.pi/cos/exp; NO native_decide; NO floats in production; NO empirical
number in any proof; words-removable; import guard: WayPointBracket + SubBandCompletion
(transitively the banked chain), NEVER OneAxiom.

## COMPILE-COST BUDGET / KILL
All proofs are citation + linarith/norm_num/ring over rationals of Cut — LIGHT (probe compiled
clean, exit 0). KILL: if any single obligation needs >90s or a heavy normalizer, STOP and decompose
(W9). Expect <30s file build.

## ONE SUCCESSOR (one-successor rail — REPLACES D8 AND the generic SELECTION ticket)
The missing-summand child: derive the freeze-out sub-band edge ratios `rb, rc, rl` as closed reals
of Cut (the ℝ-descent), compose them into the complete tower (`completeFreezeoutList`), and
re-evaluate/re-narrow the genuine `1/α(0)`. This is the D2 composition-completeness gate surfacing
(task front 1). D8 (capstone) comes AFTER the composition is completed and the genuine `1/α(0)`
numeral is stated. The arc remains directed: D7 → [freeze-out composition] → ... → D8 → M1.
