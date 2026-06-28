/-
  Phys.Algebra.LorentzContinuumCliffordPinNondegenerate — N149 (the W3 decomposition keystone
  of Lemma Z): THE INDEFINITE MINKOWSKI FORM `BvC` IS NONDEGENERATE — and hence the polar form
  `polar QvCQuad` / the polar bilinear `polarBilin QvCQuad` of the Clifford quadratic form
  SEPARATE points. Over the derived ℝ `Cut`, the spacetime `STVC = Cut × Cut × O Cut`, the
  indefinite Minkowski form `BvC`, the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE W3 DECOMPOSITION of the EXACT KERNEL `MonoidHom.mker coverMapPinUnit = {1, -1}`.

  N148 banked the conditional assembly `coverMapPinUnit_exactKernel_of_contractScalar`, whose ONE
  explicit hypothesis `hZ` (Lemma Z) is the contraction-kernel=scalars fact: every `x : CliffC`
  killed by every polar-dual interior product `contractLeft (polarBilin v) x` is a scalar
  `algebraMap μ`. Via Mathlib's `changeForm_contractLeft` + `equivExterior`
  (`CliffC ≃ₗ ExteriorAlgebra Cut STVC`, char ≠ 2) Lemma Z transports to: an exterior element
  killed by a SEPARATING family of contractions has no part of grade ≥ 1, i.e. is degree-0. That
  degree argument needs an Euler/degree-operator identity Mathlib LACKS (no Clifford center, no
  graded center, no exterior interior-product degree lemma) — a multi-lemma heavy W1 BUILD whose
  coordinate brute over the 2¹⁰ exterior monomials is the W9 instrument wall. It is childed as the
  immediate next node.

  ── THE KEYSTONE THIS NODE BANKS (W3 — the immediately-bankable structural piece). ──
  The one datum that ENTIRE degree argument consumes — and the one N148 left implicit — is the
  SEPARATING property of the contraction family, i.e. the NONDEGENERACY of the polar form. N148
  measured it ABSENT (no `stvcBasis`/`orthogonal`/`Nondegenerate` banked). It DESCENDS directly
  from the trunk's own block structure and Born positivity:
        `BvC p q = p.1·q.1 − p.2.1·q.2.1 − gFormC p.2.2 q.2.2`            (over `STVC = Cut × Cut × O Cut`)
  Testing `BvC p · = 0` against the three coordinate axes `(1,0,0)`, `(0,1,0)`, `(0,0,p.2.2)`
  extracts `p.1 = 0`, `p.2.1 = 0`, and `gFormC p.2.2 p.2.2 = 0` ⟹ `p.2.2 = 0`
  (`gFormC_eq_zero_iff`, the Born positivity N56) — so `p = 0`. The indefinite Minkowski form
  separates points; via the polarization `polar QvCQuad = 2·BvC` (`QvCQuad_polar`, char-0 over the
  derived field `Cut`) so do `polar QvCQuad` and `polarBilin QvCQuad`.

  ── WHAT THIS NODE BANKS ──
    ★★ BvC_nondegenerate            — THE KEYSTONE: `(∀ q, BvC p q = 0) → p = 0`. The indefinite
                                      Minkowski form on `Cut × Cut × O Cut` separates points,
                                      derived from the Born positivity of the octonion block, NOT
                                      posited.
    QvCQuad_polar_nondegenerate     — `(∀ v, polar QvCQuad v w = 0) → w = 0`. The polar form of the
                                      Clifford quadratic form separates points (via `polar = 2·BvC`).
    ★★ polarBilin_separating        — `(∀ v, polarBilin QvCQuad v w = 0) → w = 0`. The SEPARATING
                                      property of the polar-dual family in the EXACT shape
                                      appearing in `contractLeft (polarBilin v)` — the precise
                                      hypothesis the childed degree argument discharges. The hook.
    W8 (genuinely non-vacuous teeth):
    bvNondegenerate_timelike_teeth  — the form genuinely DETECTS the timelike axis:
                                      `BvC mTimeUnit mTimeUnit = 1 ≠ 0` (banked `BvC_mTimeUnit_self`),
                                      so `mTimeUnit ≠ 0` is witnessed BY a nonzero pairing; the
                                      separation is a real constraint, not vacuous. The read-off the
                                      costume C181 negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the spacetime metric as
  nondegenerate by fiat (a fixed `diag(1,-1,…,-1)`). Here the nondegeneracy is a THEOREM DERIVED
  from the cascade's own block structure `STVC = Cut × Cut × O Cut` and the Born positivity of the
  octonion norm `gFormC` over the derived field `Cut` — the separation falls out of the trunk, it
  is not an input. No posited metric, no posited nondegeneracy, no posited basis, no Mathlib ℝ/ℂ
  as content, no bridge.

  DERIVED from the banked N49–N148 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford quadratic form `QvCQuad`.
  Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Minkowski / metric / signature / timelike
  / spacelike / nondegeneracy / separating / polar / Born / interior-product / Clifford / Lorentz
  / spacetime": what remains is pure algebra over the derived complete ordered field `Cut` — the
  bilinear form `BvC` on `Cut × Cut × O Cut` whose only point with all pairings zero is `0` (the
  octonion block form `gFormC` vanishing only at `0`), restated for `QuadraticMap.polar` and
  `QuadraticMap.polarBilin` of `QvCQuad` via `polar = 2·BvC`, and `BvC (1,0,0) (1,0,0) = 1`. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `QuadraticMap` / `polar` /
  `polarBilin` are MACHINERY on the derived form), NO posited metric/nondegeneracy/basis structure.
-/
import Phys.Algebra.LorentzContinuumCliffordPinCentralizer

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The indefinite Minkowski form separates points — the keystone. -/

/-- ★★ THE KEYSTONE — `BvC` IS NONDEGENERATE: if `BvC p q = 0` for every `q`, then `p = 0`. The
    indefinite Minkowski form on `STVC = Cut × Cut × O Cut` separates points. Testing against the
    three coordinate axes `(1,0,0)`, `(0,1,0)`, `(0,0,p.2.2)` extracts `p.1 = 0`, `p.2.1 = 0`, and
    `gFormC p.2.2 p.2.2 = 0`; the last forces `p.2.2 = 0` by the Born positivity `gFormC_eq_zero_iff`
    (N56). DERIVED from the cascade's own block structure + Born positivity over the derived field
    `Cut`, NOT a posited metric. -/
theorem BvC_nondegenerate (p : STVC) (h : ∀ q : STVC, BvC p q = 0) : p = 0 := by
  have h1 : p.1 = 0 := by
    have hq := h ((1, 0, 0) : STVC)
    rw [show BvC p ((1, 0, 0) : STVC) = p.1 from by
      show p.1 * 1 - p.2.1 * 0 - gFormC p.2.2 0 = p.1
      rw [gFormC_zero_right']; ring] at hq
    exact hq
  have h2 : p.2.1 = 0 := by
    have hq := h ((0, 1, 0) : STVC)
    rw [show BvC p ((0, 1, 0) : STVC) = - p.2.1 from by
      show p.1 * 0 - p.2.1 * 1 - gFormC p.2.2 0 = - p.2.1
      rw [gFormC_zero_right']; ring] at hq
    linarith [hq]
  have h3 : p.2.2 = 0 := by
    apply (gFormC_eq_zero_iff p.2.2).mp
    have hq := h ((0, 0, p.2.2) : STVC)
    rw [show BvC p ((0, 0, p.2.2) : STVC) = - gFormC p.2.2 p.2.2 from by
      show p.1 * 0 - p.2.1 * 0 - gFormC p.2.2 p.2.2 = - gFormC p.2.2 p.2.2
      ring] at hq
    linarith [hq]
  have hp : p = (p.1, p.2.1, p.2.2) := rfl
  rw [hp, h1, h2, h3]; rfl

/-! ## The Clifford quadratic form's polar / polarBilin separate points. -/

/-- THE POLAR FORM OF `QvCQuad` SEPARATES POINTS: if `polar QvCQuad v w = 0` for every `v`, then
    `w = 0`. Via the polarization `polar QvCQuad = 2·BvC` (`QvCQuad_polar`, char-0 over the derived
    field `Cut`), the vanishing of every polar pairing is the vanishing of every `BvC`-pairing, and
    `BvC` separates points (`BvC_nondegenerate`). -/
theorem QvCQuad_polar_nondegenerate (w : STVC)
    (h : ∀ v : STVC, QuadraticMap.polar QvCQuad v w = 0) : w = 0 := by
  apply BvC_nondegenerate w
  intro q
  have hv := h q
  rw [QvCQuad_polar] at hv
  rw [BvC_symm]
  rcases mul_eq_zero.mp hv with h' | h'
  · exact absurd h' (two_ne_zero)
  · exact h'

/-- ★★ THE HOOK — THE POLAR-DUAL FAMILY IS SEPARATING in the EXACT shape `contractLeft` consumes:
    if `polarBilin QvCQuad v w = 0` for every `v`, then `w = 0`. `polarBilin QvCQuad v w` is, by
    `polarBilin_apply_apply`, exactly `polar QvCQuad v w`, so this is `QvCQuad_polar_nondegenerate`
    restated for the bilinear map appearing in `contractLeft (polarBilin v)`. This is the precise
    nondegeneracy datum the childed degree argument (the global Lemma Z, the contraction-kernel=
    scalars fact) discharges to conclude that a contraction-killed element has no grade ≥ 1. -/
theorem polarBilin_separating (w : STVC)
    (h : ∀ v : STVC, QuadraticMap.polarBilin QvCQuad v w = 0) : w = 0 := by
  apply QvCQuad_polar_nondegenerate w
  intro v
  rw [← QuadraticMap.polarBilin_apply_apply]
  exact h v

/-! ## W8 teeth — the form genuinely detects the timelike axis (non-vacuity). -/

/-- ★ W8 NON-VACUITY — THE FORM GENUINELY DETECTS A NONZERO AXIS:
    `BvC mTimeUnit mTimeUnit = 1 ≠ 0` (banked `BvC_mTimeUnit_self`). So `mTimeUnit` is a point on
    which the separating form is NONZERO — the nondegeneracy is a real constraint, not vacuous: a
    nonzero vector is witnessed nonzero BY a nonzero self-pairing. The read-off the costume C181
    negates. -/
theorem bvNondegenerate_timelike_teeth :
    BvC (mTimeUnit : STVC) (mTimeUnit : STVC) = 1 :=
  BvC_mTimeUnit_self

end

end Phys.Algebra
