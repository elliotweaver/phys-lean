/-
  Phys.Algebra.LorentzContinuumGenerationWordMembershipObstruction — N105: THE WORD-MEMBERSHIP
  OBSTRUCTION — the `biMulLin`-word `x`-RIGIDITY and a CONCRETE EvC-ORTHOGONAL `QvC`-ISOMETRY THAT
  IS NOT A `biMulLin` WORD. N104 reduced the FULL converse `qvIsomMonoidC ≤ genIsomMonoidC2` to a
  SINGLE residual:

      (R) "every EvC-orthogonal `QvC`-isometry IS a `biMulLin` word" (∈ `genIsomMonoidLin`).

  MEASURE-FIRST (docs/ROADMAP.md §N105 priority (i)) settled (R) DECISIVELY, and the answer is the
  theory-native one: (R) is FALSE for the `biMulLin` generating alphabet, and the structural reason
  pins exactly what those generators reach.
  ===========================================================================
  THE STRUCTURAL FACT (the decisive MEASURE-FIRST finding — THE ONE LAW).

  `STVC = Cut × Cut × O Cut` = `(t, x, v)` — the `(1,9)` continuum: one time `t`, one space `x`,
  and the EIGHT octonion space directions `v ∈ O Cut`. The NINE space directions split as
  `x ⊕ 𝕆` (1 + 8). EVERY `Module.End`-side two-sided generator `biMulLin u u'` acts as

      `biMulLin u u' (t, x, v) = (t, x, u·(v·u'))`            — FIXES `t` AND `x`, rotates only `v`.

  (and on the `Function.End` side `rotFunC`/`rotCircFun`/`biMulFun` likewise FIX `(t,x)`; the only
  generator that moves `x` is the boost `boostFunC`, which mixes `x` with `t`, never with `v`). So
  EVERY finite `biMulLin` word `K ∈ genIsomMonoidLin` FIXES the `x`-coordinate: the two-sided
  Born-unit generators reach (at most) the `SO(8)` rotation sector of the octonion block `𝕆`, NOT
  the full compact `SO(9)` of the nine space directions `x ⊕ 𝕆`. The NINTH-direction rotations —
  those mixing the `x`-axis INTO the octonion block — are NOT reached by any `biMulLin` word.

  ── WHAT THIS NODE BANKS (the genuine NEW joint — the precise reach + the obstruction) ──

  ★★ `genIsomMonoidLin_fixes_fst` / `genIsomMonoidLin_fixes_snd` — THE `biMulLin`-WORD RIGIDITY.
    Every `K ∈ genIsomMonoidLin` FIXES BOTH the time coordinate `(K p).1 = p.1` AND the `x`
    coordinate `(K p).2.1 = p.2.1`, for ALL `p`. A `Submonoid.closure_induction`: each generator
    `biMulLin u u'` fixes the first two coordinates DEFINITIONALLY (`rfl`); identity and products
    preserve the property. This pins EXACTLY the block the `biMulLin` words live in — the octonion
    block `𝕆`, with `(t,x)` rigid.

  ★ `xNegLin` — THE SIMPLEST `x`-MOVER: `(t,x,v) ↦ (t,−x,v)`. A `Cut`-linear `QvC`-isometry
    (`t² − (−x)² − gFormC v v = t² − x² − gFormC v v`), EvC-SELF-ADJOINT and an INVOLUTION
    (`xNegLin∘xNegLin = id`), hence EvC-ORTHOGONAL — so by the N104 abstract lever
    `evCOrthogonal_compact_part_eq_self` it IS its own polar/KAK compact part. Yet it MOVES `x`
    (`(0,1,0) ↦ (0,−1,0)`), so by the rigidity it is NOT a `biMulLin` word.

  ★★ `xNegLin_not_mem_genIsomMonoidLin` — THE OBSTRUCTION. `xNegLin ∉ genIsomMonoidLin`: it is an
    EvC-orthogonal `QvC`-isometry (its own compact part) that is NOT a `biMulLin` word. THIS REFUTES
    THE LITERAL RESIDUAL (R): not every EvC-orthogonal `QvC`-isometry is a `biMulLin` word. The
    converse generation `qvIsomMonoidC ≤ genIsomMonoidC2` does NOT close by word-membership against
    the `biMulLin` alphabet — the missing ninth-direction (`x ↔ 𝕆`) generator is genuine, not a gap
    in the proof but a gap in the GENERATING SET. (What the lever DID close — N104 — stands: every
    such isometry that ALREADY IS a word has its compact part land; the obstruction shows the
    word-hypothesis is not free.)

  ★ `planeRotLin c s` — THE GENUINE NINTH-DIRECTION ROTATION (det `+1`, the honest geometric
    obstruction, not a reflection): the `SO(2)` rotation of the 2-plane `span{x, 1}` (the `x`-axis
    and the real octonion axis) by a circle point `(c,s)`, `(t,x,v) ↦ (t, c·x − s·reQC v,
    v + (s·x + (c−1)·reQC v)•1)`. A `Cut`-linear `QvC`-isometry for `c² + s² = 1` (the negative-
    definite `−x² − r²` block, `r := reQC v`, is preserved by a circular rotation), which MOVES `x`
    (`(0,1,0) ↦ x' = c`, off the `(t,x)` plane whenever `c ≠ 1`). A PROPER 2-plane rotation,
    connected to the identity, that NO `biMulLin` word realises — the literal SO(9) reach gap.

    genIsomMonoidLin_fixes_fst        — ★★ word `t`-rigidity (closure induction, `rfl` base).
    genIsomMonoidLin_fixes_snd        — ★★ word `x`-rigidity (closure induction, `rfl` base).
    xNegLin                           — the simplest `x`-mover (`x ↦ −x`).
    xNegLin_apply / _isQvIsomC        — it is a `QvC`-isometry.
    xNegLin_isEvCAdjoint_self / _comp_self — EvC-self-adjoint AND involutive ⟹ EvC-orthogonal.
    xNegLin_compact_part_eq_self      — ★ via the N104 lever, it IS its own polar compact part.
    xNegLin_not_mem_genIsomMonoidLin  — ★★ THE OBSTRUCTION: not a `biMulLin` word (refutes (R)).
    planeRotLin / _apply              — the genuine `SO(2)` ninth-direction rotation.
    planeRotLin_isQvIsomC             — ★ it is a `QvC`-isometry (`c²+s²=1`).
    planeRotLin_moves_x               — it moves `x` (`(0,1,0) ↦ x' = c`).
    planeRotLin_not_mem_genIsomMonoidLin — ★ the proper rotation is not a `biMulLin` word either.

  DERIVED from the trunk (`evCOrthogonal_compact_part_eq_self` N104; `gFormC_symm` /
  `gFormC_add_left` / `gFormC_add_right` / `gFormC_smul_left` / `gFormC_smul_right` / `gFormC_one` /
  `reQC_add` / `reQC_smul` N-LieAlgebra; the `Submonoid.closure_induction` / `LinearMap` MACHINERY
  on the DERIVED objects, STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as
  content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The honest scientific act here is to MEASURE
  what the derived generators actually generate, rather than assert the surjectivity physics
  expects. The literature posits the full `Spin(9)` (or `SO⁺(1,9)`) and reads off its generators;
  here we DERIVE the generators (two-sided Born-unit bimultiplications, the octonion-block
  rotations) and PROVE, from their definitions, exactly the subgroup they reach — and prove,
  constructively, that the ninth-direction rotation lies OUTSIDE it. The contribution: a precise,
  proved characterization of the `biMulLin` reach (`x`-rigid, the `𝕆`-block `SO(8)` sector) and a
  concrete witnessed obstruction, isolating the genuine remaining structure (the `x ↔ 𝕆`
  ninth-direction generator) as a crisp forward node — NOT a literally-false surjectivity grind.

  ── THE FORWARD REMAINDER (childed N106) ──
  The `x ↔ 𝕆` ninth-direction generator: ADJOIN `planeRotLin` (or the `x`-`v` 2-plane rotation
  family) to the generating set, extending `genIsomMonoidC2` toward the full compact `SO(9)`, then
  re-pose the converse generation against the ENLARGED alphabet (`genIsomMonoidLin` + the ninth
  generator). The operator topology over `Cut` and the full `Spin(9)→SO(9)` exhaustion remain the
  HEAVY group-manifold remainder Mathlib lacks over `Cut`. THIS node closes the word-membership
  question for the `biMulLin` alphabet — NEGATIVELY and precisely — and pins the missing generator.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  compact / orthogonal / Spin / SO(9) / SO(8) / 2-plane / ninth-direction / reflection / word /
  generation / octonion-block / half-turn / KAK / polar": what remains is pure linear algebra over
  the derived complete ordered field `Cut` — every element of the submonoid `genIsomMonoidLin ⊆
  Module.End Cut (Cut × Cut × O Cut)` fixes the first two coordinate projections; a concrete
  `Cut`-linear map preserving the quadratic form `QvC` moves the second coordinate, hence is not in
  that submonoid. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE `biMulLin`-WORD RIGIDITY — every word fixes the time and `x` coordinates. -/

/-- ★★ THE TIME-COORDINATE RIGIDITY — every `K ∈ genIsomMonoidLin` FIXES `t`: `(K p).1 = p.1` for all
    `p`. A `Submonoid.closure_induction`: each generator `biMulLin u u'` fixes the first coordinate
    DEFINITIONALLY (`(biMulLin u u' p).1 = p.1` by `rfl`), the identity fixes it, and a product
    `A∘B` fixes it by composing the two fixings. -/
theorem genIsomMonoidLin_fixes_fst {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : ∀ p : STVC, (K p).1 = p.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK => obtain ⟨u, u', _, _, rfl⟩ := hK; intro p; rfl
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show (A (B p)).1 = p.1; rw [ihA (B p), ihB p]

/-- ★★ THE `x`-COORDINATE RIGIDITY — every `K ∈ genIsomMonoidLin` FIXES `x`: `(K p).2.1 = p.2.1` for
    all `p`. The same `Submonoid.closure_induction`: each two-sided generator `biMulLin u u'` fixes
    the second coordinate DEFINITIONALLY (it acts only on the octonion block `v`), so does the
    identity, and products compose the fixings. This pins EXACTLY the reach of the `biMulLin`
    alphabet — the octonion-block `SO(8)` sector, with the `(t,x)` plane rigid. -/
theorem genIsomMonoidLin_fixes_snd {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : ∀ p : STVC, (K p).2.1 = p.2.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK => obtain ⟨u, u', _, _, rfl⟩ := hK; intro p; rfl
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show (A (B p)).2.1 = p.2.1; rw [ihA (B p), ihB p]

/-! ## The simplest `x`-mover — `x ↦ −x` — an EvC-orthogonal isometry that is NOT a word. -/

/-- THE `x`-NEGATION `(t,x,v) ↦ (t,−x,v)` as a `Cut`-linear operator. `Cut`-linear since negation on
    the `x`-slot is, and the `t`/`v` slots are the identity. -/
def xNegLin : Module.End Cut STVC where
  toFun p := (p.1, -p.2.1, p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ rfl)
    show -(p.2.1 + q.2.1) = -p.2.1 + -q.2.1
    ring
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ rfl)
    show -(c • p.2.1) = c • (-p.2.1)
    simp

theorem xNegLin_apply (p : STVC) : xNegLin p = (p.1, -p.2.1, p.2.2) := rfl

/-- `xNegLin` is a `QvC`-isometry: `t² − (−x)² − gFormC v v = t² − x² − gFormC v v` (the `x`-square
    is even). -/
theorem xNegLin_isQvIsomC : IsQvIsomC xNegLin := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, v) = QvC (t, x, v)
  unfold QvC QformC
  show t^2 - (-x)^2 - gFormC v v = t^2 - x^2 - gFormC v v
  ring

/-- `xNegLin` is EvC-SELF-ADJOINT: `EvC (xNegLin p) q = EvC p (xNegLin q)` (the `x`-slot sign flips
    symmetrically on both sides of the reference form). -/
theorem xNegLin_isEvCAdjoint_self : IsEvCAdjoint xNegLin xNegLin := by
  intro p q
  obtain ⟨t, x, v⟩ := p
  obtain ⟨t', x', v'⟩ := q
  show EvC (t, -x, v) (t', x', v') = EvC (t, x, v) (t', -x', v')
  unfold EvC
  show t*t' + (-x)*x' + gFormC v v' = t*t' + x*(-x') + gFormC v v'
  ring

/-- `xNegLin` is an INVOLUTION: `xNegLin ∘ xNegLin = id` (`x ↦ −x ↦ x`). With EvC-self-adjointness,
    this makes `xNegLin` EvC-ORTHOGONAL (`xNegLin*∘xNegLin = xNegLin∘xNegLin = id`). -/
theorem xNegLin_comp_self : xNegLin.comp xNegLin = LinearMap.id := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  show xNegLin (xNegLin (t, x, v)) = (t, x, v)
  show (t, -(-x), v) = (t, x, v)
  rw [neg_neg]

/-- ★ Via the N104 abstract lever, the EvC-orthogonal `xNegLin` IS its own polar/KAK compact part —
    a genuinely-compact element that is its own compact factor. Yet (below) it is NOT a `biMulLin`
    word: a member of `qvIsomMonoidC` that is its own compact part need not be a word. -/
theorem xNegLin_compact_part_eq_self :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      xNegLin.comp xNegLin = specOpN c uu ∧
      xNegLin.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = xNegLin :=
  evCOrthogonal_compact_part_eq_self xNegLin xNegLin
    xNegLin_isQvIsomC xNegLin_isEvCAdjoint_self xNegLin_comp_self

/-- ★★ THE OBSTRUCTION — `xNegLin ∉ genIsomMonoidLin`. `xNegLin` MOVES `x` (`(0,1,0).2.1 = 1` but
    `(xNegLin (0,1,0)).2.1 = −1`); every `biMulLin` word FIXES `x` (`genIsomMonoidLin_fixes_snd`); so
    `xNegLin` is NOT a word. Since `xNegLin` is an EvC-orthogonal `QvC`-isometry (its own compact
    part), THIS REFUTES THE LITERAL RESIDUAL (R) "every EvC-orthogonal `QvC`-isometry is a `biMulLin`
    word": the missing ninth-direction (`x ↔ 𝕆`) generator is genuine — a gap in the GENERATING SET,
    not in the proof. -/
theorem xNegLin_not_mem_genIsomMonoidLin : xNegLin ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [show (xNegLin ((0:Cut),(1:Cut),(0:O Cut))).2.1 = (-1 : Cut) from rfl] at hfix
  have hcontra : (-1 : Cut) = 1 := hfix
  have h2 : (2 : Cut) = 0 := by linarith [hcontra]
  exact two_ne_zero h2

/-! ## The genuine `SO(2)` ninth-direction rotation (det `+1`) — also not a word. -/

theorem gFormC_one_right (v : O Cut) : gFormC v (1 : O Cut) = reQC v := by
  unfold gFormC; rw [star_one, mul_one]

theorem gFormC_one_left (v : O Cut) : gFormC (1 : O Cut) v = reQC v := by
  rw [gFormC_symm]; exact gFormC_one_right v

/-- The bilinear expansion of `gFormC` along the real octonion axis `1`:
    `gFormC (v + a•1) (v + a•1) = gFormC v v + 2·(a·reQC v) + a²` (using `gFormC 1 1 = 1` and
    `gFormC v 1 = reQC v`). The completing-the-square identity behind the rotation isometry. -/
theorem gFormC_add_one_self (v : O Cut) (a : Cut) :
    gFormC (v + a • (1 : O Cut)) (v + a • (1 : O Cut))
      = gFormC v v + 2 * (a * reQC v) + a^2 := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right]
  rw [gFormC_smul_right a v (1:O Cut), gFormC_one_right v]
  rw [gFormC_smul_left a (1:O Cut) v, gFormC_one_left v]
  rw [gFormC_smul_left a (1:O Cut) (a • (1:O Cut)), gFormC_smul_right a (1:O Cut) (1:O Cut),
      gFormC_one]
  ring

/-- THE GENUINE NINTH-DIRECTION ROTATION `planeRotLin c s`: the `SO(2)` rotation of the 2-plane
    `span{x, 1}` (the `x`-axis and the real octonion axis) by the circle point `(c,s)`:
    `(t,x,v) ↦ (t, c·x − s·reQC v, v + (s·x + (c−1)·reQC v)•1)`. The new real octonion component is
    `reQC v + s·x + (c−1)·reQC v = c·reQC v + s·x` — exactly the rotated `(x, reQC v)` pair, with the
    rest of `v` (the imaginary octonion block) untouched. `Cut`-linear (additivity via `reQC_add`,
    homogeneity via `reQC_smul`). -/
def planeRotLin (c s : Cut) : Module.End Cut STVC where
  toFun p := (p.1, c * p.2.1 - s * reQC p.2.2,
              p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (p.2.1 + q.2.1) - s * reQC (p.2.2 + q.2.2)
          = (c * p.2.1 - s * reQC p.2.2) + (c * q.2.1 - s * reQC q.2.2)
      rw [reQC_add]; ring
    · show (p.2.2 + q.2.2) + (s * (p.2.1 + q.2.1) + (c - 1) * reQC (p.2.2 + q.2.2)) • (1 : O Cut)
          = (p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
            + (q.2.2 + (s * q.2.1 + (c - 1) * reQC q.2.2) • (1 : O Cut))
      rw [reQC_add]
      rw [show s * (p.2.1 + q.2.1) + (c - 1) * (reQC p.2.2 + reQC q.2.2)
            = (s * p.2.1 + (c - 1) * reQC p.2.2) + (s * q.2.1 + (c - 1) * reQC q.2.2) by ring]
      rw [add_smul]; abel
  map_smul' a p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (a • p.2.1) - s * reQC (a • p.2.2) = a • (c * p.2.1 - s * reQC p.2.2)
      rw [reQC_smul]; simp only [smul_eq_mul]; ring
    · show (a • p.2.2) + (s * (a • p.2.1) + (c - 1) * reQC (a • p.2.2)) • (1 : O Cut)
          = a • (p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut))
      rw [reQC_smul, smul_add, smul_smul]
      rw [show s * (a • p.2.1) + (c - 1) * (a * reQC p.2.2)
            = a * (s * p.2.1 + (c - 1) * reQC p.2.2) by simp only [smul_eq_mul]; ring]

theorem planeRotLin_apply (c s : Cut) (p : STVC) :
    planeRotLin c s p = (p.1, c * p.2.1 - s * reQC p.2.2,
              p.2.2 + (s * p.2.1 + (c - 1) * reQC p.2.2) • (1 : O Cut)) := rfl

/-- ★ `planeRotLin c s` is a `QvC`-isometry for `c² + s² = 1`. The negative-definite block
    `−x² − (reQC v)²` of `QvC` (the `x`-axis and the real octonion axis) is preserved by the circular
    rotation; the imaginary octonion block rides along unchanged. Pure field arithmetic over the
    derived ℝ via the completing-the-square identity `gFormC_add_one_self` and `c²+s²=1`. -/
theorem planeRotLin_isQvIsomC (c s : Cut) (h : c^2 + s^2 = 1) :
    IsQvIsomC (planeRotLin c s) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [planeRotLin_apply]
  show QvC (t, c * x - s * reQC v, v + (s * x + (c - 1) * reQC v) • (1 : O Cut))
      = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_one_self v (s * x + (c - 1) * reQC v)]
  set r := reQC v with hr
  ring_nf
  nlinarith [h, sq_nonneg (c*x - s*r)]

theorem reQC_zero : reQC (0 : O Cut) = 0 := by simp [reQC]

/-- `planeRotLin c s` MOVES `x`: applied to `(0,1,0)` (`reQC 0 = 0`) the `x`-coordinate becomes `c`.
    For any circle point with `c ≠ 1` (a non-trivial rotation) the `x`-axis is genuinely rotated off
    the `(t,x)` plane into the octonion block — the proper `SO(2)` ninth-direction rotation. -/
theorem planeRotLin_moves_x (c s : Cut) :
    (planeRotLin c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  rw [planeRotLin_apply]
  show c * 1 - s * reQC (0 : O Cut) = c
  rw [reQC_zero]; ring

/-- ★ THE OBSTRUCTION (proper rotation form) — for `c ≠ 1`, the genuine `SO(2)` ninth-direction
    rotation `planeRotLin c s` is NOT a `biMulLin` word. It moves `x` (`(0,1,0).2.1 = 1 ↦ c`) while
    every word fixes `x` (`genIsomMonoidLin_fixes_snd`). A PROPER 2-plane rotation (det `+1`,
    connected to the identity), not a reflection — the literal `SO(9)` reach gap, witnessed by an
    honest rotation. -/
theorem planeRotLin_not_mem_genIsomMonoidLin (c s : Cut) (hc : c ≠ 1) :
    planeRotLin c s ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [planeRotLin_moves_x c s] at hfix
  exact hc hfix

end

end Phys.Algebra
