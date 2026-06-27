/-
  Phys.Algebra.LorentzContinuumSpin9Product — N95: A FINITE PRODUCT OF `biMulFun` GENERATORS
  realizing a 2-PLANE ROTATION IN A NEW (PURELY-IMAGINARY) PLANE — the structural exhaustion
  step toward the `Spin(9)→SO(9)` cover, over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N94 (docs/ROADMAP.md §N95 priority (i)). N94 banked the FIRST
  concrete `biMulFun` 2-plane half-turn `biMulFun u u` for a unit-imaginary `u`: an INVOLUTION
  negating the plane `span{1,u}` (which CONTAINS the real axis), fixing the anticommuting
  complement, `∈ genIsomMonoidC2`. The forced forward STRUCTURAL step (the exhaustion direction)
  is the finite PRODUCT of two such half-turns about two ANTICOMMUTING unit-imaginaries `u, w`:

      C := biMulFun w w ∘ biMulFun u u      (= `biMulFun w w * biMulFun u u` in `Function.End STVC`),

  acting on the space component by `v ↦ w·((u·(v·u))·w)`. Composing the N94 half-turn lemmas
  (NO coordinate grind, NO new algebra):
    • C(1) = 1    — FIXES the real axis. Each single half-turn NEGATES `1`; the PRODUCT of two
                    does NOT — the composite is a rotation in a plane that does NOT meet the real
                    axis, the structural novelty over the single half-turn.
    • C(u) = −u, C(w) = −w   — NEGATES the purely-imaginary plane `span{u,w}`.
    • C(z) = z    — FIXES every `z` anticommuting with BOTH `u` and `w` (the common complement).
  So `C` is a 2-plane rotation in the PURELY-IMAGINARY plane `span{u,w}` — a plane NEITHER single
  half-turn reaches (each single one negates a plane THROUGH the real axis). And `C ∈
  genIsomMonoidC2` (a product of two members, `Submonoid.mul_mem`). This is the generic-2-plane
  reachability step: imaginary-plane rotations are reached as finite products of the banked
  two-sided generators — the structural exhaustion direction toward the full non-associative
  `SO(9)`.

  ── THE CONCRETE WITNESS (W8 teeth) ──
  Over the derived ℝ `Cut`, take `u = e₂` and `w = ιe₂ := iota(e₂ : H Cut)`, the cascade's terminal
  imaginary generator and the imaginary unit it embeds. Both are unit-imaginaries (`e₂·e₂ = −1`,
  `ιe₂·ιe₂ = −1`, `e₂·(e₂·v) = −v`, `ιe₂·(ιe₂·v) = −v`, `gFormC = 1`) and they ANTICOMMUTE
  (`e₂·ιe₂ = −(ιe₂·e₂)`, the banked N94 `ext` fact). The concrete product `C = biMulFun ιe₂ ιe₂ ∘
  biMulFun e₂ e₂` FIXES the real axis (`C(0,0,1) = (0,0,1)`) — the W8 teeth: a single half-turn
  sends `(0,0,1) ↦ (0,0,−1)`, so the product genuinely fixing the real axis is the distinguishing
  fact that the composite is a NEW 2-plane rotation, not a single half-turn.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N94 + N55 + N5b):
    biMulFun_imag_negates_neg_one  — the half-turn sends `(0,0,−1) ↦ (0,0,1)` (un-negate the unit).
    biMulComp_fixes_one            — ★ the PRODUCT FIXES the real axis `(0,0,1)` (the structural
                                     novelty: not a single half-turn).
    biMulComp_negates_u / _w       — the product NEGATES `u` and `w` (the imaginary plane).
    biMulComp_fixes_common         — the product FIXES the common anticommuting complement.
    biMulComp_mem_gen2             — ★ the PRODUCT lies in `genIsomMonoidC2` (a product of two
                                     members of the generated submonoid).
    biMulComp_apply                — the `Function.End` product applies as the nested composition.
    je2_*                          — the concrete second unit `ιe₂` is a unit-imaginary over `Cut`.
    biMulComp_e2_je2_fixes_one     — ★ W8 NON-VACUITY/teeth: the CONCRETE product `biMulFun ιe₂ ιe₂
                                     ∘ biMulFun e₂ e₂` FIXES the real axis `(0,0,1)`.
    biMulComp_e2_je2_negates_e2    — the concrete product negates `e₂`.
    biMulComp_e2_je2_mem_gen2      — the concrete product lies in `genIsomMonoidC2`.

  ── THE W1 HEAVY REMAINDER (childed N96, an honest dissolution ticket, NOT closed here) ──
  CONNECTEDNESS of the isometry group over `Cut`, the one-parameter spectral-power path realising
  the positive part's connectedness to the identity, the GLOBAL reverse KAK surjectivity
  `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`, and the full `Spin(9)→SO(9)`
  exhaustion — the genuine group-manifold topology Mathlib lacks over `Cut`. Childed onto the chain.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplication composes to
  generic rotations, and that `Spin(9)` two-sidedly covers `SO(9)`, is standard (Sudbery,
  Manogue–Dray, Baez). Here the composite's fixed real axis, the negated imaginary plane, the
  fixed common complement, and the `genIsomMonoidC2` membership DESCEND from the banked N94 half-turn
  lemmas (themselves forward from the octonion alternative laws `mul_flex`/`mul_mul_right`, the
  cascade STOP) over the DERIVED ℝ `Cut` and the terminal algebra `O Cut` — NOT a posited
  Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  plane / SO(9) / Spin / SO⁺(1,9) / isometry / generator / Moufang / bimultiplication / product /
  exhaustion / imaginary-plane / real-axis / cover": what remains is the theorem that over the
  derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for `u, w` with
  `u·u = w·w = −1`, `u·(u·v) = −v`, `w·(w·v) = −v`, `u·w = −(w·u)`, the map `(t,x,v) ↦
  (t,x, w·((u·(v·u))·w))` sends `1 ↦ 1`, `u ↦ −u`, `w ↦ −w`, fixes every `z` with `u·z = −(z·u)`
  and `w·z = −(z·w)`, and lies in the generated submonoid `genIsomMonoidC2 ⊆ Function.End
  (Cut × Cut × O Cut)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The finite product of two half-turns: a 2-plane rotation in the imaginary plane. -/

/-- The half-turn `biMulFun w w` sends `(0,0,−1) ↦ (0,0,1)` for a unit-imaginary `w` (`w·w = −1`):
    `w·((−1)·w) = w·(−w) = −(w·w) = −(−1) = 1`. The "un-negation" the second half-turn performs on
    the real axis after the first half-turn negated it. -/
theorem biMulFun_imag_negates_neg_one (w : O Cut) (hsqw : w * w = -1) :
    biMulFun w w ((0 : Cut), (0 : Cut), -(1 : O Cut)) = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  rw [neg_one_mul, mul_neg w w, hsqw, neg_neg]

/-- ★ THE PRODUCT FIXES THE REAL AXIS: `(biMulFun w w ∘ biMulFun u u)(0,0,1) = (0,0,1)`. The first
    half-turn negates `1` (`biMulFun_imag_negates_one`), the second un-negates it
    (`biMulFun_imag_negates_neg_one`). The structural NOVELTY over a single half-turn (which sends
    `(0,0,1) ↦ (0,0,−1)`): the composite is a rotation in a plane that does NOT meet the real axis. -/
theorem biMulComp_fixes_one (u w : O Cut) (hsqu : u * u = -1) (hsqw : w * w = -1) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  rw [biMulFun_imag_negates_one u hsqu, biMulFun_imag_negates_neg_one w hsqw]

/-- The product NEGATES `u`: the first half-turn negates `u` (`biMulFun_imag_negates_self`), the
    second FIXES `−u` (which anticommutes with `w`, since `u` does). Net: `(0,0,u) ↦ (0,0,−u)`. -/
theorem biMulComp_negates_u (u w : O Cut) (hsqu : u * u = -1)
    (hLw : ∀ z : O Cut, w * (w * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), u)) = ((0 : Cut), (0 : Cut), -u) := by
  rw [biMulFun_imag_negates_self u hsqu]
  have hacw : w * (-u) = -((-u) * w) := by
    rw [mul_neg w u, neg_mul u w]
    rw [show w * u = -(u * w) by rw [hac, neg_neg]]
  exact biMulFun_imag_fixes_anticomm w (-u) hLw hacw

/-- The product NEGATES `w`: the first half-turn FIXES `w` (anticommuting with `u`), the second
    negates `w`. Net: `(0,0,w) ↦ (0,0,−w)`. Together with `biMulComp_negates_u`: the product negates
    the purely-imaginary plane `span{u,w}`. -/
theorem biMulComp_negates_w (u w : O Cut) (hsqw : w * w = -1)
    (hLu : ∀ z : O Cut, u * (u * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), w)) = ((0 : Cut), (0 : Cut), -w) := by
  rw [biMulFun_imag_fixes_anticomm u w hLu hac, biMulFun_imag_negates_self w hsqw]

/-- The product FIXES the common anticommuting complement: every `z` anticommuting with BOTH `u`
    and `w` is fixed by both half-turns, hence by the composite. -/
theorem biMulComp_fixes_common (u w z : O Cut)
    (hLu : ∀ y : O Cut, u * (u * y) = -y) (hLw : ∀ y : O Cut, w * (w * y) = -y)
    (hacu : u * z = -(z * u)) (hacw : w * z = -(z * w)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), z)) = ((0 : Cut), (0 : Cut), z) := by
  rw [biMulFun_imag_fixes_anticomm u z hLu hacu, biMulFun_imag_fixes_anticomm w z hLw hacw]

/-! ## The product as a member of the extended generated isometry submonoid. -/

/-- ★ THE PRODUCT LIES IN `genIsomMonoidC2`: the composite of two Born-unit half-turns is a product
    of two members of the generated submonoid (`Submonoid.mul_mem`). Realized as the subtype product
    so the `Function.End` monoid multiplication is the one used (not the pointwise `Pi` one). -/
theorem biMulComp_mem_gen2 (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    (((⟨biMulFun w w, biMulFun_imag_mem_gen2 w hw⟩ : genIsomMonoidC2)
        * ⟨biMulFun u u, biMulFun_imag_mem_gen2 u hu⟩ : genIsomMonoidC2) : Function.End STVC)
      ∈ genIsomMonoidC2 :=
  Subtype.property _

/-- The `Function.End` product applies as the nested composition `biMulFun w w (biMulFun u u p)`. -/
theorem biMulComp_apply (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (p : STVC) :
    (((⟨biMulFun w w, biMulFun_imag_mem_gen2 w hw⟩ : genIsomMonoidC2)
        * ⟨biMulFun u u, biMulFun_imag_mem_gen2 u hu⟩ : genIsomMonoidC2) : Function.End STVC) p
      = biMulFun w w (biMulFun u u p) := rfl

/-! ## The concrete second unit `ιe₂ := iota(e₂ : H Cut)` is a unit-imaginary over `Cut`. -/

/-- `ιe₂ := iota(e₂ : H Cut)` over `Cut` — the imaginary unit `e₂` of `H Cut` embedded into the
    terminal `O Cut` as a purely-imaginary octonion. -/
abbrev je2 : O Cut := (CD.iota (CD.e2 : H Cut) : O Cut)

/-- `ιe₂` is imaginary in `O Cut`: `star ιe₂ = −ιe₂`. -/
theorem je2_imag : star (je2 : O Cut) = -(je2 : O Cut) := by ext <;> simp [CD.e2, CD.iota]

/-- The unit-imaginary square for `ιe₂`: `ιe₂·(ιe₂·v) = −v` for all `v` (from the banked
    left-alternative operator-square `L_sq_imag` with `Nrm ιe₂ = 1`, `ι 1 = 1`). -/
theorem je2_alt (v : O Cut) : (je2 : O Cut) * ((je2 : O Cut) * v) = -v := by
  have h := L_sq_imag (je2 : O Cut) je2_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (je2 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (je2 : O Cut) = (1 : H Cut) by rw [CD.Nrm_def]; ext <;> simp [CD.e2, CD.iota]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

/-- `ιe₂·ιe₂ = −1` (from `je2_alt` at `v = 1`). -/
theorem je2_sq : (je2 : O Cut) * (je2 : O Cut) = -1 := by
  have h := je2_alt (1 : O Cut); rwa [mul_one] at h

/-- The Born self-overlap of `ιe₂` is `1`: `gFormC ιe₂ ιe₂ = 1`. -/
theorem je2_gFormC_self : gFormC (je2 : O Cut) (je2 : O Cut) = 1 := by
  show reQC ((je2 : O Cut) * star (je2 : O Cut)) = 1
  rw [je2_imag]
  simp only [reQC]
  simp [CD.e2, CD.iota, CD.mul_re, CD.neg_re]

/-! ## The CONCRETE product `biMulFun ιe₂ ιe₂ ∘ biMulFun e₂ e₂` and its W8 teeth. -/

/-- `e₂` and `ιe₂` ANTICOMMUTE in `O Cut`: `e₂·ιe₂ = −(ιe₂·e₂)` (a single octonion `ext`). -/
theorem e2_je2_anticomm :
    (CD.e2 : O Cut) * (je2 : O Cut) = -((je2 : O Cut) * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota]

/-- ★ W8 NON-VACUITY / TEETH: the CONCRETE product `biMulFun ιe₂ ιe₂ ∘ biMulFun e₂ e₂` FIXES the
    real axis `(0,0,1) ↦ (0,0,1)` over the derived ℝ `Cut`. A SINGLE half-turn sends `(0,0,1) ↦
    (0,0,−1)`; the product of two distinct anticommuting half-turns fixes the real axis — the
    distinguishing fact that the composite is a NEW 2-plane rotation (in the purely-imaginary plane
    `span{e₂, ιe₂}`), not a single half-turn. -/
theorem biMulComp_e2_je2_fixes_one :
    biMulFun (je2 : O Cut) (je2 : O Cut)
        (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) :=
  biMulComp_fixes_one (CD.e2 : O Cut) (je2 : O Cut) biMulFun_e2_sq je2_sq

/-- The concrete product NEGATES `e₂`: `(0,0,e₂) ↦ (0,0,−e₂)`. -/
theorem biMulComp_e2_je2_negates_e2 :
    biMulFun (je2 : O Cut) (je2 : O Cut)
        (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0 : Cut), (0 : Cut), (CD.e2 : O Cut)))
      = ((0 : Cut), (0 : Cut), -(CD.e2 : O Cut)) :=
  biMulComp_negates_u (CD.e2 : O Cut) (je2 : O Cut) biMulFun_e2_sq je2_alt e2_je2_anticomm

/-- The concrete product `biMulFun ιe₂ ιe₂ ∘ biMulFun e₂ e₂` lies in the extended generated isometry
    submonoid `genIsomMonoidC2`. -/
theorem biMulComp_e2_je2_mem_gen2 :
    (((⟨biMulFun (je2 : O Cut) (je2 : O Cut),
          biMulFun_imag_mem_gen2 (je2 : O Cut) je2_gFormC_self⟩ : genIsomMonoidC2)
        * ⟨biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut),
          biMulFun_imag_mem_gen2 (CD.e2 : O Cut) e2_gFormC_self⟩ : genIsomMonoidC2)
        : Function.End STVC)
      ∈ genIsomMonoidC2 :=
  Subtype.property _

end

end Phys.Algebra
