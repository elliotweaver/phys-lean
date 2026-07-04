# N287 PREREG — THE GAUGE-NEUTRAL INNER-DERIVATION MEMBER OF f₄ (INPUT-A dissolution)

## TARGET (committed via SELECT, ticket rewritten; anti-bullshit gate passed in full, comments 195–198)

The derived `f₄ = Der(H₃(O)) = derH3` (N285/N286) SUPPLIES a nonzero member of the
inner-derivation complement `f₄/g₂` that COMMUTES WITH THE ENTIRE DERIVED GAUGE
`g₂ = Der(O) = derivationLieQ` — the colour-neutral room so(7)/so(8) provably lacked
(N283 joint centralizer(su(2)_L + colour) = 0). One carrier up, the fold-forced arena, the room
appears (measured joint centralizer ≥ 3).

## MEASURED-FIRST (exact-Fraction octonion table = N283 convention + numpy nullspaces; workbench/N287-select/)

- `dim Der(O) = 14` (colour g₂), `colour = stab_{g2}(u1) = 8`, `dim Der(H₃(O)) = 52` (genuine F₄).
- so(8) [N283]: joint centralizer(su(2)_L + colour) = **0**. Derived f₄ [this run]: joint
  centralizer(colour + su(2)_L) = **3 ≠ 0**. THE WALL IS GONE one carrier up.
- `centralizer_{f4}(colour su(3))` = a GENUINE second su(3): dim 8, commutes with colour (1e-16),
  colour∩it = 0 (direct sum dim 16), bracket-closed (1e-16), non-abelian (28 nonzero brackets),
  Killing rank 8 + centre 0 (SEMISIMPLE), rank 2. The maximal-rank F₄ ⊃ su(3)_c ⊕ su(3)_ew pattern,
  DERIVED. Disjoint from jActL(g₂) (intersection 0) — entirely in the N286 inner-derivation complement.
- `centralizer_{f4}(FULL g₂, 14-dim) = 3` = EXACTLY the inner-derivation algebra of the REAL
  sub-arena J₃(ℝ) (real-entried innerMul), = so(3) (dim 3, closed, non-abelian, 27 nonzero brackets).
- THE MECHANISM (coordinate-free lever, COMPILING in scratch, EXIT 0):
  `⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B)` (forced by banked
  `jAct_jb`). Corollary: colour D kills 1 & u1 → A,B in ℂ-core span{1,u1} → colour commutes with
  innerMul(A,B). Verified maxerr 1e-14. The banked N286 member M0 = innerMul(slotA 1, slotB 1)
  (all-real entries) commutes with the WHOLE gauge g₂, escapes g₂ (residual 2.0), moves the
  diagonal (N286 escape certificate).

## DELIVERABLE (Phys/Algebra/OctonionJordanGaugeNeutralInnerDerivation.lean, ns Phys.Algebra.HJ)

All de-risked & COMPILING in workbench/N287-select/probe_full.lean (EXIT 0):
1. `innerMul_gauge_leibniz` — THE LEVER: `⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B)`.
2. `innerMul_zero_left` / `innerMul_zero_right` — bilinearity vanishing.
3. `jAct_slotA_one` / `jAct_slotB_one` — `jAct D (slotA 1) = 0` via `derivQ_one` (D 1 = 0).
4. ★ `M0_gauge_central` — `⁅jActL D, innerMul (slotA 1)(slotB 1)⁆ = 0` for every derivation D.
5. ★★★ capstone `gauge_neutral_inner_derivation_in_f4` — bundles: M0 ∈ derH3 (banked
   `inner_derivation_in_f4`) ∧ M0 gauge-central (∀ D, ⁅jActL D, M0⁆ = 0) ∧ M0 escapes g₂
   (`innerMul_moves_diagonal`, carried in the type) — a nonzero, gauge-neutral, genuinely-non-gauge
   member of the derived f₄. The INPUT-A structural dissolution.

## SCOPE (SUFFICIENT — W4.5; each non-banked item CHILDED not smuggled)

- BANKS: the forced gauge-commuting inner-derivation member + the coordinate-free Leibniz lever.
- NOT banked: (a) the full second su(3)_ew as a complete simple 8-dim LieSubalgebra (next rung);
  (b) the room = so(3) = Der(J₃(ℝ)) identification; (c) the ★2 mixing-angle VALUE (INPUT B,
  route-not-yet-found — a FORCED build target, NOT invented, NOT human-gated); (d) '= physical
  hypercharge/F₄' (removable prose).

## STANDARD

- UNBROKEN: jActL/jAct/jAct_jb (N268/N284), innerMul/innerMul_apply/innerMul_moves_diagonal (N274),
  derH3/inner_derivation_in_f4/slotA_one_herm (N285/N286), derivQ_one/IsDerivQ (N20/DerivationFinrank),
  slotA/slotB/Xz (N267/SinglePair). All on the derived `Matrix (Fin 3)(Fin 3)(O ℚ)`.
- COMPLETE: foundations-only `[propext, Classical.choice, Quot.sound]`; no sorry/axiom/native_decide;
  no proof-kernel maxHeartbeats raise (the lever is a coordinate-free `abel`; synthInstance bump only
  if needed, banked precedent).
- WORDS-REMOVABLE: delete gauge/colour/electroweak/hypercharge/f₄/g₂: "a nonzero member of the
  LieSubalgebra derH3 (the inner-multiplication commutator innerMul (slotA 1)(slotB 1)) commutes with
  every element of the jActL-image of derivationLieQ and moves the diagonal that image fixes" — stands
  as pure math.

## COSTUME C316 (bites; pair fresh)

Anchor the gauge-neutrality-AND-non-triviality certificate: the member M0 both commutes with the
gauge (M0_gauge_central) AND genuinely moves matter (banked reQ(M0 (Dg 0 0 1)) 1 2 = 1). Bogus reading
(M0 does NOT commute with the gauge / the neutral room is empty / f₄ has no more room than so(8))
reduces through the banked value to a false numeric `1 = 316`. Pair (316, 1) fresh (RHS 316 distinct).

## FOUNDATIONS

Independent `#print axioms` audit vs the freshly-built olean for every new decl before commit; gate
D6-fast audit lines appended to Audits/AxiomAudit.lean.
