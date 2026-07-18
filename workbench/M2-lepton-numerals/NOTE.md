# M2 — THE LEPTON MASS NUMERALS (SEED_MASSES §M2) — workbench note (t_8bb8fffb)

## SELECT (fresh worker) — CONFIRMED M2 theory-native
Trace fold → complex unit → CD cascade → octonion stop → n=9 EW rung ewClosureRatio=cutExp(−28π/3)
→ fold-phase cos(π/8) (N416) → survival 2/3 (N408) → ℝ-descent cos(2/3) (N309) → massScale (N417);
N340 gives mass_k. absMass_k = massScale·mass_k. Every arrow forced. Words-removable: a certified
bracket on a specific derived Cut. Not free-floating. No textbook analogue. Anti-bullshit gate PASS.

## WHAT WAS BANKED (Phys/Algebra/LeptonMassNumerals.lean, namespace Phys.Algebra.LeptonNumerals, C548, 13 audited decls)
- cutExp_natMul (helper: cutExp(n·x)=cutExp x^n).
- arg_bracket, partialExp_arg_lo, partialExp_arg_hi, cutExp_pi3_bracket
    (★ cutExp(π/3) ∈ [284965/1e5, 284966/1e5] via D1 + monotonicity).
- ewClosureRatio_as_inv_pow, ewClosureRatio_bracket
    (★★ ewClosureRatio ∈ [184405/1e18, 184445/1e18] ≈ 1.844e-13, via the 28th-power reciprocal).
- cutCos_quarter_bracket, cutCos_eighth_bracket (★ cos(π/8) ∈ [92387/1e5, 92388/1e5]).
- survival_two_thirds, massScale_bracket (★★ massScale ∈ [Slo, Shi] ≈ [8.926e-14, 8.931e-14]).
- absMass0_bracket (★★ ∈ [50535/1e17, 50565/1e17] ≈ 5.054e-13, τ, M_oct units).
- absMass1_bracket (★★ ∈ [14525/1e20, 14552/1e20] ≈ 1.454e-16, electron).
- absMass2_bracket (★★ ∈ [30047/1e18, 30066/1e18] ≈ 3.006e-14, muon).
- absMass_ordered_from_brackets (★ W8: 0<absMass1<absMass2<absMass0 re-derived from the numerals).
- absMass_widths_positive (★ W8: each lo<hi strictly).
- absMass_ratios_reproduce_N340 (★ ratios reproduce N340 exactly — massScale cancels).
- pegged_absMass0_bracket (★ under any M1 UnitPeg the numeral scales by the one positive peg).
- leptonNumerals_landing (welded capstone, 5 blocks, non-hollow).

## GROUNDING (not free-floating)
Every TYPE cites banked derived objects over Cut: absMass0/1/2, massScale, mass0/1/2,
ewClosureRatio, foldPhase, cutCos, cutExp, cutPi, UnitPeg. Imports: AbsoluteMassSpectrum, UnitPeg,
ScaleTowerLadder, CascadeFoldPhase, NarrowedBracket7, ContinuumBracket, ContinuumTrigEval.

## THE ONE-PEG LAW (cited, not duplicated)
absMass_k are pure dimensionless ratios to M_oct := 1; the brackets are on that ratio. The M1
UnitPeg only converts to a human unit (pegged_absMass0_bracket). NO second dimensionful input.

## GRADE
THEOREM-EXACT (certified two-sided rational inequalities of the derived Cut, foundations-only ⊆
{propext,Classical.choice,Quot.sound}). NO measured mass in any statement/proof — the MeV comparison
is removable prose; the beyond-measurement digits are the STANDING PREDICTION.

## COST (W9 — no risk)
Crux measured before build: 28th-power norm_num + exp partial sums compile in 8s total. Full module
17s. No maxHeartbeats inflation, no monolithic brute; each factor bracket is its own lemma.

## CARRIED NOTE
Deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M3 (SEED_MASSES §M3): THE CONFINEMENT SCALE NUMERAL — Λ = M·cutExp(−12π) certified
bracket against the peg; v/Λ and M/Λ ratios reproduced (the banked 128/27 band must re-emerge free).
