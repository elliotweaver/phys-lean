# PREREG — ReturnSurfaceFieldLaw (SELECT node, generic frontier)

## TARGET
The fold's return-surface field law: Gauss flux-conservation (`E·A = source`, r-independent),
the derived potential `Φ = source·r⁻¹` with `Φ'=−E`, the weak-field correspondence
`metricF = 1 − 2·Φ`, and the ★9 FIELD-LEVEL WELD — gauge and gravity obey the SAME
return-surface `1/r²` law + SAME Gauss conservation, couplings both submultiples of `azimuthalTurn`.

## FRONT (theory-native, S2/S4 in the ticket thread)
The surface-gravity node built `hasCutDerivAt_inv` + `invSquare_from_flux` and used them ONLY for
the black hole. The return surface's OWN un-mined content is its conservation geometry: a conserved
source's total flux through EVERY return surface is the same (= the source), because area = 4π·r²
and the field falls as 1/r². Both gauge (α*, `criticalPhaseNumerator = azimuthalTurn·42`, N359) and
gravity (8πG, `gravCouplingCoeff = azimuthalTurn·4`, N359) source static fields on the SAME surface.

## BANKED OBJECTS TO CITE (all reachable by `import Phys.Algebra.SpacetimeSurfaceGravity`)
- `gaussSphereSolidAngle`, `gaussSphereSolidAngle_pos`, `gaussSphereSolidAngle_eq` (N328, ContinuumSphereFlux)
- `azimuthalTurn` (= 2·cutPi, ContinuumSphereFlux)
- `invSquare_from_flux (M r) (hr:r≠0) : (gss·M)/(gss·r²) = M·(r²)⁻¹`  (surface-gravity, source-general re-home)
- `hasCutDerivAt_inv (x) (hx:x≠0) : HasCutDerivAt (·⁻¹) (−(x²)⁻¹) x`   (surface-gravity)
- `hasCutDerivAt_const_mul (c) (h) : HasCutDerivAt (c·f) (c·f')`        (BlackHoleEntropy)
- `HasCutDerivAt` def (BlackHoleEntropy)
- `metricF (M r) := 1 − 2·M·r⁻¹`, `metricF_hasDerivAt`                  (surface-gravity)
- `gravCouplingCoeff`, `gravCouplingCoeff_azimuthal` (= azimuthalTurn·4, N359)
- `criticalPhaseNumerator`, `numerator_azimuthal` (= azimuthalTurn·42, N359)
- `gravAndGauge_share_azimuthalTurn` (N359 — the coupling-level cross-lock, to be lifted to field level)

## DERIVATION PLAN (theorems, over derived ℝ Cut)
1. `returnArea (r) := gaussSphereSolidAngle * r^2`  (def) + `returnArea_pos`.
2. `fieldStrength (s r) := s * (r^2)⁻¹`  (def, the 1/r² density) — via `invSquare_from_flux` it IS
   `(gss·s)/(gss·r²)`, source-general.
3. ★★ `gauss_flux_conservation (s r) (hr:r≠0) : fieldStrength s r * returnArea r = gaussSphereSolidAngle * s`
   — the total flux through EVERY return surface = the source (r cancels). THE load-bearing new fact.
4. `fieldStrength_from_flux` : fieldStrength = the flux-density reading of `invSquare_from_flux`.
5. `potential (s r) := s * r⁻¹`  (def) + `potential_hasDerivAt : Φ'(r) = −fieldStrength s r`
   (= `−s·(r²)⁻¹`), via `hasCutDerivAt_inv` + `hasCutDerivAt_const_mul` (+ neg congruence, mirror of
   `metricF_hasDerivAt`).
6. ★ `metricF_eq_one_sub_two_potential (M r) : metricF M r = 1 − 2 · potential M r` — the derived
   Schwarzschild metric fn IS 1 minus twice the Newtonian potential (weak-field correspondence, derived).
7. ★★★ `field_law_gauge_gravity_weld` — BOTH the gauge coupling `criticalPhaseNumerator` and the
   gravity coupling `gravCouplingCoeff` are submultiples of `azimuthalTurn` (42-count / 4-count), AND
   both static sources obey the SAME `fieldStrength`/`gauss_flux_conservation` return-surface geometry;
   the cross-lock `criticalPhaseNumerator·4 = gravCouplingCoeff·42` (from N359) is the coupling-level
   shadow of the ONE field-level return surface. Statable from no single conjunct alone.
8. Capstone `return_surface_field_law` welding all + the return-surface anchor.

## W8 NON-VACUITY TEETH
- `gauss_flux_ne_wrong` : flux = `gss·s`, NOT `gss·s·2` (r-independence + coefficient load-bearing) for s≠0.
- `fieldStrength_bites` : the field genuinely falls (fieldStrength s r ≠ fieldStrength s (2r)) for s≠0, r≠0.
- `weld_counts_distinct` : the gauge count 42 ≠ the gravity count 4 (the two couplings genuinely
   distinct submultiples — the weld is not vacuous identification).
- `potential_deriv_ne_zero` : Φ'≠0 (the field bites).

## COST BUDGET / KILL (W9)
All targets are field-arithmetic (`field_simp`/`ring`) + two `HasCutDerivAt` reuses (const_mul + neg
congruence, EXACTLY mirroring `metricF_hasDerivAt` which compiles ~1s). NO coordinate blowup, NO
octonion ring, NO native_decide, NO maxHeartbeats raise. KILL: if any single obligation exceeds ~60s
or the whole olean exceeds ~30s, STOP and measure/decompose (W9). Expected LIGHT (~8s, like surfgrav).

## GRADE / GUARDS
- G1 no asserted value: `1/r²`, flux=`gss·s`, the counts 42/4 all FALL OUT of banked identities.
- G2 no empirical number: no charge/G/ε₀/measured mass; source symbolic; measured-force comparison
  removable prose only.
- G3 scales vs ratios: `s`, `M` symbolic dimensionful anchors; flux/potential homogeneous.
- G4 derived not posited: field/flux/potential from `invSquare_from_flux`/`hasCutDerivAt_inv`; counts
  from `numerator_azimuthal`/`gravCouplingCoeff_azimuthal`. No Mathlib-ℝ content.
- G5 physics-words-removable: delete Gauss/Coulomb/Newton/charge/mass/field/gravity → pure Cut
  arithmetic + Cut calculus on the banked return surface.
- G6 foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`.
- FREE-FLOATING rail: every TYPE cites `gaussSphereSolidAngle`/`invSquare_from_flux`/`metricF`/
  `gravCouplingCoeff`/`criticalPhaseNumerator` over Cut — the GR/gauge return-surface anchor, NOT generic.

## HONEST GRADE CAP
STATIC/weak-field return-surface field law. Does NOT derive full Maxwell dynamics or the full
nonlinear Einstein field equation (childed N349/E2). The ★9 weld is FIELD-LEVEL (same 1/r² geometry +
same conservation + couplings both azimuthalTurn submultiples), advancing ★9 [open]→[partial].
