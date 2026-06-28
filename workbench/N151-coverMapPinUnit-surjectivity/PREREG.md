# N151 PREREG — THE SURJECTIVITY of coverMapPinUnit onto SO⁺(1,9)

FROZEN before compute. (THE ONE LAW reframe: a reflection is scale-invariant in its axis.)

## TARGET (priority front (i) from the ROADMAP §N151 frontier)
`coverMapPinUnit_surjective : Function.Surjective coverMapPinUnit`
i.e. every linear `BvC`-isometry `g ∈ bvIsomLinMonoid` (the full continuum Lorentz group
`SO⁺(1,9)`, N132) is the covered operator of some UNIT-normalized Pin element `u ∈ PinUnitSub`.

This is the OTHER HALF of the double-cover `↠`: N150 banked the exact kernel `{1,-1}`
(injectivity-mod-center); this banks the SURJECTIVITY of the unit-normalized cover.

## THE REFRAME (THE ONE LAW — trunk-native, NOT a grind)
`coverMap_surjective` (N144) already covers all of `SO⁺(1,9)` on the BLOATED `CoversSub`,
whose reflection generators `cliffUnitOf a` use RAW axes of arbitrary norm `QvC a`. To DESCEND
to the unit-normalized domain `PinUnitSub` (`QvC a = ±1` generators), use the trunk fact that a
Householder reflection depends only on the DIRECTION of its axis:
  `houseHolderM (c • a) = houseHolderM a`  for `c ≠ 0`  (scale-invariance).
So any anisotropic axis `a` is replaced by the UNIT axis `unitAxis a := (cutSqrt |QvC a|⁻¹) • a`
(`QvC (unitAxis a) = sign(QvC a) = ±1`), whose `cliffUnitOf` is a UNIT Pin generator
(`pinUnitGenSet`) covering the SAME reflection `houseHolderM a`. Then re-run the cover induction
over reflection words landing inside `PinUnitSub`, and conclude by N132's classification +
`coverOp` uniqueness. NO new ground; pure trunk + banked cutSqrt (N57) + BvC bilinearity.

## DEPENDENCIES (all BANKED — W2 import-and-use)
- `cutSqrt` / `cutSqrt_sq` / `cutSqrt_pos` / `cutSqrt_nonneg` (N57, LorentzContinuumSqrt)
- `BvC_smul_left` / `BvC_smul_right` / `BvC_self` / `QvC` (bilinearity + QvC = BvC diag)
- `houseHolderM` / `houseHolderM_apply` (N-Householder)
- `cliffUnitOf` / `cliffCovers_reflection` / `cliffCovers_one` / `cliffCovers_mul`
  / `cover_global_reflection_word` / `reflection_closure_eq_bvIsomLinMonoid` (N132/global cover)
- `pinUnitGenSet` / `PinUnitSub` / `pinUnitSub_le_coversSub` / `coverMapPinUnit`
  / `coverMapPinUnit_coe` (N146)
- `coverOp` / `coverOp_covers` / `cliffCovers_unique` / `coverMapPin*` family (N144)
- `bvIsomLinMonoid` / `boostEndC_isBvIsomLin` (N132, W8 teeth)

## DECL PLAN (production: Phys/Algebra/LorentzContinuumCliffordPinSurjective.lean)
1. `QvC_smul (c : Cut) (a : STVC) : QvC (c • a) = c * c * QvC a`
2. `houseHolderM_smul {a} (c) (hc : c ≠ 0) (ha : BvC a a ≠ 0) : houseHolderM (c • a) = houseHolderM a`
3. `unitNormCut (a : STVC) : Cut := cutSqrt (|QvC a|⁻¹)`   (the rescale scalar)
4. `unitNormCut_pos {a} (ha : QvC a ≠ 0) : 0 < unitNormCut a`
5. `unitAxis (a : STVC) : STVC := unitNormCut a • a`
6. `QvC_unitAxis {a} (ha : QvC a ≠ 0) : QvC (unitAxis a) = 1 ∨ QvC (unitAxis a) = -1`
7. `unitAxis_aniso {a} (ha : BvC a a ≠ 0) : BvC (unitAxis a) (unitAxis a) ≠ 0`
8. `cliffUnitOf_unitAxis_mem {a} (ha) : cliffUnitOf (unitAxis a) _ ∈ PinUnitSub`
9. `cliffUnitOf_unitAxis_covers {a} (ha) : CliffCovers (cliffUnitOf (unitAxis a) _) (houseHolderM a)`
10. `cover_global_reflection_word_pinUnit {g} (hg : g ∈ closure houseHolderMSet) :
        ∃ u ∈ PinUnitSub, CliffCovers u g`   (closure_induction, unit generators)
11. `cover_global_bvIsom_pinUnit {g} (hg : g ∈ bvIsomLinMonoid) : ∃ u ∈ PinUnitSub, CliffCovers u g`
12. ★★ `coverMapPinUnit_surjective : Function.Surjective coverMapPinUnit`
13. W8 teeth: `coverMapPinUnit_boost_apply : ∃ u : PinUnitSub, coverMapPinUnit u = boostEndC (5/3)(4/3)`

## GO / NO-GO
GO if: probe of the WHOLE file `lake env lean` exits 0, every decl foundations-only.
NO-GO (→ decompose/child): if `houseHolderM_smul` or `cover_global_..._pinUnit` resists.
  Decompose: bank the immediately-bankable structural piece (the scale-invariance lemma +
  unit-normalization lemmas — themselves a genuine new datum) and child the global remainder.

## KILL BUDGET (W9 — INSTRUMENT failure classifier)
- Any SINGLE obligation compiling > 90s = instrument wall → MEASURE/DECOMPOSE/REFRAME, not grind.
- Whole-file probe expected ~20-40s (light bilinear algebra; no monolithic brute, no 2^n).
- If any tactic needs inflated maxHeartbeats → STOP, that is the W9 signal (the trunk route is light).
- max runtime 2700s / iteration budget ~90: checkpoint ~50%, FINALIZE with turns+iters to spare.

## COSTUME C183 (W8 — MUST bite)
A WRONG surjectivity / unit-normalization / scale-invariance / sqrt-rescaling read-off, reducing
to a false numeric DISTINCT from the banked battery (… C182 2=150). Use `1 = 151` or a distinct
value. Reuse a banked object (e.g. a WRONG `QvC_unitAxis`/`unitNormCut`/`coverMapPinUnit` value).

## STANDARD (the second gate)
UNBROKEN: every object from the chain N49–N150 + derived ℝ Cut + cutSqrt + CliffC/Pin family.
COMPLETE: foundations-only {propext, Classical.choice, Quot.sound}; verify #print axioms myself.
PHYSICS-WORDS-REMOVABLE: delete Lorentz/reflection/cover/spinor/Clifford/Pin/Minkowski/isometry/
surjectivity/unit-normalized → pure math: every linear `BvC`-isometry is the covered operator of
a `PinUnitSub` element (the unit-axis reflection-word cover), over the derived field Cut.
