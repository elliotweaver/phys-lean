# N336 — SEEDED GAUGE ROUTE C2 (arc-C): the ν spectrum m₁=0 / normal-ordering FLOOR.

FRESH worker, run 638. Task t_f672cebf. DIRECTED single successor of N335 (t_969b7136, C1) — chain tail.
Duplicate-instance check: my PPID=59878 = board `spawned.pid` (run 638); `ps` siblings are only the
launching hermes TUI + the dashboard python. I am the LEGIT worker; did NOT stand down. State at run
start: HEAD `c3d0b63` (N335 banked), git tree clean, `workbench/N336-nu-spectrum` fresh (genuine fresh
start — no prior probe). Build green at HEAD (`Phys.Algebra.NeutrinoMassSum` compiles).

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A), run theory-native FIRST, ANTI-BULLSHIT held brutally.

The ticket offers (a) y₁=0 exact — the self-blind gen-1 direction vanishes (massless lightest),
(b) normal ordering — the two nonzero masses ordered, (c) a smaller prerequisite / redirect.

★ THE THEORY-NATIVE READING (what the fold's own next beat is here).
N335 banked the light seesaw operator `m_ν = M⁻¹·(D Dᵀ)` (the family-blind collapse) and the SUM
`Σm_ν = Tr(m_ν) = diracSelfOverlap D / M`. C1 was the SUM. C2's theory-native question is the SPECTRUM
SHAPE: WHY is the lightest light-neutrino MASSLESS (m₁ = 0 exact)?

The fold answers directly. Two banked trunk facts, joined:

  (i) BORN = SELF-OVERLAP (the trunk). The mass of a generation-direction `v` is the Born self-overlap
      of `v` through the coupling: `massOfDir D M v := ⟨v, m_ν v⟩ = M⁻¹·⟨v, (D Dᵀ) v⟩ = M⁻¹·‖Dᵀ v‖²`
      (a genuine Born square, hence ≥ 0 — PSD). A generation is massless IFF its Born self-overlap
      through the coupling vanishes: `‖Dᵀ v‖² = 0 ⟺ Dᵀ v = 0`.

  (ii) SELF-BLINDNESS (N1 `fold_self_blind`; N290 `adE_one : adE K 1 = 0`, the family adjoint action
      ANNIHILATES the scalar/self direction; N305 `Poth` the "others"/inter-generation projector with
      `Pdem + Poth = 1`). The fold CANNOT SEE ITSELF. The self/DC generation direction `s = (1,1,1)`
      (the ℤ₃-cycle-invariant self-direction, the mean/DC mode killed by `Poth`) is the fold's own
      self-fixed direction. The neutrino Dirac coupling is the seeing-BETWEEN generations — the
      OTHERS-overlap, `D = Poth · D₀` — because self-seeing is blind (fold_self_blind). Then

          `Dᵀ s = D₀ᵀ · Pothᵀ · s = D₀ᵀ · Poth · s = D₀ᵀ · 0 = 0`   (Poth kills the DC self-direction),

      so the self-direction's Born self-overlap through the coupling VANISHES:

          `massOfDir D M s = M⁻¹·‖Dᵀ s‖² = 0`   —  THE SELF/STERILE GENERATION IS MASSLESS (m₁ = 0),

      not posited: it FALLS OUT of the fold's self-blindness (`Poth s = 0`, PROVED) + Born=self-overlap.

  THE ORDERING FLOOR. `m_ν = M⁻¹·(D Dᵀ)` is PSD: `massOfDir D M v = M⁻¹‖Dᵀ v‖² ≥ 0` for every `v`
  (for `M>0`). The massless self-direction achieves the MINIMUM `0` of the mass quadratic form — the
  massless state is the LIGHTEST (the normal-ordering FLOOR: `0 = m₁ ≤ m₂ ≤ m₃`, the massless state
  at the bottom, not the top). And the SUM of the two nonzero masses is the whole banked
  `Σm_ν = diracSelfOverlap D / M` (C1) — the two heavy states carry the entire sum.

★ WHY THIS IS THE GENUINE C2, NOT DECORATIVE (anti-bullshit crux). A C2 that merely POSITS `y₁=0`
is decorative. This deliverable PROVES the massless state falls out of the fold:
  • the mass of a direction IS its Born self-overlap through the coupling (Born=self-overlap, trunk) —
    `massOfDir D M v = M⁻¹·‖Dᵀ v‖²`, a proved identity, ≥ 0 (PSD, the ordering floor);
  • the self-direction is killed by the others-projector — `Poth.mulVec s = 0` (PROVED over Cut);
  • for the others-overlap coupling `D = Poth·D₀`, `Dᵀ s = 0` is PROVED (not hypothesized), hence
    `massOfDir D M s = 0` — the self/sterile generation is massless as a THEOREM;
  • the massless state is the LIGHTEST (PSD floor) — the normal-ordering structural content.
The ONLY candidate-grade identification (flagged, NEVER asserted, exactly like N335's `hnorm`): that
the PHYSICAL neutrino Dirac coupling factors through the others-subspace (`D = Poth·D₀`, the coupling
is inter-generation seeing, self-seeing blind). The mechanism — self-blindness ⟹ massless — is derived.

★ THE MOAT / DISSOLUTION. The Standard Model needs a POSITED texture zero or a POSITED 2-right-handed-
neutrino minimal seesaw to get `m₁=0`. The theory DERIVES the rank deficiency: the self-direction has
zero Born self-overlap because the fold cannot see itself (`Poth s = 0`). The texture zero IS the
fold's self-blindness — one cause (self-blindness) → the massless neutrino, exactly the same blindness
that capped the cascade (N5) and made the family so(3) blind to generation content (N290).

★ WHY NOT (b)-alone. Full normal ordering = the specific `m₂ < m₃` SPLITTING VALUES needs the two
nonzero singular-values² of a concrete Dirac texture — transcendental numbers requiring the ℝ-descent
(honestly deferred, like N309's `cos(2/3 rad)`). The STRUCTURAL ordering content (massless floor +
PSD ordering + the two heavy states carrying the whole sum) is what is forced NOW; the numeric
splitting is route-not-yet-found (the standing analytic-completion arc, arc D), NOT asserted here.

★ WHY NOT (c). No prerequisite is missing: N335's `neutrinoMassSum`/`diracSelfOverlap`/`lightSeesaw
Operator`, the derived `Cut`, `Matrix.mulVec`/`dotProduct`/`transpose` machinery, and the DC/others
projector split are all in hand. The theory's next beat (the massless self-generation) IS C2.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable: `Phys/Algebra/NeutrinoMasslessGeneration.lean`, ns `Phys.Algebra`)

Over the derived ℝ `Cut`. Import `Phys.Algebra.NeutrinoMassSum` (N335 banked).

- `selfDir : Fin 3 → Cut := ![1,1,1]` — the DC/self direction (the ℤ₃-cycle-invariant self-direction,
  the mean/DC mode; the fold's self-fixed direction in generation space).
- `demProj : Matrix (Fin 3)(Fin 3) Cut` = the DC projector `(1/3)·J` (all-ones/3), `othersProj = 1 −
  demProj` (the "others"/inter-generation projector — the seeing-between, N305 `Poth` structure over
  Cut). `othersProj_self_zero : othersProj.mulVec selfDir = 0` (Poth kills the DC self-direction).
- `massOfDir (D)(M)(v) : Cut := Matrix.dotProduct v (((M⁻¹) • (D * Dᵀ)).mulVec v)` — the Born
  self-overlap of direction `v` through the light seesaw operator (the mass of that generation-direction).
- ★ `massOfDir_eq_normSq : massOfDir D M v = M⁻¹ · (Σ_i (Dᵀ.mulVec v) i ^ 2)` — the mass is `M⁻¹·‖Dᵀ v‖²`,
  a Born square (Born = self-overlap). `massOfDir_nonneg (0<M) : 0 ≤ massOfDir D M v` (PSD, ordering floor).
- ★ `diracSelfBlind : Dᵀ.mulVec selfDir = 0` for `D = othersProj * D₀` (`dirac_others_self_blind`):
  the others-overlap coupling annihilates the self-direction (Poth s = 0). PROVED, not hypothesized.
- ★★ `self_generation_massless : massOfDir (othersProj * D₀) M selfDir = 0` — THE MASSLESS LIGHTEST
  NEUTRINO (m₁ = 0 exact): the self/sterile generation's Born self-overlap through the others-coupling
  VANISHES because the fold cannot see itself. THE C2 CORE.
- `massless_is_floor : massOfDir D M v ≥ 0 = massOfDir (othersProj*D₀) M selfDir` — the massless state
  is the MINIMUM (normal-ordering floor): 0 is the bottom of the PSD spectrum.
- tie to C1: the two nonzero masses carry the whole banked SUM — `neutrinoMassSum (othersProj*D₀) M`
  (N335) is the sum of the three, one of which is 0, so it rides on the two heavy states.

NON-VACUITY (W8, C361): a concrete `D₀` with `D = othersProj*D₀` giving a GENUINE `{0, +, +}` spectrum —
`massOfDir D M selfDir = 0` (massless) AND two other directions with DISTINCT POSITIVE `massOfDir`
(the two heavy states, non-degenerate). Costume: the WRONG claim that a full-rank (non-others-factored)
D makes the self-direction massless is FALSE. Flag `masslessCount := 1` (exactly one massless);
`cert_val_true : min 361 masslessCount = 1`; bogus `min 361 masslessCount = 361` ⟹ `1 = 361`.

All tactics cheap (`simp [Matrix.mulVec, Matrix.dotProduct, Matrix.transpose_apply, Matrix.mul_apply,
Fin.sum_univ_three]`, `ring`, `positivity`) on banked objects + a 3×3 matrix — no W9 risk.
Probe `workbench/N336-nu-spectrum/probe1.lean` must COMPILE CLEAN before production.

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (crux) — held brutally honest

  (a) DECORATIVE POSIT of `y₁=0` (define the gen-1 mass := 0) → REJECTED. The massless state is PROVED
      to fall out of `Poth s = 0` (self-blindness) + Born=self-overlap; `massOfDir D M s = M⁻¹‖Dᵀ s‖²`
      is a proved identity and `Dᵀ s = 0` is PROVED for the others-coupling, not assumed.
  (b) ASSERT a ν mass value / splitting / DESI number → NOT done. No decimal/literal ν mass in any
      statement or proof; the numeric splittings are the ℝ-descent's job (arc D), honestly deferred.
      Measured ordering data (JUNO/DUNE) = REMOVABLE PROSE; the JOINT KILL-LINE flagged.
  (c) POSIT the coupling texture (2 ν_R / a texture zero) → guarded. The rank deficiency is DERIVED
      from `Poth s = 0`; the only candidate identification is `D = Poth·D₀` (coupling = others-overlap),
      flagged candidate exactly like N335's `hnorm`, and the mechanism (self-blind ⟹ massless) is proved.
  (d) import Real.exp/Real.pi/Mathlib-ℝ as content → UNEARNED-IMPORT, NOT done. Ground field derived
      `Cut`; banked `neutrinoMassSum`/`diracSelfOverlap`/`lightSeesawOperator`. `Matrix` is MACHINERY.
  (e) new dimensionful Cut atom → NOT done (G3). `M` the single anchor; every mass = M⁻¹·(Born square).
  (f) FREE-FLOATING generic linear algebra → guarded. The theorem TYPES cite banked `neutrinoMassSum`/
      `lightSeesawOperator` (N335) and the RESULT is the massless state of the banked light operator.
      Not generic over an arbitrary field — over the derived `Cut`, about the banked seesaw operator.

WORDS-REMOVABLE (G5): delete neutrino/mass/massless/ordering/sterile/self-blind/generation. What
survives: for `s = ![1,1,1]` and `D = othersProj*D₀`, `(othersProj).mulVec s = 0`, `Dᵀ.mulVec s = 0`,
`⟨s, (M⁻¹•(D Dᵀ)).mulVec s⟩ = M⁻¹·Σ(Dᵀs)² = 0`, and `⟨v, (M⁻¹•(D Dᵀ)).mulVec v⟩ = M⁻¹·Σ(Dᵀv)² ≥ 0`.
Pure Cut-matrix analysis. NO name is load-bearing.

HONEST GRADE (mandatory flags):
  • IDENTITY-grade (forced math): `massOfDir_eq_normSq` (mass = Born square), `massOfDir_nonneg` (PSD
    floor), `othersProj_self_zero` (Poth kills self), `dirac_others_self_blind` (Dᵀs=0 for others-
    coupling), `self_generation_massless` (massOfDir s = 0). Pure Cut-matrix arithmetic.
  • CANDIDATE-grade (arc-C, prose + identification, NEVER asserted): (i) the physical READING —
    `massOfDir` IS a physical light-neutrino mass, the massless direction IS the lightest ν; (ii)
    `D = Poth·D₀` — the physical Dirac coupling factors through the others/inter-generation subspace
    (self-seeing blind). Both flagged candidate; the whole arc C is candidate-grade.
  • ⚠️⚠️ STANDING + JOINT KILL-LINE (prose-only, do NOT soften): `m₁=0` is JOINTLY FALSIFIABLE with the
    sterile-ν_R dark-matter identification (C3): any `m₁>0` detection kills BOTH the ν-spectrum law AND
    the dark-matter story together. The DESI Σ<58 meV tension (C1) stands. Lab ordering (JUNO/DUNE) is
    the adjudicator. NEVER fit, NEVER an escape hatch; the numbers stay prose.

NOT a runway / not a new axiom: every object is a banked-object / derived-Cut combination; no empirical
number in any statement/proof. BUILD node (production Lean banked), landing C2 (candidate + joint kill-line).

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD: bank `Phys/Algebra/NeutrinoMasslessGeneration.lean` — the massless lightest ν.
##   The mass of a generation-direction is its Born self-overlap through the banked light seesaw
##   operator; the fold's self-blind self-direction (killed by the others-projector, Poth s = 0) has
##   ZERO Born self-overlap → the self/sterile generation is MASSLESS (m₁=0 exact), and the massless
##   state is the LIGHTEST (PSD ordering floor). CANDIDATE-grade; STANDING+JOINT KILL-LINE flagged prose.

ONE-SUCCESSOR RAIL: exactly one directed successor — a C3 arc-C node (dark matter = sterile ν_R +
toward ρ_Λ, per seed order C1→C2→C3→C4) if C2 lands. Pre-complete fork check (kanban_list, non-terminal
successors = 1 on the tail). Never both, never zero.
