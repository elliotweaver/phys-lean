# N258 PREREG — THE ELECTROWEAK REDUCTIVE LIE ALGEBRA su(2)_L ⊕ u(1)_Y as ONE LieSubalgebra of so(7)

## SELECTED TARGET (SELECT S1–S5 done; anti-bullshit gate passed — see kanban comments 79/80)

Assemble, from the gather tear `so(7) = 14 (Der O) ⊕ 7 (crossEmb)`, the SECOND Standard-Model
reductive factor as ONE derived Lie subalgebra — the twin of N247's colour-charge factor, with the
roles of semisimple / central swapped across the tear:
- **semisimple su(2)_L** = the isospin derivations {DI,DJ,DK}, living in the ADJOINT-14 (`range imRepL`)
- **central u(1)_Y** = the gather hypercharge `hyperOp = crossOp(κO 1)`, living in the FUNDAMENTAL-7 (`range crossEmb`)

## THE MEASURED STRUCTURE (workbench/N258-select, exact ℚ, reusable N255/N257 model)
- `⁅DI,DJ⁆=2DK, ⁅DJ,DK⁆=2DI, ⁅DK,DI⁆=2DJ` (all banked); dim span{DI,DJ,DK}=3.
- `[DI,Y]=[DJ,Y]=[DK,Y]=0` (Y central), dim span{DI,DJ,DK,Y}=4 (Y independent of su(2)_L).
- join bracket-closed; derived subalgebra `[join,join]` = dim 3 = su(2)_L (Y lost, central abelian ideal).
- all four skew-adjoint ∈ so(7).
- W8 SECTOR TEETH: `[Q,Y]≠0` (BB=−18); `Q ∉ span{DI,DJ,DK,Y}` — the electroweak factor and the
  colour-charge factor (N247) genuinely do NOT commute; the SM is not a trivial product.

## DELIVERABLE (production file Phys/Algebra/TowerGatherElectroweakReductiveLie.lean)

DEFINITIONS (mirror N247 chargeLine/colourImg, roles swapped):
- `isospinImg : Submodule ℚ (Module.End ℚ ImO) := isospinLie.toSubmodule.map imRepL`
  where `isospinLie : LieSubalgebra ℚ derivationLieQ` has carrier `isospinSpan = span{DI,DJ,DK}`
  (NEW: prove `lie_mem'` = isospinSpan bracket-closed, from the 9 su(2) bracket relations).
- `hyperLine : Submodule ℚ (Module.End ℚ ImO) := Submodule.span ℚ {hyperOp}`.
- `electroweakLie : LieSubalgebra ℚ (Module.End ℚ ImO)` with carrier `isospinImg ⊔ hyperLine`.

THEOREMS:
1. `isospinImg_lie_closed` — su(2)_L bracket-closed (via isospinLie.lie_mem + LieHom.map_lie).
2. `hyperLine_lie_isospinImg` / `isospinImg_lie_hyperLine` — Y commutes with su(2)_L
   (via hyperOp_bracket_DI/DJ/DK N255, extended bilinearly); `hyperLine_lie_hyperLine` (self-abelian).
3. `hyperLine_central` — ⁅x,y⁆=0 for x∈hyperLine, y∈electroweakLie (central abelian ideal).
4. `ew_derived_le_isospinImg` — the derived subalgebra of the join lands in su(2)_L (four-term
   expansion: 3 vanish by centrality, one is closure) — the u(1)_Y lost under bracketing.
5. `electroweakLie` — the join is a LieSubalgebra of Module.End ℚ ImO.
6. `electroweakLie_le_so7` — ⊆ skewAdjointLieSubalgebra bornBil (isospinImg via imRep_mem_so7,
   hyperLine via crossOp_mem_so7 at κO 1).
7. `finrank_isospinImg = 3` (imRepL injective + `finrank_isospinSpan = 3`, itself from the banked
   nonsingular Gram `isospinGram = −16·I₃` ⟹ {DI,DJ,DK} linearly independent).
8. `isospinImg_inf_hyperLine_eq_bot` — ⊥ (isospinImg ⊆ range imRepL [14], hyperLine ⊆ range crossEmb
   [7], `inter_eq_bot` N225).
9. `finrank_electroweakLie = 4` (= 3+1, rank–nullity on the trivial meet).
10. **W8 TEETH `chargeOp_not_mem_electroweakLie`** (coordinate-free sector-distinctness): if
    `chargeOp = x + h` (x∈isospinImg⊆14, h∈hyperLine⊆7), then `x = chargeOp − h ∈ range crossEmb ∩
    range imRepL = ⊥` (inter_eq_bot; chargeOp,h ∈ 7), so `chargeOp = h = c•hyperOp`; but then
    `traceForm7 chargeOp chargeOp = c·traceForm7 chargeOp hyperOp = c·0 = 0` (N257 `B_chargeOp_hyperOp`),
    contradicting `traceForm7 chargeOp chargeOp = −6` (N257). ⟹ the gather charge Q ∉ electroweak Lie.
11. CAPSTONE `electroweak_reductive_lie_structure` (∧ of the headline facts).

## THE ONE LAW / DISSOLUTION
Field POSITS SU(2)×U(1) as independent input factors with posited reductive structure. Theory
DERIVES it: both summands are the two halves of ONE gather tear (su(2)_L=derivations in the 14,
u(1)_Y=gather-tear in the 7); the direct-sum + centrality FORCED by `inter_eq_bot` (simplicity of
Der O) and isospin-fixedness of κO 1. This is the twin of N247 with semisimple/central swapped —
completing the SM reductive pair split across 14⊕7. It is ALSO the smallest forward step of the
RUNBOOK-named ascent (the mixing angle needs a structure LARGER than the neutral plane; the full
electroweak Lie algebra IS that richer structure) — WITHOUT positing the angle.

## SCOPE (HONESTY CLAUSE)
Banks the electroweak reductive Lie algebra su(2)_L ⊕ u(1)_Y + reductive splitting + dim 4 +
sector-distinctness teeth ONLY. Does NOT claim the weak mixing angle / coupling ratio / GMN
(measured blocked: Q∉span{T3,Y}, [Q,Y]≠0 — the angle stays deferred, needs structure beyond this).

## COMPILE-COST BUDGET / KILL (W9)
All proofs live at the derivation / End-of-ImO level — NO octonion coordinate bash (the heaviest
banked octonion facts, e.g. traceForm_DI_DI, are IMPORTED not recomputed). Expect W9-LIGHT.
KILL: if any single lemma compile > 90s, or file build > 6 min, STOP and decompose (split the
bracket-closure / independence proofs into per-generator sub-lemmas, bank once). Never raise proof
`maxHeartbeats` above what a banked import already sets. No `native_decide`, no `decide` on
octonion products.

## WORDS-REMOVABLE CHECK (pre-commit)
Delete isospin/hypercharge/electroweak/weak: statements are "the join of a bracket-closed 3-dim
subalgebra of range imRepL and a 1-dim subspace of range crossEmb is a 4-dim Lie subalgebra of
so(7), the 1-dim summand central, derived subalgebra = the 3-dim summand, summands meet in ⊥;
crossOp u1 ∉ the join." Pure math on banked objects. ✓

## COSTUME C289 (a WRONG version must fail)
Assert `finrank_electroweakLie = 5` (or the dim-3 join / a non-central hyperLine) — the gate must
reject the wrong dimension / wrong reductive structure.
