# N405 PREREG — arc-L L4: condensed matter / phase transitions = the fold engine at the many-body scale

## SELECT (theory-native, done)
- **GOAL lens.** The fold is self-look-back; at the many-body scale there are many probes / microstates.
  A PHASE is a many-body distribution; the maxent equilibrium (G3, `uniformState`) is the C6-forced
  attractor (a deviation carries strictly-positive self-datum = C6-forbidden partial self-coincidence).
  An ORDER PARAMETER is exactly a MEASURE OF DEVIATION from that symmetric equilibrium. Disordered phase
  = the equilibrium (order param 0); ordered/broken phase = a distinct state (order param > 0). At
  CRITICALITY the linear response is the RANK-1 totalization projector (G2, `criticalProjector_unique`
  kills the identity via sum-reading), whose entry IS the universal exponent α* = 1/42.
- **REFRAMING lens.** Standard CM POSITS a Landau/Ginzburg free-energy functional (order-parameter field
  φ, potential a(T)φ²+bφ⁴) and RG-computes exponents fitted to materials. The theory DISSOLVES this: the
  order parameter is the maxent-deviation self-datum `relInfo p (uniformState)` (not a posited field), the
  disordered phase is the maxent equilibrium (not a posited φ=0 minimum), the universal exponent is the
  banked channel-share α*=1/42 (not an RG-computed fitted number), and UNIVERSALITY (independence of
  microscopic detail) IS the rank-1 forcing that kills everything except the totalization projector whose
  entry depends only on the channel count 42. The SAME number 84 = 2/α* = 2·42 that fixes the couplings
  (arc A/B) governs criticality — one engine, two regimes.
- **METHOD (no lock).** ASCENT supplies the universal exponent (the invariant channel count 42 = |offDiag
  Fin 7| = the octonion imaginary channel count). TRUNK/C6 supplies the order parameter (the deviation
  self-datum). Both used; tied by the WELD.
- **S3 reconcile.** ALIGNS with arc L (L4 = CM/phase transitions on banked G2/G3). Proceed.

## THE LOAD-BEARING WELD (never banked — the genuine new content, NOT a hollow-AND)
`equilibrium_is_universality_fixedpoint`: for any M over `Fin n` (n≥2) that is Equivariant + SumReading
+ idempotent + nonzero (the abstract characterization of the universality fixed point, G2), for all i j,
`((M i j : ℚ) : Cut) = uniformState n j`. I.e. the abstractly-characterized universality fixed point (via
`criticalProjector_unique` ⇒ M = chanProj n) has as each of its ROWS the maxent equilibrium (G3). Two
independently-derived objects — the completeness/rank-1 engine (G2) and the Gibbs/C6 engine (G3) — are the
SAME democratic totalization. One-cause-many-terminations.

## OBJECTS (Phys/Algebra/CondensedMatterPhaseTransition.lean, ns Phys.Algebra.PhaseTransition)
- `chanProj_entry_uniform (n i j) : chanProj n i j = 1/(n:ℚ)` — uniform entries (both diag/off).
- `critProjRow_eq_equilibrium (n j) : ((chanProj n i j : ℚ):Cut) = uniformState n j` — the ROW = equilibrium.
- ★★ `equilibrium_is_universality_fixedpoint (hN: 2≤n) M (hEq)(hSR)(hIdem)(hNe) i j :
    ((M i j:ℚ):Cut) = uniformState n j` — THE WELD, abstract characterization.
- `orderParam {n} (p : Fin n → Cut) : Cut := relInfo p (uniformState n)` — the order parameter.
- `orderParam_disordered_zero : orderParam (uniformState n) = 0` (via relInfo_self).
- ★ `orderParam_zero_iff_symmetric (hp hsp) : orderParam p = 0 ↔ p = uniformState n` (via relInfo_zero_iff,
    using uniformState_pos/_sum_one for the reference).
- `qWit_eq_uniform : qWit = uniformState 2` (funext + (2:Cut)⁻¹ = 1/2).
- ★ `orderParam_ordered_pos : 0 < orderParam pWit` (= relInfo pWit qWit via qWit_eq_uniform, banked
    maxent_deviation_pos) — the ordered phase genuinely deviates.
- `criticalExponent_eq_alphaStar` re-export; `criticalExponent_eq_one_div_42`.
- ★ `universality_two_regime (84 = 2/alphaStar ∧ 84 = 2·channelcount)` — the cross-tie (via scaleTowerNumerator_eq).
- ★★★ `phase_transition_structure` capstone: WELD ∧ order-param vanishing pattern (disordered 0, ordered >0,
    zero-iff-symmetric) ∧ universal exponent α*=1/42 ∧ two-regime cross-tie.
- W8: `orderParam_ordered_ne_disordered : orderParam pWit ≠ orderParam (uniformState 2)` (a real transition).

## GRADE
MECHANISM (beyond-key, SEED §L4). The order-parameter STRUCTURE (deviation self-datum, vanishing pattern),
the universal exponent (α*=1/42, banked), the WELD (universality fixed point = maxent equilibrium), and the
two-regime cross-tie are FULL theorems foundations-only over the derived Cut + banked ℚ objects. The
IDENTIFICATION that this IS condensed-matter criticality binding real materials is MECHANISM-grade (flagged
prose). NO material number (transition temperatures, material-specific exponents) in any proof (G1/G2 NO-FIT).

## GUARDS
G1 no asserted values. G2 no empirical number in any proof (removable prose; NO-FIT LOUD — do NOT chase any
residual). G3 derived-not-posited (order param from G3 maxent, exponent from G2 universality — NOT a posited
Landau model). G4 words-removable (delete condensed-matter/phase/order-parameter/critical → pure statements
about relInfo/uniformState/chanProj/criticalExponent). G5 foundations-only ⊆ {propext,Classical.choice,
Quot.sound}. ℝ-vigilance: banked derived Cut + banked G2 ℚ objects; NO Mathlib Real/Complex as content.
FREE-FLOATING: every TYPE cites banked chanProj/criticalExponent/alphaStar (G2) + relInfo/uniformState/
pWit/qWit (G3) — NOT generic. W8: C430 costume bites 1=430. W4.5: exactly L4, NOT L5.

## COST BUDGET / KILL (W9)
All-ℚ + Cut cast; no coordinate blowup, no native_decide, no maxHeartbeats. Probe must be EXIT 0 light
(<40s). If any single obligation exceeds ~90s or needs a ceiling raise → STOP, decompose. Expect trivial.
