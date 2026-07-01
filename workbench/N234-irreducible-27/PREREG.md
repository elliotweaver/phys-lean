# N234 — PREREG: irreducibility of the 27 (tracelessSym) as a g₂-module

## Target (single, decided)
`tracelessSym_irreducible` : every adEnd-invariant ℚ-subspace `W ≤ tracelessSym`
(`Submodule ℚ (Module.End ℚ ImO)`) with `0 < finrank W` satisfies `W = tracelessSym`
(equivalently only ⊥/⊤ are invariant). This upgrades N233's `7⊗7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`
from a decomposition into g₂-SUBMODULES to a decomposition into IRREDUCIBLE g₂-modules
(genuine Clebsch–Gordan). Advances ★3. Stays ON THE GATHER (lock in force).

## MEASURE-FIRST result (bounded, no grinding) — the two banked levers BOTH die on the 27

The three settled atoms of `7⊗7` were closed by two levers; **neither transfers to 27**:

1. **The 7 (`no_proper_invariant_ImO`, N28) — the so(n) DIMENSION-BOUND lever.**
   A proper nonzero invariant `W` of dim `d` in the 7 forces
   `14 = dim g₂ ≤ C(d,2)+C(7−d,2)`. That is `11,9,9,11 < 14` for `d∈{2,3,4,5}` (and
   d=1,6 by `no_one_dim_invariant_ImO`) — a CONTRADICTION, so no proper invariant exists.
   **For the 27 this is DEAD:** `min_{proper d} C(d,2)+C(27−d,2) = 169 ≥ 14` (min at d=13:
   78+91). The bound holds for EVERY proper d ⟹ excludes NOTHING. (Verified by hand.)

2. **The 14 (`ImLie_isIrreducible` core / `derivationLieQ_isSimple`) — Lie-SIMPLICITY.**
   The adjoint rep's irreducibility is g₂-simplicity itself. The 27 is not the adjoint,
   so simplicity says nothing about it.

3. **The trunk's SIGNATURE prime-collapse (`prime_split_dichotomy`, `isotypic_prime_split`,
   DerivationSimpleCollapse) — needs PRIME ℚ-dimension.** This is the theory-native move that
   nailed the 7 (7 prime ⟹ any semisimple envelope-module is scalar-or-simple). **27 = 3³ is
   NOT prime** ⟹ the dichotomy cannot apply; an intermediate split of composite dimension is
   exactly what prime-ness forbade and 27 permits.

## Reframe through the theory (SOUL W1 step 2) — what full irreducibility REDUCES to

The banked definite Born form gives SEMISIMPLICITY for free (generic
`isSemisimpleModule_adjoin`, N30a, instantiates on the g₂-action restricted to tracelessSym via
the invariant nondegenerate `bornBil`/HS-type form). A semisimple module is irreducible iff it
has a UNIQUE irreducible constituent of multiplicity one. So:

  **27 irreducible  ⟺  27 semisimple  ∧  27 contains NO copy of 1, of 7, or of 14 as a
  subrep  ∧  every irreducible g₂-module of dim ≤ 27 is one of {1,7,14,27}.**

- The **no-1-subrep** pillar (Hom_{g₂}(1,27)=0): a g₂-invariant `X ∈ tracelessSym` commutes with
  every `imRep D`; via `minpoly ℚ X` and the field `ℚ[X] = AdjoinRoot (minpoly)` acting on the 7,
  `deg(minpoly) | 7` (field-degree tower on the 7), so deg ∈ {1,7}. deg 7 ⟹ g₂ centralizer
  contains a degree-7 field ⟹ contradicts non-abelian/`derivationLieQ_not_lieAbelian`; deg 1 ⟹
  X scalar ⟹ traceless ⟹ `7c=0` (char 0) ⟹ X=0. This is the trunk's prime-7 + faithfulness +
  perfectness combined — theory-native, bankable, but a genuine min-poly/field-tower build.
- The **no-7-subrep / no-14-subrep** pillars: analogous equivariant-Hom vanishing (mirror the
  banked `isotypic_decomposition_canonical` / `DerivationRep7IsotypicSchur` intertwiner-vanishing
  levers, division survival at the H rung).
- The **constituent-classification** pillar (irreducible g₂-modules of dim ≤27 ⊆ {1,7,14,27}) is
  the TRUE BLOCKER. It needs a highest-weight / Casimir toolkit for the concrete `derivationLieQ`
  acting on `ImO` — OR equivalently the g₂ invariant-theory FFT/SFT to compute
  `dim (ImO^{⊗4})^{g₂} = 4` (3 metric pairings + one φ² contraction) ⟹ `Σ mᵢ² = 4` ⟹ with the
  three distinct known constituents 1,7,14 each once, the residual 27 is a SINGLE irreducible.

## The missing structural fact (NAMED, per SOUL W1 step 3)
There is **no banked route from semisimplicity to irreducibility of a COMPOSITE-dimensional
g₂-module.** The chain has: the prime-dimension collapse (7), Lie-simplicity (14), the so(n)
dimension bound (7) — all of which are structurally silent on 27 = 3³. What is missing is EITHER
(a) a highest-weight / Casimir classification toolkit for `derivationLieQ ↷ ImO` bounding the
low-dimensional irreducibles to {1,7,14,27}, OR (b) the g₂ invariant-theory computation
`dim (ImO^{⊗4})^{g₂} = 4`. Both are multi-node builds; NEITHER exists in Phys/ (grep for
highestWeight/weightSpace/Casimir/invariantTheory returns empty), and Mathlib has no concrete
g₂ representation theory.

## DECISION (STANDARD §4 / RUNBOOK W1 / task body)
Do NOT shrink to "semisimple", do NOT bridge, do NOT assert. This is a genuine W1 wall after a
full reframe. CHILD a dedicated creative-theory-native DISSOLUTION node TOWARD THE GATHER
carrying the full pillar decomposition above (semisimplicity + no-{1,7,14}-subrep via the trunk's
min-poly/prime-7/division levers + the constituent classification / invariant-theory blocker),
then BLOCK this node. A stalled board (honest block + queued dissolution ticket) is CORRECT; a
"done" node hiding an unproven irreducibility is the worst failure.

## Banked levers the child can build on (all foundations-only, imported not re-derived)
- N30a `isSemisimpleModule_adjoin` (generic definite-form semisimplicity) + `semisimpleModule_imRep_adjoin`.
- N28 `no_proper_invariant_ImO`, `restrictOp_skew`, `finrank_skewAdjoint_le_choose`; `ImLie_isIrreducible`.
- DerivationSimpleCollapse `prime_split_dichotomy`, `isotypic_prime_split`, `commutantHom`, `collapse_schur_branch` (the prime-7 field/Schur collapse — reusable for the no-1-subrep pillar's deg|7 step).
- N23 `DerivationPerfect` `derivationLieQ_perfect`/`_not_lieAbelian` (non-abelian, kills the deg-7 field branch).
- DerivationRep7IsotypicSchur intertwiner-vanishing levers (`isotypic_decomposition_canonical`) — mirror for no-7/no-14-subrep.
- N228 `tracelessSym`, `finrank_tracelessSym_eq_27`, `tracelessSym_adEnd_inv`, `tracelessSym_le_selfAdj`; N227 `bornBil`; N233 `fourSummands`/`canonical_internal_direct_sum_structure`.
