# N30 PREREG — the irreducible-faithful-module ⟹ simple STRUCTURE THEOREM
## ⟹ IsSimpleOrder (LieIdeal ℚ derivationLieQ) ⟹ LieAlgebra.IsSimple ℚ derivationLieQ

FROZEN before compute. Run under task t_1d603922.

## TARGET
`derivationLieQ_isSimple : LieAlgebra.IsSimple ℚ derivationLieQ`, FORWARD, by discharging
the hypothesis of the banked `isSimple_of_isSimpleOrder` (N26), i.e. proving
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` — every Lie ideal is ⊥ or ⊤.
NO posited G₂, NO bridge.

## WHAT IS BANKED (the levers this node consumes — import + USE, never re-derive, W2)
- N29 `lieIdeal_nontrivial : Nontrivial (LieIdeal ℚ derivationLieQ)` (the ⊥≠⊤ half).
- N29 `eq_bot_of_lie_ImLie_bot` / `lie_ImLie_ne_bot_of_ne_bot` (faithfulness lever:
  a nonzero ideal acts nontrivially on the 7-rep).
- N28 `ImLie_isIrreducible : LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`.
- N27 `gPerp`/`isCompl_gPerp`/`deriv_mapsTo_orthogonal`/`isCompl_gBil_orthogonal` —
  complete reducibility via Born-orthogonality (works for ANY skew-adjoint subset).
- N26 `isSimple_of_isSimpleOrder`, `gBil`, `gBil_restrict_nondegenerate`, `ImLie`.
- N25 `derivationLieQ_semisimple` ⟹ Mathlib `IsSemisimple.instBooleanAlgebra`,
  `sSupIndep_isAtom`, `sSup_atoms_eq_top`, `isSimple_of_isAtom`, `non_abelian_of_isAtom`.
- N25 `derivationLieQ_center_eq_bot`.
- N22 `imRep` (Lie hom L →ₗ⁅ℚ⁆ End ℚ ImO), `imRep_injective` (faithful), `finrank_ImO`=7.
- N20 `finrank_derivationQ_eq_14`.

## MEASUREMENT (W9, bounded reconnaissance — done THIS run before any heavy commit)
- `IsSimpleOrder α ↔ IsAtom (⊤:α)` (Mathlib `isSimpleOrder_iff_isAtom_top`). So the target
  is: `⊤` is an atom of the ideal lattice ⟺ exactly one atom (semisimple atomistic).
- Mathlib associative tools available (Schur/isotypic, NOT for Lie modules):
  `Module.End.instDivisionRing` (Schur), `IsIsotypicOfType.linearEquiv_fun`
  (`M ≃ₗ (Fin n → S)` for finite isotypic-of-type), `isSimpleModule_iff_finrank_eq_one`,
  `IsSemisimpleModule.endAlgEquiv`. These require the Lie→associative BRIDGE: build
  `A := Algebra.adjoin ℚ (ρ '' I)` ⊆ End(V) and `IsSemisimpleModule A V`.
- THE TRUNK REFRAME of the bridge (THE ONE LAW): V's semisimplicity over ANY skew-adjoint
  subalgebra is the SAME Born-orthogonality as N27 — the gBil-orthogonal complement of an
  I-invariant subspace is I-invariant because I acts skew-adjointly (banked
  `deriv_mapsTo_orthogonal` holds for every derivation, hence every element of any ideal).

## THE TRUNK-NATIVE ARGUMENT (the prime-7 / isotypic-Schur route — the GO route)
Suppose NOT a simple order. Semisimple ⟹ ≥2 atoms ⟹ pick atom `I`, `I ≠ ⊤`; let
`J := sSup (atoms \ {I})`, a nonzero ideal, `I ⊓ J = ⊥`, `⁅I,J⁆ = ⊥` (atom independence),
`I ⊔ J = ⊤`. `V = ImO` faithful irreducible L-module (N22/N28).
- STEP A: V is I-ISOTYPIC (J permutes the I-isotypic components, I preserves them ⟹ they are
  L-submodules ⟹ L-irreducibility ⟹ single component) ⟹ `V ≅ W^{⊕r}`, `7 = r·dim_I W` PRIME.
- STEP B (cases of 7 = r·dim W):
  • dim W = 1 (r=7): I acts by a 1-dim character ⟹ ⁅I,I⁆ acts 0; I atom ⟹ simple ⟹ perfect
    ⟹ I acts 0 ⟹ faithfulness (`lie_ImLie_ne_bot_of_ne_bot`) ⟹ I = ⊥. Contradiction.
  • dim W = 7 (r=1): V is I-irreducible; Schur ⟹ Δ:=End_I(V) division ℚ-algebra, dim_ℚ Δ ∈ {1,7}.
    – dim Δ = 1: J ↪ Δ=ℚ scalar; skew-adjoint ⟹ traceless; 7c=0 ⟹ c=0 ⟹ J acts 0 ⟹ J=⊥. Contra.
    – dim Δ = 7: V≅Δ (1-dim over Δ); I ↪ End_Δ(V)=Δᵒᵖ, J ↪ Δ faithfully ⟹ dim I,dim J ≤ 7;
      dim I+dim J=14 ⟹ both =7 ⟹ I≅Δᵒᵖ; ℚ·id ⊆ Z(Δᵒᵖ) nonzero centre, contra I simple
      (atom analogue of `derivationLieQ_center_eq_bot`). Closes WITHOUT CSA-perfect-square.

## GO / NO-GO
- GO: MEASURE the bridge cost in bounded probes FIRST. Then BANK-AS-YOU-GO every clean forward
  lever (W9.8) — in order of increasing cost: (1) the atom→two-commuting-ideals setup
  (`exists_two_commuting_ideals` from ¬IsSimpleOrder); (2) the commuting-actions lever
  (⁅I,J⁆=⊥ ⟹ imRep images commute in End V); (3) the bridge `IsSemisimpleModule A_I V` via Born
  orthogonality; (4) the isotypic factorization; (5) the case collapse ⟹ IsSimpleOrder ⟹ IsSimple.
  Commit each piece the instant it elaborates clean. If the full collapse closes within budget,
  LAND IsSimple. Else DECOMPOSE (W3): bank the levers that compiled, child N30b = the dedicated
  isotypic-Schur collapse with the MEASURED findings (exact Mathlib lemma names + costs) in the
  handoff so the successor EXECUTES (W9 item 7), link onto the chain tail, complete N30 as
  "decomposed".
- NO-GO (forbidden): assert IsSimple without the proof; import a Mathlib G₂ and match; weaken the
  target; inflate maxHeartbeats; grind a monolith; re-measure a route already recorded dead.

## KILL (W9 compile-cost budget)
- 90s/obligation in a bounded probe. Any single sub-lemma exceeding 90s = INSTRUMENT failure ⟹
  restructure/decompose, never grind. NEVER run an unbounded compile in the turn budget.
- TURN-BUDGET CHECKPOINT at ~55%: if the collapse is not compiling clean by then, STOP adding,
  bank what is clean, child N30b, decompose-complete N30. N28 timed out TWICE; finalize EARLY.

## ANTI-VACUITY (W8) — the new costume MUST bite (id C50)
A WRONG claim must FAIL to compile: assert `¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)` (or
`¬ LieAlgebra.IsSimple ℚ derivationLieQ`) — the banked forward result proves it IS, leaving an
unprovable `⊢ False`. Reuse banked decls only; NEVER a fresh table.

## PHYSICS-WORDS-REMOVABLE (STANDARD §2)
Delete "g₂/gauge/exceptional/compact/simple-as-physics": the theorem remains a complete proof
that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a
double of ℚ has no proper nonzero Lie ideal (its ideal lattice is a simple order).
