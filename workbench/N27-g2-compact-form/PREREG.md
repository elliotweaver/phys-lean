# N27 — PREREG (frozen before production Lean)

Node: N27 — the FULL IRREDUCIBILITY of the faithful 7-rep `imRep` on `ImLie`
+ the `IsSimpleOrder(LieIdeal)` simplicity core, FORWARD from the banked structure
(N22 faithful 7-rep, N23 perfect, N24 neg-definite/skew-adjoint, N25 semisimple,
N26 `ImLie`/`gBil`/`derivationLieQ_le_skewAdjoint`/`isSimple_of_isSimpleOrder`).
NO posited G₂.

## CONTEXT / GIT STATE
- Git CLEAN at b8263e7 (N26 landed). NO inherited uncommitted WIP — fresh node start,
  NOT a crime scene (W6 verified: `git status` empty).

## BOUNDED MEASUREMENTS (W6 + W9, re-verified this run)
- route_probe.py (W6): joint kernel of the 7-action = 0 (rank 7); every ρ(D_k) skew on ImO;
  so(d)+so(7−d) count excludes d=2,3,4,5 (=11,9,9,11 < 14), NOT d=0,1,6,7.
- min_kernel.py: the MINIMAL subset of the 14 derivations with joint kernel 0 on ImO is
  size 3 — {D0, D3, D8} (rank 7). ⟹ d=1 exclusion can be a cheap explicit fact.
- Mathlib API located:
  - `LieModule.IsIrreducible R L M := IsSimpleOrder (LieSubmodule R L M)` (Semisimple/Defs).
  - `IsIrreducible.mk : [Nontrivial M] → (∀ N, N ≠ ⊥ → N = ⊤) → IsIrreducible`.
  - `BilinForm.isCompl_orthogonal_of_restrict_nondegenerate (b₁ : B.IsRefl)`
    `(b₂ : (B.restrict W).Nondegenerate) : IsCompl W (B.orthogonal W)` (BilinearForm/Orthogonal).
    ★ THE WEYL-UNITARY-TRICK LEVER, reframed through the trunk's Born positivity.
  - banked: `gForm_symm` (⟹ gBil reflexive), `gForm_self_eq_zero` (anisotropy ⟹ restrict
    nondegenerate on ANY subspace), `deriv_isSkewAdjoint_gBil`, `derivLieQ_mapsTo`,
    `imRep_injective`, `finrank_ImLie=7`, `finrank_derivationQ_eq_14`,
    `derivationLieQ_perfect`/`_semisimple`/`_not_lieAbelian`, `isSimple_of_isSimpleOrder`.

## THE GO (decided by the measurement, not a guess — strict W9.8 bank-as-you-go)

THIS NODE banks the cleanly-tractable, theory-native COMPLETE-REDUCIBILITY core (the
trunk's Born positivity = the Weyl unitary trick), in commit-the-instant-it-elaborates order:

  T1 (the WEYL / BORN-ORTHOGONAL lever — measure FIRST, the crown):
     `gBil.IsRefl` (from `gForm_symm`); `(gBil.restrict W).Nondegenerate` for ANY submodule W
     (from anisotropy `gForm_self_eq_zero`); ⟹ `IsCompl W (gBil.orthogonal W)` for ALL W.
  T2 (INVARIANCE of the orthogonal complement): if `N` is a Lie submodule (invariant via the
     skew-adjoint derivations), `gBil.orthogonal N.toSubmodule` is invariant too — so every Lie
     submodule has a Lie-submodule COMPLEMENT. COMPLETE REDUCIBILITY of the module, theory-native.
  T3 (the d=1 EXCLUSION via skew-adjoint + joint-kernel-0, if cheap): a 1-dim invariant subspace
     ⟹ common eigenvector v, skew-adjointness ⟹ eigenvalue 0 ⟹ v in joint kernel = 0 ⟹ v=0,
     contradiction. Uses {D0,D3,D8} joint kernel 0 (min_kernel.py). Gate T3 on a bounded measure.

CHILD N28 (never asserted here, never a bridge): the d∈{2,3,4,5} dimension-count exclusion
  (needs `dim so(d)+so(7−d) ≤ 11 < 14` — an `so(n)` finrank fact Mathlib LACKS → BUILD per W1)
  ⟹ FULL `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`; then the `IsSimpleOrder(LieIdeal)`
  core ⟹ `IsSimple` (route: full irreducibility + faithfulness ⟹ any nonzero ideal acts as the
  whole). Then the automorphism Lie GROUP.

## NO-GO
- NO posited G₂ / `LieAlgebra.g₂` imported to assert anything (D3 bridge).
- NO `IsSimpleOrder`/`IsIrreducible` asserted without proof.
- NO weakening of any target to make it close (W5 / THE ONE LAW).
- NO `LieEquiv` to the split `LieAlgebra.g₂ ℚ` (FALSE — compact ≇ split, locked N22).

## KILL BUDGET (compile-cost, W9)
- 90s / single obligation. Any obligation crossing 90s → STOP, measure smallest sub-piece,
  decompose or child. NEVER inflate maxHeartbeats.
- If T1's `restrict W` nondegeneracy or T2's invariance crosses 90s in scratch → decompose.

## TURN-BUDGET CHECKPOINT
- At ~55% of turns: FINALIZE whatever is banked (commit + child + complete). Do NOT chase the
  next tier past the checkpoint. (Recurring lifecycle failure: timing out on ITERATION budget
  before banking — checkpoint EARLY, finalize with turns to spare.)

## W8 ANTI-VACUITY (the new costume C47 MUST bite)
- A WRONG invariant must FAIL to compile: e.g. asserting that the orthogonal complement of a
  Lie submodule is DISJOINT from being invariant — or asserting a 1-dim invariant subspace
  EXISTS (`∃ nonzero v, ∀ D, D v ∈ span v` with the action a NONZERO eigenvalue) — collides with
  banked skew-adjointness + anisotropy. Concretely: assert `gForm`-orthogonal complement of `⊤`
  is `⊤` (false: it's `⊥` by nondegeneracy) → false core.

## PHYSICS-WORDS-REMOVABLE
Delete "g₂ / gauge / compact / exceptional / fundamental representation / Weyl": what remains is
the pure statement that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson
double of a double of a double of ℚ acts COMPLETELY REDUCIBLY on its invariant 7-dim subspace
`ker(star+id)` — every invariant subspace has an invariant (Born-orthogonal) complement — with
no 1-dim invariant subspace. No physics word is load-bearing in any theorem STATEMENT.
