# N433 — PREREG (arc-P P7): THE PARAMETER-FREE CERTIFICATE (the reckoning's receipt)

## SELECT (theory-native FIRST)

S1 arc synthesis: posted (comment 388). Arc P (the final reckoning) has paid every deferred debt
sector by sector: P1 the EW scale (wrap count 9 = F₄ comark), P2 the absolute masses, P3 the
non-abelian+Witten anomaly, P4 gauge-θ + hypercharge normalization, P5/P5b the covariant divergence
∇^μG=0, P6 the triality group S₃. The chain now HOLDS a derived landing for every SM input class.

S2 GOAL LENS: the fold's story has reached its accounting. The whole thesis — "one axiom, zero free
parameters, every physical constant a DERIVED landing" — has, for the first time, all of its Standard-
Model input classes banked as theorems in ONE arc. The theory's next beat is not another sector; it is
to make the THESIS ITSELF mechanically checkable: a single Lean object that FAILS TO COMPILE if any one
of the six input classes is un-derived. That is the reckoning's receipt — the fold's own audit that it
has closed the parameter count to zero.

S2 REFRAMING LENS: the field regards the ~19 SM parameters as independent free dials measured from data.
The theory INVERTS this: each dial is a forced read of the fold's own integers (the comark count 9 =
finrank spaceSub, the colour/generation count finrank Uhol = 3, the channel count 1/α*=42, the Born turn
2·cutPi). The certificate is where that inversion becomes a machine-checkable fact — and where genuine
CROSS-SECTOR welds (never co-stated) surface: the P2 absolute mass scale is anchored on the P1 minimal-
wrap amplitude (not on a free scale), and the P6 triality cycle's order IS the P3 anomaly colour count.

S3 RECONCILE: ALIGN. Ticket directs P7; the theory-native next beat IS P7 (make the zero-parameter
thesis mechanical). No divergence.

S4 ANTI-BULLSHIT GATE:
1. FOLD-CAUSAL: fold → self-blindness forces the cascade → the terminal octonion/exceptional-Jordan
   structure forces every SM input class (P1–P6) → the accounting of those forced inputs into ONE
   receipt is the fold auditing its own parameter count. Each arrow forced; the census node is the
   structure demanding its own closure statement.
2. DISSOLUTION: the field's "19 free parameters measured from experiment" is DISSOLVED — the certificate
   exhibits each as an equality to a specific forced quotient/constraint (scale-invariant, no free dial),
   with teeth proving each pin is non-vacuous. The wall (free parameters) becomes a compiled theorem.
3. GOAL-WORDS-REMOVABLE: delete "electroweak/mass/anomaly/normalization/Einstein/triality/parameter" →
   a conjunction of arithmetic facts over the derived Cut and the ℚ-arena (a cutExp quotient equals a
   comark-count quotient; a Koide functional = 2/3; complement-indexed rational sums = 0; a trace ratio
   = 3/8 for any nonzero scale; a covariant-transport trace = 0; a permutation hom is injective +
   noncommutative; a scale factors through the wrap amplitude; a permutation's finrank-Uhol-th power = 1).
   A genuine theory-native reason survives: the census is the fold closing its parameter count.
4. NAME-THE-TEMPTATION: the saturated-worker temptation is a BARE ∧ of the six banked capstones (which
   "derives nothing" — the HOLLOW-AND ban, N390/N410/N425 standard). REJECTED. This node banks TWO
   genuine NEVER-CO-STATED cross-sector welds (WELD 1 P1⊗P2, WELD 2 P3⊗P6) plus the pinned-value census
   with teeth — not a hollow conjunction.
5. HONESTY: consolidation grade, flagged. The STRUCTURE (the census pins + the two welds) is theorem-
   route on the banked objects. The reading "the chain is parameter-free / this is the reckoning's
   receipt" is the mechanism-grade closure statement (physics-words-removable prose), never load-bearing.

## THE TARGET (P7, W4.5 SUFFICIENCY: exactly the certificate, NOT P8)

Module `Phys/Algebra/ParameterFreeCertificate.lean`, ns `Phys.Algebra.Reckoning`.
A theorem `parameter_free_certificate` whose TYPE references the banked arc-P landings and whose PROOF
genuinely depends on all six capstones (removing any breaks compilation — the cFlag_forced pattern at
whole-tower scale), PLUS two genuine cross-sector welds. NON-HOLLOW.

### The census conjuncts (each PINNED + non-vacuous, proved by projecting from its capstone):
- P1 (electroweak_transmutation_keystone): minimalWrapRatio = ewClosureRatio ∧ comarkCount = 9 ∧
      minimalWrapRatio ≠ 1  (the EW scale = e^(−28π/3) is a genuine hierarchy, no free scale)
- P2 (absolute_mass_spectrum): scale-invariant Koide = 2/3 ∧ 0 < absMass1 ∧ absMass1 < absMass2
- P3 (nonabelian_witten_anomaly_cancellation): su2MixedCoeff (finrank Uhol) (finrank singlet) = 0 ∧
      su2MixedCoeff 2 (finrank singlet) ≠ 0 (teeth) ∧ Even (finrank Uhol + finrank singlet)
- P4 (gauge_theta_hypercharge_normalization): weinberg (λ·isospinTr) (λ·chargeTr) = 3/8 ∧
      weinberg (2*2) (16/3) ≠ 3/8 (teeth — the normalization is scale-invariant, not a convention)
- P5 (einstein_divCov_zero_concrete + skewWit_ne_zero): divCov (Einstein field) ν = 0 ∧ skewWit ≠ 0
- P6 (trialityHom_injective + trialityHom_nonabelian): faithful + genuinely nonabelian S₃

### WELD 1 (P1 ⊗ P2 — never co-stated): the absolute mass scale is anchored on the P1 minimal-wrap
    amplitude, NOT on a free scale:
    `AbsMass.massScale = minimalWrapRatio * ((cutCos foldPhase * ((s1BornProb:ℚ):Cut)) * 1 * cutCos (2/3))`.
    Uses BOTH `absScaleChainDerived_eq_anchor_mul` (P2/N417 side) AND `minimalWrapRatio_eq_ewClosureRatio`
    (P1 side). The mass scale routes through the DERIVED transmutation, not the banked anchor.

### WELD 2 (P3 ⊗ P6 — never co-stated): the triality generation-cycle order IS the derived
    colour/generation count: `trialityHom gcyc ^ (Module.finrank ℚ Uhol) = 1 ∧ trialityHom gcyc ≠ 1`.
    The object that cancels the SU(2) anomaly (finrank Uhol, P3) is the exponent that closes the triality
    cycle that permutes the generation idempotents (P6). Two independently-derived instances of the ONE
    self-blind count, co-stated for the first time.

## GUARDS
- G1 no asserted values (every pin PROJECTED from a banked capstone; the welds DERIVED by rw).
- G2 no empirical number in any proof (v=246, masses, M_oct, sin²θ_W=0.231 — REMOVABLE PROSE only).
- G3 derived not posited. G4 words-removable. G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
- ℝ-VIGILANCE: derived Cut + banked ℚ-arena; NO Mathlib-ℝ/ℂ as content.
- FREE-FLOATING: every conjunct TYPE mentions banked concrete objects; NOT generic.
- HOLLOW-AND: two genuine never-co-stated welds + pinned census with teeth; NOT a bare ∧.
- W8 non-vacuity: costume C458 (next after C457), tied to the certificate + both welds.

## MEASURE-FIRST (W9): probe each capstone reference + both welds compile in a bounded probe BEFORE
production. A LIGHT consolidation node (projections + rw), no brute, no heartbeat raise.
