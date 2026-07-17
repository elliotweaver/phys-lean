# PREREG — SpacetimeSurfaceGravity (discharge the two BH-metric hypotheses)

## TARGET
Build the reciprocal-derivative rule on the derived ℝ `Cut`, derive the Schwarzschild
metric-function derivative `f'(r)=2M/r²` for `f=1−2M·r⁻¹` (the inverse-square law READ OFF the
banked return-surface flux — solid angle cancels), and PROVE:
  · `metricF_horizon_zero`   — `f(2M)=0`  (the horizon radius `r_h=2M` is where f vanishes)
  · `surfaceGravity_eq`      — `κ_sg := f'(r_h)/2 = (4M)⁻¹`  at `r_h=2M`
  · re-home the banked N360/N361 results with the hypothesis DISCHARGED:
       `hawkingTemp (surfaceGravity M) = 1/(gravCouplingCoeff·M)`  (T_H=1/8πM, hyp gone)
       `bhArea` / `bhEntropy_eq_area_quarter` consuming the DERIVED `r_h=2M`.

This DISCHARGES the two explicit hypotheses `κ_sg=(4M)⁻¹` (N360 hawkingTemp_schwarzschild,
N361 bhEntropy_firstLaw_temp) and `r_h=2M` (N361 bhArea) that the whole BH-thermodynamics
sub-tower carries as "N360's childed metric remainder, NOT yet banked."

## ANTI-BULLSHIT GATE (full record in kanban comment 452)
- FOLD-CAUSAL: fold → return closes on 2-sphere (N328 gaussSphereSolidAngle=4π) → conserved
  source spreads over A(r)=solidAngle·r² → solid angle CANCELS ⇒ E∝r⁻² (probe4) → f=1−2M/r →
  f'=2M/r² (needs reciprocal-deriv rule, BUILT probe1/2) → κ_sg=f'(2M)/2=(4M)⁻¹ (probe3). Every
  arrow forced; the only missing link was the reciprocal derivative (Mathlib-absence → BUILD, W1.1).
- DISSOLUTION: field POSITS Schwarzschild + matches κ_sg; theory reads 1/r² off the fold's own
  return surface (solid-angle VALUE irrelevant to the exponent) — the SAME surface that fixed α*, 8πG.
- WORDS-REMOVABLE: delete gravity/horizon/black-hole/surface-gravity → pure statements over Cut:
  HasCutDerivAt (fun r=>r⁻¹) (−(x²)⁻¹) x for x≠0; HasCutDerivAt (fun r=>1−2M·r⁻¹) (2M·(r²)⁻¹) r;
  1−2M·(2M)⁻¹=0; (2M·((2M)²)⁻¹)/2=(4M)⁻¹.
- TEMPTATION named: extend f₄/e₆/arena track (QUIET DRIFT off N470; ρ_Λ FORBIDDEN). REJECTED.
- HONEST GRADE: r_h=2M is a theorem GIVEN f (f vanishes there); the full nonlinear interior metric
  stays childed (N349/N363); this node discharges the horizon-level hypotheses T_H and S=A/4 consume.

## GUARDS
- G1 no asserted value: (4M)⁻¹, 2M/r², r_h=2M all FALL OUT (reciprocal-deriv rule + field_simp/ring).
- G2 no empirical number: no measured M, no ℏ/G/c numerics; symbolic M anchor (G3).
- G3 scales vs ratios: M the single symbolic dimensionful anchor.
- G4 derived not posited: 1/r² from banked gaussSphereSolidAngle flux (probe4); κ_sg from the
  reciprocal-derivative rule I build; NOT axiomatized, NOT matched.
- G5 ℝ-vigilance: ALL over the derived ℝ `Cut`; reciprocal deriv from continuousAt_inv₀ +
  order-topology tendsto (banked instTopologicalSpaceCut/instOrderTopologyCut). NO Mathlib-ℝ /
  Real.pi / Real.inv as content. Mathlib topology/field = MACHINERY on the derived carrier.
- G6 foundations-only: probes all #print axioms ⊆ {propext,Classical.choice,Quot.sound}. No sorry,
  no native_decide, no heartbeat raise.
- FREE-FLOATING check: every production TYPE cites the banked Cut objects (HasCutDerivAt from N361,
  gaussSphereSolidAngle N328, hawkingTemp/hawkingPeriod N360, bhArea/bhEntropy N361,
  gravCouplingCoeff N359). NOT a generic calculus lemma — the reciprocal derivative is stated on Cut
  and IMMEDIATELY consumed by the metric-function derivative → surface gravity → T_H discharge.

## COST BUDGET / KILL (W9)
- All four probes ALREADY compile foundations-only EXIT 0 (reciprocal deriv, metric-fn deriv,
  surface-gravity algebra, flux-cancellation). Heaviest tactic: `field_simp; ring` on rational
  Cut identities + order-topology `Tendsto` congruence — LIGHT, no brute, no decide.
- KILL: if any single obligation exceeds default heartbeats, STOP and decompose. Not expected —
  the probes bound the cost; production is assembly of the four probes + re-home lemmas.
- Build: `lake build Phys.Algebra.SpacetimeSurfaceGravity` (LIGHT, imports N361 chain).

## FEASIBILITY PROBES (all EXIT 0, foundations-only)
- Probe1.lean: hasCutDerivAt_inv (reciprocal derivative on Cut)   ✅
- Probe2.lean: metricF_deriv (f'=2M/r²) via const_mul+neg congr    ✅
- Probe3.lean: surfaceGravity_at_horizon ((2M·((2M)²)⁻¹)/2=(4M)⁻¹) ✅
- Probe4.lean: invSquare_from_flux (solid angle cancels ⇒ 1/r²)     ✅
