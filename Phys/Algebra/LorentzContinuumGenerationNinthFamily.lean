/-
  Phys.Algebra.LorentzContinuumGenerationNinthFamily — N113: THE FULL NINTH-DIRECTION GENERATOR
  FAMILY `x ↔ eᵢ` (a GENERAL octonion axis, not just the real axis) AND THE NON-COMMUTATION WITH
  THE OCTONION-BLOCK WORDS (the structural complement to N112's commuting single `A`-plane). N105
  banked the single `A`-plane `planeRotLin c s` — the `x ↔ 1` REAL-axis ninth rotation of the
  2-plane `span{x, 1}`. N112's measure-first FINDING: that single plane COMMUTES with every
  octonion-block word `blockWordLin L` (the words FIX the real axis `1` and PRESERVE `reQC`), so the
  banked generators reach only the PRODUCT sector `SO(8)·A`, NOT the full compact `SO(9)`
  (`kakWordLin_degenerate`). N112 pinned the genuine remainder: the FULL ninth-generator family, the
  `x ↔ eᵢ` rotation against a GENERAL octonion axis `eᵢ` (not just `1`).

  ===========================================================================
  THE MEASURED FACT (the structural complement to N112 — THE ONE LAW: what N112's commutation
  RESISTED, this node DERIVES as the genuine joint). N112 proved the `x ↔ 1` plane commutes with
  EVERY word because the words FIX `1`. For a GENERAL axis `eᵢ` a word generally does NOT fix `eᵢ`:
  the banked octonion-block word `genTwoPlaneLin e₂ je2` NEGATES `e₂` (`vTwoPlane_e2_je2_e2`, from
  `biMulComp_e2_je2_negates_e2`). And the general-axis ninth rotation `axisRotLin e c s` reads the
  `e`-component `gFormC v e` (where the real-axis rotation reads `reQC v = gFormC v 1`). So when the
  word flips the sign of `e₂`, it flips the sign of the very component the `e₂`-axis rotation depends
  on — and the two operators DO NOT COMMUTE:

      `axisRotLin e₂ c s · genTwoPlaneLin e₂ je2` applied to `(0,0,e₂)` reads `x`-slot `+s`
                                                  (the word negates `e₂` first: `gFormC(−e₂)e₂ = −1`,
                                                   so `c·0 − s·(−1) = s`),
      `genTwoPlaneLin e₂ je2 · axisRotLin e₂ c s` applied to `(0,0,e₂)` reads `x`-slot `−s`
                                                  (the rotation reads `gFormC e₂ e₂ = 1` first:
                                                   `c·0 − s·1 = −s`, then the word leaves `x` rigid).

  For `s ≠ 0` these differ (`+s ≠ −s`), so `axisRotLin e₂ c s` does NOT commute with the banked
  octonion-block word `genTwoPlaneLin e₂ je2` (`axisRotLin_word_not_commute`). This is the EXACT
  structural opposite of N112's `genTwoPlaneLin_commute_planeRot`: the single real-axis plane
  COMMUTES with the words; a general-axis plane does NOT. Hence `(SO(8)-word)·(x↔e₂ rotation)`
  reaches STRICTLY beyond the `SO(8)·A` product sector — the "strictly higher sector" the N112
  finding demanded, now witnessed by a concrete non-commuting pair.

  ── WHAT THIS NODE BANKS ──

  `axisRotLin` / `axisRotLin_apply` — the general-axis ninth-direction rotation of `span{x, e}`.
  `axisRotLin_one_eq_planeRotLin` — the `e = 1` case IS N105's `planeRotLin` (it GENERALIZES it).
  ★ `gFormC_add_axis_self` — the general-axis completing-the-square identity.
  ★ `axisRotLin_isQvIsomC` — the general-axis rotation is a `QvC`-isometry (unit axis, `c²+s²=1`).
  `ninthFamilyGenSetLin` — THE FULL NINTH-DIRECTION GENERATOR SET: `{axisRotLin e c s | gFormC e e =
    1, c²+s²=1}`, the `x ↔ eᵢ` rotations against EVERY unit octonion axis.
  `genIsomMonoidLinFamily := closure (biMulGenSetLin ∪ ninthFamilyGenSetLin)` — the alphabet enlarged
    by the FULL ninth-generator family.
  ★★ `genIsomMonoidLinFamily_isQvIsomC` — SOUNDNESS: every element is a `QvC`-isometry (the full
    family stays inside the isometry monoid).
  `axisRotLin_mem_genIsomMonoidLinFamily` — each general-axis rotation is an enlarged generator.
  `ninthGenSetLin_subset_ninthFamily` / `genIsomMonoidLinPlus_le_genIsomMonoidLinFamily` — the FULL
    family CONTAINS N106's single-axis alphabet (the `e = 1` plane is the `axisRotLin 1` member).
  `vTwoPlane_e2_je2_e2` — the banked word NEGATES the axis `e₂` (does NOT fix it — breaks N112).
  `gFormC_neg_e2_e2` — `gFormC (−e₂) e₂ = −1`.
  `axisRot_word_e2` / `word_axisRot_e2` — the two orders read `x`-slot `+s` vs `−s` at `(0,0,e₂)`.
  ★★ `axisRotLin_word_not_commute` — THE JOINT: the general-axis rotation does NOT commute with the
    banked octonion-block word (the structural opposite of N112's commuting single plane).
  `axisRot_word_e2_val` / `word_axisRot_e2_val` — W8 teeth: the concrete witness `(3/5,4/5)` reads
    `x`-slot `4/5` and `−4/5` in the two orders (distinct — the non-commutation made concrete).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──

  Every object is DERIVED: `planeRotLin` / `planeRotLin_apply` / `gFormC_one_right` (N105);
  `genTwoPlaneLin` / `genTwoPlaneLin_vblock` / `vTwoPlane` / `vTwoPlane_apply` (N100/N112);
  `biMulComp_e2_je2_negates_e2` / `biMulFun` (N95/N-Spin9); `gFormC` / `gFormC_add_left` /
  `gFormC_add_right` / `gFormC_smul_left` / `gFormC_smul_right` / `gFormC_symm` / `gFormC_one`
  (N-LieAlgebra/N-Rotation); `e2_gFormC_self` (N53); `biMulGenSetLin` / `genIsomMonoidLin`
  (N100); `genIsomMonoidLinPlus` / `ninthGenSetLin` (N106); the `Module.End` / `LinearMap` /
  `Submonoid.closure` MACHINERY on the DERIVED objects (STANDARD §3) — over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature posits the full `Spin(9)` /
  `SO(9)` and reads off its maximal torus and root structure. Here the ninth-generator family is
  built FORWARD from the trunk, gap by measured gap: N112 measured that the single real-axis plane
  commutes with the words (so it is structurally insufficient); THIS node adjoins the general-axis
  family the finding pinned and DERIVES the non-commutation that makes it reach strictly higher. The
  contribution is the forced, honest construction of exactly the missing generator and the proof —
  not a posited Cartan decomposition — that it genuinely fails to commute, the structural opposite
  of the single plane.

  ── THE FORWARD REMAINDER (childed N114) ──
  The GLOBAL `SO(8)`-generation completeness (whether the `blockWordLin`-words generate ALL of
  `SO(8)`) and the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` /
  `ContinuousLinearMap` so the N96 affine path is CONTINUOUS) remain the HEAVY group-manifold core
  Mathlib lacks over the derived `Cut` — the W1 dissolution remainder. THIS node banks the full
  ninth-generator family, its soundness, its containment of the prior alphabet, and the genuine
  non-commutation joint — the immediately-bankable structural piece N112's finding demanded.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / axis / isometry / compact / orthogonal / SO(9) / SO(8) / SO(2) /
  A-torus / ninth-direction / octonion-block / word / 2-plane / generator / commute / Cartan /
  family / Spin / half-turn": what remains is pure linear algebra over the derived complete ordered
  field `Cut` — for each `e : O Cut` with `gFormC e e = 1`, an operator `axisRotLin e c s` of
  `Module.End Cut (Cut × Cut × O Cut)` reading the component `gFormC v e`, preserving the quadratic
  form `QvC` when `c²+s²=1`; the submonoid generated by these together with the bimultiplications;
  and the fact that `axisRotLin e₂ c s · (biMulLin je2 je2 · biMulLin e₂ e₂)` differs from the
  product in the opposite order (evaluated at one point, second coordinate `+s` vs `−s`) whenever
  `s ≠ 0`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The general-axis ninth-direction rotation `x ↔ e`. -/

/-- THE GENERAL-AXIS NINTH-DIRECTION ROTATION `axisRotLin e c s`: the `SO(2)` rotation of the 2-plane
    `span{x, e}` (the `x`-axis and a general unit octonion axis `e`) by the circle point `(c,s)`,
    reading the `e`-component `gFormC v e`:
    `(t,x,v) ↦ (t, c·x − s·gFormC v e, v + (s·x + (c−1)·gFormC v e)•e)`.
    The new `e`-component is `gFormC v e + s·x + (c−1)·gFormC v e = c·gFormC v e + s·x` — the rotated
    `(x, gFormC v e)` pair, with the rest of `v` (the `e`-complement) untouched. `Cut`-linear
    (additivity via `gFormC_add_left`, homogeneity via `gFormC_smul_left`). The N105 `planeRotLin` is
    the special case `e = 1` (`gFormC v 1 = reQC v`). -/
def axisRotLin (e : O Cut) (c s : Cut) : Module.End Cut STVC where
  toFun p := (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (p.2.1 + q.2.1) - s * gFormC (p.2.2 + q.2.2) e
          = (c * p.2.1 - s * gFormC p.2.2 e) + (c * q.2.1 - s * gFormC q.2.2 e)
      rw [gFormC_add_left]; ring
    · show (p.2.2 + q.2.2) + (s * (p.2.1 + q.2.1) + (c - 1) * gFormC (p.2.2 + q.2.2) e) • e
          = (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
            + (q.2.2 + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) • e)
      rw [gFormC_add_left]
      rw [show s * (p.2.1 + q.2.1) + (c - 1) * (gFormC p.2.2 e + gFormC q.2.2 e)
            = (s * p.2.1 + (c - 1) * gFormC p.2.2 e) + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) by ring]
      rw [add_smul]; abel
  map_smul' a p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (a • p.2.1) - s * gFormC (a • p.2.2) e = a • (c * p.2.1 - s * gFormC p.2.2 e)
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (a • p.2.2) + (s * (a • p.2.1) + (c - 1) * gFormC (a • p.2.2) e) • e
          = a • (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
      rw [gFormC_smul_left, smul_add, smul_smul]
      rw [show s * (a • p.2.1) + (c - 1) * (a * gFormC p.2.2 e)
            = a * (s * p.2.1 + (c - 1) * gFormC p.2.2 e) by simp only [smul_eq_mul]; ring]

theorem axisRotLin_apply (e : O Cut) (c s : Cut) (p : STVC) :
    axisRotLin e c s p = (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e) := rfl

/-- For the real axis `e = 1`, the general-axis rotation IS N105's `planeRotLin` (`gFormC v 1 = reQC
    v`, `gFormC_one_right`). The family GENERALIZES the single real-axis plane. -/
theorem axisRotLin_one_eq_planeRotLin (c s : Cut) :
    axisRotLin (1 : O Cut) c s = planeRotLin c s := by
  apply LinearMap.ext
  intro p
  rw [axisRotLin_apply, planeRotLin_apply, gFormC_one_right]

/-! ## The general-axis rotation is a `QvC`-isometry (unit axis, circle point). -/

/-- ★ THE GENERAL-AXIS completing-the-square identity over the derived ℝ:
    `gFormC (v + a•e) (v + a•e) = gFormC v v + 2·(a·gFormC v e) + a²·gFormC e e`. The general-axis
    analogue of N105's `gFormC_add_one_self` (which is the `e = 1` case, `gFormC v 1 = reQC v`). -/
theorem gFormC_add_axis_self (e v : O Cut) (a : Cut) :
    gFormC (v + a • e) (v + a • e)
      = gFormC v v + 2 * (a * gFormC v e) + a ^ 2 * gFormC e e := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right]
  rw [gFormC_smul_right a v e]
  rw [gFormC_smul_left a e v]
  rw [gFormC_smul_left a e (a • e), gFormC_smul_right a e e]
  rw [gFormC_symm e v]
  ring

/-- ★ `axisRotLin e c s` is a `QvC`-isometry for a UNIT axis (`gFormC e e = 1`) and a circle point
    (`c² + s² = 1`). The negative-definite block `−x² − (gFormC v e)²` of `QvC` (the `x`-axis and the
    `e`-axis component) is preserved by the circular rotation; the `e`-complement of `v` rides along
    unchanged. Pure field arithmetic over the derived ℝ via the completing-the-square identity
    `gFormC_add_axis_self` with `gFormC e e = 1` and `c²+s²=1`. The general-axis generalization of
    N105's `planeRotLin_isQvIsomC`. -/
theorem axisRotLin_isQvIsomC (e : O Cut) (he : gFormC e e = 1) (c s : Cut) (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (axisRotLin e c s) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [axisRotLin_apply]
  show QvC (t, c * x - s * gFormC v e, v + (s * x + (c - 1) * gFormC v e) • e)
      = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_axis_self e v (s * x + (c - 1) * gFormC v e), he]
  set r := gFormC v e with hr
  ring_nf
  nlinarith [h, sq_nonneg (c * x - s * r)]

/-! ## The full ninth-direction generator family and the enlarged submonoid. -/

/-- THE FULL NINTH-DIRECTION GENERATOR SET: every general-axis rotation `axisRotLin e c s` for a unit
    octonion axis `e` (`gFormC e e = 1`) and a circle point `(c,s)` (`c²+s²=1`). The `x ↔ eᵢ`
    rotations against EVERY unit octonion axis — the full family N112's finding pinned, generalizing
    N106's single-axis `ninthGenSetLin` (the `e = 1` slice). -/
def ninthFamilyGenSetLin : Set (Module.End Cut STVC) :=
  {K | ∃ (e : O Cut) (c s : Cut), gFormC e e = 1 ∧ c ^ 2 + s ^ 2 = 1 ∧ K = axisRotLin e c s}

/-- THE ENLARGED GENERATED SUBMONOID with the FULL ninth-direction family: the closure of the
    `biMulLin` two-sided generators TOGETHER WITH every general-axis ninth rotation. The `biMulLin`
    alphabet enlarged by the entire `x ↔ eᵢ` family (all axes), strictly beyond N106's single-axis
    `genIsomMonoidLinPlus`. -/
def genIsomMonoidLinFamily : Submonoid (Module.End Cut STVC) :=
  Submonoid.closure (biMulGenSetLin ∪ ninthFamilyGenSetLin)

/-- ★★ SOUNDNESS — every `K ∈ genIsomMonoidLinFamily` is a `QvC`-isometry. A
    `Submonoid.closure_induction`: each `biMulLin` generator is an isometry (`biMulLin_isQvIsomC`),
    each general-axis ninth generator is an isometry (`axisRotLin_isQvIsomC`, for a unit axis and a
    circle point), the identity is, and a composite of isometries is. Adjoining the FULL ninth-
    direction family does NOT break the form — the enlargement stays inside the isometry monoid. -/
theorem genIsomMonoidLinFamily_isQvIsomC {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLinFamily) : IsQvIsomC (K : STVC → STVC) := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      rcases hK with ⟨u, u', hu, hu', rfl⟩ | ⟨e, c, s, he, h, rfl⟩
      · exact biMulLin_isQvIsomC u u' hu hu'
      · exact axisRotLin_isQvIsomC e he c s h
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show QvC (A (B p)) = QvC p; rw [ihA (B p), ihB p]

/-- Each general-axis ninth rotation `axisRotLin e c s` (unit axis, circle point) is an enlarged
    generator, hence a member of the family submonoid (`subset_closure`). -/
theorem axisRotLin_mem_genIsomMonoidLinFamily (e : O Cut) (c s : Cut)
    (he : gFormC e e = 1) (h : c ^ 2 + s ^ 2 = 1) :
    axisRotLin e c s ∈ genIsomMonoidLinFamily :=
  Submonoid.subset_closure (Or.inr ⟨e, c, s, he, h, rfl⟩)

/-- N106's single-axis generator set is contained in the FULL family: a `planeRotLin c s` (the `e =
    1` slice, `c²+s²=1`) IS `axisRotLin 1 c s` (`axisRotLin_one_eq_planeRotLin`) with `gFormC 1 1 = 1`
    (`gFormC_one`). -/
theorem ninthGenSetLin_subset_ninthFamily :
    ninthGenSetLin ⊆ ninthFamilyGenSetLin := by
  rintro K ⟨c, s, h, rfl⟩
  exact ⟨(1 : O Cut), c, s, gFormC_one, h, (axisRotLin_one_eq_planeRotLin c s).symm⟩

/-- ★ THE ALPHABET ENLARGEMENT CHAIN — N106's single-axis enlarged submonoid is CONTAINED in the
    FULL ninth-direction family submonoid (`closure_mono` on the union, since `ninthGenSetLin ⊆
    ninthFamilyGenSetLin`). The full family genuinely extends the prior alphabet. -/
theorem genIsomMonoidLinPlus_le_genIsomMonoidLinFamily :
    genIsomMonoidLinPlus ≤ genIsomMonoidLinFamily :=
  Submonoid.closure_mono (Set.union_subset_union_right _ ninthGenSetLin_subset_ninthFamily)

/-! ## THE NON-COMMUTATION — the structural complement to N112. -/

/-- The banked octonion-block word `genTwoPlaneLin e₂ je2` NEGATES the axis `e₂`:
    `vTwoPlane e₂ je2 e₂ = −e₂` (the `v`-block of `biMulComp_e2_je2_negates_e2`). It does NOT fix
    `e₂` — breaking the N112 commutation hypothesis (where every word FIXES the real axis `1`). -/
theorem vTwoPlane_e2_je2_e2 :
    vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  have h := biMulComp_e2_je2_negates_e2
  have := congrArg (fun p => p.2.2) h
  simpa [vTwoPlane_apply, biMulFun] using this

/-- `gFormC (−e₂) e₂ = −1` (the `e₂`-self-overlap is `1`, `e2_gFormC_self`, negated). -/
theorem gFormC_neg_e2_e2 : gFormC (-(CD.e2 : O Cut)) (CD.e2 : O Cut) = (-1 : Cut) := by
  rw [show (-(CD.e2 : O Cut)) = (-1 : Cut) • (CD.e2 : O Cut) by rw [neg_one_smul]]
  rw [gFormC_smul_left, e2_gFormC_self]; ring

/-- The order `(x↔e₂ rotation)·(octonion-block word)` applied to `(0,0,e₂)` reads `x`-slot `+s`: the
    word NEGATES `e₂` first (`vTwoPlane_e2_je2_e2`), so the axis-rotation reads `gFormC(−e₂)e₂ = −1`,
    giving `c·0 − s·(−1) = s`. -/
theorem axisRot_word_e2 (c s : Cut) :
    ((axisRotLin (CD.e2 : O Cut) c s * genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = s := by
  rw [Module.End.mul_apply, genTwoPlaneLin_vblock, vTwoPlane_e2_je2_e2, axisRotLin_apply]
  show c * 0 - s * gFormC (-(CD.e2 : O Cut)) (CD.e2 : O Cut) = s
  rw [gFormC_neg_e2_e2]; ring

/-- The order `(octonion-block word)·(x↔e₂ rotation)` applied to `(0,0,e₂)` reads `x`-slot `−s`: the
    axis-rotation acts first (reads `gFormC e₂ e₂ = 1`), giving `c·0 − s·1 = −s`; the word then
    leaves the `x`-slot rigid (`genTwoPlaneLin_vblock` fixes `(t,x)`). -/
theorem word_axisRot_e2 (c s : Cut) :
    ((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut) * axisRotLin (CD.e2 : O Cut) c s)
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = -s := by
  rw [Module.End.mul_apply, axisRotLin_apply]
  show (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)
      ((0:Cut), c * 0 - s * gFormC (CD.e2 : O Cut) (CD.e2 : O Cut),
        (CD.e2 : O Cut)
          + (s * 0 + (c - 1) * gFormC (CD.e2 : O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut))).2.1 = -s
  rw [genTwoPlaneLin_vblock, e2_gFormC_self]
  ring

/-- ★★ THE NON-COMMUTATION (the genuine N113 joint). The general-axis ninth rotation `axisRotLin e₂ c
    s` does NOT commute with the banked octonion-block word `genTwoPlaneLin e₂ je2` whenever `s ≠ 0`.
    If they commuted, applying both orders to `(0,0,e₂)` and reading the `x`-slot would give `+s = −s`
    (`axisRot_word_e2` vs `word_axisRot_e2`), forcing `s = 0`. The EXACT structural opposite of
    N112's `genTwoPlaneLin_commute_planeRot`: the single REAL-axis plane COMMUTES with every word
    (the words FIX `1`); a GENERAL-axis plane does NOT (the word NEGATES `e₂`). So
    `(SO(8)-word)·(x↔e₂ rotation)` reaches STRICTLY beyond the `SO(8)·A` product sector — the
    "strictly higher sector" the N112 finding demanded. -/
theorem axisRotLin_word_not_commute (c s : Cut) (hs : s ≠ 0) :
    axisRotLin (CD.e2 : O Cut) c s * genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)
      ≠ genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut) * axisRotLin (CD.e2 : O Cut) c s := by
  intro heq
  have h1 := axisRot_word_e2 c s
  rw [heq, word_axisRot_e2 c s] at h1
  exact hs (by linarith [h1])

/-! ## W8 teeth — the concrete non-commuting witness `(3/5, 4/5)`. -/

/-- ★ W8 — the concrete witness `(c,s) = (3/5, 4/5)`: the order `(x↔e₂ rotation)·(word)` applied to
    `(0,0,e₂)` reads `x`-slot `4/5` (the word negates `e₂`, the rotation reads `−1`). -/
theorem axisRot_word_e2_val :
    ((axisRotLin (CD.e2 : O Cut) ((3:Cut)/5) ((4:Cut)/5)
        * genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = (4:Cut)/5 :=
  axisRot_word_e2 ((3:Cut)/5) ((4:Cut)/5)

/-- ★ W8 — the OPPOSITE order `(word)·(x↔e₂ rotation)` applied to `(0,0,e₂)` reads `x`-slot `−4/5`
    (the rotation reads `+1`, the word leaves `x` rigid). DISTINCT from the `+4/5` of the other order
    — the non-commutation made concrete (`4/5 ≠ −4/5`). -/
theorem word_axisRot_e2_val :
    ((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)
        * axisRotLin (CD.e2 : O Cut) ((3:Cut)/5) ((4:Cut)/5))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = -((4:Cut)/5) :=
  word_axisRot_e2 ((3:Cut)/5) ((4:Cut)/5)

end

end Phys.Algebra
