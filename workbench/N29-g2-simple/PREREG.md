# N29 PREREG — IsSimpleOrder(LieIdeal ℚ derivationLieQ) ⟹ LieAlgebra.IsSimple

FROZEN before compute. Run under task t_898e6f93.

## TARGET
`derivationLieQ_isSimple : LieAlgebra.IsSimple ℚ derivationLieQ`, FORWARD, by discharging
the hypothesis of the banked `isSimple_of_isSimpleOrder` (N26), i.e. proving
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` — the only Lie ideals are ⊥ and ⊤.
NO posited G₂, NO bridge.

## MEASUREMENT (W9, done in a bounded reconnaissance, NOT a compile grind)
- `LieIdeal R L = LieSubmodule R L L`; `IsSimpleOrder(LieIdeal) = LieModule.IsIrreducible` of
  the ADJOINT rep. The banked 7-rep irreducibility (N28) does NOT directly transfer (so(4)/ℝ⁴
  is faithful+irreducible-on-4-rep but NOT simple — the ticket's locked finding; do not relitigate).
- Banked `derivationLieQ_semisimple` (N25) ⟹ Mathlib `IsSemisimple.instBooleanAlgebra`: the ideal
  lattice is a Boolean algebra, atomistic, `sSup{atoms} = ⊤`. So `IsSimpleOrder ⟺ exactly ONE atom`.
- Mathlib LACKS: "faithful irreducible ⟹ simple" (genuinely false in general), outer-tensor
  decomposition of an irreducible module over a product of commuting ideals, isotypic
  decomposition for Lie modules, Schur-for-Lie-modules. Mathlib HAS associative Schur
  (`Module.End.instDivisionRing` for `IsSimpleModule`), `IsSimpleModule`/isotypic for ASSOCIATIVE
  modules, and `isSimpleModule_iff_finrank_eq_one`.

## THE TRUNK-NATIVE ARGUMENT (the prime-7 route — the GO route, decided by measurement)
Suppose `L = derivationLieQ` is NOT a simple order. Semisimple ⟹ ≥2 atoms ⟹ pick an atom `I`
and its Boolean complement `J` (an ideal), both nonzero, `L = I ⊕ J`, `⁅I,J⁆ = ⊥` (commuting).
Let `V = ImO` (7-dim, faithful irreducible L-module, N22/N28; completely reducible over any
subalgebra by gBil-orthogonality, extending N27 gPerp).

LEVER A (CHEAP, bank this run): every nonzero ideal acts NONTRIVIALLY:
`⁅K, ⊤⁆` is an L-submodule of ImLie (Mathlib `LieSubmodule ℚ L ImLie`); irreducibility ⟹ ⊥/⊤;
`⁅K,⊤⁆=⊥ ⟹ K` in the rep kernel `⟹ K=⊥` by faithfulness. So for `K≠⊥`, `⁅K,⊤⁆=⊤`.

THE CORE (substantial, scoped to N30 if not closed this run):
- `V` is I-ISOTYPIC: distinct I-isotypic components would be L-submodules (J permutes them, I
  preserves them), contradicting L-irreducibility ⟹ `V ≅ W^{⊕r}`, `dim V = r·dim W = 7` PRIME.
- `dim W = 1` (r=7): I acts via an abelian (1-dim) character; I perfect (sum of atoms) ⟹ acts 0
  ⟹ faithfulness ⟹ I=⊥. Contradiction.
- `dim W = 7` (r=1): V is I-irreducible; Schur ⟹ `Δ := End_I(V)` a division ℚ-algebra, `dim_ℚ Δ | 7`.
  - `dim Δ = 1`: J ↪ Δ=ℚ acts by scalars; skew-adjoint ⟹ traceless ⟹ 7c=0 ⟹ c=0 ⟹ J acts 0 ⟹ J=⊥.
  - `dim Δ = 7`: V ≅ Δ as Δ-module; I ↪ End_Δ(V)=Δᵒᵖ and J ↪ Δ, both faithful, so dim I,dim J ≤ 7,
    sum = 14 ⟹ both = 7 ⟹ I ≅ Δᵒᵖ as a Lie algebra; but ℚ·id ⊆ Z(Δ) ⟹ I has nonzero centre,
    contradicting I semisimple (centre 0, banked `derivationLieQ_center_eq_bot` analogue for atoms).
  NB: this collapses WITHOUT the CSA-perfect-square theorem (the dimension+centre count suffices).

## GO / NO-GO
- GO: bank LEVER A (`ideal_acts_nontrivially`/`lie_top_eq_top_of_ne_bot`) this run — cheap, clean,
  trunk-native, reusable. Then either (a) if the isotypic+Schur core compiles within budget, close
  `IsSimpleOrder` ⟹ `IsSimple`; or (b) DECOMPOSE (W3): child N30 = the dedicated structure-theorem
  node with this argument in the handoff, link onto the chain tail, complete N29 as "decomposed".
- NO-GO (forbidden): assert IsSimple without the proof; import a Mathlib G₂ and match; weaken the
  target; inflate maxHeartbeats; grind a monolith.

## KILL (W9 compile-cost budget)
- 90s/obligation. If any single sub-lemma exceeds 90s in a bounded probe → it is an INSTRUMENT
  failure → restructure/decompose, never grind.
- TURN-BUDGET CHECKPOINT at ~55%: if the Schur/isotypic core is not compiling clean by then,
  STOP adding to it, bank LEVER A + whatever else is clean, child N30, decompose-complete N29.
  N28 timed out TWICE on iteration budget — finalize EARLY with turns to spare.

## ANTI-VACUITY (W8) — the new costume MUST bite (id C49)
A WRONG claim must FAIL to compile: e.g. asserting `¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)`
(or `¬ LieAlgebra.IsSimple ℚ derivationLieQ`) when it IS — leaves an unprovable `⊢ False`.
Reuse banked: derivationLieQ, imRep/imRep_injective, ImLie, ImLie_isIrreducible, gBil,
isSimple_of_isSimpleOrder, derivationLieQ_semisimple, derivationLieQ_not_lieAbelian, finrank_ImLie.
NEVER a fresh table.

## PHYSICS-WORDS-REMOVABLE (STANDARD §2)
Delete "g₂/gauge/exceptional/compact/simple-as-physics": the theorem remains a complete proof
that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a
double of ℚ has no proper nonzero Lie ideal (its ideal lattice is a simple order).
