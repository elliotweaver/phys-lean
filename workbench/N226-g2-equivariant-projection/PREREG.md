# N226 PREREG — THE g₂-EQUIVARIANT PROJECTION so(7) → crossEmb(7) ALONG imRep(g₂)

FROZEN BEFORE COMPUTE (measure-first, W9). Under the OVERNIGHT PRIORITY LOCK — a GATHER front.

## FRONT SELECTED (of the ROADMAP-named gather options)
The ROADMAP §N225-superseded frontier names among the next gather cuts:
  "the g₂-equivariant PROJECTION so(7) → 7 / so(7) → 14 now that the direct sum is explicit
   (the projector onto crossEmb(7) along imRep(g₂), a g₂-module map)."
This is the SELECTED front. It OPENS structure the chain does not have: N225 banked the
direct-sum FACTS (⊓=⊥, ⊔=so7, dims 14/7/21) but never the SPLITTING MAP. N226 builds the
retraction `projFun : so(7) → so(7)` and proves it a MORPHISM OF g₂-MODULES (g₂-equivariant).
That is a NEW object (a genuine idempotent g₂-module map), not a re-pin of the decomposition.

## THE OBJECT (derived, not posited) — all TYPES mention banked tower objects
Over derived ℚ, O ℚ = CD(H ℚ), banked ImO (N22), crossEmb (N224), imRep (N22), bornBil (N223):
- `isCompl_fun_adj` : IsCompl (funIn) (adjIn) inside ↥so7  — packages N225 `inter_eq_bot`+`sup_eq_so7`
  as `IsCompl` on the subtype (funIn = comap subtype (range crossEmb), adjIn = comap subtype (range imRepL)).
- `adSo7 D` : Module.End ℚ ↥so7, `X ↦ ⁅imRep D, X⁆`  — the adjoint g₂-action on so7 (well-defined
  since so7 is a Lie subalgebra: `LinearMap.BilinForm.isSkewAdjoint_bracket` + banked `imRep_mem_so7`).
- `funIn_adSo7_inv`/`adjIn_adSo7_inv` — both summands g₂-stable under adSo7 (banked N224
  `crossEmb_range_g2_invariant` / N225 `imRep_range_g2_invariant`).
- `projFun` : Module.End ℚ ↥so7 := IsCompl.projection isCompl_fun_adj — THE PROJECTOR onto the
  fundamental 7 along the adjoint 14.
- `projFun_idem` — IsIdempotentElem projFun (Mathlib `projection_isIdempotentElem`).
- `projFun_range` = funIn, `projFun_ker` = adjIn  (Mathlib `projection_range`/`projection_ker`).
- `finrank_projFun_range` : finrank (range projFun) = 7  (W8 non-vacuity; costume target).
- ★★★ `projFun_equivariant` : projFun (adSo7 D X) = adSo7 D (projFun X)  — THE CROWN. The projector
  is a MORPHISM OF g₂-MODULES: it commutes with the adjoint g₂-action. Proof = decompose
  X = projFun X + (X − projFun X) (fundamental ⊕ adjoint), push adSo7 D through, project each
  summand (funIn→identity, adjIn→0) using the two invariances.
- Capstone `g2_equivariant_projection_structure` bundles idempotent + range=fundamental + ker=adjoint
  + equivariant + finrank range = 7.

## MEASURE-FIRST VERDICT (probes already run, all clean)
- probe1: isCompl_fun_adj (crux) + projFun def + idem/range/ker — clean ~15–20s.
- probe2: projFun as Module.End (explicit-instance @ form fixes the ℚ-submodule instance diamond) — clean 17s.
- probe3: adSo7 + funIn/adjIn invariances — clean 26s.
- probe4: FULL projFun_equivariant (the crown) — clean 23s.
- probe5: projFun_range + finrank_projFun_range = 7 (via comapSubtypeEquivOfLe + finrank_crossEmb_range) — clean 15s.
Every obligation is structural over banked facts (N224 g₂-invariance, N225 inter_eq_bot/sup_eq_so7,
N223 imRep_mem_so7, Mathlib Projection/SkewAdjoint MACHINERY). NO coordinate ring, NO degree-4
expansion, NO W9 kernel-blowup. KILL = 120s/obligation, never approached. NO maxHeartbeats raise.

## INSTRUMENT NOTE (W9)
`IsCompl.projection` and its lemmas live in `namespace Submodule` and need EXPLICIT instance
pinning `@Submodule.IsCompl.projection ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj`
because the ℚ-submodule carries a Ring-vs-CommRing Semiring instance diamond that leaves the
inferred `p q` as metavars in the bare dot form. `map_sub` on the `def projFun` needs the term
form `map_sub projFun X Y`. Both discovered in probes; frozen here.

## COSTUME
C258 = `7 = 258` biting via `finrank_projFun_range` (the projector's image is GENUINELY the full
7-dim fundamental; a degenerate/zero projector would have a different range dim). RHS 258 fresh.

## UNBROKEN / WORDS-REMOVABLE
Imports only banked N225 `TowerGatherObstructionComplementSo7` (transitively N224/N223/N22/N24/N28)
+ Mathlib `LinearAlgebra.Projection`. Ground = derived ℚ; nothing posited; no bridge. Delete every
physics word (g₂/so(7)/fundamental/adjoint/projection/module): over derived ℚ and O ℚ=CD(H ℚ), for
ImO, bornBil, imRep, crossEmb — the two linear-map ranges are complementary submodules of
bornBil.skewAdjointSubmodule; the idempotent linear map onto range crossEmb along range imRep has
range of finrank 7 and commutes with X ↦ ⁅imRep D, X⁆. No theorem statement needs a physics word.
