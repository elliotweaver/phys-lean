# N28 PREREG — FULL IRREDUCIBILITY of the faithful 7-rep + the IsSimpleOrder→IsSimple core

FROZEN before production Lean. Decided by bounded MEASUREMENT, not a guess.

## Banked upstream (N19–N27, foundations-only, NO posited G₂)
- `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))`, `finrank_derivationQ_eq_14`.
- `ImO := ker(starL+1)` (7-dim), `imRep` (7-rep), `imRep_injective` (FAITHFUL),
  `derivLieQ_mapsTo`, `D0E/D3E/D8E` + `_isDerivQ`.
- `ImLie : LieSubmodule ℚ derivationLieQ (O ℚ)` (carrier ImO), `finrank_ImLie`=7, `Nontrivial`.
- `gBil` (Born form), `gBil_isSymm`/`isRefl`, `gBil_restrict_nondegenerate`,
  `isCompl_gBil_orthogonal`, `deriv_isSkewAdjoint_gBil`, `derivationLieQ_le_skewAdjoint`.
- `deriv_mapsTo_orthogonal`, `gPerp`, `isCompl_gPerp` (COMPLETE REDUCIBILITY in O ℚ).
- `deriv_eigenvalue_zero`, `no_common_eigenvector_ImO`, `no_one_dim_invariant_ImO` (d=1 excl).
- `derivationLieQ_semisimple`, `derivationLieQ_not_lieAbelian`, `isSimple_of_isSimpleOrder`.

## Numerics RE-VERIFIED this run (W6, workbench/N26/route_probe.py)
joint-kernel rank of stacked 7-action = 7 ⟹ joint kernel = 0; every ρ(D_k) skew on ImO;
dim so(d)+so(7−d): d=0..7 = 21,15,11,9,9,11,15,21. Excludes d=2,3,4,5 (=11,9,9,11 < 14).
d=1,6 by `no_one_dim_invariant_ImO` + complete reducibility.

## THE GENUINE W1 OBSTRUCTION (measured)
Mathlib LACKS: `dim so(n) = C(n,2)`, antisymmetric-matrix finrank, alternating-bilinear-form
finrank. It HAS `finrank ⋀² M = (finrank M).choose 2` (ExteriorPower/Basis.lean:162) and
`exteriorPower.alternatingMapLinearEquiv : (M [⋀^Fin n]→ₗ R) ≃ₗ (⋀^n M →ₗ R)`.

THE CRUX LEMMA to BUILD (W1, NOT a posit — a finrank fact ABOUT the banked gBil):
`finrank ℚ (skewAdjoint operators of gBil.restrict W) ≤ (finrank ℚ W).choose 2`
via the injection D ↦ (alternating bilinear form (x,y) ↦ gBil(D x, y)) ↪ AlternatingMap (Fin 2)
≅ (⋀²W →ₗ ℚ), finrank = finrank ⋀²W = C(d,2).

## GO / NO-GO
GO (this node): bank, FORWARD, foundations-only, NO posited G₂, every piece its own commit (W9.8):
  (P1) `deriv_restrict_skewAdjoint` — D ∈ derivationLieQ restricted to an invariant submodule
       N ⊆ ImO is skew-adjoint for `gBil.restrict N`. [moderate, complete]
  (P2) the JOINT INJECTION from faithfulness: D ↦ (D|N, D|N') is injective when N ⊔ N' ⊇ ImO
       (D|N=0 ∧ D|N'=0 ⟹ D|ImO=0 ⟹ imRep_injective ⟹ D=0). [moderate, complete]
  (P3) THE CRUX: `finrank_skewAdjoint_restrict_le_choose` — the so(n)-type bound. MEASURE FIRST.

CONDITIONAL on (P3) measuring TRACTABLE (≤ KILL): also bank
  (A) `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` (full irreducibility, partition assembly).
  (D) `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `IsSimple` via banked skeleton.

DECOMPOSE (W3) if (P3) is a W9 beast or runs short on turns: bank P1+P2 (+ within-ImO complete
reducibility) complete this run, CHILD N29 = the crux bound (P3) + the irreducibility assembly (A)
+ the simple-order core (D), then the automorphism Lie GROUP. NO sorry, NO conditional-on-unproven
theorem stated as fact. A reduction theorem `(hbound) → irreducible` is acceptable forward content
only if hbound is honestly flagged as the childed obligation, never as proved.

## KILL (compile-cost budget)
- Per-obligation KILL: 90s. If any single lemma elaboration exceeds 90s → INSTRUMENT failure,
  STOP, measure smallest sub-obligation, decompose. NEVER inflate maxHeartbeats.
- The crux (P3) route is STRUCTURAL (exterior power / alternating map), NOT coordinate expansion —
  if it drifts toward a d×d coordinate matrix `ring`/`decide`, that is the W9 smell, reframe.
- TURN-BUDGET checkpoint at ~55%: if P1/P2 are banked but P3 is fighting, FINALIZE the decompose
  (commit + child + complete) with turns to spare. Every prior node N17–N27 timed out on iteration
  budget before banking — checkpoint EARLY.

## Anti-vacuity (W8) — costume C48 MUST bite
A WRONG invariant must FAIL to compile: e.g. asserting a proper nonzero invariant submodule of
ImLie exists (irreducibility false) → contradiction; OR the so(n) bound with a wrong RHS
(C(d,2)+1) collapsing the count. Reuse banked structure, never a fresh table.

## STANDARD
Unbroken (every object from the banked chain or Mathlib machinery on the DERIVED object — §3:
`LieModule.IsIrreducible`/`IsSimpleOrder`/`BilinForm`/`⋀²`/`finrank` are MACHINERY). Complete
(#print axioms ⊆ {propext, Classical.choice, Quot.sound}, verified independently). Physics-words-
removable (delete "g₂/gauge/irreducible/compact" → pure statement about the 14-dim Leibniz-derivation
Lie algebra of CD(CD(CD ℚ)) acting on ker(star+id)).
