# N335 — SEEDED GAUGE ROUTE C1 (arc-C, FIRST COSMOLOGY CONTACT): Σm_ν = m₀ rides the tower.

FRESH worker, run 637. Task t_969b7136. DIRECTED single successor of N334 (t_a97bcf0a, B7) — chain tail.
Duplicate-instance check: my PPID=16116 = board `spawned.pid` (run 637); `ps` sibling is the launching
hermes CLI (16116) + a now-GONE `lean …WrongRungCostume.lean` (a leftover child of the N334 gate, dead).
I am the LEGIT worker; did NOT stand down. State at run start: HEAD `36315f9` (N334 banked), git tree
clean (only `workbench/N334/gate-fast.log` untracked), `workbench/N335-nu-mass-sum` fresh (genuine fresh
start — no prior probe; `ls workbench` shows no N335/C1 dir). Build green at HEAD.

════════════════════════════════════════════════════════════════════════════
## STEP A — SELECT (worker-body STEP A), run theory-native FIRST

The ticket offers (a) C1 the structural identity Σm_ν = m₀, (b) a smaller structural prerequisite, or
(c) redirect. I ran SELECT fresh from the THEORY.

★ THE THEORY-NATIVE READING (what the fold's own next beat is here).
The seesaw scale m₀ = v²/M is banked (N333/B6, `seesawScale M = M·seesawRatio`, `seesawScale_eq_vev_sq_div`
= the literal v²/M) and read as the (9,−2) rung of the one-object tower (N334/B7, `seesawRatio_as_rung`).
B6/B7 gave m₀ as a SINGLE dimensionless scale. C1's theory-native question is the SUM structure: WHY
does the whole THREE-generation neutrino mass sum Σm_ν equal this ONE scale m₀, and not three independent
scales? The answer is forced by TWO already-banked fold results, joined:

  (i) SELF-BLINDNESS AT THE FAMILY LEVEL (N290 `family_invariant_core_eq_span_one`; N271
      `matterColourNeutral ⊓ matterIsospinNeutral = span{1}`, the sterile-direction core). The derived
      family so(3) is BLIND to all generation content — the only family-invariant Hermitian direction is
      the scalar-unit line {r·id}. So the heavy, gauge-neutral (sterile ν_R) Majorana mass operator, being
      family-invariant, is FORCED ∝ id: M_R = M·1, ONE scale, family-universal. (This is the theory doing
      the work; the field POSITS a family-universal M_R, the theory DERIVES the family-blindness that
      forces it.)

  (ii) BORN = SELF-OVERLAP (the trunk primitive; the SAME positivity that forced `cutExp_pos`, made
      gravity's coupling a square at B3, and the ν seesaw a square at B6). The light seesaw mass operator
      is the type-I form m_ν = m_D · M_R⁻¹ · m_Dᵀ. With M_R = M·1 (family-blind), this COLLAPSES to
      m_ν = M⁻¹ · (m_D m_Dᵀ) — the Born self-overlap of the Dirac coupling, divided by the ONE scale M.

  THE SUM. Σm_ν is the trace of m_ν (basis-free sum of the three light masses; m_ν = M⁻¹·(D Dᵀ) is
  symmetric PSD, so its eigenvalues are ≥0 and their sum = the trace = the physical Σm_ν). Hence
      Σm_ν = Tr(m_ν) = M⁻¹ · Tr(D Dᵀ) = (Born self-overlap of the Dirac coupling) / M,
  and when the Dirac self-overlap saturates the electroweak scale (Tr(D Dᵀ) = v², the banked
  `transmutationScale`² — an explicit HYPOTHESIS, candidate-grade, NEVER asserted), this is EXACTLY
  v²/M = m₀ = `seesawScale M` (banked `seesawScale_eq_vev_sq_div`). The three-generation sum rides the ONE
  seesaw scale PRECISELY because the heavy scale is family-blind (scalar), and the sum's value is m₀ by the
  Born self-overlap saturating v². This is the SUM structure, not a restatement of `seesawScale`.

★ WHY THIS IS THE GENUINE C1, NOT DECORATIVE. The ticket's anti-bullshit crux: a C1 that merely restates
`seesawScale` without exhibiting the ν-mass-SUM structure is decorative. This deliverable exhibits:
  • the SUM explicitly — the TRACE over Fin 3 (three generations), = ∑ᵢ (light masses);
  • WHY it rides ONE scale — the family-blind collapse M_R = M·1 (the scalar heavy Majorana operator
    commutes with EVERY family rotation, proved: `heavyMajorana_family_blind`), so Tr(m_ν) = Tr(D Dᵀ)/M;
  • the Born self-overlap — Tr(D Dᵀ) = ∑ᵢⱼ Dᵢⱼ² ≥ 0 (positivity, the trunk);
  • the B6 landing — under the v²-normalization hypothesis, Σm_ν = `seesawScale M` and Σm_ν/M = `seesawRatio`
    = `scaleTowerRung 9 (−2)` (the tower rung).
This is genuinely the three-gen sum riding the one seesaw scale, with the mechanism shown.

★ WHY NOT (b) a prerequisite. The needed banked material is all in hand: `seesawScale`/`_eq_vev_sq_div`,
`transmutationScale`, `seesawRatio`/`_as_rung`, `scaleTowerRung`, the derived ℝ `Cut`, `Matrix` machinery.
No prerequisite node is missing. (C2 — the ν spectrum m₁=0/normal ordering — is the SUCCESSOR's territory,
per seed order C1→C2→C3→C4.)

★ WHY NOT (c) redirect. The theory's next beat (the SUM riding the one scale) IS C1; it does not point
elsewhere. Arc order is respected.

════════════════════════════════════════════════════════════════════════════
## S1 — STATE SURVEY (grep-confirmed this run, HEAD 36315f9)

BANKED (Phys/Algebra/), all transitively available by importing `ScaleTowerOneObject`:
- SeesawScale (N333): `seesawScale (M:Cut) = M·seesawRatio`; `seesawScale_pos (M) (0<M)`;
  `seesawScale_eq_vev_sq_div (M g2)(M≠0)(g2≠0) : (transmutationScale M (rungExponent (finrank spaceSub)·g2) g2)^2 / M = seesawScale M`;
  `seesawScale_lt_vev (M g2)(0<M)(g2≠0)`; `seesawRatio`, `seesawRatio_eq`, `seesawRatio_pos`, `seesawRatio_lt_one`.
- ScaleTowerOneObject (N334): `seesawRatio_as_rung : seesawRatio = scaleTowerRung 9 (-2)`; `scaleTowerRung`.
- DimensionalTransmutation (N320): `transmutationScale (M c g2:Cut) = M·transmutationRatio c g2`.
- ScaleTowerLadder (N332): `ewClosureRatio`, `_eq`. ScaleTowerNumeratorLock (N329): `rungExponent`, `finrank_spaceSub`.
- ContinuumExp/ContinuumQ: the derived ℝ `Cut` (ordered field), `cutExp`, `cutPi`.
- Mathlib `Matrix (Fin 3)(Fin 3) Cut` machinery: `trace`, `transpose (ᵀ)`, `*`, `•`, `trace_smul`,
  `Matrix.trace_mul_transpose_self` (or `trace_transpose_mul`), `Fin.sum_univ_three`.

FAMILY-BLINDNESS grounding (PROSE citation, not imported — different carrier): N290
`family_invariant_core_eq_span_one` (family-invariant Hermitian core on H₃(O) = scalar-unit line), N271
`matterColourNeutral ⊓ matterIsospinNeutral = span{1}` (the sterile ν_R direction). Both justify M_R ∝ id.

NOT banked (correctly — C2/C3 territory): any ν Dirac/Majorana matrix, y₁=0, the three-ν spectrum, ordering.

════════════════════════════════════════════════════════════════════════════
## S2 — THE BUILD (deliverable: `Phys/Algebra/NeutrinoMassSum.lean`, ns `Phys.Algebra`)

Over the derived ℝ `Cut`, `D : Matrix (Fin 3)(Fin 3) Cut` the (dimensionful) Dirac coupling.

- `heavyMajorana (M : Cut) : Matrix (Fin 3)(Fin 3) Cut := M • 1` — the FAMILY-BLIND heavy Majorana scale
  (∝ id, forced by N290/N271: the family-invariant sterile direction is the scalar-unit line). ONE scale M.
- `heavyMajorana_family_blind (M) (U) : U * heavyMajorana M = heavyMajorana M * U` — the scalar heavy scale
  commutes with EVERY family rotation U: family-UNIVERSAL, the concrete family-blindness. (`smul` + `one_mul`)
- `heavyMajorana_scalar_inv (M) (hM : M ≠ 0) : heavyMajorana M * (M⁻¹ • (1:Matrix …)) = 1` — the scalar
  heavy scale's seesaw inverse is scalar (family-blind ⟹ one scale governs the inverse), no matrix inverse.
- `diracSelfOverlap (D) : Cut := Matrix.trace (D * Dᵀ)` — the Born self-overlap of the Dirac coupling.
- `diracSelfOverlap_eq_sum_sq : diracSelfOverlap D = ∑ i, ∑ j, (D i j)^2` (Born = self-overlap explicit).
- `diracSelfOverlap_nonneg : 0 ≤ diracSelfOverlap D` (sum of squares, Born positivity over ordered Cut).
- `neutrinoMassSum (D) (M) : Cut := Matrix.trace ((M⁻¹) • (D * Dᵀ))` — Σm_ν = trace of the light seesaw
  operator m_ν = M⁻¹·(D Dᵀ) (the family-blind collapse of m_D M_R⁻¹ m_Dᵀ). The SUM over three generations.
- ★ `neutrinoMassSum_eq : neutrinoMassSum D M = diracSelfOverlap D / M` — the three-gen sum RIDES the ONE
  scale M (trace_smul + div_eq). THE STRUCTURAL CORE: family-blindness ⟹ whole sum ÷ one scale.
- `neutrinoMassSum_nonneg (0 ≤ M⁻¹ side)` / `neutrinoMassSum_pos ((∃ i j, D i j ≠ 0) → 0 < M → 0 < …)`.
- ★ `neutrinoMassSum_eq_seesawScale (M g2)(hM:M≠0)(hg:g2≠0)(hnorm: diracSelfOverlap D = (transmutationScale
  M (rungExponent (finrank spaceSub)·g2) g2)^2) : neutrinoMassSum D M = seesawScale M` — CANDIDATE: under the
  Born self-overlap saturating v² (explicit hypothesis, NOT asserted), Σm_ν = m₀ = v²/M (banked
  `seesawScale_eq_vev_sq_div`). THE C1 LANDING.
- ★ `neutrinoMassSum_over_M_eq_rung (…hnorm…) : neutrinoMassSum D M / M = scaleTowerRung 9 (-2)` — under the
  same normalization, Σm_ν/M = seesawRatio = the (9,−2) tower rung (banked `seesawRatio_as_rung`). THE TOWER.
- `neutrinoMassSum_lt_vev (…) : neutrinoMassSum D M < transmutationScale …` (banked `seesawScale_lt_vev`).
- CAPSTONE `neutrino_mass_sum_rides_tower` (★★★): the sum = Tr, rides the one scale (=diracSelfOverlap/M),
  is a Born self-overlap (∑ squares, ≥0), and under the v²-normalization = seesawScale M = the (9,−2) rung.

NON-VACUITY (W8, C360): the SUM structure is over THREE generations riding ONE scale. Certificate: the
Born self-overlap of the identity Dirac coupling counts the three generations, `diracSelfOverlap (1 : Matrix
(Fin 3)(Fin 3) Cut) = 3` (Tr(1·1ᵀ)=Tr 1 = 3 over Cut). Flag `genSumCount := 3`; `cert_val_true : min 360
genSumCount = 3`; bogus `min 360 genSumCount = 360` reduces (via the banked value) to `3 = 360`. If the SUM
were mis-built (wrong index range, not three generations, trace not factoring), diracSelfOverlap 1 ≠ 3.

All tactics cheap (`simp [Matrix.trace, Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_three]`,
`ring`, `trace_smul`, banked `seesawScale_eq_vev_sq_div`) on banked objects + a 3×3 matrix — no W9 risk.
Probe `workbench/N335-nu-mass-sum/probe1.lean` must COMPILE CLEAN before production.

════════════════════════════════════════════════════════════════════════════
## S3 — ANTI-BULLSHIT GATE (crux) — held brutally honest

NAME-THE-TEMPTATION, each handled:
  (a) DECORATIVE RESTATEMENT (define `neutrinoMassSum := seesawScale M`, call it done) → REJECTED. The
      deliverable exhibits the SUM as a TRACE over Fin 3 (three generations), proves it RIDES one scale via
      the family-blind collapse `neutrinoMassSum_eq` (= diracSelfOverlap/M), and only THEN lands on
      seesawScale under an explicit Born-self-overlap-saturates-v² hypothesis. The mechanism (why the sum =
      m₀) is proved, not asserted.
  (b) ASSERT the neutrino mass sum value / 58 meV / DESI number → NOT done. No decimal/literal ν mass in any
      statement or proof. The v²-saturation is an explicit HYPOTHESIS (hnorm), candidate-grade; the 58 meV and
      its DESI exclusion are REMOVABLE PROSE ONLY, flagged as the STANDING KILL-LINE.
  (c) POSIT M_R ∝ id without justification (smuggle family-universality) → guarded. `heavyMajorana = M•1` is
      justified by the banked family-blindness (N290/N271, PROSE), and its family-universality is PROVED
      (`heavyMajorana_family_blind`: commutes with every U). Not a bare posit.
  (d) import Real.exp/Real.pi / Mathlib-ℝ as content → UNEARNED-IMPORT, NOT done. Ground field the derived ℝ
      `Cut`; banked seesawScale/transmutationScale/seesawRatio/scaleTowerRung throughout. Matrix is MACHINERY.
  (e) new dimensionful Cut atom → NOT done (G3). M is the single anchor; v = banked `transmutationScale M …`;
      D dimensionful but its self-overlap is normalized to the banked v² (hypothesis); no new atom.
  (f) FREE-FLOATING generic linear algebra → guarded. The capstone TYPE cites banked `seesawScale`,
      `transmutationScale`, `scaleTowerRung`; the landing theorems are literally ABOUT the banked B6/B7
      objects. `diracSelfOverlap`/`neutrinoMassSum` are over the derived `Cut`. Not generic over an arbitrary
      field — the RESULT is Σm_ν = the banked seesawScale.

WORDS-REMOVABLE (G5): delete neutrino/mass/sum/seesaw/Dirac/Majorana/family/sterile/cosmology. What survives:
for D : Matrix (Fin 3)(Fin 3) Cut, Tr((M⁻¹)•(D Dᵀ)) = Tr(D Dᵀ)/M, Tr(D Dᵀ) = ∑ᵢⱼ Dᵢⱼ² ≥ 0, M•1 commutes
with every U and (M•1)(M⁻¹•1)=1, and under Tr(D Dᵀ) = (transmutationScale …)² one has Tr((M⁻¹)•(D Dᵀ)) =
seesawScale M = M·scaleTowerRung 9 (−2). Pure real (Cut) matrix analysis on banked cutExp/cutPi-built
scales. NO name is load-bearing.

HONEST GRADE (mandatory flags — DO NOT over-claim):
  • IDENTITY-grade (forced math): the trace factorization `neutrinoMassSum_eq` (Σ rides one scale M), the
    Born self-overlap `diracSelfOverlap_eq_sum_sq`/`_nonneg`, the family-blind collapse
    (`heavyMajorana_family_blind`/`_scalar_inv`), and the seesawScale/rung landings UNDER the explicit
    normalization hypothesis. Pure Cut-matrix arithmetic on banked objects.
  • CANDIDATE-grade (arc-C, prose + hypothesis, NEVER asserted): (i) the physical READING — Tr(m_ν) IS the
    physical neutrino mass sum, m_ν's eigenvalues ARE the physical light masses (PSD ⟹ nonneg sum); (ii) the
    Born-self-overlap-saturates-v² normalization (hnorm) — the Dirac coupling self-overlap equals the EW
    scale²; (iii) M_R ∝ id as the physical family-universal sterile scale. All flagged candidate.
  • STANDING KILL-LINE (prose-only, do NOT soften): Σm_ν ≈ 58 meV is under DESI DR2 95%-CL exclusion (Σ<58
    meV), and the framework's Σ is the normal-ordering floor → ~2σ tension. A REAL FIGHT, NOT a win. Lab
    ordering (JUNO/DUNE) is the adjudicator. NEVER fit, NEVER invoke an escape hatch; the number stays prose.

NOT a runway / not a new axiom: no empirical scale in any statement/proof; every object is a banked-object /
derived-Cut combination. BUILD node (production Lean banked), landing C1 (candidate-grade + kill-line).

════════════════════════════════════════════════════════════════════════════
## DECISION — BUILD: bank `Phys/Algebra/NeutrinoMassSum.lean` — Σm_ν = m₀ rides the tower.
##   The three-generation neutrino mass SUM is the trace of the type-I light seesaw operator; it rides the
##   ONE seesaw scale M because the heavy Majorana scale is family-blind (∝id, N290/N271); its value is the
##   Born self-overlap Tr(D Dᵀ)/M; under the Born self-overlap saturating v² it equals m₀ = seesawScale M =
##   M·scaleTowerRung 9 (−2) (banked B6/B7). CANDIDATE-grade; STANDING KILL-LINE (DESI Σ<58 meV) flagged prose.

ONE-SUCCESSOR RAIL: exactly one directed successor — a C2 arc-C node (the ν spectrum m₁=0 / normal ordering,
per seed order C1→C2→C3→C4) if C1 lands. Pre-complete fork check (kanban_list, non-terminal successors = 1
on the tail). Never both, never zero.
