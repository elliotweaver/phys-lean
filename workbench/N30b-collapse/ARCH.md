# N30b ARCHITECTURE (decided after MEASURE) — run 147

## Generic layer (abstract A : Subalgebra ℚ (End ℚ V), fast typeclass)
GEN1 `commutantHom`  : T commuting with generators S ⟹ V →ₗ[adjoin ℚ S] V (probe14 ✓)
GEN2 `submodule_invariant_of_generator` : an A-submodule N is preserved by each a∈A (probe12 ✓)
GEN3 `fullyInvariant_preserved` : N fully-invariant ⟹ preserved by each f : End A V (probe12 ✓)
GEN4 `isIsotypic_of_dichotomy` : (∀ fully-inv N, N=⊥∨⊤) ⟹ IsIsotypic A V  (probe6 ✓)
GEN5 `prime_split` : V ≃ₗ[A] Fin n → S, S simple, dim_ℚ V = p prime ⟹
       (n=p ∧ dim_ℚ S=1) ∨ (n=1 ∧ dim_ℚ S=p)   (probe11 G2 ✓ + Nat.Prime)

## Concrete instantiation layer (A_I := adjoin ℚ (range (imRep ∘ I.incl)), at the END only)
Because concrete A_I typeclass synth is SLOW, every use of A_I-module facts must go through the
banked `semisimpleModule_imRep_adjoin I` (which already paid that cost once) and be stated so the
elaborator does not re-synthesize Finite/SMul. Strategy: keep A_I appearances minimal; push the
work into GEN lemmas applied with V := ↥ImO and A := A_I, supplying instances by `haveI` from the
banked bridge.

## The contradiction (the FORWARD theorem `derivationLieQ_isSimpleOrder`)
Assume ¬IsSimpleOrder. Get atom I, J:=Iᶜ, both ≠⊥, ⁅I,J⁆=⊥ (atom_compl_decomp).
Let A := A_I. haveI semisimple (banked). 
Step 1: show every fully-invariant A-submodule N is ⊥ or ⊤.
   N preserved by all generators imRep(I.incl x) (GEN2) ⟹ N (as ℚ-subspace) is I-invariant.
   For y∈J: commutantHom (imRep(J.incl y)) ∈ End A V (GEN1, since imRep(J.incl y) commutes with
   each generator imRep(I.incl x) by banked imRep_commute_of_lie_zero) ⟹ N preserved by it (GEN3)
   ⟹ N is J-invariant. I+J=⊤ ⟹ N is derivationLieQ-invariant subspace of ImO.
   ⟹ by no_proper_invariant_ImO (N=⊥ or dim=7=⊤). [Need: N as ℚ-subspace = N.restrictScalars ℚ;
   derivationLieQ-invariance via I-gen + J-commutant + I⊔J=⊤. The "I⊔J=⊤ ⟹ every D is sum"
   step: every D ∈ derivationLieQ = a+b, a∈I,b∈J since I⊔J=⊤; imRep D = imRep a + imRep b both
   preserve N.] 
Step 2: IsIsotypic A V (GEN4). prime split (GEN5): two branches.
Step 3a (n=7,dimS=1): A acts by scalars on each S-line ⟹ each imRep(I.incl x) is scalar; I
   perfect (atom_isPerfect) ⟹ traceless ⟹ scalar 0 ⟹ imRep|I=0 ⟹ ⁅I,ImLie⁆=⊥ ⟹ I=⊥. ✗.
Step 3b (n=1,dimS=7): V A-simple ⟹ End A V division ring. J-action ⊆ End A V (commutantHom)
   skew-adjoint scalar ⟹ ... → J=⊥. ✗ (decompose dim-D=7 sub-branch if needed).

## RISK / DECOMPOSE BOUNDARY
- Step 1 (the I⊔J=⊤ ⟹ invariance + restrictScalars dictionary) is the crux; bank it alone.
- Step 3a needs "scalar action on 1-dim isotypic ⟹ each generator scalar" + traceless. Medium.
- Step 3b division-ring branch is the heaviest; designated W1 child if it resists.
- If Step 1 + GEN lemmas bank but the branches resist within budget: COMMIT GENs + Step1, child
  "N30c — the prime-7 branch collapse" onto the chain tail, complete N30b as decomposed.
