# M4 — THE SCALE-TOWER NUMERALS (SEED_MASSES §M4) — PREREG (t_61b0e5f9)

## SELECT: CONFIRMED M4 theory-native (full S1–S4 in kanban comment 473)
The whole dimensionful skeleton is ONE geometric ladder in the small-arg exponential cutExp(π/3):
  M/v = topBandRatio = cutExp(π/3)^28,  v/Λ = confBandRatio = cutExp(π/3)^8,  M/Λ = cutExp(π/3)^36,
the exponents ADD (28+8=36). Standard physics: 3 independent scales + hierarchy problem. Theory:
one ladder, hierarchy = exponent. The composition tooth (M/v·v/Λ=M/Λ) IS the "one pipeline".

## TARGET (deliverable, over the banked derived Cut + M1 peg)
1. topBandRatio_eq_pow28: topBandRatio = cutExp(π/3)^28  (M/v reciprocal-power form).
2. ★★★ topBandRatio_bracket: M/v = topBandRatio ∈ [54220·1e8, 54226·1e8]  (the NEW numeral).
   - crux measured 8.1s in workbench/Probe.lean (28th-power reciprocal, norm_num) — W9-safe.
   - cross-checks against reciprocal of M2 ewClosureRatio bracket (verify.py).
3. THE FULL SKELETON assembled (edges pegged, ratios as dimensionless numerals):
   - octEdgeScale=M=1 (peg reads p.val), ewEdgeScale=v (M2 bracket), confEdgeScale=Λ (M3 bracket)
   - band ratios: M/v NEW, v/Λ (M3 confBandRatio_bracket), M/Λ (M3 invConfinementScaleRatio_bracket)
4. ★ tower_ratio_composition: topBandRatio * confBandRatio = confinementScaleRatio⁻¹
   (cutExp(π/3)^28 · cutExp(π/3)^8 = cutExp(π/3)^36 = M/Λ — the ONE-ladder consistency, EXACT).
5. WAY-POINTS FREE: 42 (invAlphaZero_nil), 448/27 (bandScreen_topBand_exact), 128/27
   (bandScreen_conf_exact), 1582/27 (invAlphaZero_topBand_value), 190/3 (derivedBandList_assembly) —
   all banked exact rationals over the SAME edges the M4 brackets pin; reproduced free.
6. PEGGED edges: p.human octEdgeScale = p.val (M); p.human ewEdgeScale ∈ [p.val·184405/1e18, ...];
   p.human confEdgeScale ∈ [p.val·42408/1e21, ...]  (M,v,Λ against the M1 peg, ONE-PEG LAW).
7. W8 teeth: edge ordering Λ<v<M (edges_ordered); ratio ordering topBand>confBand>1;
   non-degenerate widths; composition non-trivial (topBandRatio·confBandRatio > 1).

## BANKED PIECES (cite, do not re-derive)
- topBandRatio, topBandRatio_eq (FineStructureZeroMomentum): cutExp(28π/3)
- cutExp_natMul, cutExp_pi3_bracket, ewClosureRatio_bracket (LeptonNumerals/M2)
- confinementScaleRatio_bracket, confBandRatio_bracket, confBandRatio_eq_pow8,
  invConfinementScaleRatio_bracket, invConfinementScaleRatio_eq_pow36 (ConfNumeral/M3)
- octEdgeScale/ewEdgeScale/confEdgeScale, edges_ordered, derivedBandList_assembly,
  invAlphaZero_topBand_value, invAlphaZero_nil, bandScreen_topBand_exact, bandScreen_conf_exact
  (BandEdgeList/Z4)
- UnitPeg, UnitPeg.human, peg_fixes_Moct (Peg/M1)

## DISCIPLINE
- Module Phys/Algebra/ScaleTowerNumerals.lean, namespace Phys.Algebra.TowerNumerals (both FREE).
- Foundations-only ⊆ {propext,Classical.choice,Quot.sound}; NO sorry/axiom/native_decide/floats.
- Ground field the DERIVED Cut; NO Mathlib-ℝ as content; NEVER Phys/OneAxiom/*.
- ONE-PEG LAW: cite M1 UnitPeg only; NO second dimensionful input.
- G2: no measured M_Planck/v/Λ_QCD/GeV in any statement or proof (removable prose only); no bracket
  depth chosen by a measured value; beyond-measurement digits are the standing prediction.
- Words-removable: delete mass/scale/hierarchy/edge/peg → pure Cut inequalities + the exponent-ladder
  identity survive.
- New costume C550 (bites 1=550), AxiomAudit import+block appended, LEDGER row, gate-fast D0–D6.
- ONE directed successor → M5 (SEED_MASSES §M5, THE HEAVY QUARK SECTOR). NO generic SELECT.

## CARRIED NOTE
deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.
