# N175 PREREG — cutLog → cutRpow over the derived ℝ Cut (the continuous real power)

FROZEN before compute. THE ONE LAW: if it fights, reframe through the trunk (cutExp_add functional
equation), do NOT add hypotheses / weaken the target.

## NODE (forced by MEASURE + W4.5)
Front (i) cutLog → cutRpow OPENS new number-tower structure (the continuous real power over the
derived ℝ). Front (ii) full G₂ via expOEquiv is W9-heavy (operator-exp). Front (iii) discrete
component-group ℤ/2×ℤ/2 RE-PINS N173 Klein-four relations (W4.5 re-pin → OPTIONAL child only).
⟹ front (i) is the FORCED node.

## TARGET (the genuine continuous power, DERIVED from Cut + cutExp N174 — NEVER Mathlib Real.log/rpow)
1. cutExp STRICT MONOTONICITY: x < y → cutExp x < cutExp y. SEED: 1 + t ≤ cutExp t for 0 ≤ t
   (the n=0,1 terms via sum_le_tsum, all terms nonneg), so cutExp t > 1 for t > 0; then
   cutExp y = cutExp x · cutExp (y-x) > cutExp x (cutExp_add + cutExp_pos). [CHEAP — opens structure]
2. cutLog: the inverse of cutExp on the positives. Route TBD by MEASURE (IVT vs trunk-native sSup).
3. cutRpow x p := cutExp (p · cutLog x) for x > 0; with cutRpow x (p+q) = cutRpow x p · cutRpow x q
   (cutExp_add), cutLog (cutExp x) = x, cutExp (cutLog y) = y for y > 0, cutRpow x 1 = x or x²=x·x.

## ⚠ MEASURE-FIRST (W9) — THE KILL DECISION (frozen)
The crux unknown: cutExp CONTINUITY / IVT over the norm-less Cut. Mathlib's continuous_tsum needs
a Norm; Cut has NONE (by design, N174). PROBE whether:
  (a) Continuous cutExp synthesizes / is cheaply derivable, or
  (b) intermediate_value_Icc / a monotone-surjective OrderIso route is reachable, or
  (c) a trunk-native sSup inverse (cutLog y := sSup {x | cutExp x ≤ y}) closes WITHOUT continuity
      via the cutExp_add functional equation + completeness.
KILL per obligation: 40 lines / one probe round. If continuity is a genuine separate sub-node
after measure + trunk-reframe → DECOMPOSE: BANK the strict-monotonicity family now (it opens
structure and is cheap), CHILD cutLog/cutRpow (needs the continuity/surjectivity sub-node).

## GO / NO-GO
GO if: strict monotonicity banks clean (foundations-only) AND either (cutLog/cutRpow close in this
run) OR (a clean decomposition: monotonicity banked + cutLog childed with a crisp continuity handoff).
NO-GO regression: any Mathlib Real.log/Real.rpow/Real.exp as content; any posited continuous power;
any weakening of the target; any sorry/axiom/native bypass.

## COST BUDGET
Whole-file Foundation probe build ~7-15s (cutExp file builds in 7s). KILL a single obligation at
~40s. Production build of the new file + audit ≤ 60s. Gate in BACKGROUND (D5/D6 ~10-15min).

## COSTUME (anti-vacuity W8)
C207, DISTINCT value 1=175. Bites a WRONG cutLog/cutRpow/strict-mono claim, reducing to 1=175.

## PHYSICS-WORDS-REMOVABLE
No physics words. Delete nothing physical: pure math about cutExp over the completion-of-the-gather
-of-closures of the derived rationals — strict monotonicity, the inverse on positives, the power.
