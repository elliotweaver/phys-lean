# N30b FINDINGS — W9 MEASUREMENTS (bounded probes, run 147)

## Typeclass-cost diagnosis (the W9 crux)
- `Module A_I ↥ImO` for concrete `A_I := Algebra.adjoin ℚ (Set.range (imRep ∘ I.incl))`:
  SYNTHESIZES (probe1 M1 ✓).
- `IsSemisimpleModule A_I ↥ImO` = banked `semisimpleModule_imRep_adjoin I` ✓.
- `Module.Finite A_I ↥ImO`, even bare `SMul A_I ↥ImO`: TIMES OUT at typeclass synth (20k,40k hb)
  when `A_I` is the CONCRETE adjoin (probe2/3). ⟸ unfolding `Algebra.adjoin (Set.range ...)`.
- With an ABSTRACT `A : Subalgebra ℚ (End ℚ V)`: ALL synthesis fast, ~7s (probe4). 
  ⟹ **ROUTE: prove every lemma GENERICALLY over an abstract `A : Subalgebra ℚ (End ℚ V)`,
  instantiate at `A_I` only at the final theorem (exactly as N30a did the generic bridge).**

## Confirmed-compiling generic lemmas (probe5/6)
- `Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V` ✓ (from `FiniteDimensional ℚ V`).
- `IsScalarTower ℚ A V` auto ✓.
- `isIsotypic_iff_isFullyInvariant_imp_bot_or_top` applies given `haveI : IsSemisimpleModule A V` ✓.
- `IsIsotypicOfType.linearEquiv_fun` fires with `haveI Module.Finite` + `haveI IsSemisimpleModule` ✓.
- `IsIsotypic.linearEquiv_fun` ⟹ `∃ n (_:NeZero n) S, IsSimpleModule A S ∧ V ≃ₗ[A] Fin n → S` ✓.

## Dimension count friction (probe7/8/9)
- `Module ℚ ↥S` for `S : Submodule A V`: synthesizes ✓.
- `FiniteDimensional ℚ ↥S`, `Module.Free ℚ ↥S`, `SMul A ↥S`: do NOT auto-synth (probe8/9).
  ⟹ route the ℚ-dimension through `S.restrictScalars ℚ : Submodule ℚ V` (genuine ℚ-subspace,
  all instances free) rather than `↥S`, OR supply instances explicitly via the A-equiv.

## THE PRIME-7 SPLIT + BRANCHES (math, decided)
`V = ↥ImO`, dim_ℚ V = 7 PRIME. V is A_I-isotypic (L2) ⟹ `V ≃ₗ[A_I] Fin n → S`, S simple,
7 = n · dim_ℚ S ⟹ (n, dim_ℚ S) ∈ {(7,1),(1,7)}.
- BRANCH A (n=7, dim S=1): A_I acts by a ℚ-character; I PERFECT (`atom_isPerfect`) ⟹ each
  imRep(I.incl x) is TRACELESS (lin. comb. of commutators, imRep a Lie hom) AND a scalar ⟹
  7·c = 0 ⟹ c = 0 ⟹ imRep|I = 0 ⟹ ⁅I,ImLie⁆=⊥ ⟹ I=⊥ (`eq_bot_of_lie_ImLie_bot`). ⊥≠I. ✓ CLEAN.
- BRANCH B (n=1, dim S=7): V is A_I-SIMPLE. D := End_{A_I}(V) division ring (Schur). J-action ⊆ D
  (L1 commutant). dim_ℚ D ∣ 7 (V a D-vector space) ⟹ dim_ℚ D ∈ {1,7}.
  - dim_ℚ D = 1 (D=ℚ·id): imRep(J.incl y) scalar + skew-adjoint (N30a `imRep_isSkewAdjoint_gImO`)
    ⟹ 2c·B=0, B nondeg ⟹ c=0 ⟹ J acts 0 ⟹ J=⊥. Iᶜ≠⊥. ✓ (or scalar+traceless if J perfect).
  - dim_ℚ D = 7: D a degree-7 field ⟹ A_I = End_D(V) (Jacobson density, dim_D V=1) commutative
    ⟹ all commutators 0 ⟹ I perfect ⟹ imRep|I=0 ⟹ I=⊥. HEAVY (division-alg classification +
    density + involution). ★ DESIGNATED W1 DECOMPOSE POINT if it resists in budget.

## PLAN (bank-as-you-go, W9.8)
L1 commutant (generic) → L2 isotypic dichotomy (generic) → L3 prime split + branch A → branch B
dim D=1 → assemble IsSimpleOrder → IsSimple. Child branch-B dim-D=7 if it resists. COMMIT each.
