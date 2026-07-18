# M7 — THE CROSS-CHECK WEB (SEED_MASSES §M7) — workbench note (t_9a43008b)

## SELECT (fresh worker) — CONFIRMED M7 theory-native (kanban comment 477)
The fold generates ONE derived tower; M2–M6 read that tower along DIFFERENT independent paths
(lepton scale, confinement rung, scale-tower edges, fold-phase Born weight, N340 texture). Single
unbroken origin ⟹ the readings MUST agree numerically. The SM's ~20 independent free parameters make
such a cross-sector web impossible to even state; the theory DISSOLVES that independence — the web
closes as a theorem. "One cause, many terminations" made NUMERICAL. Anti-bullshit gate PASS (full
S1–S4 in comment 477). Board order D→M→C→GR.

## WHAT WAS BANKED (Phys/Algebra/CrossCheckWeb.lean, namespace Phys.Algebra.CrossCheckWeb, C553, 10 audited decls)
- koide_overconstraint (★★★ the three INDEPENDENTLY-bracketed relative Born squares mass0/mass1/mass2
  bound the sum, while the exact Koide total is mass0+mass1+mass2=6).
- koide_bracket_straddles_6 (★★ Σlo<6<Σhi genuine straddle, ≈5.99995 < 6 < ≈6.00002, by norm_num).
- waypoints_from_bracketed_edges (★★★ the SAME edges carry BOTH a numeric bracket AND an exact
  way-point: topBandRatio∈[54220e8,54226e8] ∧ bandScreen=448/27; confBandRatio∈[4347,4350] ∧
  bandScreen=128/27; the three scalars 42, 1582/27, 190/3 — from M4 waypoints_free + M3/M4 brackets).
- confBandRatio_triple_reading (★★★ the cross-sector spine: v/Λ=confBandRatio brackets [4347,4350] AND
  screens 128/27 AND = downConfBundle/mbRatioDerived — scale-tower + coupling + quark sectors, one object).
- lightPlacement_ratio_reproduces_N340 (★★ light placements ratioed reproduce N340 m_d/m_s∈[483/1e5,485/1e5];
  downConfBundle cancels; via massRatio_1_2 × downConfBundle_pos + nlinarith).
- absLepton_ratio_web (★★ the absolute lepton masses reproduce N340 relative ratios exactly, massScale cancels).
- waypoint_edge_widths_positive, waypoints_distinct (★ W8: widths lo<hi; 448/27≠128/27).
- web_peg_invariant (★ ONE-PEG LAW: the whole web peg-invariant via ratio_peg_invariant, NO dimensionful input).
- crossCheckWeb_landing (welded capstone, 9 blocks, non-hollow).

## GROUNDING (not free-floating)
Every TYPE cites banked derived objects over Cut: mass0/1/2, topBandRatio, confBandRatio, downConfBundle,
mbRatioDerived, absMass0/1/2, bandScreen, chargeTraceDepth, invAlphaZero, derivedBandList, lightBand*,
the M1 UnitPeg. Imports: LightQuarkNumerals, ScaleTowerNumerals, UnitPeg, Mathlib.Tactic.
opens needed: AbsMass (name resolution for absMass1/absMass0 in absLepton_ratio_web's type),
UpDownRelativeScaleFoldPhase + QuarkHadronTower (mbRatioDerived), TowerNumerals/ConfNumeral/BandEdgeList.

## THE ONE-PEG LAW (cited, not duplicated)
All cross-checks are pure DIMENSIONLESS statements; the web is peg-free (web_peg_invariant), so NO
dimensionful input enters at all. NO second dimensionful input.

## GRADE (honest, all FREE)
THEOREM-EXACT: every cross-check is an exact two-sided rational inequality or exact identity of the
derived Cut, foundations-only, consuming ONLY banked M2–M6 brackets + banked exact way-points — NO new
derivation, NO new crux. No miss found → NO suspect-band child (SEED_MASSES §M7). NO measured value in
any statement/proof — comparison prose only.

## COST (W9 — no risk)
Crux measured before build (workbench/M7-cross-check/Probe.lean): Koide straddle norm_num +
light-placement-ratio nlinarith + confBandRatio triple, 12s standalone. Full module 22s (lake build,
incl deps). No maxHeartbeats inflation, no monolithic brute. Reused banked M2–M6 brackets + M4
waypoints_free (no new cutExp/cutCos/pow crux).

## CARRIED NOTE
Deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M8 (SEED_MASSES §M8, TERMINAL, t_9a6e064c): AIRTIGHT CAPSTONE + HANDOFF — one derived
object bundling M1–M7, the grade ledger UPGRADED (per-row honest), NO-RESIDUAL attestation (every
M2–M6 numeral target met; honest residuals named — M5 within-sector individual quark ratios
route-not-yet-found, M6 placement identification hypothesis-carrying), #print axioms clean. Bundle the
landing capstones leptonNumerals_landing / confinementScaleNumeral_landing / scaleTowerNumerals_landing
/ heavyQuarkNumerals_landing / lightQuarkNumerals_landing / crossCheckWeb_landing. THEN hand exactly
ONE directed successor toward docs/SEED_MIXING.md target C1 (arc C — THE MIXING). Do NOT hand GR1/D7/
a generic SELECT.
