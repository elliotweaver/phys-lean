# N359 — arc-E E3: the gravitational coupling coefficient κ = 2·4π·G DERIVED, both factors homed

## SELECT (theory-native FIRST, fresh worker — QUIET DRIFT + ANTI-BULLSHIT gate)

The ticket points at E3: κ = 2·4π·G. I asked the theory-native question FIRST, not the ticket's framing.

**Standard version (what the field does):** κ = 8πG is POSITED / fixed by MATCHING the Newtonian
limit — a weak-field Christoffel/Ricci computation (R_00 = ∇²Φ) + Poisson (∇²Φ = 4πGρ). The `8π` is a
matched normalization; the `2` is folded in by the trace-reversal of the source in the Newtonian limit.

**What the theory DOES (the moat):**
- The `4π` is NOT matched — it is the DERIVED Gauss-sphere flux `gaussSphereSolidAngle = 4·cutPi`
  (N328), built from the derived Born-circle azimuthal turn `azimuthalTurn = 2·cutPi` × the derived
  meridian flux `2`. REUSE it (SEED §E3: "if B already built the flux measure, E3 is cheap").
- **★ THE SHARED HIDDEN JOINT / MOAT (arc-A cross-tie).** The SAME derived `azimuthalTurn` (2·cutPi)
  that builds gravity's flux `4π = azimuthalTurn·2` ALSO builds the gauge-coupling numerator
  `84π = azimuthalTurn·42` (N329 `criticalPhaseNumerator`). Gravity's `4π` normalization and the
  fine-structure `α*=1/42` normalization share ONE derived object: the Born-circle turn. This is the
  cross-tie the SEED flags ("the SAME 4π object that normalized α*").
- **★ THE `2` — CAREFUL MEASUREMENT (the ticket's explicit warning).** The `2` in `8π = 2·4π` is the
  RECIPROCAL of the trace-reversal COEFFICIENT `½` — the `2⁻¹` in the banked `einstein_traceReversal`
  (N354: `einsteinScalar G = R − 2⁻¹·finrank·R`). That `½` is the spin-2 trace-reversal
  (h̄_μν = h_μν − ½h g_μν), FORCED by conservation (N356 contracted-Bianchi / divergence structure:
  `Ric − c·R·g` conserved ⟺ c = ½), and is DIMENSION-INDEPENDENT. It is CAREFULLY DISTINCT from the
  dimension-dependent trace-VALUE `(1 − ½·finrank) = −4` (N354 `einstein_traceReversal_value`, at
  finrank=10). Homing the `2` to `(½)⁻¹` is correct; homing it to the trace-value `−4` would be WRONG.
  I PROVE the distinction (`kappa_two_ne_traceValue`: 2 ≠ −4) — the careful measurement is load-bearing.
- G stays the SYMBOLIC dimensionful anchor (scale tower keeps G symbolic; G3). The Lean CONTENT is the
  DIMENSIONLESS coefficient `gravCouplingCoeff = 8·cutPi` (= κ/G). No fabricated `G : Cut`.

**Temptations named + rejected:**
- (a) grind the weak-field Newtonian limit R_00 = ∇²Φ → 8πG. REJECTED: needs the coordinate-varying-
  field second-derivative computation N358 flagged STRUCTURALLY BLOCKED (curvature scalars constant on
  the fixed solderWit gradient); and it is the standard grind, not theory-native. The matching layer
  is leading-order — flagged + childed, NOT built here.
- (b) assert κ = 8πG. REJECTED (G1).
- (c) home the `2` to the dimension-dependent trace-VALUE `−4`. REJECTED as WRONG — the careful
  measurement: the κ-factor `2` is the trace-reversal-COEFFICIENT reciprocal `(½)⁻¹`, dimension-
  independent, NOT the trace-value. Proved distinct (kappa_two_ne_traceValue).
- (d) generic "define a coupling, prove positivity". REJECTED (free-floating); the content is the two
  HOMED factors (banked flux + banked trace-reversal coefficient) + the moat cross-tie.

**Genuinely different / the moat:** the coefficient `8π` FALLS OUT of banked derived objects (the flux
`4π` × the trace-reversal reciprocal `2`), and its `4π` SHARES the derived Born-circle turn with the
gauge numerator — gravity and the gauge coupling normalized by the one derived `azimuthalTurn`.

## THE OBJECTS (Phys/Algebra/SpacetimeGravitationalCoupling.lean, ns Phys.Algebra)

- `einsteinTraceReversalCoeff : Cut := 2⁻¹` — the spin-2 trace-reversal coefficient (the ½).
- `einsteinTraceReversalCoeff_homed` — it IS the coefficient in the banked N354 `einstein_traceReversal`
  (`einsteinScalar G = R − einsteinTraceReversalCoeff·finrank·R`). Homes ½ to the banked Einstein tensor.
- `gravCouplingCoeff : Cut := einsteinTraceReversalCoeff⁻¹ * gaussSphereSolidAngle` — κ/G = (½)⁻¹·(4π).
- `gravCouplingCoeff_eq` — ★★ = 8·cutPi (the derived 8π).
- `gravCouplingCoeff_two_flux` — ★★ = 2·gaussSphereSolidAngle (the 2·4π split, both factors homed).
- `gravCouplingCoeff_flux_factor` — = einsteinTraceReversalCoeff⁻¹·gaussSphereSolidAngle (definitional home).
- `gravCouplingCoeff_azimuthal` — ★ = azimuthalTurn·4 (gravity via the shared Born turn).
- `numerator_azimuthal` — ★ criticalPhaseNumerator = azimuthalTurn·42 (gauge via the shared Born turn).
- `gravAndGauge_share_azimuthalTurn` — ★★★ THE MOAT: both gravCouplingCoeff and criticalPhaseNumerator
  are azimuthalTurn-multiples (4 and 42); numerator = 21·gravity-flux. One derived turn normalizes both.
- `gravCouplingCoeff_pos` — 0 < gravCouplingCoeff (cutPi_pos).
- `ehActionInverseCoeff : Cut := 2 * gravCouplingCoeff` — the S=(1/16πG)∫√−g R normalization.
- `ehActionInverseCoeff_eq` — = 16·cutPi (the action `2`= the variational action-vs-EOM convention, prose).
- W8: `kappa_two_ne_traceValue` — ★★ the κ-factor 2 (= (½)⁻¹) ≠ the dimension trace-value (1−½·finrank)=−4.
- `gravCouplingCoeff_ne_flux` — ★ 8π ≠ 4π (the trace-reversal `2` is load-bearing; drop it and κ=4πG wrong).
- `gravitational_coupling_structure` — ★★★ THE HEART bundled.

## GUARDS
G1 no asserted value (8π, 2, 4π all fall out of banked objects). G2 no empirical number (Newton's-G
value removable prose only; G symbolic). G3 G the single dimensionful anchor, the coefficient dimensionless.
G4 4π from banked N328 flux, 2 from banked N354 trace-reversal coeff, both derived. G5 words-removable
(delete gravity/Einstein/coupling/spin-2/action → statements about (2⁻¹)⁻¹·gaussSphereSolidAngle = 8·cutPi
and the shared azimuthalTurn over derived Cut). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound},
no sorry/axiom/native_decide/maxHeartbeats. ℝ-vigilance: banked cutPi/gaussSphereSolidAngle/finrank_STVC/
einsteinScalar/ricciScalar, NEVER Mathlib Real/pi as content.

## HONEST GRADE
ALGEBRAIC/COEFFICIENT layer (like N357/N358 weak-field). Banks the coefficient STRUCTURE `8π=(½)⁻¹·4π`
both factors HOMED + the moat cross-tie. Does NOT build the Newtonian-limit MATCHING (why the trace-
reversal half is exactly what relates κ to 4πG) — that needs the coordinate-varying-field 2nd-derivative
computation (N358 STRUCTURALLY BLOCKED at the fixed-gradient layer) — flagged LEADING-ORDER + childed.
The EH-action `2` is the standard variational action-vs-EOM convention (prose). G symbolic (G3).

## W9 MEASURE-FIRST: pure arithmetic on banked cutPi/gaussSphereSolidAngle/finrank_STVC — LIGHT olean,
no coordinate bash, no native_decide/maxHeartbeats. De-risk in probe.lean BEFORE production.
