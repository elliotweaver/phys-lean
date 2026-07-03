# N259 PREREG — THE SHARED ISOSPIN CARTAN (the two SM reductive factors are NOT a direct product)

## TARGET
Over the derived octonion rung `O ℚ = CD (H ℚ)`, fundamental 7 = `ImO`, inside the single derived
`so(7)`: the two BANKED reductive Lie subalgebras
  chargeColourLie = chargeLine ⊔ colourImg   (u(1)_Q in 7 + su(3)_c in 14, dim 9, N247)
  electroweakLie  = isospinImg ⊔ hyperLine    (su(2)_L in 14 + u(1)_Y in 7, dim 4, N258)
INTERSECT in EXACTLY the 1-dimensional isospin Cartan line:
  ★★★ chargeColourLie ⊓ electroweakLie = Submodule.span ℚ {imRep DI}   (= span{T3})
  ★★  finrank (chargeColourLie ⊓ electroweakLie) = 1
  ★★★ finrank (chargeColourLie ⊔ electroweakLie) = 12   (= 9 + 4 − 1, inclusion–exclusion)
  W8 TEETH (not-a-direct-product): the two factors do NOT commute / the shared line is UNIQUE —
    hyperOp ∉ chargeColourLie (Y not colour-charge), chargeOp ∉ electroweakLie (banked N258), so the
    intersection is neither factor; and imRep DI ≠ 0 so the meet is NONtrivial (not ⊥, not a whole
    factor). [The heavier "colour+isospin generate all of so(7)" (12→21 closure) is DEFERRED — a
    later node, W9 risk.]

## MEASURED EXACT (workbench/N259-select/*.py, exact ℚ on the banked octonion tower)
- chargeColourLie ⊓ electroweakLie = span{imRep DI}, dim EXACTLY 1 (probe_intersection.py).
- The shared generator is UNIQUE: Q,Y,DJ,DK each in exactly ONE factor; only T3=imRep DI in BOTH.
- Forced by u1: DI(u1)=0 ⟹ [DI,Q]=0 ⟹ DI ∈ colourCentralizer ⟹ imRep DI ∈ colourImg∩isospinImg.
- dim(sum) = 12 = 9+4−1 (probe_intersection.py); [DJ,Q],[DK,Q] independent (probe_derisk_route.py).
- (companion, DEFERRED) ⟨colour ∪ isospin⟩_Lie = 14 = all g2; ⟨both factors⟩_Lie = 21 = all so(7).

## ROUTE (all at End/submodule level — NO octonion coordinate bash)
Let P14 = range imRepL (adjoint 14), P7 = range crossEmb (fundamental 7). Banked: P14 ⊓ P7 = ⊥
(`inter_eq_bot`, N225, simplicity of Der O).
- colourImg ⊆ P14 (`colourImg_le_range_imRep`), isospinImg ⊆ P14 (`isospinImg_le_range_imRep`),
  chargeLine ⊆ P7 (`chargeLine_le_range_crossEmb`), hyperLine ⊆ P7 (`hyperLine_le_range_crossEmb`).

⊇: imRep DI ∈ colourImg (DI ∈ colourCentralizer, `DI_mem_colour` N202; imRepL DI ∈ colourImg) ⊆
   chargeColourLie; imRep DI ∈ isospinImg (DI ∈ isospinSpan) ⊆ electroweakLie. So span{imRep DI} ⊆ meet.

⊆: x ∈ chargeColourLie ⊓ electroweakLie. `Submodule.mem_sup`: x = c + k (c∈chargeLine⊆P7, k∈colourImg⊆P14)
   and x = i + h (i∈isospinImg⊆P14, h∈hyperLine⊆P7). Then c + k = i + h ⟹ k − i = h − c.
   k−i ∈ P14, h−c ∈ P7, equal ⟹ ∈ P14 ⊓ P7 = ⊥ ⟹ k = i and h = c.
   • k = i ∈ colourImg ⊓ isospinImg = span{imRep DI}  (see below).
   • c = h ∈ chargeLine ⊓ hyperLine = ⊥ (chargeOp, hyperOp independent) ⟹ c = 0.
   ∴ x = k ∈ span{imRep DI}.

colourImg ⊓ isospinImg = span{imRep DI}:
   colourImg = colourCentralizer.toSubmodule.map imRepL, isospinImg = isospinSpan.map imRepL.
   `Submodule.map_inf imRepL imRep_injective` ⟹ colourImg ⊓ isospinImg =
     (colourCentralizer.toSubmodule ⊓ isospinSpan).map imRepL
     = (isospinSpan ⊓ colourCentralizer.toSubmodule).map imRepL   [inf_comm]
     = (span ℚ {DI}).map imRepL   [`meet_eq_span_DI` N202, banked]
     = span ℚ {imRepL DI} = span ℚ {imRep DI}   [`Submodule.map_span` / map singleton].

chargeLine ⊓ hyperLine = ⊥:
   x = a•chargeOp = b•hyperOp. Apply traceForm7(·, chargeOp): a·(−6) = b·0 = 0 (N257
   `B_chargeOp_chargeOp_via_isometry` = −6, `B_chargeOp_hyperOp` = 0; traceForm7 bilinear) ⟹ a = 0 ⟹ x = 0.

finrank(sum) = 12: `Submodule.finrank_sup_add_finrank_inf_eq chargeColourLie.toSubmodule
   electroweakLie.toSubmodule`: finrank(sup) + finrank(inf) = finrank(cc) + finrank(ew) = 9 + 4.
   With finrank(inf) = 1 (this node) ⟹ finrank(sup) = 12.

## LEVERS (all banked — grep-confirmed)
- inter_eq_bot (N225, TowerGatherObstructionComplementSo7)
- meet_eq_span_DI, DI_mem_colour, DI, isospinSpan (N202, DerivationColourIsospinMeet / …NonNormalize)
- colourImg, chargeLine, chargeLine_le_range_crossEmb, colourImg_le_range_imRep, chargeColourLie,
  chargeColourLie_toSubmodule, chargeColourLie_finrank=9 (N247)
- isospinImg, hyperLine, isospinImg_le_range_imRep, hyperLine_le_range_crossEmb, electroweakLie,
  electroweakLie_toSubmodule, electroweakLie_finrank=4, chargeOp_not_mem_electroweakLie (N258)
- imRep_injective (N22); imRepL (N225)
- B_chargeOp_chargeOp_via_isometry=−6, B_chargeOp_hyperOp=0, traceForm7 bilinear (N257)
- hyperOp_ne_zero (N255), DI_ne_zero (N202)
- Mathlib: Submodule.map_inf, Submodule.map_span, Submodule.mem_sup, inf_comm,
  Submodule.finrank_sup_add_finrank_inf_eq, finrank_span_singleton.

## COMPILE-COST BUDGET / KILL (W9)
LIGHT node — every obligation is a submodule/finrank argument composing banked lemmas; NO coordinate
`ring`/`decide`/`native_decide` on octonion products, NO degree-4 expansion. Precedent: N258 (32 decls,
whole-module 33s). KILL: if any single obligation exceeds ~90s isolated, STOP and decompose (do NOT
raise proof-kernel maxHeartbeats; the synthInstance bump is instance-search only, banked precedent).
Expect whole-module olean < 40s. If the map_inf/map_span chain or mem_sup destructuring fights beyond
2–3 tactic-family switches, re-examine setup (not a 4th variant).

## FREE-FLOATING CHECK (SOUL rail)
Every headline TYPE mentions the banked tower objects — `chargeColourLie`/`electroweakLie`/`colourImg`/
`isospinImg`/`chargeLine`/`hyperLine`/`imRep`/`DI` on the derived `O ℚ`. The intersection is the CONCRETE
meet of the two banked LieSubalgebras, NOT a carrier-agnostic construction. All new names grep-clean
before writing.

## SCOPE — HONESTY CLAUSE
Banks the intersection = span{imRep DI} + finrank 1 + finrank(sum)=12 + not-a-direct-product teeth ONLY.
Does NOT claim: the so(7)-generation (12→21 closure — heavier, DEFERRED to a later node); the weak
MIXING ANGLE / GMN (structurally blocked — the shared Cartan is the hinge the angle needs, but the angle
itself stays deferred). The mixing-angle deferral is respected: this node supplies the third neutral
generator (the shared T3 connecting the two sectors) WITHOUT positing the angle.

## COSTUME C290
`1 = 290` biting at the intersection-finrank TEETH: a WRONG reading (the meet is not 1-dim / the two
factors share nothing / share more than T3 / the intersection is a whole factor) reduces through the
banked `finrank(chargeColourLie ⊓ electroweakLie) = 1` to the false numeric `1 = 290`. Pair (290,1)
fresh, RHS 290 distinct from every prior right-hand value.
