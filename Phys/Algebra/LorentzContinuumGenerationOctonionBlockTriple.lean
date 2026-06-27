/-
  Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple — N109: THE TRIPLE-BLOCK `SO(8)`-
  GENERATION LEG (a concrete rank-≥6 octonion-block factorization — the immediately-bankable
  structural piece of the full compact-`SO(9)` surjectivity, extending N108's two-block witness one
  rank higher). N107 banked the abelian `A`-torus leg; N108 banked a concrete HIGHER-RANK TWO-block
  octonion factorization (`doubleBlockLin` reaches a 2-plane the single block fixes — rank ≥ 4). The
  full compact-`SO(9)` surjectivity needs the FULL `SO(8)`-generation: do the `biMulLin` two-sided
  words generate the full `SO(8)` rotation sector of `𝕆`? The HEAVY Moufang/triality "words generate
  `SO(8)`" is the W1 group-manifold core Mathlib lacks over the derived `Cut`. THIS node banks the
  ROADMAP §N109 priority (i) immediately-bankable piece: a CONCRETE TRIPLE-BLOCK FACTORIZATION — a
  product of THREE `genTwoPlaneLin` octonion-block 2-plane rotations of DISTINCT imaginary 2-planes,
  reaching a STRICTLY-HIGHER-RANK (rank ≥ 6) octonion-block compact rotation (extending the N108
  two-block witness toward the full rank-8 octonion-block rotation).

  ===========================================================================
  THE STRUCTURAL FACT (NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content).

  `doubleBlockLin u w a b = genTwoPlaneLin a b * genTwoPlaneLin u w` (N108) is a four-generator
  octonion-block word (a product of two 2-plane rotations). Composing a THIRD `genTwoPlaneLin`
  on a distinct 2-plane:

      `tripleBlockLin u w a b c d := genTwoPlaneLin c d * doubleBlockLin u w a b`
          = genTwoPlaneLin c d * (genTwoPlaneLin a b * genTwoPlaneLin u w)`,

  a SIX-generator `biMulLin` word — a `Module.End Cut STVC`. It lies in the `Module.End` generated
  two-sided submonoid `genIsomMonoidLin` (a finite product of Born-unit generators, `mul_mem` of
  `genTwoPlaneLin_mem_genLin` and `doubleBlockLin_mem_genLin`), is a `QvC`-isometry (the composition
  of three `genTwoPlaneLin` isometries, N103), and its bridge-image lies in `genIsomMonoidC2` (the
  N100 transport). The bridge carries the six-generator product to the nested `Function.End`
  six-factor composite (`map_mul` + `endToFunEnd_genTwoPlaneLin` + `doubleBlock_bridge_apply`).

  THE HIGHER-RANK WITNESS (W8 TEETH — rank ≥ 6). Take the FOURTH octonion unit
  `ii4 := iota(iota(Dbl.J))` — the embedded complex unit `i₁`, lying OUTSIDE the quaternion
  `span{e₂, ιe₂, ke2je2}` and anticommuting with all three (a Born-unit-imaginary,
  `gFormC ii4 ii4 = 1`). Both the FIRST block `genTwoPlaneLin e₂ ιe₂` and the DOUBLE block
  `doubleBlockLin e₂ ιe₂ ke2je2 e₂` FIX `ii4` (it lies in the common anticommuting complement of
  BOTH the `span{e₂, ιe₂}` and the `span{ke2je2, e₂}` planes — every half-turn fixes it,
  `biMulFun_imag_fixes_anticomm`). The TRIPLE block
  `tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂ = genTwoPlaneLin ii4 e₂ * doubleBlockLin e₂ ιe₂ ke2je2 e₂`
  NEGATES it (the third block's `biMulFun ii4 ii4` half-turn negates `ii4`, `biMulComp_negates_u`):
  applied to `(0,0,ii4)` the composite reads `(0,0,−ii4)`. So the composite reaches a rotation in a
  THIRD 2-plane that BOTH the single AND the double block leave fixed — a STRICTLY HIGHER-RANK
  octonion-block compact rotation (rank ≥ 6 vs the double block's rank ≥ 4). The distinguishing
  coordinate: `(−ii4).re.re.im = −1`, where the double block FIXES `ii4` (`ii4.re.re.im = 1`) — the
  genuine higher-rank read-off.

  ── WHAT THIS NODE BANKS ──

  `ii4` / `ii4_sq` / `ii4_imag` / `ii4_alt` / `ii4_gFormC_self` — the concrete fourth octonion unit
    `iota(iota(Dbl.J))` is a Born-unit-imaginary (`ii4·ii4 = −1`, `star ii4 = −ii4`, the left-square
    law `ii4·(ii4·v) = −v`, `gFormC ii4 ii4 = 1`).
  `ke2je2_alt` — the third-unit left-square law `ke2je2·(ke2je2·v) = −v` (banked here for the witness).
  `tripleBlockLin` / `tripleBlockLin_apply` — the six-generator octonion-block composite and its
    product-application (`Module.End.mul_apply`).
  ★ `tripleBlockLin_mem_genLin` — the composite is a finite `biMulLin` word `∈ genIsomMonoidLin`
    (`mul_mem` of `genTwoPlaneLin_mem_genLin` and `doubleBlockLin_mem_genLin`).
  ★ `tripleBlockLin_isQvIsomC` — the composite is a `QvC`-isometry (composition of three
    `genTwoPlaneLin` isometries, N103).
  ★ `tripleBlockLin_mem_gen2` — the bridged composite `∈ genIsomMonoidC2` (the N100 transport).
  `tripleBlock_bridge_eq` / `tripleBlock_bridge_apply` — the bridge carries the six-generator product
    to the nested six-factor `biMulFun` composite (`map_mul` + `genTwoPlaneLin_apply` +
    `doubleBlock_bridge_apply`).
  `e2_ii4_anticomm` / `je2_ii4_anticomm` / `ke2je2_ii4_anticomm` — `ii4` anticommutes with all three
    quaternion units.
  `block2_fixes_ii4` — the DOUBLE block `doubleBlockLin e₂ ιe₂ ke2je2 e₂` FIXES `ii4`.
  ★ `tripleBlock_negates_ii4` (W8 TEETH) — the concrete TRIPLE block negates `ii4`:
    `endToFunEnd (tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂) (0,0,ii4) = (0,0,−ii4)` — the rank-≥6
    witness, a THIRD 2-plane both the single and double block leave fixed.
  ★ `tripleBlock_ii4_coord` (W8 ANCHOR) — the higher-rank coordinate read-off `(...).2.2.re.re.im = −1`
    (vs the double block's fixed `1`).

  DERIVED from the trunk (`genTwoPlaneLin` / `genTwoPlaneLin_apply` / `genTwoPlaneLin_mem_genLin` /
  `genTwoPlaneLin_isQvIsomC` N100/N103; `doubleBlockLin` / `doubleBlockLin_mem_genLin` /
  `doubleBlockLin_isQvIsomC` / `doubleBlock_bridge_apply` N108; `endToFunEnd_genIsomMonoidLin_mem_gen2`
  N100; `biMulFun_imag_fixes_anticomm` N94; `biMulComp_negates_u` N95; `ke2je2` / `ke2je2_imag` N108;
  `je2` / `je2_alt` N95; `e2_alt` N53/N94; `L_sq_imag` / `Nrm_def` N-operator; the embedded complex
  unit `Dbl.J` from the DERIVED cascade; the `Module.End` / `Submonoid` / `map_mul` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator
  topology, NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplications generate
  `SO(8)` (the Moufang/triality fact, Sudbery, Manogue–Dray, Baez) is standard, and is POSITED
  whole by the division-algebra-physics field. Here the triple-block composite — its membership in
  the generated submonoid, its isometry, and its STRICTLY HIGHER RANK (a THIRD 2-plane both the
  single and double block fix is moved by the triple block) — DESCENDS from the banked
  N94/N95/N100/N103/N108 octonion-block lemmas over the derived ℝ `Cut` and the terminal algebra
  `O Cut`. The `SO(8)`-generation leg advanced one more concrete multi-block step (rank ≥ 4 → rank
  ≥ 6), derived, never posited.

  ── THE FORWARD REMAINDER (childed N110) ──
  The full compact-`SO(9)` surjectivity still needs: (a) the FULL `SO(8)`-generation (the
  Moufang/triality "all of `SO(8)`" — HEAVY, the rank-induction to rank 8); (b) the KAK assembly
  `SO(9) = SO(8)·A·SO(8)` + the operator topology over `Cut` (HEAVY — Mathlib has NO operator
  topology `TopologicalSpace (Module.End Cut STVC)` over the derived `Cut`). THIS node banks one
  more concrete multi-block `SO(8)`-factorization step (rank ≥ 6); the full leg + the KAK assembly
  + the operator topology are the childed heavy group-manifold remainder.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / rotation / isometry / compact /
  orthogonal / Spin / SO(9) / SO(8) / 2-plane / block / octonion-block / generator / word / Moufang
  / triality / bimultiplication / rank / KAK / torus / quaternion / complex-unit": what remains is
  pure linear algebra over the derived complete ordered field `Cut` — a product of six `biMulLin`
  operators of `Module.End Cut (Cut × Cut × O Cut)` lies in the generated submonoid, preserves the
  quadratic form `QvC`, bridges to a nested self-map composite, and a concrete instance sends the
  third coordinate `(0,0,z)` to `(0,0,−z)` for a specific `z` that a four-factor sub-composite fixes.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The fourth octonion unit `ii4 := iota(iota(Dbl.J))` is a Born-unit-imaginary. -/

/-- THE FOURTH OCTONION UNIT `ii4 := iota(iota(Dbl.J))` — the embedded complex unit `i₁` of the
    cascade, a unit imaginary lying OUTSIDE the quaternion `span{e₂, ιe₂, ke2je2}` and anticommuting
    with all three. A member of the common anticommuting complement that BOTH the single and the
    double octonion-block fix. -/
abbrev ii4 : O Cut :=
  (CD.iota (CD.iota (Phys.Cascade.Dbl.J : Phys.Cascade.Dbl Cut)) : O Cut)

/-- `ii4` is imaginary: `star ii4 = −ii4` (one octonion `ext`). -/
theorem ii4_imag : star (ii4 : O Cut) = -(ii4 : O Cut) := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

/-- `ii4·ii4 = −1` (a unit imaginary square, one octonion `ext`). -/
theorem ii4_sq : (ii4 : O Cut) * (ii4 : O Cut) = -1 := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

/-- The unit-imaginary left-square law for `ii4`: `ii4·(ii4·v) = −v` for all `v` (from the banked
    left-alternative operator-square `L_sq_imag` with `Nrm ii4 = 1`, `ι 1 = 1`). -/
theorem ii4_alt (v : O Cut) : (ii4 : O Cut) * ((ii4 : O Cut) * v) = -v := by
  have h := L_sq_imag (ii4 : O Cut) ii4_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ii4 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ii4 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

/-- The Born self-overlap of `ii4` is `1`: `gFormC ii4 ii4 = 1`. -/
theorem ii4_gFormC_self : gFormC (ii4 : O Cut) (ii4 : O Cut) = 1 := by
  show reQC ((ii4 : O Cut) * star (ii4 : O Cut)) = 1
  rw [ii4_imag]
  simp only [reQC]
  simp [CD.iota, Phys.Cascade.Dbl.J, CD.mul_re, CD.neg_re]

/-- The third-unit left-square law `ke2je2·(ke2je2·v) = −v` (banked here for the witness;
    mirrors `je2_alt`, `ii4_alt`). -/
theorem ke2je2_alt (v : O Cut) : (ke2je2 : O Cut) * ((ke2je2 : O Cut) * v) = -v := by
  have h := L_sq_imag (ke2je2 : O Cut) ke2je2_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ke2je2 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ke2je2 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.e2, CD.iota]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

/-! ## The six-generator octonion-block composite (a product of three 2-plane rotations). -/

/-- THE TRIPLE-BLOCK COMPOSITE — a product of three octonion-block 2-plane rotations
    `genTwoPlaneLin c d * doubleBlockLin u w a b` (a SIX-generator `biMulLin` word). The `SO(8)`
    analogue of N108's two-block composition: composing a third distinct-plane octonion-block
    rotation onto the double block reaches a strictly-higher-rank octonion-block compact rotation. -/
def tripleBlockLin (u w a b c d : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin c d * doubleBlockLin u w a b

/-- The composite applies as the nested rotation `genTwoPlaneLin c d (doubleBlockLin u w a b p)`
    (`Module.End.mul_apply` — the structural product rule, NOT a `rfl` on the nested coercion). -/
theorem tripleBlockLin_apply (u w a b c d : O Cut) (p : STVC) :
    tripleBlockLin u w a b c d p = genTwoPlaneLin c d (doubleBlockLin u w a b p) := by
  rw [tripleBlockLin, Module.End.mul_apply]

/-- ★ The composite is a finite `biMulLin` word `∈ genIsomMonoidLin` (`mul_mem` of
    `genTwoPlaneLin_mem_genLin` and `doubleBlockLin_mem_genLin`). A six-generator product of
    Born-unit two-sided operators. -/
theorem tripleBlockLin_mem_genLin (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    tripleBlockLin u w a b c d ∈ genIsomMonoidLin := by
  unfold tripleBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin c d hc hd)
    (doubleBlockLin_mem_genLin u w a b hu hw ha hb)

/-- ★ The composite is a `QvC`-isometry (the composition of three `genTwoPlaneLin` isometries, N103;
    each preserves `QvC`, so the product does). -/
theorem tripleBlockLin_isQvIsomC (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    IsQvIsomC ((tripleBlockLin u w a b c d : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  rw [tripleBlockLin, Module.End.mul_apply]
  rw [genTwoPlaneLin_isQvIsomC c d hc hd (doubleBlockLin u w a b p)]
  exact doubleBlockLin_isQvIsomC u w a b hu hw ha hb p

/-- ★ The bridged composite lands in `genIsomMonoidC2` — the N100 transport applied to the
    six-generator word: a specific `Cut`-linear higher-rank octonion-block rotation, pushed across
    the bridge, IS a member of the `Function.End` generated isometry submonoid. -/
theorem tripleBlockLin_mem_gen2 (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    endToFunEnd (tripleBlockLin u w a b c d) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2
    (tripleBlockLin_mem_genLin u w a b c d hu hw ha hb hc hd)

/-! ## The bridge carries the composite to the nested six-factor self-map composite. -/

/-- The bridge of the composite is the `Function.End` product of the third block's bridge-image and
    the double block's bridge-image (`map_mul`). -/
theorem tripleBlock_bridge_eq (u w a b c d : O Cut) :
    endToFunEnd (tripleBlockLin u w a b c d)
      = (endToFunEnd (genTwoPlaneLin c d)) * (endToFunEnd (doubleBlockLin u w a b)) := by
  rw [tripleBlockLin, map_mul]

/-- The bridged composite applies as the nested SIX-factor self-map composite
    `biMulFun d d ∘ biMulFun c c ∘ biMulFun b b ∘ biMulFun a a ∘ biMulFun w w ∘ biMulFun u u`
    (`map_mul` then `genTwoPlaneLin_apply` then `doubleBlock_bridge_apply`). -/
theorem tripleBlock_bridge_apply (u w a b c d : O Cut) (p : STVC) :
    endToFunEnd (tripleBlockLin u w a b c d) p
      = biMulFun d d (biMulFun c c
          (biMulFun b b (biMulFun a a (biMulFun w w (biMulFun u u p))))) := by
  rw [tripleBlock_bridge_eq]
  show (endToFunEnd (genTwoPlaneLin c d)) ((endToFunEnd (doubleBlockLin u w a b)) p) = _
  rw [genTwoPlaneLin_apply, doubleBlock_bridge_apply]

/-! ## The rank-≥6 witness — both single and double block fix `ii4`; the triple block negates it. -/

/-- `e₂` and `ii4` ANTICOMMUTE in `O Cut`: `e₂·ii4 = −(ii4·e₂)` (a single octonion `ext`). -/
theorem e2_ii4_anticomm : (CD.e2 : O Cut) * ii4 = -(ii4 * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ιe₂` and `ii4` ANTICOMMUTE in `O Cut`: `ιe₂·ii4 = −(ii4·ιe₂)`. -/
theorem je2_ii4_anticomm : (je2 : O Cut) * ii4 = -(ii4 * (je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- `ke2je2` and `ii4` ANTICOMMUTE in `O Cut`: `ke2je2·ii4 = −(ii4·ke2je2)`. -/
theorem ke2je2_ii4_anticomm : (ke2je2 : O Cut) * ii4 = -(ii4 * (ke2je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- The DOUBLE block `doubleBlockLin e₂ ιe₂ ke2je2 e₂` FIXES `ii4`: as the common anticommuting
    complement of BOTH the `span{e₂, ιe₂}` and `span{ke2je2, e₂}` planes, each of the four half-turns
    fixes it (`biMulFun_imag_fixes_anticomm`). The bridged double block leaves `(0,0,ii4)` unchanged. -/
theorem block2_fixes_ii4 :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
      (biMulFun (ke2je2 : O Cut) (ke2je2 : O Cut)
        (biMulFun (je2 : O Cut) (je2 : O Cut)
          (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
            ((0 : Cut), (0 : Cut), (ii4 : O Cut)))))
      = ((0 : Cut), (0 : Cut), (ii4 : O Cut)) := by
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii4 : O Cut) e2_alt e2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (je2 : O Cut) (ii4 : O Cut) je2_alt je2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (ke2je2 : O Cut) (ii4 : O Cut) ke2je2_alt ke2je2_ii4_anticomm]
  rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii4 : O Cut) e2_alt e2_ii4_anticomm]

/-- ★ W8 TEETH — THE RANK-≥6 WITNESS. The bridged TRIPLE block
    `tripleBlockLin e₂ ιe₂ ke2je2 e₂ ii4 e₂ = genTwoPlaneLin ii4 e₂ * doubleBlockLin e₂ ιe₂ ke2je2 e₂`,
    applied to `(0,0,ii4)`, reads `(0,0,−ii4)` — it NEGATES the very unit BOTH the single AND the
    DOUBLE block FIX (`block2_fixes_ii4`). The composite reaches a THIRD 2-plane rotation both lower
    blocks leave fixed: a STRICTLY HIGHER-RANK octonion-block compact rotation (rank ≥ 6). The nested
    six-factor composite (`tripleBlock_bridge_apply`) collapses by the double block fixing `ii4`
    (`block2_fixes_ii4`), then the third block's half-turn negating it (`biMulComp_negates_u` with
    `u = ii4`, `w = e₂`). -/
theorem tripleBlock_negates_ii4 :
    endToFunEnd (tripleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii4 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ii4 : O Cut)) := by
  rw [tripleBlock_bridge_apply, block2_fixes_ii4]
  -- remaining: biMulFun e₂ e₂ (biMulFun ii4 ii4 (0,0,ii4)) = (0,0,−ii4)
  apply biMulComp_negates_u
  · exact ii4_sq
  · exact e2_alt
  · show (ii4 : O Cut) * (CD.e2 : O Cut) = -((CD.e2 : O Cut) * ii4)
    ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

/-- ★ W8 ANCHOR (teeth) — the rank-≥6 coordinate read-off. The triple-block image of `(0,0,ii4)` is
    `(0,0,−ii4)`, whose third-coordinate deep slot `.2.2.re.re.im = −1`. BOTH the single and the
    double block FIX `ii4` (coordinate `1` at that slot, `ii4.re.re.im = 1`); the triple block reads
    `−1` — the distinguishing higher-rank value, a genuine rotation in a third plane both lower blocks
    do not touch. -/
theorem tripleBlock_ii4_coord :
    (endToFunEnd (tripleBlockLin (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) (CD.e2 : O Cut)
        (ii4 : O Cut) (CD.e2 : O Cut))
        ((0 : Cut), (0 : Cut), (ii4 : O Cut))).2.2.re.re.im = (-1 : Cut) := by
  rw [tripleBlock_negates_ii4]
  simp [CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
