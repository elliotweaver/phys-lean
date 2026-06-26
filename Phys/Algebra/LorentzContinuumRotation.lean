/-
  Phys.Algebra.LorentzContinuumRotation — N50(a): THE CONTINUUM ROTATION generator over the
  DERIVED ℝ `Cut` — the Born-unit space rotation `v ↦ u·v` re-grounded over the terminal
  algebra `O Cut`, proved to preserve the continuum Born form `QvC`, DERIVED.
  ===========================================================================
  THE NEXT FORCED NODE after the continuum re-grounding (N49). N49 banked the continuum carrier
  `STVC = Cut × Cut × O Cut`, the continuum Born form `QvC = t² − x² − gFormC v v`, the hyperbolic
  BOOST isometry `boostC_isom` (the non-compact, time-mixing generator, by pure field arithmetic
  over `Cut`), and the continuum isometry monoid `qvIsomMonoidC ⊆ Function.End STVC`, and proved
  the continuum STRICTLY EXTENDS the rational cover (N48). This module banks `boostC_isom`'s
  SIBLING: the continuum ROTATION generator `v ↦ u·v` (the compact, space-rotating generator),
  re-grounded over `O Cut`, proved to preserve `QvC` under the Born-unit condition `gFormC u u = 1`.

  ── THE CRUX: the `Cut`-PINNED BORN COMPOSITION LAW (the W2/W1 obstacle dissolved) ──
  The abstract rotation `rot u` (N45 `LorentzIsometry.lean`) preserves the Born form by the
  composition law `gForm (u·v) (u·v) = gForm u u · gForm v v` (`gForm_comp`). But the N45 proof of
  `gForm_comp` routes through ℚ-PINNED scalar lemmas (`cd_qsmul_re`, `Dbl.smul_re`,
  `qsmul_mul_right`, and `selfMul_eq_smul` via `selfconj_eq_smul`/`trace_id`), none of which is
  available over the derived `Cut`. The W1 reframe: route the COMPOSITION LAW through the GENERIC
  Cayley–Dickson facts that hold over ANY base, never through the ℚ-pinned scalar coordinatization:
    • `gFormC z z = (CD.Nrm z).re.re` by definitional unfolding (`gFormC v w = reQC (v · star w)`,
      `reQC x = x.re.re.re`, `CD.Nrm z = (z · star z).re`).
    • `CD.Nrm_mul_of_doubled_base : Nrm (x·y) = Nrm x · Nrm y` over `O Cut = CD (H Cut) =
      CD (CD (Dbl Cut))` — the GENERIC composition law surviving at the last associative base
      (the base `H Cut = CD (Dbl Cut)` is a double of a commutative `*`-ring, hence associative);
      it holds over the derived `Cut` exactly as over ℚ.
    • `nrm_selfconj` — `CD.Nrm z` is self-conjugate (generic: `star (z·star z) = z·star z`).
    • `reH_mul_selfconj` — for self-conjugate `a, b : H Cut`, `(a·b).re.re = a.re.re · b.re.re`.
      A self-conjugate element of `H Cut = CD (Dbl Cut)` has `a.im = 0` and `a.re.im = 0` (the
      derived `Cut` is `CharZero` via 2-torsion-freeness, `cut_add_self_zero`), so the product's
      deep-real part is just the product of the deep-real parts.
  Composing these gives `gFormC_comp` over `Cut` with NO ℚ-pinning, NO analysis, NO new posit.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    cut_add_self_zero  — the derived ℝ `Cut` is 2-torsion-free (`r + r = 0 → r = 0`), via the
                         banked field structure (`2 ≠ 0`).
    nrm_selfconj       — the generic self-overlap norm `CD.Nrm z` is self-conjugate in `H Cut`.
    reH_mul_selfconj   — the deep-real part of a product of self-conjugate `H Cut` elements
                         factors: `(a·b).re.re = a.re.re · b.re.re`.
    gFormC_comp        — ★★ THE Cut-PINNED BORN COMPOSITION LAW: `gFormC (x·y) (x·y) =
                         gFormC x x · gFormC y y` over the DERIVED ℝ, through the GENERIC
                         doubled-base multiplicativity, NOT the ℚ-pinned scalar coordinatization.
    rotFunC            — the continuum rotation `(t,x,v) ↦ (t,x,u·v)`, left-multiplying the nine
                         space directions by `u`, leaving the time–space block fixed.
    rotC_isom          — ★★ THE CONTINUUM ROTATION IS A `QvC`-ISOMETRY when `gFormC u u = 1`:
                         the space block `gFormC (u·v) (u·v) = gFormC u u · gFormC v v = gFormC v v`
                         is preserved by `gFormC_comp` — the compact generator, the sibling of the
                         hyperbolic boost `boostC_isom`.
    rotC_mem           — the Born-unit rotation lies in the continuum isometry monoid `qvIsomMonoidC`.
    gFormC_one         — `gFormC 1 1 = 1`: the unit `1 : O Cut` is a concrete Born-unit.
    rotC_one_mem       — ★ NON-VACUITY: the continuum isometry monoid contains a genuine rotation
                         generator (the `u = 1` rotation, a member with a Born-unit parameter).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `H₂(𝕆)` carries an `SO(1,9)` action whose
  compact part rotates the spacelike block is standard (Sudbery, Manogue–Dray, Baez). Here the
  continuum rotation generator and its Born-form preservation DESCEND from the banked terminal-algebra
  composition law `CD.Nrm_mul_of_doubled_base` + the banked continuum carrier `O Cut` over the
  DERIVED ℝ `Cut` — NO posited Lorentz group, NO Mathlib ℝ/ℂ as content. The W1 reframe (route the
  composition law through the generic doubled-base multiplicativity, not the ℚ-pinned scalar
  coordinatization) is exactly what lets the rotation re-ground over the continuum.

  WHAT IS CHILDED (N51, the heavy Lie-theoretic core). The FULL surjectivity — that EVERY
  orientation/time-preserving continuum isometry of `QvC` is a finite product of the boost +
  rotation generators (the connected component as the generated subgroup) — is a deep Cartan /
  polar-decomposition / generation-by-one-parameter-subgroups theorem. Mathlib has no `SO⁺(1,9)`,
  no octonionic spinor cover, no Lie machinery for it; it is the genuinely heavy continuum core
  (an honest W1 dissolution ticket). This node banks the LIGHT continuum rotation generator —
  `boostC_isom`'s sibling — completing both one-parameter generator families over the derived ℝ;
  the full surjectivity is childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / spinor / rotation /
  SO⁺(1,9) / isometry / cover / surjectivity": what remains is the theorem that, over the derived
  complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, the `Cut`-linear map
  `(t,x,v) ↦ (t,x,u·v)` with `gFormC u u = 1` preserves `t² − x² − gFormC v v`, via the composition
  law `gFormC (x·y) (x·y) = gFormC x x · gFormC y y`, and such maps lie in the submonoid of
  `Function.End (Cut × Cut × O Cut)` preserving the form. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuum

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The `Cut`-pinned Born composition law (through the GENERIC doubled-base multiplicativity). -/

/-- The derived ℝ `Cut` is 2-torsion-free: `r + r = 0 → r = 0`. From the banked field structure
    (`(2 : Cut) ≠ 0`), so `Cut` is `CharZero` — the standard-physics "char 0" made a theorem of
    the derived continuum. -/
theorem cut_add_self_zero {r : Cut} (h : r + r = 0) : r = 0 := by
  have h2 : (2 : Cut) * r = 0 := by linear_combination h
  rcases mul_eq_zero.mp h2 with h0 | hr
  · exact absurd h0 two_ne_zero
  · exact hr

/-- The generic self-overlap norm `CD.Nrm z = (z · star z).re` is self-conjugate in `H Cut`:
    `star (Nrm z) = Nrm z`. Generic (`star (z · star z) = z · star z`), reflected to the base
    component through `CD.star_re`. The Born self-overlap is "real" one level up. -/
theorem nrm_selfconj (z : O Cut) : star (CD.Nrm z) = CD.Nrm z := by
  show star ((z * star z).re) = (z * star z).re
  rw [← CD.star_re]; congr 1; rw [star_mul, star_star]

/-- For self-conjugate `a, b : H Cut`, the deep-real part of the product factors:
    `(a · b).re.re = a.re.re · b.re.re`. A self-conjugate element of `H Cut = CD (Dbl Cut)` has
    `a.im = 0` (so the off-base term of the `CD` product drops) and `a.re.im = 0` (so the `Dbl`
    product's real part is the product of the real parts), both from 2-torsion-freeness of the
    derived `Cut` (`cut_add_self_zero`). -/
theorem reH_mul_selfconj (a b : H Cut) (ha : star a = a) (_hb : star b = b) :
    (a * b).re.re = a.re.re * b.re.re := by
  have haim : a.im = 0 := by
    have hh := congrArg CD.im ha
    simp only [CD.star_im] at hh
    have h2 : a.im + a.im = 0 := by linear_combination -hh
    exact Dbl.two_torsion_free (fun r hr => cut_add_self_zero hr) a.im h2
  have hareim : a.re.im = 0 := by
    have hh := congrArg CD.re ha
    rw [CD.star_re] at hh
    have h2 := congrArg Dbl.im hh
    simp only [Dbl.star_im'] at h2
    exact cut_add_self_zero (by linear_combination -h2)
  show ((a * b).re).re = _
  rw [CD.mul_re, haim]
  simp only [mul_zero, neg_zero, add_zero]
  rw [Dbl.mul_re, hareim]; ring

/-- ★★ THE `Cut`-PINNED BORN COMPOSITION LAW: `gFormC (x·y) (x·y) = gFormC x x · gFormC y y` over
    the DERIVED ℝ. Routed through the GENERIC Cayley–Dickson facts — `gFormC z z = (Nrm z).re.re`
    (definitional), the generic doubled-base multiplicativity `CD.Nrm_mul_of_doubled_base`
    (`O Cut = CD (CD (Dbl Cut))`, base associative), and the real factorization of self-conjugate
    products `reH_mul_selfconj` — NOT through the ℚ-pinned scalar coordinatization the abstract
    `gForm_comp` used. The Born = self-overlap composition law, re-grounded over the continuum. -/
theorem gFormC_comp (x y : O Cut) :
    gFormC (x * y) (x * y) = gFormC x x * gFormC y y := by
  have key : ∀ z : O Cut, gFormC z z = (CD.Nrm z).re.re := fun _ => rfl
  rw [key, key, key, CD.Nrm_mul_of_doubled_base x y]
  exact reH_mul_selfconj (CD.Nrm x) (CD.Nrm y) (nrm_selfconj x) (nrm_selfconj y)

/-! ## The continuum rotation generator. -/

/-- THE CONTINUUM ROTATION generator over the derived ℝ: `(t,x,v) ↦ (t,x,u·v)`, left-multiplying
    the nine space directions by a fixed `u`, leaving the time–space `(t,x)` block fixed. The
    compact generator — the sibling of the hyperbolic boost `boostFunC`. -/
def rotFunC (u : O Cut) : STVC → STVC := fun p => (p.1, p.2.1, u * p.2.2)

/-- ★★ THE CONTINUUM ROTATION IS A `QvC`-ISOMETRY when `u` is a Born-unit (`gFormC u u = 1`): the
    `(t,x)` block is untouched, and the space block `gFormC (u·v) (u·v) = gFormC u u · gFormC v v =
    gFormC v v` is preserved by the `Cut`-pinned Born composition law `gFormC_comp` — a
    norm-preserving rotation of the nine space directions over the continuum, with NO analysis. -/
theorem rotC_isom {u : O Cut} (hu : gFormC u u = 1) (p : STVC) :
    QvC (rotFunC u p) = QvC p := by
  obtain ⟨t, x, v⟩ := p
  show QformC _ _ _ = QformC _ _ _
  unfold QformC rotFunC
  simp only
  rw [gFormC_comp, hu, one_mul]

/-- The Born-unit continuum rotation lies in the continuum isometry monoid `qvIsomMonoidC`. -/
theorem rotC_mem {u : O Cut} (hu : gFormC u u = 1) :
    (rotFunC u : Function.End STVC) ∈ qvIsomMonoidC :=
  fun p => rotC_isom hu p

/-! ## Non-vacuity (W8) — a concrete Born-unit rotation exists. -/

/-- `gFormC 1 1 = 1`: the unit `1 : O Cut` is a concrete Born-unit (its self-overlap is `1`). -/
theorem gFormC_one : gFormC (1 : O Cut) (1 : O Cut) = 1 := by
  show reQC ((1 : O Cut) * star (1 : O Cut)) = 1
  rw [star_one, mul_one]; rfl

/-- ★ NON-VACUITY: the continuum isometry monoid contains a genuine continuum rotation generator
    (the `u = 1` rotation), so the continuum rotation construction is non-empty — the compact
    generator family is realized over the derived ℝ. -/
theorem rotC_one_mem : (rotFunC (1 : O Cut) : Function.End STVC) ∈ qvIsomMonoidC :=
  rotC_mem gFormC_one

end

end Phys.Algebra
