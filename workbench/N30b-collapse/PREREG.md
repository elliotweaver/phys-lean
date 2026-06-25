# N30b PREREG — the PRIME-7 / ISOTYPIC-SCHUR COLLAPSE ⟹ IsSimpleOrder ⟹ IsSimple

Frozen before compute. Run 147 (task t_3717530e). The board is single-flight (this is the
only running task; the untracked workbench/ files are inherited N28–N30a scratch — NOT to be
bulk-built, W9.6).

## TARGET
Prove `LieAlgebra.IsSimple ℚ derivationLieQ` FORWARD, via
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` + the banked `isSimple_of_isSimpleOrder` (N26).
NO posited G₂, NO bridge.

## THE ROUTE (decided; to be confirmed cheap by a bounded MEASURE first)
Suppose `¬ IsSimpleOrder`. `exists_atom_ne_top` (N30) + `atom_compl_decomp` (N30) ⟹ atom `I`,
`J := Iᶜ`, both ≠ ⊥, `I ⊔ J = ⊤`, `I ⊓ J = ⊥`, `⁅I,J⁆ = ⊥`.
Let `A_I := Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))` ⊆ `End ℚ ↥ImO`.
N30a banked `semisimpleModule_imRep_adjoin I : IsSemisimpleModule A_I ↥ImO`.

L1 (COMMUTANT LEMMA, bankable). For `y ∈ J`, `imRep (J.incl y)` commutes with every
   generator `imRep (I.incl x)` (banked `imRep_commute_of_lie_zero`, since `⁅x,y⁆ = 0` from
   `⁅I,J⁆ = ⊥`), hence with all of `A_I` (`Algebra.commute_of_mem_adjoin_*` / centralizer is a
   subalgebra) ⟹ `imRep (J.incl y) ∈ End_{A_I}(↥ImO)` as an A_I-linear map.

L2 (ISOTYPIC, bankable). `IsIsotypic A_I ↥ImO`, via Mathlib
   `isIsotypic_iff_isFullyInvariant_imp_bot_or_top` [needs `IsSemisimpleModule A_I ↥ImO` ✓]:
   any fully-invariant A_I-submodule `N` is `I`-invariant (A_I gen by I-action) AND `J`-invariant
   (fully-invariant ⟹ closed under `End_{A_I}`, which contains the J-action by L1); `I+J=⊤`
   ⟹ `N` is `derivationLieQ`-invariant subspace of ImO ⟹ by `ImLie_isIrreducible`
   (`no_proper_invariant_ImO`) `N = ⊥ ∨ N = ⊤`.

L3 (PRIME SPLIT). `linearEquiv_fun` ⟹ `↥ImO ≃ₗ[A_I] (Fin n → S)`, `S` simple. ℚ-dim:
   `7 = n · dim_ℚ S`. 7 PRIME ⟹ `(n, dim_ℚ S) ∈ {(7,1),(1,7)}`.

L4 (BRANCH dim S = 1, i.e. n=7). A_I acts by a character `χ : I → ℚ` (Lie hom into abelian ℚ);
   `I` PERFECT (`atom_isPerfect`) ⟹ `χ = 0` ⟹ `imRep x = 0` ∀x∈I ⟹ `⁅I,ImLie⁆=⊥` ⟹ `I = ⊥`
   (`eq_bot_of_lie_ImLie_bot`). Contradiction with `I ≠ ⊥`.

L5 (BRANCH dim S = 7, n=1). `↥ImO` is A_I-SIMPLE ⟹ `D := End_{A_I}(↥ImO)` a DIVISION RING
   (Schur, `Module.End.instDivisionRing`). `J`-action ⊆ D (L1). `dim_ℚ D ∣ 7`.
   - `dim_ℚ D = 1` (D = ℚ·id): `imRep y` scalar AND skew-adjoint (banked `derivationLieQ_le_skewAdjoint`
     / N30a `imRep_isSkewAdjoint_gImO`) ⟹ scalar = 0 (2c·B = 0, B nondeg) ⟹ `J` acts as 0 ⟹
     `⁅J,ImLie⁆=⊥` ⟹ `J = ⊥`. Contradiction with `J = Iᶜ ≠ ⊥`.
   - `dim_ℚ D = 7`: cross-check via `atom_center_eq_bot` + `finrank_derivationQ_eq_14` (decompose
     to child if it resists — see KILL).

## GO / NO-GO
GO if the MEASURE probe confirms (a) the A_I-module structure on `↥ImO` is available/synthesizable,
(b) `Module.Finite A_I ↥ImO` and `IsSemisimpleModule A_I ↥ImO` instances feed
`isIsotypic_iff_isFullyInvariant_imp_bot_or_top` and `linearEquiv_fun`, (c) the
`Submodule A_I ↥ImO` ↔ I-invariant-subspace dictionary is cheap. If any is heavy, DECOMPOSE that
lemma to its own commit; never grind.
NO-GO (reframe / child) if the isotypic API does not apply to `A_I ↥ImO` without a heavy
typeclass fight — then build the structural dichotomy directly (the L2 fully-invariant argument
is itself the core; isotypic is its corollary).

## KILL (compile-cost budget — W9)
- Per-obligation KILL: 90s wall. Any single lemma whose smallest sub-obligation exceeds 90s in a
  bounded probe is an INSTRUMENT failure → MEASURE/DECOMPOSE/reframe, never grind, never inflate
  maxHeartbeats.
- NEVER run an unbounded `lake build` of a new heavy file inside the turn budget — probe pieces
  with `lake env lean` on isolated scratch first.
- L5 dim_ℚ D = 7 sub-case is the designated DECOMPOSE point: if not closed cheaply, child it.

## TURN-BUDGET CHECKPOINT
At ~55% of turns: STOP opening new fronts. Bank every clean-compiling lemma (commit each as its
.olean — W9.8 bank-as-you-go), then FINALIZE: either complete (if IsSimple lands) or DECOMPOSE
(commit safe levers, child the remainder onto the chain tail, complete THIS as "decomposed").
N28/N29/N30/N30a ALL timed out then recovered — do NOT repeat: finalize EARLY with turns to spare.

## ANTI-VACUITY (W8)
Costume C52 must BITE: a WRONG simplicity claim (`¬ IsSimpleOrder`, or asserting NOT simple, or a
non-prime factorization 7 = r·s with r,s>1) must FAIL to compile. Reuse banked
derivationLieQ/imRep/imRep_injective/ImLie_isIrreducible/semisimpleModule_imRep_adjoin/
atom_compl_decomp/isSimple_of_isSimpleOrder — NEVER a fresh table.

## NUMERICS (reuse + re-verify, W6)
workbench/N22-g2-isomorphism/killing_rep.py: Killing det 9618527719784448, NEG-definite, single
14-dim block (one simple factor), faithful 7-rep — consistent with simplicity. Re-verify, do not
trust prior runs.
