# N22 PREREG — frozen BEFORE production Lean. THE ≅ g₂ ROUTE DECISION.

## The target (from the ticket / ROADMAP §N22)
Prove FORWARD that the banked 14-dim Lie algebra `derivationLieQ` (N21, with its full
91-pair bracket table) IS g₂ — as a Lie isomorphism, NEVER a posited G₂ asserted at grade.

## W1 SURVEY (actual Mathlib inspection, NOT a guess) — DONE
Mathlib HAS, via `Mathlib/Algebra/Lie/SerreConstruction.lean`:
  • `Matrix.ToLieAlgebra R CM` — the Serre-relation quotient of the FREE Lie algebra on a
    Cartan matrix `CM` (genuinely DERIVED, not a posited G₂).
  • `LieAlgebra.g₂ R := Matrix.ToLieAlgebra R CartanMatrix.G₂` — a real type-G₂ object.
  • `FreeLieAlgebra.lift`, `LieHom.quotKerEquivRange` — maps out of it.
Mathlib LACKS, for `LieAlgebra.g₂`:
  • ANY structure theory: NO `finrank (g₂ R) = 14`, NO simplicity, NO Chevalley basis,
    NO root-system instance, NO `IsKilling (g₂ R)`. (grep: zero theorems mention `g₂`
    beyond its definition.) So the Serre g₂ is an opaque quotient with no usable invariants.

## THE DECISIVE OBSTRUCTION (route-deciding numerics, workbench/N22.../killing_rep.py,
   EXACT Fraction, reusing the BANKED 14 derivations + proved bracket table — W6):
  • Killing form K(Di,Dj)=tr(adDi·adDj) on the 14 basis derivations: rank 14 (nondegenerate),
    diagonal all −16, and NEGATIVE-DEFINITE (leading principal minors of −K all > 0, det≠0).
  • ⟹ `Der(O ℚ)` is the COMPACT real form of g₂ (anisotropic/DIVISION octonions).
  • The Serre `LieAlgebra.g₂ ℚ` is the SPLIT form (indefinite Killing form over ℝ).
  • COMPACT ≇ SPLIT over ℚ (definite vs indefinite Killing form is an isomorphism invariant).
  ★ THEREFORE a literal `LieEquiv ℚ derivationLieQ (LieAlgebra.g₂ ℚ)` is FALSE. THE ONE LAW:
    forcing it would fight me because the TARGET is wrong, not the theory. The honest target
    is "the COMPACT real form of the 14-dim simple Lie algebra of type G₂", pinned by
    invariants, NOT a LieEquiv to the split Serre object.

## ROUTE TAKEN — (3) DECOMPOSE to the sharpest TRACTABLE invariant (W1 step 3 / W3).
Routes (1) [LieEquiv to Mathlib g₂] and (2) [build the abstract type-G₂ + LieEquiv] are BOTH
blocked: (1) is FALSE (compact≠split); (2) needs the full simple-Lie classification
(finrank/simplicity/root-system of the Serre quotient) which Mathlib lacks and which is a
multi-node build. Per W1 step 3 / W3, bank the SHARPEST proved invariant pinning
`derivationLieQ` as compact-type-G₂, child the rest.

Candidate invariants, ranked by tractability (numerics confirm all hold):
  (A) FAITHFUL 7-dim representation on Im(O ℚ): every derivation maps Im→Im (banked
      `deriv_maps_im`) and kills 1 (banked `derivQ_one`); the restriction to the 7-dim
      imaginary subspace is FAITHFUL (rank of the 14 restricted 7×7 maps = 14). This is THE
      G₂ FUNDAMENTAL 7-REPRESENTATION. ★ CHOSEN — cleanest, builds on banked N17/N18/N20,
      faithfulness ≈ free via the banked `determined` lemma. TRACTABLE.
  (B) Killing form negative-definite / nondegenerate (compact signature) — W9 BEAST: 14×14
      rational-matrix definiteness via principal minors / 14×14 det ≠ 0 (det is 16 digits).
      Monolithic coordinate computation W9 forbids. → CHILD N23.
  (C) Simplicity (no nonzero proper ideal) — hard from the 14×14 bracket table. → CHILD N23.

## DELIVERABLE (N22) — the FAITHFUL 7-dim representation, derived FORWARD:
  1. `ImO : Submodule ℚ (O ℚ)` := ker(star + id) (the imaginary subspace; star is ℚ-linear).
  2. `finrank_ImO_eq_7` — via rank–nullity: range(star+id)=ℚ·1 (finrank 1), finrank O=8 (N19).
  3. `derivQ_mapsTo_ImO` — D∈derivationLieQ maps ImO into ImO (from banked `deriv_maps_im`).
  4. `imRep : derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` — restriction-to-Im Lie homomorphism
     (the G₂ fundamental 7-rep), bracket respected because ImO is invariant.
  5. ★★ `imRep_injective` — FAITHFUL: imRep D = 0 ⟹ D u1=D u2=D u4=0 (u1,u2,u4∈ImO) ⟹ D=0
     by the banked `determined` lemma. A 14-dim Lie algebra faithfully on a 7-dim space.
  6. Anti-vacuity: `witnessDerivQ` has NONZERO image under imRep (non-trivial rep).
  7. Costume C42: a WRONG faithfulness/dim claim FAILS to compile.

## GO / NO-GO
GO if: (4)+(5) elaborate clean foundations-only AND a costume bites. The faithful 7-rep is a
genuine forward increment (the G₂ fundamental representation, derived not posited).
NO-GO / re-scope if: the LieHom bundling (4) fights the kernel — then bank the UNBUNDLED facts
(2,3,5-as-`determined`-corollary,6) which ARE the faithful 7-rep, and child the bundle.

## KILL BUDGET (W9)
  • Compile-cost KILL: 90s per single obligation. If any one lemma exceeds 90s in a bounded
    probe → STOP, decompose or reframe; do NOT inflate maxHeartbeats (default only).
  • The risky pieces are finrank=7 (rank-nullity) and the LieHom bundle. MEASURE each in
    scratch before production. No monolithic coordinate computation (the Killing det is CHILDED).
  • Turn-budget checkpoint at ~55%: if not banked by then, COMMIT what compiles, child the rest,
    FINALIZE (commit+child+complete) with turns to spare. Bank-as-you-go (W9.8): commit each
    clean lemma the instant it elaborates.

## STANDARD self-check (applied before "done")
  • UNBROKEN: ImO/imRep built from banked O ℚ + derivationLieQ + deriv_maps_im + determined;
    Mathlib Submodule/LinearMap/LieHom are MACHINERY on the derived object (§3). No posited G₂.
  • COMPLETE: foundations-only ⊆ {propext,Classical.choice,Quot.sound}; verify #print axioms.
  • PHYSICS-WORDS-REMOVABLE: delete "g₂/gauge/fundamental/representation" ⟹ pure statement that
    the 14-dim Lie algebra of Leibniz-derivations of CD³(ℚ) acts faithfully (injectively) by
    restriction on the 7-dim subspace ker(star+id). No physics word load-bearing.

## ANTI-VACUITY (W8) — the costume MUST bite
A WRONG claim must fail: e.g. asserting imRep is faithful from a FALSE premise, or claiming
finrank ImO = 6/8, or a non-derivation in derivationLieQ. Reuse banked derivationLieQ + the
witness + determined — never a fresh table.
