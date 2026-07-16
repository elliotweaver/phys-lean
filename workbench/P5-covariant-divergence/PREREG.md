# PREREG — N### (arc-P P5): THE COVARIANT DIVERGENCE ∇^μ G_μν = 0 AT THE DERIVATIVE LAYER

## TARGET (SEED_FINAL_RECKONING §P5, J-P5)
Assemble the DERIVATIVE-layer content of the covariant divergence of the Einstein field, close
the ½-coefficient RIGIDITY that makes G_μν the unique consistent source coupling (retiring E2's
Lovelock uniqueness import to a DERIVED theorem), on the banked derived-ℝ carrier
`MetricEnd = Module.End Cut STVC`.

## FRONT (theory-native, from S2/S4)
- N356 proved: metric term `½R·id` BRACKET-INERT (`einstein_covTransport_eq_ricci`); naive scalar
  divergence IDENTICALLY BLIND (`divFiberTrace_blind`). So the WHOLE conservation content of the
  trace-reversal lives in the DERIVATIVE layer `D_k(½R)·id`. BUILD it (J-P5).
- The full covariant derivative of the Einstein field splits:
    `∇_k(Ric − ½R·id) = ∇_k Ric − ½(D_k R)·id`
  (derivative face; the metric term's bracket face is inert by N356, its derivative face is the
  scalar gradient). The `½` is the UNIQUE coefficient making it a consistent source coupling.
- Lovelock uniqueness → DERIVED rigidity: N358's 2-plane independence + the trace-reversal
  coefficient rigidity here (distinct c ⇒ distinct derivative-layer object).

## SCOPE (W3 / no-deferral §2 — a within-P payment split, NOT a forward defer)
THIS node (P5) banks:
  - the scalar-times-operator derivative rule `scalarOpDeriv` (grounds the metric-term derivative);
  - the metric-term derivative `metricTerm_opDeriv` (½R·id derivative = ½(dR)·id);
  - the id covariant-constancy at BOTH layers (bracket-inert N356 + constant-field derivative);
  - the EINSTEIN-FIELD SPLIT `einsteinField_covDeriv` (grounded in banked ricciRaiseMap/ricciScalar);
  - the ½-coefficient RIGIDITY `traceReversal_coeff_rigid` (Lovelock uniqueness → derived rigidity);
  - non-vacuity teeth (a concrete nonzero scalar gradient; the ½ genuinely distinguishes coeffs).
Single directed successor P5b (WITHIN arc P): the SOLDERED twice-contracted Bianchi
`∇^μ Ric_μν = ½ ∇_ν R` that closes the literal vanishing (the naive fiber-trace divergence is
blind — N356/N358 — so it needs a soldered-divergence contraction, genuine unbanked machinery,
mirroring N352's soldered Ricci).

## MEASURE-FIRST (W9) — DONE, all EXIT 0
- probe1 `scalarOp_opderiv` (scalar family × const op) — PASS
- probe2 `affine_scalar_deriv`, `id_covDeriv_zero`, `metricTerm_opderiv` — PASS
- probe3 `opderiv_neg/opderiv_sub` (banked N351) + `einstein_field_opderiv` split (grounded model) — PASS
- probe4 `genEinsteinRaiseMap` + grounded `genEinstein_field_opderiv` + `traceReversal_coeff_rigid` — PASS
Whole-file `lake env lean` per probe ~17s cold. COST BUDGET: KILL any single obligation at 90s
whole-file; production whole-file expected <20s. All light (no coordinate bash, no decide, no
heartbeat raise).

## BANKED OBJECTS USED (unbroken)
- N350 `HasOpDerivAt0`, `hasOpDerivAt0_iff`, `const_opderiv`, `opderiv_add`, `affine_opderiv`,
  `opderiv_unique`, `lbConn_offDiagVar_ne_zero`
- N351 `opderiv_neg`, `opderiv_sub`
- N356 `covTransport`, `metric_covTransport_zero`, `einstein_covTransport_eq_ricci`
- N354 `einsteinRaiseMap`, `ricciRaiseMap` (N353), `ricciScalar`, `einstein_traceReversal`,
  `einsteinTraceReversalCoeff` (N359)
- N41g/ContinuumExpDeriv `CutHasDerivAt`, `CutHasDerivAt.const_mul`, `cutHasDerivAt_const`
- N359 `einsteinTraceReversalCoeff = 2⁻¹`

## GUARDS
- G1 no asserted value (the split, the ½, fall out of banked objects + the derivative rules)
- G2 no empirical number
- G3 DERIVED not posited (Lovelock uniqueness → derived rigidity; the ½ from the banked
  trace-reversal coefficient)
- G4 physics-words-removable (pure derived-ℝ operator-derivative algebra)
- G5 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; NO Mathlib-ℝ/ℂ as content
  (ground field derived Cut; banked ricciScalar/ricciRaiseMap/einsteinRaiseMap; CutHasDerivAt is
  the banked bare Tendsto over Cut, NEVER Real.deriv/HasDerivAt as content)
- W8 non-vacuity: next Cid C455
- W4.5 SUFFICIENCY: derive exactly P5 (derivative-layer assembly + ½ rigidity), NOT P5b's soldered
  vanishing, NOT P6.

## MODULE
`Phys/Algebra/SpacetimeCovariantDivergence.lean` (ns Phys.Algebra). ONE commit; import into BOTH
Phys.lean AND Audits/AxiomAudit.lean. Costume C455.
