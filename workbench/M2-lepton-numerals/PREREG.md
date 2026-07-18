# M2 — THE LEPTON MASS NUMERALS (SEED_MASSES §M2) — PREREG (t_8bb8fffb)

## SELECT (fresh, run before build) — CONFIRMED M2 theory-native
Trace: fold → complex unit → CD cascade → octonion stop → n=9 EW grammar rung ewClosureRatio =
cutExp(−28π/3) (arc B/N332) → fold-phase Born amplitude cos(π/8) (N416) → survival 2/3 → ℝ-descent
cos(2/3) (N309-genre) → massScale = absScaleChainDerived (N417); N340 gives mass_k = b_k². Then
absMass_k = massScale · mass_k (banked AbsMass). Every arrow forced; NO new posit. Words-removable:
a certified bracket on a specific derived Cut. Not free-floating: production TYPE cites
absMass0/1/2, massScale, mass0/1/2. No standard-math analogue ("the lepton masses in the arena's
own unit, forced from the fold" is not a textbook step). Anti-bullshit gate: PASS.

## THE ONE-PEG LAW (cited, not duplicated)
absMass_k are pure dimensionless ratios to M_oct := 1 (massScale is a ratio to M_oct, N417). The
bracket is on THAT ratio. The M1 UnitPeg only converts to a human unit; NO second dimensionful
input appears — the numerals are stated as brackets on the derived Cut ratio, and (via M1
ratio_peg_invariant) the RATIOS are peg-free. p.human absMass_k inherits the bracket by
multiplication by the single positive peg (monotone). Cited: Phys.Algebra.Peg.UnitPeg.

## THE FORCED CLOSED FORM (banked)
massScale = ewClosureRatio · (cos(π/8) · 2/3) · 1 · cos(2/3)   [absScaleChainDerived_factors, N417]
          = cutExp(−28π/3) · cos(π/8) · (2/3) · cos(2/3)
ewClosureRatio = cutExp(−(28·cutPi/3))                         [ewClosureRatio_eq, ScaleTowerLadder]

## THE BRACKET PIPELINE (all rationals pre-verified in design_full.py — ALL ASSERTIONS PASSED)
1. cutPi ∈ [31415924/1e7, 78539817/25e6]            (banked cutPi_bracket_ext2)
2. arg: 1047197/1e6 ≤ cutPi/3 ≤ 1047198/1e6         (linarith from 1)
3. cutExp(π/3) ∈ [284965/1e5, 284966/1e5] = [Elo,Ehi]  via D1:
   Elo ≤ partialExp aArg 12 ≤ cutExp aArg ≤ cutExp(π/3) ≤ cutExp bArg ≤ partialExp bArg 12 + rem ≤ Ehi
   (cutExp monotone; both partial-sum inequalities kernel norm_num, N=12)
4. HELPER cutExp_natMul: cutExp (n·x) = cutExp x ^ n  (induction on cutExp_add)
   ⇒ cutExp(28·(π/3)) = cutExp(π/3)^28 ∈ [Elo^28, Ehi^28]
   ⇒ ewClosureRatio = 1/cutExp(28π/3) ∈ [1/Ehi^28, 1/Elo^28]  (cutExp_mul_neg gives inverse)
   ⇒ ewClosureRatio ∈ [ewlo, ewhi] = [184405/1e18, 184445/1e18]
      (kernel: ewlo·Ehi^28 ≤ 1 and 1 ≤ ewhi·Elo^28, both norm_num — 8s measured)
5. cos(π/8) ∈ [92387/1e5, 92388/1e5]  via cutCos_eighth_sq + cos(π/4)∈[7071/1e4,707107/1e6]
6. cos(2/3) ∈ [191/243−56/455625, 191/243+56/455625]  (banked cutCos_two_thirds_bounds)
7. massScale ∈ [Slo, Shi] = [ewlo·c8lo·(2/3)·c23lo, ewhi·c8hi·(2/3)·c23hi]
   ≈ [8.9259e-14, 8.9307e-14]  (true 8.9270e-14)  [nlinarith from positivity of each factor]
8. mass_k ∈ banked N340 brackets (mass0/1/2_lo/hi)
9. absMass_k = massScale · mass_k ∈ [Slo·mklo, Shi·mkhi]:
   absMass0 ∈ [5.0536e-13, 5.0563e-13]   (τ in M_oct units)
   absMass1 ∈ [1.4525e-16, 1.4551e-16]   (e  in M_oct units)
   absMass2 ∈ [3.0047e-14, 3.0066e-14]   (μ  in M_oct units)

## W8 TEETH
- ordering: 0 < absMass1 < absMass2 < absMass0 (banked absMass_order_12/20 + absMass1_pos) —
  RE-DERIVED free from the brackets (Slo·m1hi < Shi·m2lo etc. — check numerically).
- non-degenerate width: lo < hi strictly for each (each relwidth ~1e-3 > 0).
- ratio-consistency: the bracket ratios reproduce N340 — cite absMass_ratio_peg_invariant /
  the banked absolute ratio brackets absMass1/absMass2, absMass2/absMass0 already in AbsMass.

## COST / KILL (W9)
Crux measured: 4 obligations (2 big-power norm_num + 2 exp partial sums) compile in 8s TOTAL.
No maxHeartbeats inflation. If any single bracket exceeds ~60s → decompose into a banked sub-lemma
`.olean`. KILL: no monolithic tactic on a fully-expanded goal; each factor bracket is its own lemma.

## GRADE
THEOREM-EXACT (certified two-sided rational inequalities of the derived Cut, foundations-only).
NO measured mass in any statement/proof — the MeV comparison is removable prose only. Ground field
the derived Cut. Numerals are the STANDING PREDICTION (beyond-measurement digits deliverable).

## GROUNDING (not free-floating)
Every production TYPE mentions banked derived objects: absMass0/1/2, massScale, mass0/1/2,
ewClosureRatio, foldPhase, cutCos, cutExp, cutPi, UnitPeg. Imports: AbsoluteMassSpectrum,
UnitPeg, ScaleTowerLadder, CascadeFoldPhase, ContinuumBracket, NarrowedBracket7, ContinuumTrigEval.

## SUCCESSOR (ONE directed child — REPLACES generic SELECT)
M3 (SEED_MASSES §M3): THE CONFINEMENT SCALE NUMERAL — Λ = M·cutExp(−12π) certified bracket.
