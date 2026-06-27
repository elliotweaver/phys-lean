# N99 PREREG — THE FUNCTION.End ↔ MODULE.End MONOID BRIDGE

FROZEN before compute. Run 275 (fresh; parent N98 LANDED at HEAD d93062f).

## THE NODE (priority ii of the ROADMAP §N99 frontier — the algebraic obstruction
the global reverse surjectivity passes through, surfaced by the N98 measure).

The obstruction (N98 measure): the polar/KAK compact part `k := g∘(p^{1/2})⁻¹`
(N93 `isometry_compact_part_isQvIsom`) is a `Module.End Cut STVC` OPERATOR, but
the generators `biMulFun u u'` and the generated submonoid
`genIsomMonoidC2 : Submonoid (Function.End STVC)` live in the `Function.End`
(bare-self-map) world. Stating the global reverse surjectivity
`qvIsomMonoidC ≤ genIsomMonoidC2` requires bridging `Module.End → Function.End`.

MEASURE-FIRST verdict to confirm in the probe: this is a CLEAN WRAP (priority ii's
"clean wrap", NOT a W1 remainder) — the coercion `⇑ : Module.End Cut STVC →
Function.End STVC` is a MONOID HOMOMORPHISM (preserves comp = mul, id = one), it is
FAITHFUL (injective: a linear map is determined by its underlying function), the
generators `biMulFun u u'` are themselves images of explicit linear maps, and the
N93 compact part `k`, pushed across the bridge, lands in `qvIsomMonoidC`. So the
whole generation question becomes well-posed in ONE monoid. The bridge is the joint
the global surjectivity passes through; the genuine GENERATION (k = finite product
of generators) + operator topology + Spin(9)→SO(9) exhaustion stay the W1 HEAVY
remainder, childed N100.

## DELIVERABLES (production, foundations-only)
- `endToFunEnd : Module.End Cut STVC →* Function.End STVC` — the coercion monoid hom
  (the BRIDGE; map_one' = id, map_mul' = comp).
- `endToFunEnd_apply` — `endToFunEnd k = ⇑k` (computation rule).
- `endToFunEnd_injective` — the bridge is FAITHFUL (no information lost crossing it).
- `biMulLin u u'` — the explicit `Module.End` whose bridge-image is `biMulFun u u'`
  (the generators live in the bridged image; the algebra mult is Cut-bilinear).
- `endToFunEnd_biMulLin` — `endToFunEnd (biMulLin u u') = biMulFun u u'`.
- ★ `isometry_compact_part_mem_qvIsomMonoidC` — THE JOINT: the N93 compact part `k`,
  pushed across the bridge, lies in `qvIsomMonoidC : Submonoid (Function.End STVC)`.
- W8 non-vacuity: `endToFunEnd_biMulLin_e2_apply` (concrete coordinate read) + a
  costume C131 biting a WRONG bridged-coordinate / wrong-hom claim.

## GO / NO-GO
GO if: the monoid-hom map_mul'/map_one' close by `LinearMap.coe_comp`/`rfl`-level
lemmas (Function.End mul = ∘ confirmed), injectivity by `DFunLike.coe_injective`,
`biMulLin` builds from `O Cut` algebra bilinearity (mul_add/add_mul/smul/…), and the
compact-part landing is `isometry_compact_part_isQvIsom` transported. Each decl < ~15s.

NO-GO / KILL (INSTRUMENT, not theory — W9): if ANY single obligation exceeds a
**90-second** compile in a bounded probe, STOP — do not inflate maxHeartbeats, do not
grind. The bridge is pure algebra; a 90s+ obligation means the framing is wrong
(e.g. biMulLin bilinearity bashing coordinates instead of using algebra lemmas) →
reframe through the trunk (use the `O Cut` algebra instances) or DECOMPOSE: bank the
bridge hom alone (endToFunEnd + apply + injective + compact-part landing, all cheap)
and child `biMulLin` + the generation remainder.

## W8 COSTUME (C131) — MUST BITE
A WRONG bridge claim reducing to a false numeric DISTINCT from C115 1=7 … C130 −1=17.
Plan: a wrong read of `endToFunEnd (biMulLin e₂ e₂)` applied to a space vector — the
genuine value vs a bogus one, forcing e.g. `-1 = 23` (pick a fresh RHS, verify
distinct from the banked battery). The wrong claim MUST fail to compile (EXIT=1).

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/isometry/compact/orthogonal/polar/KAK/generator/
Moufang/bimultiplication/Spin/SO(9)/cover/generation/bridge": what remains is pure
math — the coercion `Module.End Cut STVC → Function.End STVC` is an injective monoid
hom, the maps `(t,x,v)↦(t,x,u·(v·u'))` are images of explicit linear maps, and the
compact operator `g∘(p^{1/2})⁻¹` of a `QvC`-preserving `g` is, as a bare self-map, in
the `QvC`-preserving submonoid. NO physics word in any STATEMENT.

NO posited Lorentz group, NO Mathlib ℝ/ℂ as content (the field is the DERIVED `Cut`),
NO bridge-in-the-forbidden-sense (this is a proved monoid homomorphism, not an
asserted physics identification).
