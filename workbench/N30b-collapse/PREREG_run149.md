# N30b PREREG — run 149 (crime-scene recovery + FINAL instantiation)

Runs 147/148 timed out on ITERATION budget (breaker reset to 0 — NOT real failures).
GENERIC layer is BANKED + BUILT (DerivationSimpleCollapse.lean, olean fresh 19:40 >
src 19:39): commutantHom, finrank_of_linearEquiv_fun, isotypic_prime_split,
prime_split_dichotomy. Do NOT re-derive. W6/W9.8 crime scene.

## REMAINING (the FORWARD instantiation at V=ImO, p=7, A=A_I)
probe48 PROVED: `prime_split_dichotomy _ 7 (by norm_num) finrank_ImO
(semisimpleModule_imRep_adjoin I)` elaborates at the CONCRETE A_I with ONLY `hdich`
stubbed. So the WHOLE remaining math is the `hdich` proof + the two-branch collapse.

ROUTE (decided, frozen — measured by probes 48–51):
- L_hdich: a fully-invariant A_I-submodule N of ImO is ⊥ or ⊤.
    W := (N.restrictScalars ℚ).map ImO.subtype  ≤ ImO  (probe49 ✓).
    W invariant under FULL derivationLieQ: D ∈ ⊤ = I ⊔ Iᶜ ⟹ (sup_toSubmodule) D = a+b,
    a∈I.toSubmodule, b∈Iᶜ.toSubmodule. imRep a is an A_I generator ⟹ N stable (probe51 ✓).
    imRep b commutes with every generator (imRep_commute_of_lie_zero, ⁅I,Iᶜ⁆=⊥) ⟹ A_I-linear
    (commutantHom) ⟹ N fully-invariant ⟹ stable. Hence W invariant.
    If N≠⊥,N≠⊤ ⟹ 0<dim W<7 ⟹ no_proper_invariant_ImO ⟹ False. So N=⊥∨N=⊤.
- THE COLLAPSE (derivationLieQ_isSimpleOrder): ¬IsSimpleOrder ⟹ exists_atom_ne_top +
    atom_compl_decomp give I,J=Iᶜ nonzero, ⁅I,J⁆=⊥, I⊔J=⊤. prime_split_dichotomy gives:
    • SCALAR branch (∀a∈A_I, a = c•id): each imRep(I.incl x) is a ℚ-scalar AND traceless
      (atom_isPerfect ⟹ imRep|I is sum of commutators ⟹ trace 0; a scalar c•id on dim-7 has
      trace 7c ⟹ c=0) ⟹ imRep|I = 0 ⟹ ⁅I,ImLie⁆=⊥ ⟹ I=⊥ (eq_bot_of_lie_ImLie_bot). I≠⊥ ⊥.
    • SIMPLE branch (IsSimpleModule A_I ImO): J acts in commutant End_{A_I}(ImO); Schur ⟹
      division ring D; J-action skew-adjoint (imRep_isSkewAdjoint_gImO). dim_ℚ D ∣ 7.
      EASIER ROUTE if scalar route resists: use the SCALAR alternative of the dichotomy is
      false here, so we're in IsSimpleModule. Then consider the J generators: each imRep(J.incl y)
      ∈ commutant. ★ DESIGNATED DECOMPOSE: if the Schur-division-ring scalar argument is
      multi-lemma, CHILD it; bank L_hdich + the scalar branch + IsSimpleOrder-modulo-simple-branch.

## KILL: 90s/obligation (lake env lean on isolated scratch). NEVER inflate proof
maxHeartbeats. synthInstance.maxHeartbeats 400000 is SUBSTRATE (banked precedent) — OK.
NEVER unbounded `lake build` in turn budget. CHECKPOINT ~50%: bank every clean lemma,
finalize (AxiomAudit + C52 + LEDGER + ROADMAP) with turns to spare.

## FINALIZATION OWED REGARDLESS: AxiomAudit N30b block + costume C52 + LEDGER + ROADMAP.
