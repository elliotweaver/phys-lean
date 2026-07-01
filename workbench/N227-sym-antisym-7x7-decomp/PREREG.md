# N227 PREREG — THE SYMMETRIC/ANTISYMMETRIC SPLIT OF 7⊗7: End ℚ ImO = Sym²(28) ⊕ Λ²(21=so(7)) AS g₂-MODULES

## FRONT SELECTION (W4.5 look WIDEST + OVERNIGHT LOCK: gather-only)
N223–N226 built the ANTISYMMETRIC side of the Clebsch–Gordan `7⊗7`: `so(7) = Λ²7 = 21 = 14⊕7`
(adjoint g₂ ⊕ fundamental 7), with the faithful embedding, the complement, and the g₂-equivariant
projector. That arc is a *classification-sufficient* pinning of the Λ² side. Per W4.5, the DUAL
projector `1−projFun` and further Λ² invariants would RE-CONFIRM the banked 14⊕7 (over-pinning /
gold-plating). The genuinely-NEW structure the chain LACKS is the **SYMMETRIC side**:
`End ℚ ImO = Sym²7 ⊕ Λ²7 = 28 ⊕ 21 = 49`, where `Λ²7 = so(7)` is exactly the banked skew-adjoint
subalgebra and `Sym²7 = 28` is the self-adjoint complement (the metric/trace-carrying side,
containing the trivial rep 1 = ℚ·id, the first step toward `7⊗7 = 1⊕7⊕14⊕27`). This OPENS the
symmetric half of `7⊗7` that the whole so(7) arc never touched — a true frontier node, not a re-pin.

STAYS ON THE GATHER: the arena is the banked octonion rung `O ℚ = CD (H ℚ)`, the banked fundamental
7-module `ImO` (N22), and the banked Born form `bornBil` (N223) whose skew-adjoint submodule IS the
concrete `so(7)`. Every headline TYPE mentions banked tower objects (`bornBil`/`ImO`/`imRep`/
`crossEmb`/`skewAdjointSubmodule`/`selfAdjointSubmodule bornBil` on the derived `O ℚ`). No
hypercharge/Freudenthal/gauge front (LOCK).

## THE OBJECT (derived, not posited)
Over `O ℚ`, on `End ℚ ImO` (= `7⊗7` as a g₂-module via `X ↦ ⁅imRep D, X⁆`):
1. THE BORN-ADJOINT INVOLUTION. `bAdj φ := bornBil.leftAdjointOfNondegenerate bornBil_nondegenerate φ`
   — the transpose w.r.t. the Born form. Because `bornBil` is SYMMETRIC (banked `bornBil_isSymm`,
   N225) and NONDEGENERATE (banked `bornBil_nondegenerate`, N225), `bAdj` is an INVOLUTION
   (`bAdj_involutive`), additive/ℚ-linear (`bAdj_add`/`bAdj_smul`/`bAdj_sub`/`bAdj_neg`),
   anti-multiplicative (`bAdj_mul`), and fixes the identity (`bAdj_one`, so `1 ∈ self`).
2. THE CHARACTERIZATION. `mem_self_iff`: `φ ∈ selfAdjointSubmodule bornBil ↔ bAdj φ = φ`;
   `mem_skew_iff`: `φ ∈ skewAdjointSubmodule bornBil ↔ bAdj φ = −φ`.
3. ★★★ THE DECOMPOSITION (the crux). `selfSkew_isCompl`:
   `IsCompl (selfAdjointSubmodule bornBil) (skewAdjointSubmodule bornBil)`.
   Disjoint: `φ = bAdj φ = −φ ⇒ 2φ = 0 ⇒ φ = 0` (char 0). Codisjoint: the CANONICAL split
   `φ = ½(φ + bAdj φ) + ½(φ − bAdj φ)` — self part + skew part. `End ℚ ImO = Sym² ⊕ Λ²`.
4. THE DIMENSIONS. `finrank_end_eq_49`: `finrank (End ℚ ImO) = 49` (via `Module.finrank_linearMap`
   + banked `finrank_ImO = 7`). `finrank_selfAdj_eq_28`: `finrank (selfAdjointSubmodule) = 28`
   (via `Submodule.finrank_add_eq_of_isCompl` + banked `finrank_so7_eq_21`, N225: `49 − 21 = 28`).
   The symmetric side is 28-dimensional = `1 + 27` (the trivial + the traceless-symmetric 27).
5. BOTH SUMMANDS ARE g₂-SUBMODULES. `adEnd D : Module.End ℚ (End ℚ ImO)`, `X ↦ ⁅imRep D, X⁆` (the
   g₂-action on `7⊗7`). `skewAdj_adEnd_inv`: `so(7)` closed (banked `isSkewAdjoint_bracket` +
   `imRep_mem_so7`). `selfAdj_adEnd_inv`: the self-adjoint side closed (bAdj anti-mult + `imRep D`
   skew ⇒ `⁅imRep D, X⁆` preserves self-adjointness). So `7⊗7 = 28 ⊕ 21` INTO g₂-submodules.
6. W8 NON-VACUITY. `one_mem_selfAdj`: `1 ∈ self` (so the self side is nonzero — carries the trivial
   rep 1 = ℚ·id); `one_adEnd_zero`: `adEnd D 1 = 0` (the identity is g₂-invariant — the trivial
   rep, the `1` of `7⊗7 = 1⊕7⊕14⊕27`).
Capstone `sym_antisym_decomposition_structure` bundles isCompl + dims (28,21,49) + both g₂-stable.

## MEASURE-FIRST VERDICT (W9) — frozen before compute
LIGHT node. probe1 (bAdj involution + add/smul/sub/mul + mem_self_iff + mem_skew_iff) clean ~15s
after switching the skew-iff closing from `linarith` to an `isAdjointPair_swap` calc (TACTIC-FAMILY
switch per SOUL — the coordinate `linarith`/`simpa` form timed out at whnf on `⇑(-φ)` unification;
the symmetric-form calc closes instantly). probe2 (selfSkew_disjoint/codisjoint/isCompl) route
confirmed. Every obligation is structural over banked facts (`bornBil_isSymm`/`bornBil_nondegenerate`
N225, `finrank_ImO` N22, `finrank_so7_eq_21` N225, `isSkewAdjoint_bracket`/`imRep_mem_so7` N223) +
Mathlib adjoint-pair / projection / finrank MACHINERY. NO coordinate ring, NO degree-4 expansion,
NO W9 kernel-blowup risk. KILL = 120s/obligation. INSTRUMENT NOTE: the ℚ-`End ℚ ImO` module carries
a synthInstance diamond → `set_option synthInstance.maxHeartbeats 1000000` needed for `IsAdjointPair`
smul/comp lemmas (same diamond N226 flagged; NOT a maxHeartbeats proof-search raise). Close skew/adj
sign goals by the `bornBil_symm` calc, NEVER by `linarith` on coerced neg-apply.

## FREE-FLOATING CHECK (SOUL rail)
Every headline TYPE mentions the banked tower objects `bornBil`/`ImO`/`imRep`/`crossEmb`/
`skewAdjointSubmodule bornBil`/`selfAdjointSubmodule bornBil` on the derived `O ℚ`. The self/skew
submodules are the CONCRETE ones of the banked Born form on the banked fundamental 7 — NOT an
abstract symmetric/antisymmetric split of an arbitrary bilinear form. NOT a re-pin of N225 (which
banked the Λ² = so(7) = 14⊕7 FACTS; N227 banks the Sym² COMPLEMENT of so(7) inside End, the
symmetric half of 7⊗7 — a NEW object, dim 28, with its own g₂-stability), NOT a re-pin of N226
(the projector WITHIN so(7); N227 is the projector of End ONTO so(7) along its symmetric complement).

## PLAN
Production `Phys/Algebra/TowerGatherSymAntisymDecomp.lean`; wire `Phys.lean` + `AxiomAudit`; costume
C259 (`28 = 259`: self-adjoint side GENUINELY dim 28; a wrong claim it collapses / is not 49−21
forces 28=259 in ℕ). Bank-as-you-go; commit BEFORE gate; gate bg + poll non-blocking; STANDARD;
child N228 on tail (max_retries=25).
