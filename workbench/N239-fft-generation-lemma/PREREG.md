# N239 PREREG — Absolute irreducibility of the fundamental 7 (End_{g₂}(V₇) = ℚ)

## Status
RESUME of run 505/506 (both timed_out). Rogue duplicate worker (run 506, pid 74800, spawned by
phys-messy gateway) KILLED to enforce single-flight; I am run 507 (pid 74801, current_run_id).
No PREREG existed; both prior runs timed out during exploration having left 5 probes.

## What run 505 correctly discovered (the pivot)
The task body frames the hard core as the degree-4 g₂ FFT count `dim (ImO^⊗4)^{g₂} = 4`. Run 505
pivoted to the SHARPER, load-bearing sub-fact that the FFT partition over ℚ actually needs:
**ABSOLUTE IRREDUCIBILITY of the fundamental 7**, i.e. `End_{g₂}(V₇) = ℚ` (equivalently the
degree-2 count `dim (V₇⊗V₇)^{g₂} = 1` — only the metric δ). This is required because over a
non-algebraically-closed field ℚ, `dim End_{g₂}(V) = Σ mᵢ² dᵢ` where `dᵢ = dim_ℚ End_{g₂}(Vᵢ)`
is the division-algebra degree of the i-th irreducible. N238 banked plain irreducibility
(no proper invariant subspace); this node banks the Schur-scalar strengthening `dᵢ = 1` for the
fundamental 7 — the division-algebra-triviality the count silently assumes.

## Target (single, decided)
`fundamental7_absolutely_irreducible : ∀ (T : Module.End ℚ ImO),
  (∀ D : derivationLieQ, Commute T (imRep D)) → ∃ c : ℚ, T = c • (1 : Module.End ℚ ImO)`

TYPE mentions banked tower objects: `Module.End ℚ ImO`, `derivationLieQ`, `imRep` (N22),
`ImO = ker(star+1)` on derived `O ℚ = CD(H ℚ)`. Words-removable: delete g₂/gauge/fundamental →
"any ℚ-endo of `ImO` commuting with every `X↦imRep D X` is a ℚ-scalar" — pure math about the
derived octonions, no physics word load-bearing.

## Route (all pieces MEASURED CLEAN in probes)
1. C := centralizer_ℚ of the imRep image; T ∈ C. K := adjoin ℚ {T} ≤ C.  [probe4]
2. Every a ∈ K commutes with every imRep D ⟹ ker a is imRep-invariant.  [probe1, probe4]
3. (N28 transported) any imRep-invariant subspace of V₇ is ⊥ or ⊤ (prime dim 7)
   ⟹ nonzero a ∈ K is injective ⟹ K is a DOMAIN ⟹ (finite-dim over ℚ) a FIELD.  [probe4, probe5c]
4. Field tower `dim_ℚ K · dim_K V₇ = 7` (K.val compHom, diamond-free) ⟹ dim_ℚ K ∣ 7.  [probe3c]
5. 7 prime ⟹ dim_ℚ K ∈ {1,7}.
   - dim=1: K = ⊥ ⟹ T ∈ ⊥ ⟹ T = c • 1.  DONE.
   - dim=7: dim_K V₇ = 1 ⟹ each imRep D is a K-scalar (existsUnique_eq_smul_id_of_finrank_eq_one)
     ⟹ all imRep D commute pairwise (K commutative) ⟹ imRep⁅D,D'⁆ = 0 ⟹ (imRep injective)
     ⁅D,D'⁆ = 0 ∀ ⟹ g₂ ABELIAN, contradicting banked derivationLieQ_not_lieAbelian.  [probe6]

## W9 instrument notes
- synthInstance.maxHeartbeats 1000000, maxHeartbeats 800000 (inherited N227–N238 ceiling for the
  ℚ-End Cayley–Dickson instance diamond). NO proof-search heartbeat raise beyond this.
- Field tower routed through K.val compHom (probe3c), NOT algebraMap K End (which timed out probe3b).
- IsDomain built via explicit `NoZeroDivisors.to_isDomain K` (type passed explicitly — a bare `_`
  leaves a stuck metavar / semiring diamond).
- Individual pieces compile in 37–41s each; full assembly measured in background (probe_full).

## Banked deps used
no_proper_invariant_ImO (N28, DerivationIrreducibleFull), finrank_ImO (N.., DerivationRep7),
imRep/imRep_coe/imRep_injective (N22, DerivationRep7), derivationLieQ_not_lieAbelian
(DerivationPerfect), imRep is a LieHom (LieHom.map_lie). Mathlib: Subalgebra.centralizer,
Algebra.adjoin_le, fieldOfFiniteDimensional, Module.finrank_mul_finrank,
LinearMap.existsUnique_eq_smul_id_of_finrank_eq_one, eq_bot_of_finrank_one, Algebra.mem_bot.

## Next node (to decide on completion)
This banks the `dᵢ=1` (division-trivial) ingredient for the fundamental 7. The FFT count still
needs: (a) the same absolute-irreducibility for the 27 (tracelessSym) and 14 (adjoint), then
(b) the assembled `dim End_{g₂}(7⊗7) = Σ dim End_{g₂}(Vᵢ) + Σ_{i≠j} dim Hom = 4` closing
commutantG2 ≤ commutantSpan. Decide the immediate next brick (likely: abs-irred of the 27 via the
analogous centralizer-field argument on tracelessSym) and child on the tail.
