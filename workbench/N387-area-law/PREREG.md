N387 — arc-I I3: THE AREA LAW (Wilson-loop area-scaling FORM ⟨W(C)⟩ ~ exp(−σ·Area)).
PREREG (docs/NODE_SELECTION.md SELECT done in comment 293; theory-native target confirmed).

TARGET (SEED_QCD_CONFINEMENT §I3, theorem-route for the FORM; σ VALUE candidate/mechanism):
DERIVE the area-scaling FORM: the descent obstruction (the octonion associator, N219/N385)
accumulates PER PLAQUETTE over a 2-DIMENSIONAL region of overlaps — one obstruction factor per
2-cell tiling the enclosed AREA, so the failure-to-glue grows with ENCLOSED AREA not boundary
length. Total suppression = w^(Area) = cutExp(−(σ·Area)), the derived-ℝ Born-positive exp.

THEORY-NATIVE FRAMING (comment 293):
- The associator is a TRILINEAR (triple-overlap) alternating form. Reconciling a 2-dim region of
  overlaps needs ONE obstruction factor per plaquette (2-cell); the count = card of a 2-dim index
  grid = AREA, NOT the 1-dim boundary length. Area-vs-perimeter is a COUNTING fact, not a posited
  dynamics.
- The per-plaquette factor is the Born SELF-OVERLAP of the associator obstruction: w = cutExp(−σ),
  σ = per-plaquette Born action = gForm(assoc a b x)(assoc a b x) ≥ 0 (Born=self-overlap=positivity).
- σ = 0 on the fold's ℂ line span{1,u1} (singlet_assoc_vanishes ⟹ gForm 0 = 0) → w = 1, no
  suppression, DECONFINED (N386 singlets). σ > 0 on the coloured carrier (assoc_nonvanishing ⟹
  gForm > 0) → w < 1, strict area-law suppression, CONFINED. Same nonvanishing N385/N386 used.

BANKED PLATFORM (all foundations-only, verified in probes):
- cutExp/cutLog/cutRpow (N174/175): cutExp_pos, cutExp_zero, cutExp_add, cutExp_strictMono,
  cutExp_le_one_of_nonpos. Template: DimensionalTransmutation (exp(−positive)∈(0,1)).
- gForm (N24, DerivationCompact): gForm_self_nonneg, gForm_self_eq_zero (Born positivity, =0 iff 0).
- associator (Alternative): assoc, alt_left, assoc_nonvanishing; singlet_assoc_vanishes (N386).
- Finset.prod_const / Fintype.card_prod for the 2-cell grid product.

PRODUCTION DECLS (Phys/Algebra/ConfinementAreaLaw.lean, ns Phys.Algebra):
  plaqFactor σ := cutExp(−σ)              -- per-plaquette suppression factor
  wilsonArea σ m n := plaqFactor σ ^ (m*n)  -- accumulated over the m×n plaquette grid
  bornAction a b x := ((gForm (assoc a b x) (assoc a b x) : ℚ) : Cut)  -- per-plaquette σ, DERIVED
  wilsonArea_form      : wilsonArea σ m n = cutExp(−(σ·(m*n)))   ★ THE AREA LAW FORM
  wilsonArea_prod      : = ∏ over Fin m × Fin n of plaqFactor σ  (product over 2-cells)
  wilsonArea_pos       : 0 < wilsonArea
  wilsonArea_le_one    : ≤ 1 for σ ≥ 0
  wilsonArea_lt_one    : < 1 for σ > 0, Area > 0                 ★ strict area suppression
  wilsonArea_strictAnti: cutExp(−σ)^A2 < ^A1 for A1<A2, σ>0      ★ grows with ENCLOSED AREA
  area_beats_perimeter : wilsonArea σ n n < cutExp(−(σ·4n)) for n≥5  ★ area ≫ perimeter
  bornAction_nonneg    : 0 ≤ σ (Born positivity)
  bornAction_singlet_zero : σ = 0 on span{1,u1} (deconfined; N386 singlet)  ★ dichotomy
  bornAction_coloured_pos : 0 < σ at the coloured witness (confined)         ★ dichotomy
  area_law_dichotomy (capstone): singlet σ=0 (no suppression) vs coloured σ>0 (suppression)
  + area_law_form (capstone): the FORM + pos + strict suppression + area-beats-perimeter.

COSTUME C412 (Counterexamples/ConfinementAreaLawVacuityCostume.lean, bites 1=412): the WRONG
mechanism "the coloured Born action is zero / no area suppression" (per-plaquette factor = 1) must
fail — iFlag tied to bornAction_coloured_pos (σ>0 at the coloured witness). min 412 iFlag = 1.

GUARDS: G1 no asserted value (σ a DERIVED gForm, w computed from cutExp). G2 no empirical number
(σ≈0.19 GeV², 938 MeV — none in any proof). G4 words-removable (delete Wilson/plaquette/
string-tension/confinement → pure cutExp^card + gForm facts). G5 foundations-only, derived-ℝ Cut
(NEVER Mathlib Real as content), no heartbeat raise. W8: costume bites. W4.5: exactly the I3 FORM,
NOT I4 mass gap / I5 hadronic mass. σ VALUE flagged candidate/mechanism (NO-FIT).

ROUTE VERIFIED: probe1 (infra), probe2 (casts/pow/prod), probe3 (all 8 production theorems) all EXIT 0.
