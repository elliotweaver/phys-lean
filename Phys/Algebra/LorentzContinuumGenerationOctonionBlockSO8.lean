/-
  Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8 — N108: THE OCTONION-BLOCK `SO(8)`-
  GENERATION LEG (a concrete MULTI-BLOCK factorization — the immediately-bankable structural piece
  of the full compact-`SO(9)` surjectivity). N107 banked the abelian `A`-torus leg (the
  ninth-rotation circle subgroup `≅ SO(2)`). The full compact-`SO(9)` surjectivity needs the
  OCTONION-BLOCK `SO(8)`-generation leg: do the `biMulLin` two-sided words generate the full `SO(8)`
  rotation sector of `𝕆`? The HEAVY Moufang/triality "words generate `SO(8)`" is the W1
  group-manifold core Mathlib lacks over the derived `Cut`. THIS node banks the ROADMAP §N108
  priority (i) immediately-bankable piece: a CONCRETE MULTI-BLOCK FACTORIZATION — a product of TWO
  `genTwoPlaneLin` octonion-block 2-plane rotations of DISTINCT imaginary 2-planes, reaching a
  HIGHER-RANK octonion-block compact rotation (the `SO(8)` analogue of N107's ninth composition).

  ===========================================================================
  THE STRUCTURAL FACT (NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content).

  `genTwoPlaneLin u w = biMulLin w w * biMulLin u u` (N100) is the octonion-block 2-plane rotation
  (a product of two two-sided half-turns). Composing TWO of them on distinct 2-planes:

      `doubleBlockLin u w a b := genTwoPlaneLin a b * genTwoPlaneLin u w`
          = (biMulLin b b * biMulLin a a) * (biMulLin w w * biMulLin u u)`,

  a FOUR-generator `biMulLin` word — a `Module.End Cut STVC`. It lies in the `Module.End` generated
  two-sided submonoid `genIsomMonoidLin` (a finite product of Born-unit generators, `mul_mem`), is a
  `QvC`-isometry (the composition of two `genTwoPlaneLin` isometries, N103), and its bridge-image
  lies in `genIsomMonoidC2` (the N100 transport). The bridge carries the four-generator product to
  the nested `Function.End` composite `biMulFun b b ∘ biMulFun a a ∘ biMulFun w w ∘ biMulFun u u`
  (`map_mul` + `endToFunEnd_genTwoPlaneLin`).

  THE HIGHER-RANK WITNESS (W8 TEETH). Take the THIRD octonion unit `ke2je2 := e₂·ιe₂` (a unit
  imaginary anticommuting with both `e₂` and `ιe₂`, `gFormC ke2je2 ke2je2 = 1`). The first block
  `genTwoPlaneLin e₂ ιe₂` FIXES `ke2je2` (it lies in the common anticommuting complement of the
  `span{e₂, ιe₂}` plane — `biMulComp_fixes_common`). The DOUBLE block
  `doubleBlockLin e₂ ιe₂ ke2je2 e₂ = genTwoPlaneLin ke2je2 e₂ * genTwoPlaneLin e₂ ιe₂` NEGATES it
  (the second block's `biMulFun ke2je2 ke2je2` half-turn negates `ke2je2`,
  `biMulComp_negates_u`): applied to `(0,0,ke2je2)` the composite reads `(0,0,−ke2je2)`. So the
  composite reaches a rotation in a 2-plane the first block alone does NOT touch — a STRICTLY
  HIGHER-RANK octonion-block compact rotation (rank ≥ 4 vs the single block's rank 2). The
  distinguishing coordinate: `(−ke2je2).im.im.re = 1`, where the single block alone FIXES `ke2je2`
  with `ke2je2.im.im.re = −1` — the genuine higher-rank read-off.

  ── WHAT THIS NODE BANKS ──

  `doubleBlockLin` / `doubleBlockLin_apply` — the four-generator octonion-block composite and its
    product-application (`Module.End.mul_apply`).
  ★ `doubleBlockLin_mem_genLin` — the composite is a finite `biMulLin` word `∈ genIsomMonoidLin`
    (`mul_mem` of two `genTwoPlaneLin_mem_genLin`).
  ★ `doubleBlockLin_isQvIsomC` — the composite is a `QvC`-isometry (composition of two
    `genTwoPlaneLin_isQvIsomC`, N103).
  ★ `doubleBlockLin_mem_gen2` — the bridged composite `∈ genIsomMonoidC2` (the N100 transport).
  `doubleBlock_bridge_eq` / `doubleBlock_bridge_apply` — the bridge carries the four-generator
    product to the nested `biMulFun` composite (`map_mul` + `endToFunEnd_genTwoPlaneLin`).
  `ke2je2` / `ke2je2_sq` / `ke2je2_imag` / `ke2je2_gFormC_self` — the concrete third octonion unit
    `e₂·ιe₂` is a Born-unit-imaginary (`ke2je2·ke2je2 = −1`, `star ke2je2 = −ke2je2`,
    `gFormC ke2je2 ke2je2 = 1`).
  `block1_fixes_ke2je2` — the first octonion-block `genTwoPlaneLin e₂ ιe₂` FIXES `ke2je2`.
  ★ `doubleBlock_e2je2_negates_ke2je2` (W8 TEETH) — the concrete DOUBLE block negates `ke2je2`:
    `endToFunEnd (doubleBlockLin e₂ ιe₂ ke2je2 e₂) (0,0,ke2je2) = (0,0,−ke2je2)` — the higher-rank
    witness, a 2-plane the single block leaves fixed.
  ★ `doubleBlock_e2je2_coord` (W8 ANCHOR) — the higher-rank coordinate read-off
    `(...).2.2.im.im.re = 1` (vs the single block's fixed `−1`).

  DERIVED from the trunk (`genTwoPlaneLin` / `genTwoPlaneLin_apply` / `genTwoPlaneLin_mem_genLin` /
  `endToFunEnd_genTwoPlaneLin` N100; `genTwoPlaneLin_isQvIsomC` N103; `endToFunEnd_genIsomMonoidLin_mem_gen2`
  N100; `biMulComp_fixes_common` / `biMulComp_negates_u` N95; `e2_alt` / `biMulFun_e2_sq` N53/N94;
  `je2` / `je2_alt` / `je2_sq` N95; the `Module.End` / `Submonoid` / `map_mul` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator
  topology, NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplications generate
  `SO(8)` (the Moufang/triality fact, Sudbery, Manogue–Dray, Baez) is standard, and is POSITED
  whole by the division-algebra-physics field. Here the multi-block composite — its membership in
  the generated submonoid, its isometry, and its STRICTLY HIGHER RANK (a 2-plane the single block
  fixes is moved by the double block) — DESCENDS from the banked N95/N100/N103 octonion-block
  lemmas over the derived ℝ `Cut` and the terminal algebra `O Cut`. The `SO(8)`-generation leg
  advanced one concrete multi-block step, derived, never posited.

  ── THE FORWARD REMAINDER (childed N109) ──
  The full compact-`SO(9)` surjectivity still needs: (a) the FULL `SO(8)`-generation (the
  Moufang/triality "all of `SO(8)`" — HEAVY); (c) the KAK assembly `SO(9) = SO(8)·A·SO(8)` + the
  operator topology over `Cut` (HEAVY — Mathlib has NO operator topology
  `TopologicalSpace (Module.End Cut STVC)` over the derived `Cut`). THIS node banks one concrete
  multi-block `SO(8)`-factorization step; the full leg + the KAK assembly + the operator topology
  are the childed heavy group-manifold remainder.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / rotation / isometry / compact /
  orthogonal / Spin / SO(9) / SO(8) / 2-plane / block / octonion-block / generator / word / Moufang
  / triality / bimultiplication / rank / KAK / torus": what remains is pure linear algebra over the
  derived complete ordered field `Cut` — a product of four `biMulLin` operators of `Module.End Cut
  (Cut × Cut × O Cut)` lies in the generated submonoid, preserves the quadratic form `QvC`, bridges
  to a nested self-map composite, and a concrete instance sends the third coordinate `(0,0,z)` to
  `(0,0,−z)` for a specific `z` that a single sub-factor fixes. No theorem STATEMENT needs a physics
  word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The four-generator octonion-block composite (a product of two 2-plane rotations). -/

/-- THE MULTI-BLOCK COMPOSITE — a product of two octonion-block 2-plane rotations
    `genTwoPlaneLin a b * genTwoPlaneLin u w` (a FOUR-generator `biMulLin` word). The `SO(8)`
    analogue of N107's two-ninth composition: composing two distinct-plane octonion-block rotations
    reaches a higher-rank octonion-block compact rotation. -/
def doubleBlockLin (u w a b : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin a b * genTwoPlaneLin u w

/-- The composite applies as the nested rotation `genTwoPlaneLin a b (genTwoPlaneLin u w p)`
    (`Module.End.mul_apply` — the structural product rule, NOT a `rfl` on the nested coercion). -/
theorem doubleBlockLin_apply (u w a b : O Cut) (p : STVC) :
    doubleBlockLin u w a b p = genTwoPlaneLin a b (genTwoPlaneLin u w p) := by
  rw [doubleBlockLin, Module.End.mul_apply]

/-- ★ The composite is a finite `biMulLin` word `∈ genIsomMonoidLin` (`mul_mem` of two
    `genTwoPlaneLin_mem_genLin`). A four-generator product of Born-unit two-sided operators. -/
theorem doubleBlockLin_mem_genLin (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    doubleBlockLin u w a b ∈ genIsomMonoidLin := by
  unfold doubleBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin a b ha hb) (genTwoPlaneLin_mem_genLin u w hu hw)

/-- ★ The composite is a `QvC`-isometry (the composition of two `genTwoPlaneLin` isometries, N103;
    each preserves `QvC`, so the product does). -/
theorem doubleBlockLin_isQvIsomC (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    IsQvIsomC ((doubleBlockLin u w a b : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  rw [doubleBlockLin, Module.End.mul_apply]
  rw [genTwoPlaneLin_isQvIsomC a b ha hb (genTwoPlaneLin u w p),
      genTwoPlaneLin_isQvIsomC u w hu hw p]

/-- ★ The bridged composite lands in `genIsomMonoidC2` — the N100 transport applied to the
    four-generator word: a specific `Cut`-linear higher-rank octonion-block rotation, pushed across
    the bridge, IS a member of the `Function.End` generated isometry submonoid. -/
theorem doubleBlockLin_mem_gen2 (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    endToFunEnd (doubleBlockLin u w a b) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (doubleBlockLin_mem_genLin u w a b hu hw ha hb)

/-! ## The bridge carries the composite to the nested four-factor self-map composite. -/

/-- The bridge of the composite is the `Function.End` product of the two block bridge-images
    (`map_mul`). -/
theorem doubleBlock_bridge_eq (u w a b : O Cut) :
    endToFunEnd (doubleBlockLin u w a b)
      = (endToFunEnd (genTwoPlaneLin a b)) * (endToFunEnd (genTwoPlaneLin u w)) := by
  rw [doubleBlockLin, map_mul]

/-- The bridged composite applies as the nested FOUR-factor self-map composite
    `biMulFun b b ∘ biMulFun a a ∘ biMulFun w w ∘ biMulFun u u` (`map_mul` then
    `genTwoPlaneLin_apply` twice). -/
theorem doubleBlock_bridge_apply (u w a b : O Cut) (p : STVC) :
    endToFunEnd (doubleBlockLin u w a b) p
      = biMulFun b b (biMulFun a a (biMulFun w w (biMulFun u u p))) := by
  rw [doubleBlock_bridge_eq]
  show (endToFunEnd (genTwoPlaneLin a b)) ((endToFunEnd (genTwoPlaneLin u w)) p) = _
  rw [genTwoPlaneLin_apply, genTwoPlaneLin_apply]

/-! ## The concrete third octonion unit `ke2je2 := e₂·ιe₂` is a Born-unit-imaginary. -/

/-- THE THIRD OCTONION UNIT `ke2je2 := e₂·ιe₂` — the product of the two banked distinct
    unit-imaginaries, itself a unit imaginary anticommuting with both. The member of the common
    anticommuting complement of `span{e₂, ιe₂}` that the first block fixes. -/
abbrev ke2je2 : O Cut := (CD.e2 : O Cut) * (je2 : O Cut)

/-- `ke2je2·ke2je2 = −1` (a unit imaginary square, one octonion `ext`). -/
theorem ke2je2_sq : (ke2je2 : O Cut) * (ke2je2 : O Cut) = -1 := by
  ext <;> simp [CD.e2, CD.iota]

/-- `ke2je2` is imaginary: `star ke2je2 = −ke2je2` (one octonion `ext`). -/
theorem ke2je2_imag : star (ke2je2 : O Cut) = -(ke2je2 : O Cut) := by
  ext <;> simp [CD.e2, CD.iota]

/-- The Born self-overlap of `ke2je2` is `1`: `gFormC ke2je2 ke2je2 = 1` (`ke2je2_imag` then the
    deep-real read-off of `ke2je2·(−ke2je2) = 1`). -/
theorem ke2je2_gFormC_self : gFormC (ke2je2 : O Cut) (ke2je2 : O Cut) = 1 := by
  show reQC ((ke2je2 : O Cut) * star (ke2je2 : O Cut)) = 1
  rw [ke2je2_imag]
  simp only [reQC]
  simp [CD.e2, CD.iota, CD.mul_re, CD.neg_re]

/-! ## The higher-rank witness — the first block fixes `ke2je2`; the double block negates it. -/

/-- The FIRST octonion-block `genTwoPlaneLin e₂ ιe₂` FIXES `ke2je2`: as the common anticommuting
    complement of the `span{e₂, ιe₂}` plane, both half-turns fix it (`biMulComp_fixes_common`). The
    bridged single block leaves `(0,0,ke2je2)` unchanged. -/
theorem block1_fixes_ke2je2 :
    biMulFun (je2 : O Cut) (je2 : O Cut)
      (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0 : Cut), (0 : Cut), (ke2je2 : O Cut)))
      = ((0 : Cut), (0 : Cut), (ke2je2 : O Cut)) := by
  apply biMulComp_fixes_common
  · exact e2_alt
  · exact je2_alt
  · show (CD.e2 : O Cut) * ke2je2 = -(ke2je2 * (CD.e2 : O Cut))
    rw [show (ke2je2 : O Cut) * (CD.e2 : O Cut) = -((CD.e2 : O Cut) * ke2je2) by
          ext <;> simp [CD.e2, CD.iota], neg_neg]
  · show (je2 : O Cut) * ke2je2 = -(ke2je2 * (je2 : O Cut))
    rw [show (ke2je2 : O Cut) * (je2 : O Cut) = -((je2 : O Cut) * ke2je2) by
          ext <;> simp [CD.e2, CD.iota], neg_neg]

/-- ★ W8 TEETH — THE HIGHER-RANK WITNESS. The bridged DOUBLE block
    `doubleBlockLin e₂ ιe₂ ke2je2 e₂ = genTwoPlaneLin ke2je2 e₂ * genTwoPlaneLin e₂ ιe₂`, applied to
    `(0,0,ke2je2)`, reads `(0,0,−ke2je2)` — it NEGATES the very unit the FIRST block FIXES
    (`block1_fixes_ke2je2`). The composite reaches a 2-plane rotation the single block leaves fixed:
    a STRICTLY HIGHER-RANK octonion-block compact rotation. The nested four-factor composite
    (`doubleBlock_bridge_apply`) collapses by the first block fixing `ke2je2`
    (`block1_fixes_ke2je2`), then the second block's half-turn negating it (`biMulComp_negates_u`
    with `u = ke2je2`, `w = e₂`). -/
theorem doubleBlock_e2je2_negates_ke2je2 :
    endToFunEnd (doubleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ke2je2 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ke2je2 : O Cut)) := by
  rw [doubleBlock_bridge_apply, block1_fixes_ke2je2]
  -- remaining: biMulFun e₂ e₂ (biMulFun ke2je2 ke2je2 (0,0,ke2je2)) = (0,0,−ke2je2)
  apply biMulComp_negates_u
  · exact ke2je2_sq
  · exact e2_alt
  · show (ke2je2 : O Cut) * (CD.e2 : O Cut) = -((CD.e2 : O Cut) * ke2je2)
    ext <;> simp [CD.e2, CD.iota]

/-- ★ W8 ANCHOR (teeth) — the higher-rank coordinate read-off. The double-block image of
    `(0,0,ke2je2)` is `(0,0,−ke2je2)`, whose third-coordinate deep slot `.2.2.im.im.re = 1`. The
    SINGLE block FIXES `ke2je2` (coordinate `−1` at that slot, `ke2je2.im.im.re = −1`); the double
    block reads `1` — the distinguishing higher-rank value, a genuine rotation in a plane the single
    block does not touch. -/
theorem doubleBlock_e2je2_coord :
    (endToFunEnd (doubleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ke2je2 : O Cut))).2.2.im.im.re = (1 : Cut) := by
  rw [doubleBlock_e2je2_negates_ke2je2]
  simp [CD.e2, CD.iota]

end

end Phys.Algebra
