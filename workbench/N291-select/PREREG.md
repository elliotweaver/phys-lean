# N291 PREREG — THE GAUGE-COVARIANT, COLOUR-NEUTRAL, FAMILY-VISIBLE COUPLING MEMBER OF f₄

## TARGET (committed via SELECT; anti-bullshit gate passed in full, comments 207–208)

The derived `f₄ = Der(H₃(O)) = derH3` (N285/N286) decomposes (as a vector space) into three
fold-forced pieces:
  f₄ (52) = jActL(g₂) [14, the entrywise gauge] ⊕ family-so(3) [3, N288/289] ⊕ CROSS [35 = 7×5].
N288–N290 banked ONLY the family piece and its self-blindness. THIS node banks a concrete,
fold-forced member of the CROSS complement — the object N290 named as ★5's missing
"family-symmetry-BREAKING derived object":

  Mc := innerMul (slotA u1) (slotB 1)     (u1 = the fold-root √−1, imaginary; slotA u1 Hermitian)

and its DEFINING covariance law, proving Mc is genuinely gauge-COVARIANT (unlike the family
so(3), which is gauge-central) AND family-VISIBLE (unlike N290's family-blind core), with the
deep tie that Mc is COLOUR-NEUTRAL but ISOSPIN-CHARGED — the fold-root's colour-blindness (N266)
forces the family-breaking coupling into the electroweak (colour-neutral) sector, joining ★5↔★2.

## MEASURED-FIRST (exact-Fraction octonion table = N283/N287/N288 convention + numpy; workbench/N291-select/, all EXIT 0)

- f₄(52) = jActL(g₂)[14] ⊕ family-so(3)[3] ⊕ CROSS[35]: rank(g₂ ∪ family) = 17 (disjoint);
  rank(f₄) = 52; complement dim = 52 − 17 = 35 = 7×5.
- Mc ∈ f₄ (residual 1.5e-15), ∉ jActL(g₂) (res 0.5), ∉ family-so(3) (res 0.5), ∉ g₂+family (res 0.5)
  — genuinely in the CROSS complement.
- ★ EXACT COVARIANCE: ⁅jActL D, Mc⁆ = innerMul(slotA (D u1))(slotB 1), residual **0.0** (the SAME
  N287 Leibniz lever; NO coordinate bash). slotA u1 Hermitian ✓.
- COLOUR-NEUTRAL: max ⁅jActL colour, Mc⁆ = 1.1e-15 (colour kills u1, banked D u1 = 0 ⟺ colour);
  ISOSPIN-COVARIANT: ⁅jActL DJ, Mc⁆ = 1 ≠ 0, ⁅jActL DK, Mc⁆ = 1 ≠ 0. DJ u1 = iotaO(−2 hK) ≠ 0 ✓.
- FAMILY-VISIBLE: ⁅R12, Mc⁆ = 1 ≠ 0 (the family so(3) MOVES Mc — contrast N290's blind core).
- Mc moves the diagonal Dg(0,0,1) (0.25 ≠ 0) — escapes gauge (via N274 innerMul_slot_diag).

## DELIVERABLE (Phys/Algebra/OctonionJordanGaugeFamilyCoupling.lean, ns Phys.Algebra.HJ)

All levers banked (route de-risked, see below):
1. `coupling_mem_derH3` — Mc = innerMul(slotA u1)(slotB 1) ∈ derH3 (via innerMul_mem_derH3 + Xz_herm u1 0 0 + slotB_one_herm).
2. ★★ `coupling_covariance` — ⁅jActL D, Mc⁆ = innerMul(slotA (D u1))(slotB 1), ∀ IsDerivQ D
   (via innerMul_gauge_leibniz + jAct_slotA + jAct_slotB_one + innerMul_zero_right). THE DEFINING LAW.
3. `coupling_gauge_neutral_iff_kills_u1` — ⁅jActL D, Mc⁆ = 0 ⟺ innerMul(slotA (D u1))(slotB 1) = 0,
   and (via slotA-injectivity/entry-extraction) ⟺ D u1 = 0. (The covariance made an iff.)
4. ★★ `coupling_colour_neutral` — for colour D (D u1 = 0), ⁅jActL D, Mc⁆ = 0 (Mc colour-neutral):
   substitute D u1 = 0 into the covariance ⟹ innerMul(slotA 0)(slotB 1) = 0.
5. ★★ W8 TEETH `coupling_isospin_covariant_ne_zero` — ⁅jActL DJ, Mc⁆ ≠ 0 (Mc genuinely gauge-COUPLED,
   NOT gauge-central like the family): covariance gives innerMul(slotA (DJ u1))(slotB 1); DJ u1 = iotaO(−2 hK) ≠ 0;
   nonzero via the innerMul_slot_diag entry (moves the diagonal) — Mc genuinely SEES the gauge.
6. `coupling_escapes_gauge` — Mc ∉ jActL(g₂)-image style tooth: Mc moves the diagonal
   (innerMul_moves_diagonal analog for slotA u1 — via innerMul_slot_diag entry ≠ 0) that jActL fixes.
7. ★★★ capstone `gauge_family_coupling_member` — bundles: Mc ∈ derH3 ∧ the covariance law ∧
   colour-neutral ∧ isospin-covariant (≠ 0) ∧ moves the diagonal — carrying jordan_fails_H4 in the TYPE.

## SCOPE (SUFFICIENT — W4.5; each non-banked item CHILDED not smuggled)

- BANKS: the concrete forced cross-member + its exact covariance law + colour-neutral-vs-isospin-charged
  teeth + escapes-both + non-vacuity.
- NOT banked: (a) the FULL 35-dim CROSS complement as a module / the (7,5) g₂×so(3) branching character
  (the heavy module-multiplicity computation — the N290-scoped-out analog, W9-risky, optional hardening);
  (b) the ★2 mixing-angle VALUE (INPUT B, route-not-yet-found — a FORCED build target, NOT invented,
  NOT human-gated); (c) the actual ★5 mass texture / CKM-PMNS / Yukawa couplings; (d) '= physical
  Higgs/flavour-breaking' (removable prose).

## STANDARD
- UNBROKEN: innerMul/innerMul_apply/innerMul_slot_diag/innerMul_moves_diagonal (N274),
  slotA/slotB/Xz/slotC_entry (N267), innerMul_gauge_leibniz/jAct_slotB_one/innerMul_zero_right (N287),
  jAct_slotA/jAct_slotB (N268 GaugeUniversality), innerMul_mem_derH3/Xz_herm/slotB_one_herm (N285/N286),
  derivQ_one/IsDerivQ (N20), u1/DJ/DJ_u1 (N201/DerivationColourIsospinMeet), iotaO (cascade). All on
  the derived `Matrix (Fin 3)(Fin 3)(O ℚ)`.
- COMPLETE: foundations-only `[propext, Classical.choice, Quot.sound]`; no sorry/axiom/native_decide;
  NO maxHeartbeats raise (every step is a banked-lever rewrite; the covariance is a 4-rewrite `rw`).
- WORDS-REMOVABLE: delete gauge/family/generation/colour/isospin/electroweak/texture: "the member
  innerMul(slotA u1)(slotB 1) of the LieSubalgebra derH3 satisfies ⁅jActL D, ·⁆ = innerMul(slotA (D u1))(slotB 1),
  which vanishes iff D u1 = 0; it lies outside the jActL-image and the so(3) centralizer, and moves the
  diagonal" — stands as pure math.
- NOT FREE-FLOATING: every headline TYPE cites banked innerMul/slotA/slotB/jActL/derH3/u1 on
  Matrix(Fin 3)(Fin 3)(O ℚ); capstone carries jordan_fails_H4.
- ANTI-VACUITY (W8): coupling_isospin_covariant_ne_zero (⁅jActL DJ, Mc⁆ ≠ 0) proves the coupling is
  GENUINE (Mc is not gauge-central); coupling_colour_neutral + it distinguishes colour from isospin.

## COSTUME C320 (bites; pair fresh)
Anchor the coupling-is-genuine certificate: Mc genuinely SEES the gauge (⁅jActL DJ, Mc⁆ ≠ 0 via
DJ u1 ≠ 0) AND is colour-neutral. Bogus reading (Mc is gauge-CENTRAL like the family / the cross-term
is empty / f₄ has no coupling beyond gauge⊕family) reduces through a banked nonzero entry value to a
false numeric `1 = 320`. Pair (320, 1) fresh (RHS 320 distinct).

## FOUNDATIONS
Independent `#print axioms` audit vs the freshly-built olean for every new decl before commit; gate
D6-fast audit lines appended to Audits/AxiomAudit.lean.

## COMPILE-COST BUDGET / KILL (W9)
Whole olean expected LIGHT (~15–35s, all banked-lever rewrites, no coordinate ring, no native_decide).
KILL: if any single obligation needs maxHeartbeats > 400k or a coordinate `ring`/`decide` over octonion
matrices, STOP — that signals a wrong framing (reframe through the covariance lever, not entry expansion).
The covariance law is FOUR rewrites; the teeth are entry-extractions via innerMul_slot_diag (banked).
