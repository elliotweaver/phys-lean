/-
  Phys.Algebra.LorentzContinuumGenerationOctonionBlockQuad — N110: THE QUAD-BLOCK `SO(8)`-
  GENERATION LEG (a concrete rank-≥8 octonion-block factorization — the immediately-bankable
  structural piece of the full compact-`SO(9)` surjectivity, extending N109's three-block witness
  one rank higher to the TOP of the explicit-witness ladder). N107 banked the abelian `A`-torus leg;
  N108 banked a concrete HIGHER-RANK TWO-block octonion factorization (`doubleBlockLin` reaches a
  2-plane the single block fixes — rank ≥ 4); N109 banked the THREE-block factorization
  (`tripleBlockLin` reaches a third 2-plane both lower blocks fix — rank ≥ 6). The full compact-
  `SO(9)` surjectivity needs the FULL `SO(8)`-generation: do the `biMulLin` two-sided words generate
  the full `SO(8)` rotation sector of `𝕆`? The HEAVY Moufang/triality "words generate `SO(8)`" is
  the W1 group-manifold core Mathlib lacks over the derived `Cut`. THIS node banks the ROADMAP §N110
  priority (i) immediately-bankable piece: a CONCRETE QUAD-BLOCK FACTORIZATION — a product of FOUR
  `genTwoPlaneLin` octonion-block 2-plane rotations of DISTINCT imaginary 2-planes, reaching the
  STRICTLY-HIGHEST-RANK explicit octonion-block compact rotation (rank ≥ 8 — the FULL rank on the
  8-dimensional octonion space `O Cut`, the TOP of the explicit witness ladder rank 2→4→6→8).

  ===========================================================================
  THE STRUCTURAL FACT (NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content).

  `tripleBlockLin u w a b c d = genTwoPlaneLin c d * doubleBlockLin u w a b` (N109) is a six-generator
  octonion-block word (a product of three 2-plane rotations). Composing a FOURTH `genTwoPlaneLin`
  on a distinct 2-plane:

      `quadBlockLin u w a b c d e f := genTwoPlaneLin e f * tripleBlockLin u w a b c d`
          = genTwoPlaneLin e f * (genTwoPlaneLin c d * (genTwoPlaneLin a b * genTwoPlaneLin u w))`,

  an EIGHT-generator `biMulLin` word — a `Module.End Cut STVC`. It lies in the `Module.End` generated
  two-sided submonoid `genIsomMonoidLin` (a finite product of Born-unit generators, `mul_mem` of
  `genTwoPlaneLin_mem_genLin` and `tripleBlockLin_mem_genLin`), is a `QvC`-isometry (the composition
  of four `genTwoPlaneLin` isometries, N103), and its bridge-image lies in `genIsomMonoidC2` (the
  N100 transport). The bridge carries the eight-generator product to the nested `Function.End`
  eight-factor composite (`map_mul` + `endToFunEnd_genTwoPlaneLin` + `tripleBlock_bridge_apply`).

  THE HIGHEST-RANK WITNESS (W8 TEETH — rank ≥ 8). Take the FIFTH octonion unit `ii5 := ii4·ιe₂` —
  the embedded quaternion unit `k = i·j`, lying OUTSIDE the `span{e₂, ιe₂, ke2je2, ii4}` and
  anticommuting with all four (a Born-unit-imaginary, `gFormC ii5 ii5 = 1`). The TRIPLE block
  `tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂` FIXES `ii5` (it lies in the common anticommuting
  complement of ALL THREE lower 2-planes — every one of the six half-turns fixes it,
  `biMulFun_imag_fixes_anticomm`). The QUAD block
  `quadBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂ ii5 e₂ = genTwoPlaneLin ii5 e₂ * tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂`
  NEGATES it (the fourth block's `biMulFun ii5 ii5` half-turn negates `ii5`, `biMulComp_negates_u`):
  applied to `(0,0,ii5)` the composite reads `(0,0,−ii5)`. So the composite reaches a rotation in a
  FOURTH 2-plane that ALL THREE lower blocks leave fixed — the STRICTLY-HIGHEST-RANK explicit
  octonion-block compact rotation (rank ≥ 8 vs the triple block's rank ≥ 6). The distinguishing
  coordinate: `(−ii5).im.re.im = −1`, where the triple block FIXES `ii5` (`ii5.im.re.im = 1`) — the
  genuine higher-rank read-off.

  ── WHAT THIS NODE BANKS ──

  `ii5` / `ii5_sq` / `ii5_imag` / `ii5_alt` / `ii5_gFormC_self` — the concrete fifth octonion unit
    `ii4·ιe₂` is a Born-unit-imaginary (`ii5·ii5 = −1`, `star ii5 = −ii5`, the left-square law
    `ii5·(ii5·v) = −v`, `gFormC ii5 ii5 = 1`).
  `quadBlockLin` / `quadBlockLin_apply` — the eight-generator octonion-block composite and its
    product-application (`Module.End.mul_apply`).
  ★ `quadBlockLin_mem_genLin` — the composite is a finite `biMulLin` word `∈ genIsomMonoidLin`
    (`mul_mem` of `genTwoPlaneLin_mem_genLin` and `tripleBlockLin_mem_genLin`).
  ★ `quadBlockLin_isQvIsomC` — the composite is a `QvC`-isometry (composition of four
    `genTwoPlaneLin` isometries, N103).
  ★ `quadBlockLin_mem_gen2` — the bridged composite `∈ genIsomMonoidC2` (the N100 transport).
  `quadBlock_bridge_eq` / `quadBlock_bridge_apply` — the bridge carries the eight-generator product
    to the nested eight-factor `biMulFun` composite (`map_mul` + `genTwoPlaneLin_apply` +
    `tripleBlock_bridge_apply`).
  `e2_ii5_anticomm` / `je2_ii5_anticomm` / `ke2je2_ii5_anticomm` / `ii4_ii5_anticomm` — `ii5`
    anticommutes with all four lower units.
  `block3_fixes_ii5` — the TRIPLE block `tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂` FIXES `ii5`.
  ★ `quadBlock_negates_ii5` (W8 TEETH) — the concrete QUAD block negates `ii5`:
    `endToFunEnd (quadBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂ ii5 e₂) (0,0,ii5) = (0,0,−ii5)` — the rank-≥8
    witness, a FOURTH 2-plane all three lower blocks leave fixed.
  ★ `quadBlock_ii5_coord` (W8 ANCHOR) — the highest-rank coordinate read-off `(...).2.2.im.re.im = −1`
    (vs the triple block's fixed `1`).

  DERIVED from the trunk (`genTwoPlaneLin` / `genTwoPlaneLin_apply` / `genTwoPlaneLin_mem_genLin` /
  `genTwoPlaneLin_isQvIsomC` N100/N103; `tripleBlockLin` / `tripleBlockLin_mem_genLin` /
  `tripleBlockLin_isQvIsomC` / `tripleBlock_bridge_apply` / `ii4` / `ii4_imag` / `block2_fixes_ii4`
  N109; `doubleBlockLin` / `ke2je2` / `ke2je2_imag` N108; `endToFunEnd_genIsomMonoidLin_mem_gen2`
  N100; `biMulFun_imag_fixes_anticomm` N94; `biMulComp_negates_u` N95; `je2` / `je2_alt` N95;
  `e2_alt` N53/N94; `L_sq_imag` / `Nrm_def` N-operator; the embedded units `Dbl.J` / `e₂` from the
  DERIVED cascade; the `Module.End` / `Submonoid` / `map_mul` MACHINERY on the DERIVED objects,
  STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator topology, NOT Mathlib
  ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplications generate
  `SO(8)` (the Moufang/triality fact, Sudbery, Manogue–Dray, Baez) is standard, and is POSITED
  whole by the division-algebra-physics field. Here the quad-block composite — its membership in
  the generated submonoid, its isometry, and its STRICTLY HIGHER RANK (a FOURTH 2-plane all three
  lower blocks fix is moved by the quad block) — DESCENDS from the banked N94/N95/N100/N103/N108/N109
  octonion-block lemmas over the derived ℝ `Cut` and the terminal algebra `O Cut`. The
  `SO(8)`-generation leg advanced one more concrete multi-block step to the TOP of the explicit
  ladder (rank ≥ 6 → rank ≥ 8), derived, never posited.

  ── THE FORWARD REMAINDER (childed N111) ──
  The full compact-`SO(9)` surjectivity still needs: (a) the genuinely-GENERAL `SO(8)`-generation
  (the abstract "k distinct octonion-block planes give a rank-2k rotation" rank-induction, or "words
  generate ALL of `SO(8)`" — HEAVY; the explicit witness ladder TOPS OUT here at rank 8); (b) the
  KAK assembly `SO(9) = SO(8)·A·SO(8)` + the operator topology over `Cut` (HEAVY — Mathlib has NO
  operator topology `TopologicalSpace (Module.End Cut STVC)` over the derived `Cut`). THIS node banks
  the FINAL concrete explicit multi-block `SO(8)`-factorization rung (rank ≥ 8); the abstract
  generation + the KAK assembly + the operator topology are the childed heavy group-manifold
  remainder.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / rotation / isometry / compact /
  orthogonal / Spin / SO(9) / SO(8) / 2-plane / block / octonion-block / generator / word / Moufang
  / triality / bimultiplication / rank / KAK / torus / quaternion / complex-unit": what remains is
  pure linear algebra over the derived complete ordered field `Cut` — a product of eight `biMulLin`
  operators of `Module.End Cut (Cut × Cut × O Cut)` lies in the generated submonoid, preserves the
  quadratic form `QvC`, bridges to a nested self-map composite, and a concrete instance sends the
  third coordinate `(0,0,z)` to `(0,0,−z)` for a specific `z` that a six-factor sub-composite fixes.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The fifth octonion unit `ii5 := ii4·ιe₂` is a Born-unit-imaginary. -/

/-- THE FIFTH OCTONION UNIT `ii5 := ii4·ιe₂` — the embedded quaternion unit `k = i·j` (the product
    of the two banked distinct unit-imaginaries `ii4` and `ιe₂`), itself a unit imaginary lying
    OUTSIDE the `span{e₂, ιe₂, ke2je2, ii4}` and anticommuting with all four. A member of the common
    anticommuting complement that ALL THREE lower octonion-blocks fix. -/
abbrev ii5 : O Cut := (ii4 : O Cut) * (je2 : O Cut)

/-- `ii5·ii5 = −1` (a unit imaginary square, one octonion `ext`). -/
theorem ii5_sq : (ii5 : O Cut) * (ii5 : O Cut) = -1 := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ii5` is imaginary: `star ii5 = −ii5` (one octonion `ext`). -/
theorem ii5_imag : star (ii5 : O Cut) = -(ii5 : O Cut) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- The unit-imaginary left-square law for `ii5`: `ii5·(ii5·v) = −v` for all `v` (from the banked
    left-alternative operator-square `L_sq_imag` with `Nrm ii5 = 1`, `ι 1 = 1`). -/
theorem ii5_alt (v : O Cut) : (ii5 : O Cut) * ((ii5 : O Cut) * v) = -v := by
  have h := L_sq_imag (ii5 : O Cut) ii5_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ii5 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ii5 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

/-- The Born self-overlap of `ii5` is `1`: `gFormC ii5 ii5 = 1`. -/
theorem ii5_gFormC_self : gFormC (ii5 : O Cut) (ii5 : O Cut) = 1 := by
  show reQC ((ii5 : O Cut) * star (ii5 : O Cut)) = 1
  rw [ii5_imag]
  simp only [reQC]
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J, CD.mul_re, CD.neg_re]

/-! ## The eight-generator octonion-block composite (a product of four 2-plane rotations). -/

/-- THE QUAD-BLOCK COMPOSITE — a product of four octonion-block 2-plane rotations
    `genTwoPlaneLin e f * tripleBlockLin u w a b c d` (an EIGHT-generator `biMulLin` word). The
    `SO(8)` analogue of N109's three-block composition: composing a fourth distinct-plane
    octonion-block rotation onto the triple block reaches the strictly-highest-rank explicit
    octonion-block compact rotation (rank ≥ 8 — the full rank on the 8-dim octonion space). -/
def quadBlockLin (u w a b c d e f : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin e f * tripleBlockLin u w a b c d

/-- The composite applies as the nested rotation `genTwoPlaneLin e f (tripleBlockLin u w a b c d p)`
    (`Module.End.mul_apply` — the structural product rule, NOT a `rfl` on the nested coercion). -/
theorem quadBlockLin_apply (u w a b c d e f : O Cut) (p : STVC) :
    quadBlockLin u w a b c d e f p = genTwoPlaneLin e f (tripleBlockLin u w a b c d p) := by
  rw [quadBlockLin, Module.End.mul_apply]

/-- ★ The composite is a finite `biMulLin` word `∈ genIsomMonoidLin` (`mul_mem` of
    `genTwoPlaneLin_mem_genLin` and `tripleBlockLin_mem_genLin`). An eight-generator product of
    Born-unit two-sided operators. -/
theorem quadBlockLin_mem_genLin (u w a b c d e f : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1)
    (he : gFormC e e = 1) (hf : gFormC f f = 1) :
    quadBlockLin u w a b c d e f ∈ genIsomMonoidLin := by
  unfold quadBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin e f he hf)
    (tripleBlockLin_mem_genLin u w a b c d hu hw ha hb hc hd)

/-- ★ The composite is a `QvC`-isometry (the composition of four `genTwoPlaneLin` isometries, N103;
    each preserves `QvC`, so the product does). -/
theorem quadBlockLin_isQvIsomC (u w a b c d e f : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1)
    (he : gFormC e e = 1) (hf : gFormC f f = 1) :
    IsQvIsomC ((quadBlockLin u w a b c d e f : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  rw [quadBlockLin, Module.End.mul_apply]
  rw [genTwoPlaneLin_isQvIsomC e f he hf (tripleBlockLin u w a b c d p)]
  exact tripleBlockLin_isQvIsomC u w a b c d hu hw ha hb hc hd p

/-- ★ The bridged composite lands in `genIsomMonoidC2` — the N100 transport applied to the
    eight-generator word: a specific `Cut`-linear highest-rank octonion-block rotation, pushed across
    the bridge, IS a member of the `Function.End` generated isometry submonoid. -/
theorem quadBlockLin_mem_gen2 (u w a b c d e f : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1)
    (he : gFormC e e = 1) (hf : gFormC f f = 1) :
    endToFunEnd (quadBlockLin u w a b c d e f) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2
    (quadBlockLin_mem_genLin u w a b c d e f hu hw ha hb hc hd he hf)

/-! ## The bridge carries the composite to the nested eight-factor self-map composite. -/

/-- The bridge of the composite is the `Function.End` product of the fourth block's bridge-image and
    the triple block's bridge-image (`map_mul`). -/
theorem quadBlock_bridge_eq (u w a b c d e f : O Cut) :
    endToFunEnd (quadBlockLin u w a b c d e f)
      = (endToFunEnd (genTwoPlaneLin e f)) * (endToFunEnd (tripleBlockLin u w a b c d)) := by
  rw [quadBlockLin, map_mul]

/-- The bridged composite applies as the nested EIGHT-factor self-map composite
    `biMulFun f f ∘ biMulFun e e ∘ biMulFun d d ∘ biMulFun c c ∘ biMulFun b b ∘ biMulFun a a ∘
     biMulFun w w ∘ biMulFun u u` (`map_mul` then `genTwoPlaneLin_apply` then
    `tripleBlock_bridge_apply`). -/
theorem quadBlock_bridge_apply (u w a b c d e f : O Cut) (p : STVC) :
    endToFunEnd (quadBlockLin u w a b c d e f) p
      = biMulFun f f (biMulFun e e
          (biMulFun d d (biMulFun c c
            (biMulFun b b (biMulFun a a (biMulFun w w (biMulFun u u p))))))) := by
  rw [quadBlock_bridge_eq]
  show (endToFunEnd (genTwoPlaneLin e f)) ((endToFunEnd (tripleBlockLin u w a b c d)) p) = _
  rw [genTwoPlaneLin_apply, tripleBlock_bridge_apply]

/-! ## The rank-≥8 witness — the triple block fixes `ii5`; the quad block negates it. -/

/-- `e₂` and `ii5` ANTICOMMUTE in `O Cut`: `e₂·ii5 = −(ii5·e₂)` (a single octonion `ext`). -/
theorem e2_ii5_anticomm : (CD.e2 : O Cut) * ii5 = -(ii5 * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ιe₂` and `ii5` ANTICOMMUTE in `O Cut`: `ιe₂·ii5 = −(ii5·ιe₂)`. -/
theorem je2_ii5_anticomm : (je2 : O Cut) * ii5 = -(ii5 * (je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ke2je2` and `ii5` ANTICOMMUTE in `O Cut`: `ke2je2·ii5 = −(ii5·ke2je2)`. -/
theorem ke2je2_ii5_anticomm : (ke2je2 : O Cut) * ii5 = -(ii5 * (ke2je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ii4` and `ii5` ANTICOMMUTE in `O Cut`: `ii4·ii5 = −(ii5·ii4)`. -/
theorem ii4_ii5_anticomm : (ii4 : O Cut) * ii5 = -(ii5 * (ii4 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- The TRIPLE block `tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂` FIXES `ii5`: as the common
    anticommuting complement of ALL THREE lower 2-planes (`span{e₂, ιe₂}`, `span{ke2je2, e₂}`,
    `span{ii4, e₂}`), each of the six half-turns fixes it (`biMulFun_imag_fixes_anticomm`). The
    bridged triple block leaves `(0,0,ii5)` unchanged. -/
theorem block3_fixes_ii5 :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
      (biMulFun (ii4 : O Cut) (ii4 : O Cut)
        (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
          (biMulFun (ke2je2 : O Cut) (ke2je2 : O Cut)
            (biMulFun (je2 : O Cut) (je2 : O Cut)
              (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
                ((0 : Cut), (0 : Cut), (ii5 : O Cut)))))))
      = ((0 : Cut), (0 : Cut), (ii5 : O Cut)) := by
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]
  rw [biMulFun_imag_fixes_anticomm (je2 : O Cut) (ii5 : O Cut) je2_alt je2_ii5_anticomm]
  rw [biMulFun_imag_fixes_anticomm (ke2je2 : O Cut) (ii5 : O Cut) ke2je2_alt ke2je2_ii5_anticomm]
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]
  rw [biMulFun_imag_fixes_anticomm (ii4 : O Cut) (ii5 : O Cut) ii4_alt ii4_ii5_anticomm]
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]

/-- ★ W8 TEETH — THE RANK-≥8 WITNESS. The bridged QUAD block
    `quadBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂ ii5 e₂ = genTwoPlaneLin ii5 e₂ * tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂`,
    applied to `(0,0,ii5)`, reads `(0,0,−ii5)` — it NEGATES the very unit ALL THREE lower blocks FIX
    (`block3_fixes_ii5`). The composite reaches a FOURTH 2-plane rotation all three lower blocks
    leave fixed: the STRICTLY-HIGHEST-RANK explicit octonion-block compact rotation (rank ≥ 8). The
    nested eight-factor composite (`quadBlock_bridge_apply`) collapses by the triple block fixing
    `ii5` (`block3_fixes_ii5`), then the fourth block's half-turn negating it (`biMulComp_negates_u`
    with `u = ii5`, `w = e₂`). -/
theorem quadBlock_negates_ii5 :
    endToFunEnd (quadBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut) (ii5 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ii5 : O Cut)) := by
  rw [quadBlock_bridge_apply, block3_fixes_ii5]
  -- remaining: biMulFun e₂ e₂ (biMulFun ii5 ii5 (0,0,ii5)) = (0,0,−ii5)
  apply biMulComp_negates_u
  · exact ii5_sq
  · exact e2_alt
  · show (ii5 : O Cut) * (CD.e2 : O Cut) = -((CD.e2 : O Cut) * ii5)
    ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- ★ W8 ANCHOR (teeth) — the rank-≥8 coordinate read-off. The quad-block image of `(0,0,ii5)` is
    `(0,0,−ii5)`, whose third-coordinate deep slot `.2.2.re.im.im = −1`. ALL THREE lower blocks FIX
    `ii5` (coordinate `1` at that slot, `ii5.re.im.im = 1`); the quad block reads `−1` — the
    distinguishing highest-rank value, a genuine rotation in a fourth plane all three lower blocks do
    not touch. -/
theorem quadBlock_ii5_coord :
    (endToFunEnd (quadBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut) (ii5 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))).2.2.re.im.im = (-1 : Cut) := by
  rw [quadBlock_negates_ii5]
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
