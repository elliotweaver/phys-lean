# N24 PREREG — frozen BEFORE production Lean. THE COMPACT-FORM / TYPE-G₂ PINNING, increment 2.

## Target (ticket / ROADMAP §N24)
Prove FORWARD the next sharpest TRACTABLE compact-form / type-G₂ invariant(s) of the banked
14-dim Lie algebra `derivationLieQ` (N21 bracket table; N22 faithful 7-rep; N23 perfectness),
NO posited G₂. Candidates: (A) irreducibility of the faithful 7-rep, (B) Killing-form
nondegeneracy=semisimplicity, (C) Killing negative-definiteness (compact signature), (D) simplicity.

## MEASUREMENT (W9 — route decided by a bounded measurement, NOT a guess)
Numerics re-verified (W6, workbench/N23-g2-compact-form/route_probe.py + /tmp/skewcheck.py,
exact-rational, reusing the BANKED 14 derivations + bracket table):

  • ★★ THE TRUNK DISSOLUTION OF (B)+(C). The DEFINING trace form on the derivation algebra
    B(D,E) := tr_{O ℚ}(D∘E) is NEGATIVE-DEFINITE. PROOF THROUGH THE TRUNK (THE ONE LAW): every
    derivation is SKEW-ADJOINT for the Born form (banked N17 `deriv_skew_polar`:
    reQ(Dx·star y)+reQ(Dy·star x)=0 ⟹ in the orthonormal coordinate basis the matrix M of D
    satisfies M=−Mᵀ — re-verified: all 14 `D[k][i][j]=-D[k][j][i]`). Hence
    B(D,D) = tr(M·M) = Σ_{i,j} M_ij M_ji = -Σ_{i,j} M_ij² ≤ 0, and =0 ⟺ M=0 ⟺ D=0. So the
    trace form is negative-definite ⟹ nondegenerate. The feared 14×14 Killing determinant is
    ENTIRELY AVOIDED: we use the CHEAP defining 8-dim trace form, not the adjoint 14×14 one,
    and definiteness comes from skew-adjointness + sum-of-squares positivity, NOT a nested det.
    (Numerics: B(D_k,D_k)=tr(M²)=-Σ M² confirmed for sample k.) → THIS NODE.
  • SEMISIMPLICITY (B) FOR FREE FROM NONDEGENERACY. Mathlib
    `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` takes ANY nondegenerate, reflexive,
    `lieInvariant` bilinear form + "no abelian atoms" hL ⟹ `IsSemisimple ℚ derivationLieQ`.
    The trace form is `lieInvariant` (Mathlib `LieModule.traceForm_lieInvariant`, FREE) and
    symmetric/reflexive (`traceForm_isSymm.isRefl`, FREE). hL: an abelian atom I would lie in the
    radical of the nondeg invariant form ⟹ trivial (Dieudonné). → THIS NODE if it elaborates cheap.
  • (A) IRREDUCIBILITY HOLDS (orbit-span 7 from every vector; generated algebra full 49-dim,
    Burnside) — needs `LieModule.IsIrreducible` = `IsSimpleOrder (LieSubmodule ℚ derivationLieQ (ImO))`
    setup over the abstract 7-space. The 7-rep `imRep` + `derivLieQ_mapsTo` give the action; the
    no-proper-invariant-submodule proof is a separate build. → CHILD (if not reached this node).
  • (D) SIMPLICITY = IsSemisimple + the 7-rep faithful + perfect, OR directly. With semisimple
    (B) banked + N23 perfect + the single off-diagonal-block structure, simplicity is the next
    increment but may need the atom analysis. → CHILD (if not reached this node).

## ROUTE TAKEN — (2) REFRAME THROUGH THE TRUNK then bank forward (W1 step 2 / W3).
Bank the NEGATIVE-DEFINITENESS / NONDEGENERACY of the defining trace form (the compact
signature, invariant C — the ticket's feared W9 beast, DISSOLVED through skew-adjointness),
and — if it elaborates within budget — SEMISIMPLICITY (invariant B, Cartan's criterion) via
the Mathlib InvariantForm bridge. This is the structurally decisive compact-form pin: a
negative-definite invariant form is THE defining feature of the compact real form, and
semisimplicity is the Cartan-criterion payoff. Bank-as-you-go (W9.8): commit definiteness the
instant it compiles, then attempt semisimplicity; child whatever is not reached (A irreducibility,
D simplicity if not free, then the automorphism Lie GROUP).

## DELIVERABLE (N24) — `Phys/Algebra/DerivationCompact.lean`:
  1. `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` — the 8 coordinate functionals as a linear equiv (the
     orthonormal coordinate frame the trace computes in); `bO : Basis (Fin 8) ℚ (O ℚ)` its basis.
  2. `gForm x y := reQ (x * star y)` — the Born bilinear form on `O ℚ` (banked reQ + star);
     `gForm_posdef`/`gForm_orthonormal` on `bO` (g(e_i,e_j)=δ_ij), and `g(x,x)=Σ coord²>0` for x≠0.
  3. `traceForm ℚ derivationLieQ (O ℚ)` (Mathlib) on the derivation Lie algebra. The skew-adjoint
     identity from N17 lifted to ℚ: `reQ (D x * star y) = - reQ (x * star (D y))` ⟹ the matrix of
     D in `bO` is skew (`Mᵀ = −M`). ★ `traceForm_neg : B(D,D) = -Σ (coord of D e_i)²` ≤ 0.
  4. ★★ `traceForm_neg_definite : B(D,D)=0 → D=0` (sum of squares zero ⟹ each entry 0 ⟹ D=0 by
     `determined`/coordinate vanishing), hence ★★ `traceForm_nondegenerate`.
  5. ★★ `derivationLieQ_semisimple : LieAlgebra.IsSemisimple ℚ derivationLieQ` via
     `InvariantForm.isSemisimple_of_nondegenerate` (Φ := traceForm), using free invariance +
     reflexivity + hL (no abelian atoms from nondegeneracy). [If heavy → CHILD, bank 1–4.]
  6. Anti-vacuity: the form is nonzero (`traceForm witnessLieQ witnessLieQ = -4 ≠ 0` — the banked
     nonzero witness has negative self-form), so nondegeneracy/semisimplicity has teeth.
  7. Costume C44: a WRONG claim FAILS — assert the trace form is degenerate / B(witness,witness)=0
     (claim the nonzero witness is in the radical) → contradicts B(wit,wit)=-4<0; false core.

## GO / NO-GO
GO if: (3)+(4) negative-definiteness/nondegeneracy elaborate clean foundations-only AND C44 bites.
STRETCH: (5) semisimplicity if the InvariantForm bridge elaborates within budget.
NO-GO / re-scope: if the trace-form coordinate computation fights the kernel (traceForm reduction
to the explicit 8 functionals heavy), bank the UNBUNDLED skew-adjoint trace identity + the
sum-of-squares B(D,D)≤0 + definiteness on the explicit basis derivations, and child the abstract
nondegeneracy/semisimplicity assembly.

## KILL BUDGET (W9)
  • Compile-cost KILL: 90s per single obligation in a bounded probe. If any one lemma exceeds 90s
    → STOP, decompose/reframe; do NOT inflate maxHeartbeats (default only).
  • The risk: `traceForm` reduction (Mathlib `trace_eq_matrix_trace` / `trace_eq_contract_of_basis`)
    over `bO` — MEASURE in scratch BEFORE production. The skew identity is banked-cheap (N17 lift).
  • Turn-budget checkpoint at ~50%: if definiteness not banked, COMMIT what compiles, child the rest,
    FINALIZE with turns to spare. Bank-as-you-go (W9.8): commit each clean lemma instantly.
  • RECURRING LIFECYCLE WARNING (N17/N22/N23 timed out on iteration budget before banking): checkpoint
    EARLY, FINALIZE (commit + child + complete) with turns to spare. Never run an unbounded compile.

## STANDARD self-check (applied before "done")
  • UNBROKEN: trace form / definiteness / semisimplicity built from banked derivationLieQ + N17
    skew + N19 finrank + the coordinate frame; Mathlib traceForm/InvariantForm/IsSemisimple are
    MACHINERY on the derived object (§3). No posited G₂.
  • COMPLETE: foundations-only ⊆ {propext,Classical.choice,Quot.sound}; verify #print axioms.
  • PHYSICS-WORDS-REMOVABLE: delete "g₂/gauge/compact/exceptional/Killing" ⟹ pure statement that
    the defining trace form of the 14-dim Lie algebra of Leibniz-derivations of CD³(ℚ) is
    negative-definite hence nondegenerate, and the algebra is semisimple. No physics word load-bearing.

## ANTI-VACUITY (W8) — the costume MUST bite
A WRONG claim must fail: asserting the trace form is degenerate (the nonzero witness in the radical),
or B(witness,witness)=0. Reuse banked derivationLieQ + N17 skew + the nonzero witness — never a
fresh table. Negative-definiteness is NOT automatic (a nilpotent/abelian algebra has degenerate
trace form), so the result has teeth.
