# N261 — PREREG (frozen before production compute)

## TARGET (selected via SELECT S1–S5, anti-bullshit gate passed — see t_fe2ae2da comments 89,90)

**THE CHARGED MATTER IS AN IRREDUCIBLE COLOUR MULTIPLET.** The derived colour representation
on the charged 6-space `Vsub = 3 ⊕ 3̄` (N42c) has NO proper nonzero colour-invariant ℚ-subspace:
the quark colour triplet is a single indivisible irreducible fundamental, forced by the
self-blindness / perfectness of the derived colour (the derived gauge symmetry has no fixed
self-direction in the charged matter). Advances ★3 (one generation of matter) — the MODULE-level
irreducibility that N248–N250 opened only at the ALGEBRA level (faithful/dim-8/ℂ-linear).

## HEADLINE STATEMENT (production, `Phys/Algebra/TowerGatherIrreducibleColourMatter.lean`)

- ⭐⭐⭐ `no_proper_invariant_Vsub` : for `W ≤ Vsub` colour-invariant (∀ D ∈ colourCentralizer,
  D maps W→W) with `0 < finrank W < 6`, `False`. (Vsub is an irreducible colour module.)
- ⭐⭐⭐ capstone `irreducible_colour_matter_structure` bundling the no-proper-invariant fact +
  the ℂ-refinement + W8 teeth.
- ⭐⭐ (ℂ-refinement, if cheap) the commutant of `colourRepImg` in `End ℚ Vsub` is the FIELD
  `ℚ[chargeOpV] ≅ ℂ` (dim 2, `chargeOpV² = −id` banked N242) — so via the double centralizer the
  charged matter is a COMPLEX-irreducible "fundamental 3", the genuinely-complex (non-self-conjugate)
  triplet (ties to N241 charge exchanges 3↔3̄). MAY scope out to optional hardening if W9-heavy.
- ⭐⭐ W8 teeth: non-vacuity — Vsub is 6-dim (`finrank_Vsub`, N42c) and colour acts nontrivially
  (`colourRepV_ne_zero`, N249) so the statement is not vacuous; a WRONG dimension bites the costume.

## MEASURE-FIRST (W9) — DONE, exact ℚ, both agree (workbench/N261-select/probe_irreducible_colour{,_v2}.py)
- dim colour = 8; colour PERFECT ([colour,colour]=colour, dim 8; brackets ⊆ colour). ✓
- IRREDUCIBLE over ℚ: every nonzero v ∈ Vsub generates all 6 dims (min cyclic dim = 6). ✓
- commutant C on Vsub: dim 2, contains J with J²=−I (a FIELD, complex type). ✓
- enveloping algebra A: dim 18 = 36/2 (double-centralizer consistent: dim V²/dim C). ✓

## THE ROUTE (template = `no_proper_invariant_ImO` N28 / DerivationIrreducibleFull, adapted colour+Vsub)
The so(6) dimension bound excludes invariant dims 2,3,4; the fold-native skew-forces-fixed
argument excludes 1,5. Concretely, for colour-invariant `W ≤ Vsub`, `0 < d = finrank W < 6`:
1. Born complement `W' := gBil.orthogonal W ⊓ Vsub`, also colour-invariant
   (`deriv_mapsTo_orthogonal` — colour D is skew-adjoint, so maps W⊥→W⊥; and Vsub colour-invariant).
   `W ⊔ W' = Vsub`, `Disjoint W W'`, `finrank W + finrank W' = 6` (isCompl_gBil_orthogonal on Vsub).
2. `colourCentralizer` (dim 8) INJECTS into `skew(Φ|W) × skew(Φ|W')` via FAITHFULNESS on Vsub
   (N249 `colourRepV_faithful`): if colour D kills W and W' it kills Vsub=W⊕W' ⟹ colourRepV D = 0
   ⟹ D = 0. [reuse `restrictToSkew` machinery on W ⊆ Vsub ⊆ O ℚ, invariance = colour-invariance.]
3. so(n)-bound (`finrank_skewAdjoint_le_choose`, banked): `8 ≤ C(d,2)+C(6−d,2)`.
   d=2→7, d=3→6, d=4→7, all `< 8` ⟹ `decide` FALSE. Excludes d ∈ {2,3,4}.
4. d=1 (and d=5 on W'): THE FOLD-NATIVE CRUX. A 1-dim colour-invariant `span{v}`, v∈Vsub, v≠0:
   ∀ D∈colour, `D v = λ_D • v`, λ_D ∈ ℚ. Skew-adjointness (`gFormQ_skew`):
   `gForm(Dv,v) = −gForm(v,Dv)` ⟹ `2 λ_D gForm(v,v) = 0`; Born anisotropy `gForm_self_eq_zero`
   (v≠0 ⟹ gForm(v,v)≠0) ⟹ `λ_D = 0` ⟹ `D v = 0` ∀ colour D ⟹ `v ∈ colourInvariants`
   = `span{sgl}` (N252 `colourInvariants_eq_span_sgl`, sgl = u1). But `v ∈ Vsub` and
   `singlet_disj_Vsub` (`Disjoint (span{u1}) Vsub`, N42c) ⟹ `v = 0`, contradiction.
   [This is self-blindness one level up: the derived colour has no fixed self-direction in matter.]

## BANKED LEVERS (all confirmed present — grep'd)
- N28: `finrank_skewAdjoint_le_choose`, `restrictOp`/`restrictToSkew`/`restrictOp_skew`,
  `gBil_restrict_symm`, `gBil_restrict_nondegenerate`, `finrank_restrictSkew_le`,
  `deriv_mapsTo_orthogonal`, `isCompl_gBil_orthogonal` (DerivationIrreducible{,Full}.lean).
- N249 `colourRepV_faithful` / `colourRepV_ker_eq_bot`; N248 `colour_mapsTo_Vsub`, `colourVFun`.
- N201 `colourCentralizer` (`finrank_colourCentralizer_eq_eight`), `mem_colourCentralizer`.
- N252 `colourInvariants_eq_span_sgl` (colourInvariants = ⨅ ker imRep over colour = span{sgl}).
- N42c `Vsub` (`finrank_Vsub = 6`), `Vsub_le_ImO`, `singlet_disj_Vsub`, `singlet = span{u1}`.
- N24 `gFormQ_skew`, `gForm_self_eq_zero` (Born anisotropy), `gForm_symm`.
- N242 `chargeOpV_sq` (chargeOpV² = −id) for the optional ℂ-refinement.

## KILL BUDGET (W9)
- Whole-module olean target ≤ ~45s (template N28 built within Phys; all levers banked, no coordinate
  bash). The only `decide` is the tiny `8 ≤ C(d,2)+C(6−d,2)` numeric (d∈{2,3,4}) — trivial.
- KILL: if any single obligation exceeds ~90s in a bounded probe, STOP and decompose (do NOT raise
  proof-kernel maxHeartbeats; the synthInstance 400000 instance-search bump is the only permitted one,
  banked N255/N257–N260 precedent). If the ℂ-refinement commutant proof is heavy, SCOPE IT OUT to
  optional hardening (child), keep the ℚ-irreducibility headline.
- MEASURE-FIRST rule: scratch-probe the two NOVEL pieces (the colour-restricted faithful injection
  step 2, and the d=1 skew-forces-fixed step 4) in isolation BEFORE full production.

## COSTUME (C292) — plan
Bite at the irreducibility TEETH via the banked dimension: a WRONG reading (Vsub reducible / a
proper invariant exists / the matter splits) reduces through `finrank_Vsub = 6` (or the
no-proper-invariant fact) to a false numeric `6 = 292`. Pair (292, 6) fresh; RHS 292 distinct from
every prior right-hand value (last was C291 `21 = 291`).

## STANDARD / MOAT / physics-words-removable
- UNBROKEN: every object derived (colourCentralizer, Vsub, gForm, chargeOpV back to the fold);
  Mathlib only as machinery (Submodule/finrank/BilinForm/exteriorPower). No posit but the fold.
- MOAT / DISSOLUTION: the field POSITS the quark colour triplet as an irreducible SU(3) fundamental
  (chosen representation content); the theory DERIVES the irreducibility from the perfectness /
  self-blindness of the derived colour + the no-fixed-axis-in-matter fact (N252). The wall "why is
  matter an irreducible multiplet?" dissolves into a consequence of the fold's self-blindness.
- WORDS-REMOVABLE: delete colour/quark/triplet/matter/fundamental → "the derived 6-dim charged
  submodule Vsub of Im(O ℚ) has no proper nonzero subspace invariant under all colourCentralizer
  elements" — a pure math theorem, all physics words gone, still true.
- FREE-FLOATING check: the headline TYPE mentions the banked tower objects (Vsub, colourCentralizer,
  gForm on the derived O ℚ) — the CONCRETE charged matter module, NOT a carrier-agnostic irreducibility.

## RESUME
Fresh single-flight run 549; workbench had no prior N261 probes; derived the route + measured from
scratch this run.
