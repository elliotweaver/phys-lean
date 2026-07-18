# M4 — THE SCALE-TOWER NUMERALS (SEED_MASSES §M4) — workbench note (t_61b0e5f9)

## SELECT (fresh worker) — CONFIRMED M4 theory-native
Trace fold → complex unit → CD cascade → octonion STOP → three edges (M=octonion ceiling,
v=electroweak, Λ=confinement) as rungs of ONE finite tower; the ONE 84π grammar budget quotiented by
derived dimensions fixes the rungs (28π/3, 12π). ALL THREE edges + ALL THREE band ratios are POWERS
of the ONE small-arg exponential cutExp(π/3), exponents 28 (M/v), 8 (v/Λ), 36 (M/Λ) — and they ADD
(28+8=36). The theory's next beat: exhibit the whole skeleton as ONE geometric ladder + the
composition tooth. Standard physics: 3 independent scales + hierarchy problem → DISSOLVED. Words-
removable, not free-floating (cites topBandRatio/confBandRatio/confinementScaleRatio/edges/way-points/
UnitPeg). Anti-bullshit gate PASS (full S1–S4 in kanban comment 473). Board order D→M→C→GR.

## WHAT WAS BANKED (Phys/Algebra/ScaleTowerNumerals.lean, namespace Phys.Algebra.TowerNumerals, C550, 14 audited decls)
- topBandRatio_eq_pow28 (★ M/v = topBandRatio = cutExp(π/3)^28, via topBandRatio_eq + cutExp_natMul).
- topBandRatio_bracket (★★★ M/v ∈ [54220·1e8, 54226·1e8] ≈ 5.422e12, via 28th-power).
- topBandRatio_pos (genuine positive derived scale ratio).
- tower_ratio_composition (★★★ topBandRatio·confBandRatio = confinementScaleRatio⁻¹ — the exact
  exponent-addition ladder 28+8=36 via pow_add; the ONE-ladder consistency, M/v · v/Λ = M/Λ).
- pegged_octEdge / pegged_ewEdge / pegged_confEdge (★ M,v,Λ against the M1 peg; M reads p.val).
- bandRatio_numerals (★★ the three band-ratio numerals collected: M/v new, v/Λ + M/Λ from M3).
- waypoints_free (★★★ 42, 448/27, 128/27, 1582/27, 190/3 re-emerge free over the SAME edges).
- tower_edges_ordered (★ W8: Λ<v<M edges), bandRatio_ordered_from_brackets (★ W8: M/v>v/Λ>1).
- tower_widths_positive (★ W8: each lo<hi), composition_nontrivial (★ W8: composed M/Λ > 23576·1e12).
- scaleTowerNumerals_landing (welded capstone, 6 blocks, non-hollow).

## GROUNDING (not free-floating)
Every TYPE cites banked derived objects over Cut: topBandRatio, confBandRatio, confinementScaleRatio,
octEdgeScale, ewEdgeScale, confEdgeScale, chargeTraceDepth, bandScreen, invAlphaZero, derivedBandList,
cutExp, cutPi, UnitPeg. Imports: ConfinementScaleNumeral, BandEdgeList, LeptonMassNumerals, UnitPeg,
ContinuumBracket, ContinuumTrigEval.

## THE ONE-PEG LAW (cited, not duplicated)
All edge scales are pure dimensionless ratios to M_oct := 1; brackets on those ratios. The M1 UnitPeg
only converts to a human unit (pegged_octEdge/ewEdge/confEdge). NO second dimensionful input.

## GRADE
THEOREM-EXACT (certified two-sided rational inequalities + exact identities of the derived Cut,
foundations-only ⊆ {propext,Classical.choice,Quot.sound}). NO measured scale (M_Planck/v/Λ_QCD/GeV) in
any statement/proof — comparison is removable prose; beyond-measurement digits are the STANDING
PREDICTION.

## COST (W9 — no risk)
Crux measured before build (workbench/M4-scale-tower-numeral/Probe.lean): 28th-power norm_num
reciprocal bracket compiles in 8.1s. Full module 6.0s (lake replay). No maxHeartbeats inflation, no
monolithic brute; each bracket its own lemma. Route mirrors M2/M3's cutExp_natMul small-arg-power
template.

## CARRIED NOTE
Deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M5 (SEED_MASSES §M5): THE HEAVY QUARK SECTOR — certified brackets for the heavy-sector
masses from the banked Z3 texture ratios + D's ratio numerals × the derived anchors.
