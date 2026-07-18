# M6 — THE LIGHT QUARK SECTOR (SEED_MASSES §M6) — workbench note (t_a4eb6352)

## SELECT (fresh worker) — CONFIRMED M6 theory-native (kanban comment 476)
Trace fold → CD cascade → cycle amplitudes (N307) at δ_B=2/9 → Born-square masses (N340) →
line-independence (phase_no_deviation) forces the SAME shape on the quark generation line → within-
sector light splittings = banked lepton numerals; confinement weld (arc-I/X9) gives the floor →
light-band edge = downConfBundle·bMass2. Standard physics: light quark masses = FREE Yukawa couplings,
the LEAST-constrained SM corner ("the light quarks are hopeless"). DISSOLVED: within-sector shape =
lepton descent (line-indep, zero free shape), placement = M5 offset × N340 texture eigenvalue. Anti-
bullshit gate PASS (full S1–S4 in comment 476). Board order D→M→C→GR.

## WHAT WAS BANKED (Phys/Algebra/LightQuarkNumerals.lean, namespace Phys.Algebra.LightQuarkNumerals, C552, 15 audited decls)
- lightBandStrange_bracket (★★★ downConfBundle·bMass 2 ∈ [49/2, 1227/50] ≈ 24.52, the strange placement
  relative to the confinement floor squared = M5 offset × N340 middle texture, via mul_le_mul).
- lightBandStrange_pos, lightBandStrange_eq_edgeLight (★★ re-export of banked edgeLight_pinned,
  hypothesis-carrying — the identification with the physical light-band edge; NOT a bridge).
- lightBandDown_bracket (★★★ downConfBundle·bMass 1 ∈ [118/1000, 119/1000] ≈ 0.1185), lightBandDown_pos.
- invLightBandStrange_bracket (★★ 1/lightBandStrange ∈ [407/1e4, 409/1e4] ≈ 0.0408, one_div_le_one_div_of_le).
- withinSector_down_strange (★★ m_d/m_s ∈ [483/1e5, 485/1e5] at any Md≠0, from withinSector_ratio_12),
  withinSector_strange_bottom (★★ m_s/m_b ∈ [594/1e4, 595/1e4], from withinSector_ratio_20) — the banked
  N340 lepton descent, line-independent (zero free shape).
- lightQuark_numerals (★★ the three placement numerals collected).
- lightBand_ordered_from_brackets (★ W8: lightBandDown < lightBandStrange), lightBand_straddles_floor
  (★★ W8: lightBandDown < 1 < lightBandStrange — the floor separates the two light quarks),
  lightBandStrange_lt_downConfBundle (★ W8: < downConfBundle), lightQuark_widths_positive (★ W8: lo<hi).
- pegged_lightBandStrange_bracket (★ ONE-PEG LAW: p.human lightBandStrange scaled by the SINGLE peg).
- lightQuarkNumerals_landing (welded capstone, 7 blocks, non-hollow).

## GROUNDING (not free-floating)
Every TYPE cites banked derived objects over Cut: downConfBundle, bMass, mass1/mass2, sectorMass,
edgeLight, the M1 UnitPeg. Imports: HeavyQuarkNumerals, FreezeoutEdgeCrossSectorReduction, UnitPeg.
opens needed: UpDownRelativeScaleFoldPhase + QuarkHadronTower (name resolution for mbRatioDerived/confBundle
in edgeLight_pinned's type).

## THE ONE-PEG LAW (cited, not duplicated)
All light-sector placements/ratios are pure dimensionless ratios to M_oct := 1. The M1 UnitPeg only
converts to a human unit (pegged_lightBandStrange_bracket). NO second dimensionful input.

## GRADE (honest, per SEED_MASSES §M6 HIDDEN-JOINT)
THEOREM-EXACT: the within-sector light splittings are banked N340 numerals (discharge real — line-
independence rung phase_no_deviation forces quark within shape = lepton descent). The light-band
placement lightBandStrange = downConfBundle·bMass 2 is a theorem-exact bracket of a determined derived
Cut; its IDENTIFICATION with the physical light-band edge edgeLight Md (Mλ²) carries the two relative-
scale HYPOTHESES of the banked edgeLight_pinned, re-exported as lightBandStrange_eq_edgeLight (both
premises banked/derived objects, NOT a bridge). NO measured light-quark mass in any statement/proof —
comparison prose only; beyond-measurement digits are the STANDING PREDICTION.

## COST (W9 — no risk)
Crux measured before build (workbench/M6-light-quark/Probe.lean): 3 product brackets + reciprocal
compile in 22.9s wall / 7.3s user; each product bracket its own lemma via mul_le_mul/norm_num/linarith.
Full module 10s (lake build). No maxHeartbeats inflation, no monolithic brute. Route reuses the M5
downConfBundle_bracket + the N340 mass1_lo/mass2_lo (no new cutExp/cutCos crux).

## CARRIED NOTE
Deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M7 (SEED_MASSES §M7): THE CROSS-CHECK WEB (free, never targeted) — every dimensionless
ratio recomputable from the M2–M6 brackets lands inside its banked derived bracket (Koide from the
evaluated masses; the band ratios from the evaluated edges; the way-points from the evaluated tower) —
the overconstraint proof at numeral grade, all FREE. Any miss = a band's derivation is the suspect →
child node.
