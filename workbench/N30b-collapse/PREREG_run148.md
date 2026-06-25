# N30b PREREG ADDENDUM — run 148 (crime-scene recovery + forward build)

Run 147 timed_out on iteration budget (90/90) AFTER committing the GENERIC prime-dimension
structure-theorem layer (7afbb1d: DerivationSimpleCollapse.lean — commutantHom,
finrank_of_linearEquiv_fun, isotypic_prime_split) but BEFORE finalizing (NOT in AxiomAudit,
no costume C52). The olean is FRESH (18:48 > source 18:47), file is CLEAN (no inflated
maxHeartbeats / sorry / native_decide). This is a W6/W9.8 crime scene: the generic layer is
real banked work; do NOT rebuild it blind.

## RUN 148 PLAN (decided, frozen)
1. CRIME-SCENE VERIFY the inherited generic layer: independently #print axioms on the 3 decls.
2. MEASURE (W9.2, bounded probe ≤120s): does `isotypic_prime_split A_I 7 ...` instantiate at the
   CONCRETE `A_I := Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))` cheaply, given
   `hss := semisimpleModule_imRep_adjoin I` supplied EXPLICITLY (so SMul/Module are unified from
   the banked instance, not re-synthesized)? FINDINGS flagged bare `SMul A_I`/`Module.Finite A_I`
   synthesis blows up — but the bridge statement TYPECHECKS, so the Module instance exists.
   GO if the application elaborates with `sorry` for hdich within budget.
   NO-GO → reframe: prove the dichotomy directly and bypass isotypic instantiation (build the
   structural split by hand from the banked levers).
3. BUILD the concrete collapse bank-as-you-go in DerivationSimpleCollapse.lean:
   - L2 dichotomy: fully-invariant A_I-submodule → I-inv + J-inv (L1 commutant) → derivationLieQ-inv
     (I⊔J=⊤) → image ≤ ImO invariant subspace → no_proper_invariant_ImO → ⊥/⊤.
   - L3 prime split via isotypic_prime_split (or hand-built).
   - L4 branch (n=7,dimS=1): characters + atom_isPerfect → I acts 0 → eq_bot_of_lie_ImLie_bot → I=⊥.
   - L5 branch (n=1,dimS=7): Schur → End_{A_I} division ring; J-action skew + scalar → 0 → J=⊥.
4. CHECKPOINT ~55% of turns: bank every clean lemma; if IsSimple lands, finalize+complete; else
   commit safe levers + CHILD the remainder onto chain tail + complete as "decomposed".

## KILL (unchanged): 90s/obligation; never inflate maxHeartbeats; never unbounded `lake build`
in the turn budget — probe pieces with `lake env lean` on isolated scratch.

## FINALIZATION OWED REGARDLESS: AxiomAudit N30b block (the 3 generic decls minimum) + costume
C52 + LEDGER + ROADMAP. The generic layer is banked; its finalization is non-negotiable this run.
