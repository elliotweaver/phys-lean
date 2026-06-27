/-
  Phys.Algebra.LorentzContinuumGenerationKAK — N112: THE KAK-SANDWICH ASSEMBLY
  `SO(8)·A·SO(8)` AND THE SINGLE-PLANE DEGENERATION (the measure-first finding). N107 banked the
  abelian `A`-torus `planeRotLin` (the ninth-direction circle subgroup, acting on the 2-plane
  `span{x, 1}` — the `x`-axis and the REAL octonion axis). N108–N111 banked the octonion-block
  `SO(8)` words `blockWordLin` (arbitrary-length products of `genTwoPlaneLin` 2-plane rotations).
  The forward frontier (ROADMAP §N112 priority (i)) is the Cartan/KAK assembly
  `SO(9) = SO(8)·A·SO(8)`: does a compact `QvC`-isometry factor as
  `(octonion-block word)·(ninth rotation)·(octonion-block word)`?

  ===========================================================================
  THE MEASURED FACT (W1/W9 MEASURE-FIRST — what the chain ACTUALLY produces, NOT what a posited
  `SO(9)` would). The octonion-block words and the single `A`-plane act on COMPLEMENTARY subspaces:

    • each `genTwoPlaneLin u w` (`u, w` imaginary Born-units, `u² = w² = −1`) FIXES the time
      coordinate `t`, FIXES the `x` coordinate (`genIsomMonoidLin_fixes_snd`, N105), and FIXES the
      REAL octonion axis `1` (`vTwoPlane_fix_one`: `w·((u·(1·u))·w) = 1`), acting ONLY on the
      imaginary octonion block — moreover it PRESERVES `reQC` (`vTwoPlane_reQC`, via the polarized
      Born isometry `biMul_gFormC` and `reQC v = gFormC v 1`);
    • `planeRotLin c s` acts ONLY within the 2-plane `span{x, 1}`, fixing the imaginary octonion
      block.

  Therefore — THE ONE LAW: the apparent KAK target RESISTS, and the resistance is the finding —
  every octonion-block word COMMUTES with the `A`-torus ninth rotation
  (`genTwoPlaneLin_commute_planeRot`, lifted to arbitrary length by ONE list induction
  `blockWordLin_commute_planeRot`), and the single-plane KAK sandwich DEGENERATES:

      `kakWordLin L₁ L₂ c s := blockWordLin L₂ · planeRotLin c s · blockWordLin L₁`
                              = blockWordLin (L₂ ++ L₁) · planeRotLin c s         (`kakWordLin_degenerate`)

  — a mere `SO(8)·A` PRODUCT (one octonion-block word times one ninth rotation), NOT a genuine
  three-factor `SO(9)` element. The two `SO(8)` words coalesce; the ninth rotation factors out. So
  a SINGLE `A`-plane is structurally INSUFFICIENT to assemble the full compact `SO(9)`: the genuine
  remainder is the FULL ninth-generator family (the `x ↔ eᵢ` rotation against EACH octonion axis,
  not just the real axis), which the single banked `A`-plane does not reach. This is the honest
  measure-first result the frontier demanded — it pins exactly what the next node must adjoin.

  THE SOUND DIRECTION (⊇) still banks cleanly: every KAK sandwich `kakWordLin L₁ L₂ c s` IS a valid
  compact enlarged isometry — it lies in `genIsomMonoidLinPlus` (`kakWordLin_mem`, `mul_mem` of the
  two word memberships N111 and the ninth-rotation membership N106/N107) and is a `QvC`-isometry
  (`kakWordLin_isQvIsomC`, the enlarged-alphabet soundness `genIsomMonoidLinPlus_isQvIsomC` N106).

  ── WHAT THIS NODE BANKS ──

  `kakWordLin` / `kakWordLin_mem` / `kakWordLin_isQvIsomC` — the KAK sandwich and its soundness (⊇).
  `biMulV` / `biMulV_apply` — the `v`-block linear map `v ↦ u·(v·u')` of `biMulLin`.
  `vTwoPlane` / `vTwoPlane_apply` / `genTwoPlaneLin_vblock` — the `v`-block of `genTwoPlaneLin`.
  `vTwoPlane_fix_one` — the `v`-block fixes the real octonion axis (imaginary units).
  ★ `gFormC_polarize` — polarization: diagonal `gFormC`-preservation ⟹ bilinear preservation.
  `vTwoPlane_gFormC_diag` / `vTwoPlane_reQC` — the `v`-block preserves `gFormC` and hence `reQC`.
  ★★ `commuteBlockNinth` — THE GENERAL COMMUTATION: any `(t,x,Kblock v)`-operator whose block fixes
    `1` and preserves `reQC` commutes with `planeRotLin c s`.
  ★ `genTwoPlaneLin_commute_planeRot` — a single octonion-block 2-plane rotation commutes with the
    `A`-torus ninth rotation.
  ★★ `blockWordLin_commute_planeRot` — THE ABSTRACT COMMUTATION at arbitrary length (ONE list
    induction over the single-block commutation).
  `blockWordLin_append` — `blockWordLin (L₁ ++ L₂) = blockWordLin L₁ · blockWordLin L₂`.
  ★★ `kakWordLin_degenerate` — THE FINDING: the single-plane KAK sandwich degenerates to
    `blockWordLin (L₂ ++ L₁) · planeRotLin c s`.
  `kakWord_e2je2_x` / `kakWord_e2je2_x_val` — W8 teeth: a concrete KAK sandwich with an active ninth
    rotation moves `x` to `3/5` (the ninth rotation is genuinely active — it reaches beyond the
    `x`-rigid `SO(8)` words — yet the sandwich is only `SO(8)·A`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──

  Every object is DERIVED: `blockWordLin` / `blockWordLin_mem_genLin` (N111); `genTwoPlaneLin` /
  `genTwoPlaneLin_mem_genLin` (N100); `biMulLin` (N-EndBridge); `biMul_gFormC` (N-Spin9);
  `genIsomMonoidLinPlus` / `genIsomMonoidLinPlus_isQvIsomC` / `genIsomMonoidLin_le_genIsomMonoidLinPlus`
  (N106); `planeRotLin` / `planeRotLin_apply` / `planeRotLin_mem_genIsomMonoidLinPlus` (N105–N107);
  `reQC` / `reQC_add` / `reQC_smul` / `reQC_one` / `gFormC_one_right` / `gFormC_add_left` /
  `gFormC_add_right` / `gFormC_symm` (N-LieAlgebra/N-Rotation); `smulCompat_oCut` (`Cut` central on
  `O Cut`); the `Module.End` / `LinearMap` / `List` MACHINERY on the DERIVED objects (STANDARD §3) —
  over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited
  Lorentz group / SO⁺(1,9), NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a
  bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature posits the full `Spin(9)` /
  `SO(9)` and reads off its KAK decomposition. Here the assembly is INTERROGATED, not assumed: the
  measure reveals that the banked generators — octonion-block words + a SINGLE `A`-plane — generate
  only the PRODUCT sector `SO(8)·A` (the words commute with the plane), so the genuine `SO(9)`
  needs the full ninth-generator family. The structure is read OUT of what the chain built, gap by
  measured gap — the contribution is the forced, honest map of exactly what remains, never a posited
  decomposition.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / isometry / compact / orthogonal / KAK / Cartan / SO(9) / SO(8) /
  SO(2) / A-torus / ninth-direction / octonion-block / word / 2-plane / generator / commute /
  sandwich / degenerate": what remains is pure linear algebra over the derived complete ordered
  field `Cut` — the operators `blockWordLin L₂ · planeRotLin c s · blockWordLin L₁` of
  `Module.End Cut (Cut × Cut × O Cut)` lie in the submonoid `genIsomMonoidLinPlus` and preserve the
  quadratic form `QvC`; each `genTwoPlaneLin u w` (`u² = w² = −1`) commutes with each `planeRotLin c
  s` because it fixes `t`, `x`, and `1` and preserves `reQC` while `planeRotLin` acts only on
  `span{x,1}`; this lifts by list induction to arbitrary `blockWordLin L`; hence the triple product
  collapses to `blockWordLin (L₂ ++ L₁) · planeRotLin c s`. No theorem STATEMENT needs a physics
  word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The KAK sandwich `SO(8)·A·SO(8)` — soundness (the ⊇ direction). -/

/-- THE KAK SANDWICH `SO(8)·A·SO(8)`: an octonion-block word `blockWordLin L₂`, a ninth-direction
    rotation `planeRotLin c s`, and an octonion-block word `blockWordLin L₁`. The candidate Cartan
    factorization of a compact `QvC`-isometry of `x ⊕ 𝕆`. -/
def kakWordLin (L1 L2 : List (O Cut × O Cut)) (c s : Cut) : Module.End Cut STVC :=
  blockWordLin L2 * planeRotLin c s * blockWordLin L1

/-- ★ The KAK sandwich lies in the enlarged generated submonoid `genIsomMonoidLinPlus`: a product of
    two octonion-block words (`blockWordLin_mem_genLin`, N111, contained in the enlarged submonoid)
    and a ninth-direction rotation (`planeRotLin_mem_genIsomMonoidLinPlus`, N106/N107), closed under
    `mul_mem`. -/
theorem kakWordLin_mem (L1 L2 : List (O Cut × O Cut)) (c s : Cut)
    (hL1 : ∀ p ∈ L1, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (hL2 : ∀ p ∈ L2, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (h : c ^ 2 + s ^ 2 = 1) :
    kakWordLin L1 L2 c s ∈ genIsomMonoidLinPlus := by
  unfold kakWordLin
  exact mul_mem (mul_mem
      (genIsomMonoidLin_le_genIsomMonoidLinPlus (blockWordLin_mem_genLin L2 hL2))
      (planeRotLin_mem_genIsomMonoidLinPlus c s h))
    (genIsomMonoidLin_le_genIsomMonoidLinPlus (blockWordLin_mem_genLin L1 hL1))

/-- ★ The KAK sandwich is a `QvC`-isometry — directly from the enlarged-alphabet soundness
    `genIsomMonoidLinPlus_isQvIsomC` (N106), since it is an enlarged word. (No coordinate grind:
    the isometry property is inherited from the submonoid.) -/
theorem kakWordLin_isQvIsomC (L1 L2 : List (O Cut × O Cut)) (c s : Cut)
    (hL1 : ∀ p ∈ L1, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (hL2 : ∀ p ∈ L2, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC ((kakWordLin L1 L2 c s : Module.End Cut STVC) : STVC → STVC) :=
  genIsomMonoidLinPlus_isQvIsomC (kakWordLin_mem L1 L2 c s hL1 hL2 h)

/-! ## The `v`-block of `genTwoPlaneLin` as a `Cut`-linear endomorphism of `O Cut`. -/

theorem biMulLin_tx_apply (u u' : O Cut) (t x : Cut) (v : O Cut) :
    biMulLin u u' (t, x, v) = (t, x, u * (v * u')) := rfl

/-- THE `v`-BLOCK LINEAR MAP of `biMulLin u u'`: `v ↦ u·(v·u')`. The bimultiplication restricted to
    the octonion block (the `t, x` coordinates being fixed). `Cut`-linear via the centrality
    `smulCompat_oCut`. -/
def biMulV (u u' : O Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := u * (v * u')
  map_add' p q := by show u * ((p + q) * u') = u * (p * u') + u * (q * u'); rw [add_mul, mul_add]
  map_smul' c v := by
    have hsc := smulCompat_oCut
    show u * ((c • v) * u') = c • (u * (v * u'))
    rw [hsc.hl c v u', hsc.hr c u (v * u')]

theorem biMulV_apply (u u' v : O Cut) : biMulV u u' v = u * (v * u') := rfl

/-- THE `v`-BLOCK of `genTwoPlaneLin u w = biMulLin w w · biMulLin u u` — the composite
    `biMulV w w ∘ biMulV u u`. -/
def vTwoPlane (u w : O Cut) : O Cut →ₗ[Cut] O Cut := (biMulV w w).comp (biMulV u u)

theorem vTwoPlane_apply (u w v : O Cut) : vTwoPlane u w v = w * ((u * (v * u)) * w) := rfl

/-- `genTwoPlaneLin u w` acts as `(t,x,v) ↦ (t, x, vTwoPlane u w v)` — it fixes the `(t,x)` block and
    acts on the octonion block by the `v`-block composite. -/
theorem genTwoPlaneLin_vblock (u w : O Cut) (t x : Cut) (v : O Cut) :
    genTwoPlaneLin u w (t, x, v) = (t, x, vTwoPlane u w v) := by
  rw [genTwoPlaneLin, Module.End.mul_apply, biMulLin_tx_apply, biMulLin_tx_apply,
      vTwoPlane, LinearMap.comp_apply, biMulV_apply, biMulV_apply]

/-- The `v`-block FIXES the real octonion axis `1` for imaginary units (`u² = w² = −1`):
    `w·((u·(1·u))·w) = w·((u·u)·w) = w·(−w)... = 1` (the half-turn negates `1`, the second
    half-turn negates `−1` back). The octonion-block 2-plane rotation leaves the real axis rigid. -/
theorem vTwoPlane_fix_one (u w : O Cut) (hu : u * u = -1) (hw : w * w = -1) :
    vTwoPlane u w 1 = 1 := by
  rw [vTwoPlane, LinearMap.comp_apply]
  have hin : biMulV u u 1 = -1 := by rw [biMulV_apply, one_mul, hu]
  rw [hin, map_neg, biMulV_apply, one_mul, hw, neg_neg]

/-! ## The `v`-block preserves `gFormC` (polarized) and hence `reQC`. -/

/-- ★ POLARIZATION over the derived ℝ `Cut`: a `Cut`-linear `T : O Cut →ₗ O Cut` that preserves the
    DIAGONAL form (`gFormC (T v) (T v) = gFormC v v`) preserves the FULL bilinear form
    (`gFormC (T a) (T b) = gFormC a b`). Expand `gFormC (T(a+b)) (T(a+b))` two ways via the bilinear
    laws (`gFormC_add_left` / `gFormC_add_right` / `gFormC_symm`), cancel the diagonal terms, and
    divide by `2` (the field `Cut`). -/
theorem gFormC_polarize (T : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (T v) (T v) = gFormC v v) (a b : O Cut) :
    gFormC (T a) (T b) = gFormC a b := by
  have hab := hdiag (a + b)
  rw [map_add] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [hdiag a, hdiag b, gFormC_symm (T b) (T a), gFormC_symm b a] at hab
  linarith [hab]

/-- The `v`-block preserves `gFormC` diagonally — the three-factor Born composition law
    `biMul_gFormC` applied twice with the Born-unit conditions `gFormC u u = gFormC w w = 1`. -/
theorem vTwoPlane_gFormC_diag (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (v : O Cut) :
    gFormC (vTwoPlane u w v) (vTwoPlane u w v) = gFormC v v := by
  rw [vTwoPlane_apply, biMul_gFormC w w (u * (v * u)), hw, biMul_gFormC u u v, hu]
  ring

/-- The `v`-block PRESERVES `reQC`: `reQC x = gFormC x 1` (`gFormC_one_right`); the `v`-block fixes
    `1` (`vTwoPlane_fix_one`) and preserves `gFormC` bilinearly (`gFormC_polarize` of
    `vTwoPlane_gFormC_diag`), so `reQC (vTwoPlane u w v) = gFormC (T v) (T 1) = gFormC v 1 = reQC v`. -/
theorem vTwoPlane_reQC (u w : O Cut) (hu_im : u * u = -1) (hw_im : w * w = -1)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (v : O Cut) :
    reQC (vTwoPlane u w v) = reQC v := by
  have h1 : vTwoPlane u w 1 = 1 := vTwoPlane_fix_one u w hu_im hw_im
  have hpol := gFormC_polarize (vTwoPlane u w) (vTwoPlane_gFormC_diag u w hu hw) v 1
  rw [h1] at hpol
  rw [← gFormC_one_right, ← gFormC_one_right v]
  exact hpol

/-! ## THE GENERAL COMMUTATION — a block-acting operator commutes with the ninth rotation. -/

/-- ★★ THE GENERAL COMMUTATION. A `Cut`-linear operator `K` that (i) acts as `(t,x,v) ↦ (t,x,Kblock
    v)` — fixing the `(t,x)` block and acting on the octonion block by some `Cut`-linear `Kblock` —
    that (ii) FIXES the real octonion axis (`Kblock 1 = 1`) and (iii) PRESERVES `reQC`, COMMUTES with
    every ninth-direction rotation `planeRotLin c s`. The `A`-plane `span{x,1}` and the `Kblock`
    sector are complementary: `planeRotLin` only ever reads/writes `x` and `reQC v` (and the `•1`
    increment), all of which `Kblock` leaves invariant, so the two operators do not interfere. -/
theorem commuteBlockNinth (K : Module.End Cut STVC) (Kblock : O Cut →ₗ[Cut] O Cut)
    (hK : ∀ t x : Cut, ∀ v : O Cut, K (t, x, v) = (t, x, Kblock v))
    (h1 : Kblock 1 = 1) (hre : ∀ v : O Cut, reQC (Kblock v) = reQC v) (c s : Cut) :
    K * planeRotLin c s = planeRotLin c s * K := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, Module.End.mul_apply, planeRotLin_apply, hK, hK, planeRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c * x - s * reQC v = c * x - s * reQC (Kblock v)
    rw [hre]
  · show Kblock (v + (s * x + (c - 1) * reQC v) • (1 : O Cut))
        = Kblock v + (s * x + (c - 1) * reQC (Kblock v)) • (1 : O Cut)
    rw [map_add, map_smul, h1, hre]

/-- ★ A single octonion-block 2-plane rotation `genTwoPlaneLin u w` (`u, w` imaginary Born-units)
    COMMUTES with every ninth-direction rotation `planeRotLin c s`. The instance of
    `commuteBlockNinth` with `Kblock = vTwoPlane u w` (fixes `1` by `vTwoPlane_fix_one`, preserves
    `reQC` by `vTwoPlane_reQC`). The `SO(8)` octonion-block sector and the `A`-torus are disjoint. -/
theorem genTwoPlaneLin_commute_planeRot (u w : O Cut)
    (hu_im : u * u = -1) (hw_im : w * w = -1) (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (c s : Cut) :
    genTwoPlaneLin u w * planeRotLin c s = planeRotLin c s * genTwoPlaneLin u w :=
  commuteBlockNinth (genTwoPlaneLin u w) (vTwoPlane u w)
    (fun t x v => genTwoPlaneLin_vblock u w t x v)
    (vTwoPlane_fix_one u w hu_im hw_im)
    (vTwoPlane_reQC u w hu_im hw_im hu hw) c s

/-! ## THE ABSTRACT COMMUTATION at arbitrary length, and the degeneration. -/

/-- ★★ THE ABSTRACT COMMUTATION — every arbitrary-length octonion-block word `blockWordLin L`
    (all pairs imaginary Born-units) COMMUTES with the ninth rotation `planeRotLin c s`. ONE list
    induction over the single-block commutation `genTwoPlaneLin_commute_planeRot`: the empty word is
    the identity (commutes trivially); a cons `genTwoPlaneLin u w · blockWordLin rest` commutes by
    moving `planeRotLin` past the leading block (single-block commutation) then past the tail (the
    inductive hypothesis), with `mul_assoc`. The whole `SO(8)` word sector commutes with the
    `A`-torus. -/
theorem blockWordLin_commute_planeRot (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, p.1 * p.1 = -1 ∧ p.2 * p.2 = -1 ∧ gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (c s : Cut) :
    blockWordLin L * planeRotLin c s = planeRotLin c s * blockWordLin L := by
  induction L with
  | nil => rw [blockWordLin_nil, one_mul, mul_one]
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      have hhd := hL (u, w) List.mem_cons_self
      have ihtl := ih (fun p hp => hL p (List.mem_cons_of_mem _ hp))
      rw [blockWordLin_cons, mul_assoc, ihtl, ← mul_assoc,
          genTwoPlaneLin_commute_planeRot u w hhd.1 hhd.2.1 hhd.2.2.1 hhd.2.2.2, mul_assoc]

/-- `blockWordLin (L₁ ++ L₂) = blockWordLin L₁ · blockWordLin L₂` — the word fold is a monoid
    homomorphism from list concatenation to operator product. ONE list induction. -/
theorem blockWordLin_append (L1 L2 : List (O Cut × O Cut)) :
    blockWordLin (L1 ++ L2) = blockWordLin L1 * blockWordLin L2 := by
  induction L1 with
  | nil => rw [List.nil_append, blockWordLin_nil, one_mul]
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      rw [List.cons_append, blockWordLin_cons, blockWordLin_cons, ih, mul_assoc]

/-- ★★ THE SINGLE-PLANE DEGENERATION (the measure-first FINDING). The KAK sandwich over a SINGLE
    `A`-plane DEGENERATES to a mere `SO(8)·A` product: the inner octonion-block word `blockWordLin L₁`
    COMMUTES with the ninth rotation (`blockWordLin_commute_planeRot`), so it slides past
    `planeRotLin c s` and merges with the outer word (`blockWordLin_append`):

        `kakWordLin L₁ L₂ c s = blockWordLin (L₂ ++ L₁) · planeRotLin c s`.

    The two `SO(8)` words coalesce into one and the ninth rotation factors out — the triple product
    is NOT a genuine three-factor `SO(9)` element. A single `A`-plane is structurally insufficient to
    assemble the full compact `SO(9)`; the genuine remainder is the full ninth-generator family (the
    `x ↔ eᵢ` rotation against EACH octonion axis), which the single banked `A`-plane does not reach. -/
theorem kakWordLin_degenerate (L1 L2 : List (O Cut × O Cut)) (c s : Cut)
    (hL1 : ∀ p ∈ L1, p.1 * p.1 = -1 ∧ p.2 * p.2 = -1 ∧ gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    kakWordLin L1 L2 c s = blockWordLin (L2 ++ L1) * planeRotLin c s := by
  rw [kakWordLin, mul_assoc, ← blockWordLin_commute_planeRot L1 hL1 c s, ← mul_assoc,
      blockWordLin_append L2 L1]

/-! ## W8 teeth — a concrete KAK sandwich with an active ninth rotation moves `x`. -/

/-- ★ W8 — a CONCRETE KAK sandwich with one octonion-block factor on each side and an ACTIVE ninth
    rotation `(c,s) = (3/5, 4/5)`, applied to `(0,1,0)`, moves the `x` coordinate to `3/5`. Each
    `genTwoPlaneLin e₂ ιe₂` factor fixes `(0,1,0)` (zero octonion block) and fixes `x`; the ninth
    rotation sends `x = 1 ↦ c = 3/5`. So the ninth rotation IS genuinely active (it reaches `x`,
    beyond the `x`-rigid `SO(8)` words) — yet the whole sandwich is only `SO(8)·A`. -/
theorem kakWord_e2je2_x :
    (kakWordLin [((CD.e2 : O Cut), (je2 : O Cut))] [((CD.e2 : O Cut), (je2 : O Cut))]
        ((3:Cut)/5) ((4:Cut)/5) ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (3:Cut)/5 := by
  rw [kakWordLin, blockWordLin_cons, blockWordLin_nil, mul_one,
      Module.End.mul_apply, Module.End.mul_apply]
  have hz : vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) (0 : O Cut) = 0 := by
    rw [vTwoPlane_apply]; simp
  have hinner : genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (1:Cut), (0:O Cut)) := by
    rw [genTwoPlaneLin_vblock, hz]
  -- the outer block fixes (t,x), so .2.1 reads the x-coord of the ninth rotation
  rw [genTwoPlaneLin_vblock, hinner, planeRotLin_apply]
  show (3:Cut)/5 * 1 - (4:Cut)/5 * reQC (0 : O Cut) = (3:Cut)/5
  rw [reQC_zero]; ring

/-- ★ W8 TEETH — the concrete KAK sandwich `x`-image is exactly `3/5` (the active ninth-rotation
    cosine), DISTINCT from the input `x = 1`. The distinguishing read-off: the `SO(8)` words leave
    `x` rigid, the single ninth rotation moves it to `c = 3/5`. -/
theorem kakWord_e2je2_x_val :
    (kakWordLin [((CD.e2 : O Cut), (je2 : O Cut))] [((CD.e2 : O Cut), (je2 : O Cut))]
        ((3:Cut)/5) ((4:Cut)/5) ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (3:Cut)/5 :=
  kakWord_e2je2_x

end

end Phys.Algebra
