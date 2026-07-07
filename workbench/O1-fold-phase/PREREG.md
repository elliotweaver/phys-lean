# O1 — THE FOLD PHASE P via the HALF-ANGLE AMPLITUDE CASCADE (arc-O O1)

## SELECT (done, comment 351)
REDIRECTED the ticket: target = SEED_COMPLETION_SWEEP §O1 (the fold phase P), NOT the
(1,9)→(1,3) reduction (that is SEED §O4). The finishing worker propagated a mislabel from
N414/N415 handoffs; the SEED doc (line 21) + SOUL + the ticket's own successor pointer (→O2 =
DISCHARGE ARC M) all agree O1 = the fold phase. Arc M banked a STANDING free-parameter theorem
(`ratios_exact_absolutes_conditional`); the fold phase is the forced BUILD that closes it — the
sharpest live debt under "EVERY CONSTANT IS FORCED". S4 gate passed in writing (comment 351).

## TARGET (theorem-route, derived-ℝ trig on the banked cascade)
Module: `Phys/Algebra/CascadeFoldPhase.lean`, ns `Phys.Algebra.FoldPhase`.
Over the derived ℝ `Cut` + banked `cutCos`/`cutSin`/`cutPi`. NO Mathlib-ℝ as content.

The cascade's intrinsic rotation angle HALVES per Cayley–Dickson fold, because each fold is the
AMPLITUDE (positive Born root) of the previous rotation — the half-angle identity
`cos(x/2) = +√((1+cos x)/2)` over the derived trig. Anchored at the quarter-turn (J²=−1, cos(π/2)=0):
  π/2 (ℂ unit, quarter-turn) → π/4 (ℂ-fold, the 45° self=other Born balance) → π/8 = P (ℍ-fold).

## DELIVERABLES (theorem-grade)
1. `cutCos_two_mul (x) : cutCos (x+x) = 2*cutCos x*cutCos x − 1`  [double-angle, from cutCos_add + Pythagorean]
2. `cutCos_half_angle (x) : cutCos x = 2*cutCos (x/2)*cutCos (x/2) − 1`  [the FORCED halving law]
3. `cutCos_pos_below_half_pi (x) (0≤x) (x<cutPi/2) : 0 < cutCos x`  [IVT + least-zero; the sign selector]
4. `cutCos_quarter_sq : cutCos (cutPi/4)*cutCos (cutPi/4) = 1/2`  [ℂ-fold amplitude²]
5. `quarter_self_eq_other : cutCos(π/4)² = cutSin(π/4)²`  [the 45° self=other Born balance, N309-genre]
6. `cutCos_quarter_pos : 0 < cutCos (cutPi/4)`
7. `cutCos_eighth_sq : cutCos (cutPi/8)*cutCos (cutPi/8) = (1 + cutCos (cutPi/4))/2`  [ℍ-fold amplitude²]
8. `cutCos_eighth_pos : 0 < cutCos (cutPi/8)`  [amplitude = POSITIVE Born root]
9. `def foldPhase : Cut := cutPi/8` + `foldPhase_is_half_of_quarter` (= (π/4)/2), `quarter_is_half_of_half_turn`
10. `foldPhase_amplitude : 0 < cutCos foldPhase ∧ cutCos foldPhase² = (1+cutCos(cutPi/4))/2`  [P is the ℍ amplitude, positive root]
11. `def foldPhaseHalf : Cut := cutPi/16` + `foldPhaseHalf_amplitude` (the next half-step R=cos(P/2), cascade continues)
12. capstone `fold_phase_half_angle_cascade` — the three-rung amplitude descent, each an exact positive Born root.

## PHYSICS-WORDS-REMOVABLE
Delete fold/cascade/amplitude/Born/phase: pure statements that cutCos at cutPi/2, cutPi/4, cutPi/8,
cutPi/16 satisfy the iterated double-angle relations with strictly-positive values on (0,cutPi/2).
No theorem STATEMENT needs a physics word; all TYPEs cite the banked cutCos/cutSin/cutPi on Cut.

## NON-VACUITY (W8) / COSTUME C441
Anchor: `cutCos(cutPi/4)² = 1/2` and `0 < cutCos(cutPi/8)` (positive Born root). cFlag:=1 tied to
the landing via foldPhase_amplitude + cutCos_quarter_sq; anchor `min 441 cFlag = 1` true; bogus
`min 441 cFlag = 441` reduces to `1 = 441`, BITES. Next Cid after C440 = C441.

## RISK / MEASURE-FIRST (W9)
Light node (pure Cut trig). Risk surface = the positivity lemma (IVT + csInf_le) and the linarith
closings of the square identities. MEASURE all in one bounded probe BEFORE production.

## KILL / COST BUDGET
If any single obligation exceeds ~90s in the probe, decompose. Expect all light (banked cutCos_add,
cutSin_sq_add_cutCos_sq, cutCos_continuous, cosZeroSet already built). No maxHeartbeats raise ever.

## SUCCESSOR (ONE)
Directed child toward SEED_COMPLETION_SWEEP §O2 (DISCHARGE ARC M: substitute the derived fold phase
into absScaleChain, derive top+light links, re-grade M's conditional to derived).
