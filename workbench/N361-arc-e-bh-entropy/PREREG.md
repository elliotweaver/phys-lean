# N361 — arc-E E5: black hole entropy S = A/4 with s₀ = ln 2 DERIVED

## SELECT (theory-native FIRST, fresh worker — QUIET DRIFT + ANTI-BULLSHIT gate)

The ticket points at E5: S = A/4, s₀ = ln 2. I asked the theory-native question FIRST.

**Standard version (what the field does):**
- S = A/4 from Bekenstein's area argument (entropy ∝ area, bit-counting) + the first law dS = dM/T_H.
  The coefficient 1/4 is fixed by matching to the Hawking temperature.
- s₀ (entropy per bit/cell) posited or counted from microstate degeneracy (string/loop counting), a
  model-dependent input.

**What the theory DOES (the moat):**
- **The 1/4 is NOT matched — it FALLS OUT of the first law with N360's DERIVED T_H, and reduces to the
  banked coupling identity.** dS = dM/T_H with T_H = 1/(gravCouplingCoeff·M) (N360 hawkingTemp_schwarzschild)
  ⟹ dS/dM = gravCouplingCoeff·M. Integrating (∫₀ᴹ M' dM' = M²/2, the antiderivative-difference "2" — the
  SAME FTC pattern as the banked sinAntideriv) gives S = gravCouplingCoeff·M²/2. The horizon area
  A = gaussSphereSolidAngle·r_h² with r_h = 2M (Schwarzschild horizon, explicit hypothesis like N360's
  κ_sg=(4M)⁻¹). Then S = A/4 REDUCES to the BANKED `gravCouplingCoeff_two_flux` (N359:
  gravCouplingCoeff = 2·gaussSphereSolidAngle):
    S = gravCouplingCoeff·M²/2 = (2·gaussSphereSolidAngle)·M²/2 = gaussSphereSolidAngle·M²
    A/4 = gaussSphereSolidAngle·(2M)²/4 = gaussSphereSolidAngle·4M²/4 = gaussSphereSolidAngle·M²  ⟹ EQUAL.
  So **S = A/4 ⟺ gravCouplingCoeff = 2·gaussSphereSolidAngle** — the 1/4 is the SAME "2" (spin-2
  trace-reversal, κ=2·4π·G) conspiring with the first-law integration "2" and the r_h=2M horizon "4".
  THE MOAT: the 1/4 homes to the banked N359 coupling, not a matched number.
- **s₀ = ln 2 = cutLog 2 from the fold's BINARY self-blindness.** The look-back's miss is TWO-VALUED
  (see / not-see — the fold cannot distinguish itself, a binary forcing-failure), so the number of
  forcing-failure states per boundary cell is 2, and the entropy per cell is s₀ = cutLog 2 (the DERIVED
  log, N175 — NOT Mathlib Real.log). Binary is LOAD-BEARING: ω=3 (ternary) would give cutLog 3 ≠ cutLog 2
  (W8). The cell area a* = 4·s₀ = 4·cutLog 2 (in ℓ_P² units) is then FORCED by the cell decomposition
  S = (A/a*)·s₀ = A/4: matching the first-law S=A/4 to the bit-count S = N·s₀ (N = A/a* cells) forces
  a* = 4 s₀. The "4 ln 2 ℓ_P²" cell area (seed §E5) is a DERIVED consequence, not posited.
- **The cross-tie / moat:** T_H (N360) and S both descend from the ONE banked gravCouplingCoeff = 2·4π
  (the derived Born turn ×4); s₀ is the binary fold-count. Three faces of the same derived structure.

**Temptations named + rejected:**
- (a) DEFINE bhEntropy = c·M²/2 and prove S=A/4 by ring — the /2 (⟹ /4) would be POSITED. REJECTED (G1/G4).
  The /2 is EARNED: I build the derived scalar derivative predicate `HasCutDerivAt` and PROVE
  `HasCutDerivAt bhEntropy (gravCouplingCoeff·M) M` (= dS/dM = 1/T_H, the first law), so the /2 is the
  unique first-law-consistent coefficient (d/dM of c·M² is 2c·M = gravCouplingCoeff·M ⟹ c = gravCouplingCoeff/2).
- (b) assert r_h = 2M / assert S = A/4. REJECTED (G1). r_h = 2M stays an explicit HYPOTHESIS (metric-
  specific horizon radius, CHILDED, like N360's κ_sg), never a posited fact; S=A/4 a conditional theorem
  homing to gravCouplingCoeff_two_flux.
- (c) posit s₀ = ln 2 as a microstate degeneracy. REJECTED (G4). s₀ = cutLog 2 from the BINARY
  self-blindness (structurally 2-valued); binary load-bearing proved (cutLog 2 ≠ cutLog 3, W8).
- (d) generic thermodynamics/statmech abstraction. REJECTED (free-floating). Every TYPE cites the banked
  bhEntropy/gravCouplingCoeff/gaussSphereSolidAngle/hawkingTemp/cutLog over the derived Cut.
- (e) import Mathlib Real.log / Real.pi / deriv as content. REJECTED (ℝ-vigilance) — the log is the
  DERIVED cutLog (N175), the derivative the trunk-native `HasCutDerivAt` (Tendsto over the N34 order
  topology, the SAME shape as the banked cut_powerseries_deriv), never Mathlib deriv.

**Words-removable (G5):** delete entropy/area/black-hole/Bekenstein/Hawking/horizon/bit/cell → pure
statements over the derived Cut: `HasCutDerivAt (fun M => c·M²/2) (c·M) M`; `c·M²/2 = (gaussSphereSolidAngle·(2M)²)/4`
(⟺ gravCouplingCoeff=2·gaussSphereSolidAngle); `cutLog 2 ≠ cutLog 3`; `4·cutLog 2 ≠ 4·cutLog 3`;
`(A/(4·cutLog 2))·cutLog 2 = A/4`. Pure arithmetic + banked cutLog monotonicity. No physics name is load-bearing.

## SMALLEST FORCED BEAT (W9 MEASURE-FIRST)
The RISK piece is the derived scalar derivative primitive `HasCutDerivAt` + `hasCutDerivAt_sq`
(difference quotient of M² = 2M+t → 2M). Everything else (S=A/4 reduction to gravCouplingCoeff_two_flux;
s₀=cutLog 2; binary non-vacuity via cutLog_lt) is shallow ring/cutLog arithmetic on banked lemmas.
MEASURE the derivative primitive FIRST in a bounded probe. Compile budget: each lemma <10s. KILL: if the
derivative primitive needs heavy analysis (>60s / maxHeartbeats raise), decompose — bank the algebraic
S=A/4 (conditional on the first-law form) + s₀ pieces, child the derivative primitive.

## PLAN (production module Phys/Algebra/SpacetimeBlackHoleEntropy.lean, ns Phys.Algebra)
Part A — derived scalar derivative (small W1 build):
1. `HasCutDerivAt (f : Cut → Cut) (f' x : Cut) : Prop := Tendsto (fun t => t⁻¹*(f(x+t)-f x)) (𝓝[≠] 0) (𝓝 f')`
2. `hasCutDerivAt_sq (x) : HasCutDerivAt (fun y => y^2) (2*x) x`  (diff quotient = 2x+t → 2x)
3. `hasCutDerivAt_const_mul (c) (h : HasCutDerivAt f f' x) : HasCutDerivAt (fun y => c*f y) (c*f') x`
Part B — first law fixes the coefficient:
4. `bhEntropy (M) : Cut := gravCouplingCoeff * M^2 / 2`  (S = 4πM²)
5. `bhEntropy_firstLaw (M) : HasCutDerivAt bhEntropy (gravCouplingCoeff*M) M`  (dS/dM = gravCouplingCoeff·M)
6. `bhEntropy_firstLaw_temp (κsg M) (hM) (h:κsg=(4M)⁻¹) : HasCutDerivAt bhEntropy (1/hawkingTemp κsg) M`
   (dS/dM = 1/T_H — the first law, homing to N360)
Part C — the area law + the 1/4:
7. `bhArea (M) : Cut := gaussSphereSolidAngle * (2*M)^2`  (r_h=2M hypothesis; A=16πM²)
8. `bhEntropy_eq_area_quarter (M) : bhEntropy M = bhArea M / 4`  (★★★ S = A/4, reduces to gravCouplingCoeff_two_flux)
Part D — binary self-blindness count:
9. `cellEntropy : Cut := cutLog 2`  (s₀ = ln 2, binary forcing-failure count)
10. `cellEntropy_pos : 0 < cellEntropy`  (cutLog_pos, 1<2)
11. `cellArea : Cut := 4 * cellEntropy`  (a* = 4 ln 2, FORCED by the cell decomposition)
12. `bhEntropy_cell_decomposition (M) : bhEntropy M = (bhArea M / cellArea) * cellEntropy`  (S = N·s₀)
Part E — W8 non-vacuity (binary + 1/4 load-bearing):
13. `cellEntropy_binary_ne_ternary : cellEntropy ≠ cutLog 3`  (ln2≠ln3 via cutLog_lt)
14. `bhEntropy_ne_area_half (M) (hM:M≠0) : bhEntropy M ≠ bhArea M / 2`  (½ instead of ¼ fails)
15. Bundle `black_hole_entropy_structure`.
16. Costume C386 (a wrong factor ½, OR ternary cutLog 3, must be rejected).

## HONEST GRADE
THEOREM-GRADE for the forced core (the first-law derivative fixes the /2; S=A/4 reduces to the banked
gravCouplingCoeff_two_flux; s₀=cutLog 2 the binary count; binary+1/4 non-vacuity). CONDITIONAL on the
explicit hypotheses r_h=2M (horizon radius) and κ_sg=(4M)⁻¹ (surface gravity) — metric-specific, CHILDED
(same as N360). The A itself symbolic/parametric. The WHY-binary (self-blindness is two-valued) is the
mechanism identification — flagged. M/ℓ_P² symbolic dimensionful anchors (G3); S/ln2 numeric values
removable prose only (G2). MOAT flagged: the 1/4 homes to gravCouplingCoeff=2·gaussSphereSolidAngle;
T_H/S/s₀ all faces of the ONE derived structure.
