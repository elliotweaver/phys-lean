/-
  Phys.Algebra.LorentzContinuumGenerationEnlargedAlphabet — N106: THE ENLARGED-ALPHABET CONVERSE
  GENERATION. N105 PROVED the literal residual (R) "every EvC-orthogonal `QvC`-isometry IS a
  `biMulLin` word" FALSE for the `biMulLin` generating alphabet: every finite `biMulLin` word
  `K ∈ genIsomMonoidLin` FIXES the `x`-coordinate (`genIsomMonoidLin_fixes_snd`), reaching at most
  the octonion-block `SO(8)` rotation sector of `𝕆`, NOT the full compact `SO(9)` of the nine space
  directions `x ⊕ 𝕆`; the genuine ninth-direction rotation `planeRotLin c s` (`c²+s²=1`, `c≠1`) and
  the `x`-negation `xNegLin` are `QvC`-isometries OUTSIDE the word reach. The missing `x ↔ 𝕆`
  ninth-direction generator is a gap in the GENERATING SET, not the proof.

  THIS NODE closes that gap STRUCTURALLY (ROADMAP §N106 priority (i), the immediately-bankable
  piece — NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content): ADJOIN the
  ninth-direction rotation `planeRotLin` to the `biMulLin` generating alphabet, forming the ENLARGED
  generated submonoid `genIsomMonoidLinPlus`, and bank the three forced structural facts.

  ===========================================================================
  ── WHAT THIS NODE BANKS (the enlarged alphabet — soundness, strict enlargement, witness) ──

  ★ `biMulLin_isQvIsomC` — THE FULL TWO-SIDED GENERATOR is a `QvC`-isometry (general `u, u'`, the
    `v`-block `v ↦ u·(v·u')` preserves `gFormC` by the three-factor Born composition law
    `biMulFun_isom`; the N102 half-turn `biMulLin_imag_isQvIsomC` is the `u=u'` special case).

  `ninthGenSetLin` — THE NINTH-DIRECTION GENERATOR SET: every `planeRotLin c s` for a circle point
    `(c,s)` with `c²+s²=1`. The `x ↔ 𝕆` 2-plane rotations the `biMulLin` alphabet cannot reach.

  `genIsomMonoidLinPlus := closure (biMulGenSetLin ∪ ninthGenSetLin)` — THE ENLARGED GENERATED
    SUBMONOID: every finite product of the octonion-block two-sided Born-unit generators AND the
    ninth-direction rotations. The alphabet extended toward the full compact `SO(9)` of `x ⊕ 𝕆`.

  ★★ `genIsomMonoidLinPlus_isQvIsomC` — SOUNDNESS: every `K ∈ genIsomMonoidLinPlus` is a
    `QvC`-isometry. A `Submonoid.closure_induction`: the `biMulLin` generators are isometries
    (`biMulLin_isQvIsomC`), the ninth-direction generators are isometries (`planeRotLin_isQvIsomC`,
    N105), the identity is, and composites of isometries are (`rw` the two fixings). The enlargement
    stays INSIDE the isometry monoid — adjoining the ninth generator does NOT break the form.

  ★★ `genIsomMonoidLin_lt_genIsomMonoidLinPlus` — STRICT ENLARGEMENT: the `biMulLin`-word submonoid
    is a PROPER subset of the enlarged submonoid. `≤` by `closure_mono` (`biMulGenSetLin ⊆ union`);
    strictness witnessed by `planeRotLin (3/5) (4/5)`, which lies in `genIsomMonoidLinPlus`
    (a generator, `subset_closure`) but NOT in `genIsomMonoidLin` (the N105 obstruction
    `planeRotLin_not_mem_genIsomMonoidLin`, since `3/5 ≠ 1`). The enlargement reaches something the
    words provably cannot — exactly the structure N105 isolated.

  ★ `enlargedTwoPlaneNinth u w c s := planeRotLin c s * genTwoPlaneLin u w` — THE CONCRETE
    higher-rank compact rotation: an octonion-block two-plane rotation (`genTwoPlaneLin`, a banked
    `biMulLin` word, the `SO(8)` factor) composed with a ninth-direction rotation (`planeRotLin`,
    the `SO(2)` factor). It lies in `genIsomMonoidLinPlus` (`enlargedTwoPlaneNinth_mem`), is a
    `QvC`-isometry (`enlargedTwoPlaneNinth_isQvIsomC`, via soundness), MOVES `x`
    (`enlargedTwoPlaneNinth_moves_x`: `(0,1,0) ↦ x' = c`, because the `genTwoPlaneLin` factor fixes
    the zero `v`-block hence `(0,1,0)`, then the ninth rotation sends `x → c`), and for `c ≠ 1` is
    NOT a `biMulLin` word (`enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin`). A genuine
    `SO(8)·(ninth-rotation)` element of the enlarged alphabet that NO octonion-block word realises —
    the structural `SO(9) = SO(8)·(x-rotations)` factorization made concrete.

      biMulLin_isQvIsomC          — ★ the full two-sided generator is a `QvC`-isometry.
      ninthGenSetLin              — the ninth-direction generator set `{planeRotLin c s | c²+s²=1}`.
      genIsomMonoidLinPlus        — the enlarged generated submonoid.
      genIsomMonoidLinPlus_isQvIsomC      — ★★ SOUNDNESS (closure induction).
      genIsomMonoidLin_le_genIsomMonoidLinPlus  — the word submonoid is contained.
      planeRotLin_mem_genIsomMonoidLinPlus      — the ninth rotation is an enlarged generator.
      three_fifths_sq_add / three_fifths_ne_one — the circle-point witness arithmetic.
      genIsomMonoidLin_lt_genIsomMonoidLinPlus  — ★★ STRICT enlargement (the N105 obstruction is
                                                     the strictness witness).
      enlargedTwoPlaneNinth       — the concrete `SO(8)·ninth` higher-rank compact rotation.
      enlargedTwoPlaneNinth_mem   — it is an enlarged word.
      enlargedTwoPlaneNinth_isQvIsomC     — it is a `QvC`-isometry (via soundness).
      biMulLin_fixes_zero_v / genTwoPlaneLin_fixes_zero_v — the octonion-block factor fixes `(t,x,0)`.
      enlargedTwoPlaneNinth_moves_x       — ★ it moves `x` (`(0,1,0) ↦ x' = c`) — W8 teeth.
      enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin — ★ no `biMulLin` word realises it (`c≠1`).

  DERIVED from the trunk (`biMulFun_isom` N55; `planeRotLin` / `planeRotLin_isQvIsomC` /
  `planeRotLin_moves_x` / `planeRotLin_not_mem_genIsomMonoidLin` / `genIsomMonoidLin_fixes_snd` N105;
  `biMulGenSetLin` / `genIsomMonoidLin` / `genTwoPlaneLin` / `genTwoPlaneLin_mem_genLin` N100; the
  `Submonoid.closure_induction` / `closure_mono` / `SetLike.lt_iff_le_and_exists` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator
  topology, NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature posits the full `Spin(9)` (or
  `SO⁺(1,9)`) and reads off its generators. Here we DERIVED the octonion-block generators (N100),
  PROVED constructively (N105) that they reach exactly the `x`-rigid `SO(8)` sector and that the
  ninth-direction rotation lies OUTSIDE — and now we ADJOIN precisely the missing generator the
  obstruction pinned, PROVE the enlargement is sound (stays an isometry monoid) and STRICTLY larger
  (the obstruction is the strictness witness), and exhibit a concrete `SO(8)·ninth` element no word
  realises. The contribution: the generating set is built FORWARD from the trunk, gap by measured
  gap, never posited whole — the enlargement is forced by what the previous node proved missing.

  ── THE FORWARD REMAINDER (childed N107) ──
  The full compact-`SO(9)` SURJECTIVITY: does the enlarged alphabet `genIsomMonoidLinPlus` generate
  ALL `QvC`-isometries of the compact `x ⊕ 𝕆` sector (every compact rotation a finite product of
  octonion-block two-plane words and ninth-direction rotations)? That is the GENUINE heavy
  group-manifold core — Mathlib has NO operator topology `TopologicalSpace (Module.End Cut STVC)`
  over the derived `Cut`, no `2`-plane-rotation exhaustion, no `Spin(9)→SO(9)` cover over `Cut`. THIS
  node banks the enlarged alphabet, its soundness, its strict enlargement, and a concrete
  higher-rank witness — the immediately-bankable structural piece — and childs the global
  surjectivity / operator topology / exhaustion as the forward frontier.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  compact / orthogonal / Spin / SO(9) / SO(8) / SO(2) / 2-plane / ninth-direction / generator /
  alphabet / word / octonion-block / half-turn": what remains is pure linear algebra over the
  derived complete ordered field `Cut` — a submonoid of `Module.End Cut (Cut × Cut × O Cut)`,
  generated by the bimultiplication operators together with the `span{x,1}`-plane circular maps,
  every element of which preserves the quadratic form `QvC`; it strictly contains the
  bimultiplication-word submonoid (a concrete circular map preserving `QvC` is not in the smaller
  submonoid); and a concrete product of a bimultiplication word and a circular map moves the second
  coordinate projection. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationWordMembershipObstruction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE FULL TWO-SIDED GENERATOR is a `QvC`-isometry (general `u, u'`). -/

/-- ★ THE FULL TWO-SIDED GENERATOR `biMulLin u u'` (`v ↦ u·(v·u')`) is a `QvC`-isometry for
    Born-units `u, u'`: the `v`-block preserves `gFormC` by the three-factor Born composition law
    (`biMulFun_isom`, via the defeq `biMulLin u u' = biMulFun u u'` on coordinates). The N102
    half-turn `biMulLin_imag_isQvIsomC` is the diagonal `u = u'` special case. -/
theorem biMulLin_isQvIsomC (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    IsQvIsomC (biMulLin u u') :=
  fun p => biMulFun_isom hu hu' p

/-! ## The enlarged generating set and the enlarged generated submonoid. -/

/-- THE NINTH-DIRECTION GENERATOR SET: every `Cut`-linear `SO(2)` rotation `planeRotLin c s` of the
    2-plane `span{x, 1}` (the `x`-axis and the real octonion axis) for a circle point `(c,s)` with
    `c² + s² = 1`. These are the `x ↔ 𝕆` ninth-direction rotations that N105 proved no `biMulLin`
    word realises — the missing generators the obstruction pinned. -/
def ninthGenSetLin : Set (Module.End Cut STVC) :=
  {K | ∃ c s : Cut, c ^ 2 + s ^ 2 = 1 ∧ K = planeRotLin c s}

/-- THE ENLARGED GENERATED SUBMONOID: the closure of the `biMulLin` two-sided generators TOGETHER
    WITH the ninth-direction rotations — every finite product of octonion-block Born-unit operators
    and `span{x,1}`-plane rotations. The `biMulLin` alphabet (`genIsomMonoidLin`, the octonion-block
    `SO(8)` sector) extended by the missing `x ↔ 𝕆` ninth generator, toward the full compact `SO(9)`
    of the nine space directions `x ⊕ 𝕆`. -/
def genIsomMonoidLinPlus : Submonoid (Module.End Cut STVC) :=
  Submonoid.closure (biMulGenSetLin ∪ ninthGenSetLin)

/-! ## SOUNDNESS — every enlarged word is still a `QvC`-isometry. -/

/-- ★★ SOUNDNESS — every `K ∈ genIsomMonoidLinPlus` is a `QvC`-isometry. A
    `Submonoid.closure_induction` over the enlarged generating set: each `biMulLin` generator is an
    isometry (`biMulLin_isQvIsomC`), each ninth-direction generator is an isometry
    (`planeRotLin_isQvIsomC`, N105, for `c²+s²=1`), the identity is, and a composite of two
    isometries is (compose the two form-preservations). Adjoining the ninth-direction rotation does
    NOT break the form — the enlargement stays inside the isometry monoid. -/
theorem genIsomMonoidLinPlus_isQvIsomC {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLinPlus) : IsQvIsomC (K : STVC → STVC) := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      rcases hK with ⟨u, u', hu, hu', rfl⟩ | ⟨c, s, h, rfl⟩
      · exact biMulLin_isQvIsomC u u' hu hu'
      · exact planeRotLin_isQvIsomC c s h
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show QvC (A (B p)) = QvC p; rw [ihA (B p), ihB p]

/-! ## STRICT ENLARGEMENT — the word submonoid is a proper subset. -/

/-- The `biMulLin`-word submonoid is contained in the enlarged submonoid (`closure_mono` on
    `biMulGenSetLin ⊆ biMulGenSetLin ∪ ninthGenSetLin`). -/
theorem genIsomMonoidLin_le_genIsomMonoidLinPlus :
    genIsomMonoidLin ≤ genIsomMonoidLinPlus :=
  Submonoid.closure_mono (Set.subset_union_left)

/-- The ninth-direction rotation `planeRotLin c s` (for `c²+s²=1`) is an enlarged generator, hence
    a member of the enlarged submonoid (`subset_closure`). -/
theorem planeRotLin_mem_genIsomMonoidLinPlus (c s : Cut) (h : c ^ 2 + s ^ 2 = 1) :
    planeRotLin c s ∈ genIsomMonoidLinPlus :=
  Submonoid.subset_closure (Or.inr ⟨c, s, h, rfl⟩)

/-- The strictness-witness circle point `(3/5, 4/5)` lies on the unit circle over the derived ℝ. -/
theorem three_fifths_sq_add : ((3:Cut)/5) ^ 2 + ((4:Cut)/5) ^ 2 = 1 := by
  norm_num

/-- The witness `x`-image `3/5` differs from the input `x`-coordinate `1`, so the witnessing
    rotation genuinely moves `x` (hence by N105 is not a `biMulLin` word). -/
theorem three_fifths_ne_one : ((3:Cut)/5) ≠ 1 := by
  norm_num

/-- ★★ STRICT ENLARGEMENT — `genIsomMonoidLin < genIsomMonoidLinPlus`. The `≤` is the containment
    above; strictness is witnessed by the concrete ninth-direction rotation `planeRotLin (3/5)(4/5)`,
    which IS an enlarged generator (`planeRotLin_mem_genIsomMonoidLinPlus`) but is NOT a `biMulLin`
    word (the N105 obstruction `planeRotLin_not_mem_genIsomMonoidLin`, since `3/5 ≠ 1`). The enlarged
    alphabet reaches a `QvC`-isometry the `biMulLin` words provably cannot — exactly the missing
    ninth-direction structure N105 isolated. -/
theorem genIsomMonoidLin_lt_genIsomMonoidLinPlus :
    genIsomMonoidLin < genIsomMonoidLinPlus := by
  rw [SetLike.lt_iff_le_and_exists]
  refine ⟨genIsomMonoidLin_le_genIsomMonoidLinPlus, planeRotLin ((3:Cut)/5) ((4:Cut)/5), ?_, ?_⟩
  · exact planeRotLin_mem_genIsomMonoidLinPlus ((3:Cut)/5) ((4:Cut)/5) three_fifths_sq_add
  · exact planeRotLin_not_mem_genIsomMonoidLin ((3:Cut)/5) ((4:Cut)/5) three_fifths_ne_one

/-! ## The concrete `SO(8)·(ninth-rotation)` higher-rank compact rotation. -/

/-- THE CONCRETE `SO(8)·(ninth-rotation)` ELEMENT: an octonion-block two-plane rotation
    `genTwoPlaneLin u w` (a banked `biMulLin` word, the `SO(8)` factor) composed with a
    ninth-direction rotation `planeRotLin c s` (the `SO(2)` factor). The `SO(9) = SO(8)·(x-rotations)`
    factorization made concrete: a higher-rank compact rotation as `(ninth) · (octonion-block word)`. -/
def enlargedTwoPlaneNinth (u w : O Cut) (c s : Cut) : Module.End Cut STVC :=
  planeRotLin c s * genTwoPlaneLin u w

/-- The concrete `SO(8)·ninth` element lies in the enlarged submonoid: a product of an enlarged
    generator (`planeRotLin`) and a `biMulLin` word (`genTwoPlaneLin`, contained via the
    `le`), closed under `mul_mem`. -/
theorem enlargedTwoPlaneNinth_mem (u w : O Cut) (c s : Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    enlargedTwoPlaneNinth u w c s ∈ genIsomMonoidLinPlus :=
  mul_mem (planeRotLin_mem_genIsomMonoidLinPlus c s h)
    (genIsomMonoidLin_le_genIsomMonoidLinPlus (genTwoPlaneLin_mem_genLin u w hu hw))

/-- The concrete `SO(8)·ninth` element is a `QvC`-isometry — directly from soundness, since it is an
    enlarged word. (No coordinate grind: the isometry property is inherited from the submonoid.) -/
theorem enlargedTwoPlaneNinth_isQvIsomC (u w : O Cut) (c s : Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (enlargedTwoPlaneNinth u w c s) :=
  genIsomMonoidLinPlus_isQvIsomC (enlargedTwoPlaneNinth_mem u w c s hu hw h)

/-- A two-sided generator `biMulLin u u'` FIXES a point with zero octonion block `(t,x,0)`:
    `u·(0·u') = 0`. -/
theorem biMulLin_fixes_zero_v (u u' : O Cut) (t x : Cut) :
    biMulLin u u' (t, x, (0 : O Cut)) = (t, x, (0 : O Cut)) := by
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show u * ((0 : O Cut) * u') = (0 : O Cut)
  rw [zero_mul, mul_zero]

/-- The octonion-block two-plane rotation `genTwoPlaneLin u w` FIXES `(t,x,0)` (two `biMulLin`
    factors, each fixing the zero `v`-block). -/
theorem genTwoPlaneLin_fixes_zero_v (u w : O Cut) (t x : Cut) :
    genTwoPlaneLin u w (t, x, (0 : O Cut)) = (t, x, (0 : O Cut)) := by
  show biMulLin w w (biMulLin u u (t, x, (0 : O Cut))) = (t, x, (0 : O Cut))
  rw [biMulLin_fixes_zero_v u u t x, biMulLin_fixes_zero_v w w t x]

/-- ★ W8 TEETH — the concrete `SO(8)·ninth` element MOVES `x`. Applied to `(0,1,0)`: the
    octonion-block factor `genTwoPlaneLin u w` fixes `(0,1,0)` (zero `v`-block), then the
    ninth-direction rotation sends `x = 1 ↦ x' = c` (`planeRotLin_moves_x`). So the `x`-image is `c`
    — off the `(t,x)` plane for `c ≠ 1`, the genuine ninth-direction motion no `biMulLin` word
    produces. -/
theorem enlargedTwoPlaneNinth_moves_x (u w : O Cut) (c s : Cut) :
    (enlargedTwoPlaneNinth u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  show (planeRotLin c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut)))).2.1 = c
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), planeRotLin_moves_x]

/-- ★ For `c ≠ 1`, the concrete `SO(8)·ninth` element is NOT a `biMulLin` word: it moves `x`
    (`enlargedTwoPlaneNinth_moves_x`) while every `biMulLin` word fixes `x`
    (`genIsomMonoidLin_fixes_snd`, N105). A genuine higher-rank compact rotation realised by the
    ENLARGED alphabet that the octonion-block words provably cannot — the strict enlargement, now
    on a multi-factor `SO(8)·SO(2)` element. -/
theorem enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin (u w : O Cut) (c s : Cut) (hc : c ≠ 1) :
    enlargedTwoPlaneNinth u w c s ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [enlargedTwoPlaneNinth_moves_x u w c s] at hfix
  exact hc hfix

end

end Phys.Algebra
