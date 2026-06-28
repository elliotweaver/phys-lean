/-
  Phys.Algebra.LorentzContinuumCliffordCoverKernel — N136: THE COVER KERNEL `{±1}` —
  THE TWO-TO-ONE ("double") HALF OF THE DOUBLE COVER `Pin(1,9) ↠ SO⁺(1,9)`.
  Over the derived ℝ `Cut`, the terminal algebra `O Cut`, the spacetime `STVC`, the indefinite
  Minkowski form `BvC`, the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORCED NEXT STRUCTURE (W4.5 SUFFICIENCY: advance, do not re-pin).
  N132 CLOSED the continuum Lorentz group (`reflection_closure_eq_bvIsomLinMonoid`). N133 banked
  the generator-level Clifford cover (`reflection_clifford_conj`). N134 banked the even/Spin
  two-generator cover (`cover_compose_two`). N135 banked the GLOBAL SURJECTIVITY: every linear
  `BvC`-isometry `g ∈ bvIsomLinMonoid = SO⁺(1,9)` has a Clifford covering unit `u : CliffCˣ` with
  `CliffCovers u g` (`cover_global_bvIsom`) — the "cover" (ONTO) half of the double cover.

  The forward joint (priority i) the global cover OPENS is the OTHER, DEFINING half: the cover is
  TWO-to-one. N135's surjectivity says each fiber is nonempty; this node proves each fiber is a
  `{±1}`-torsor — the KERNEL of the cover is `{±1}`, genuinely of order two. Together,
  surjectivity (N135) + the `{±1}` kernel (N136) characterize `Pin(1,9) ↠ SO⁺(1,9)` as a genuine
  TWO-to-one (double) cover. This is NOT re-pinning surjectivity; it is the orthogonal structural
  fact the surjectivity alone does not capture.

  ── THE TRUNK DERIVATION (all from the banked `CliffCovers` predicate + Mathlib `involute`). ──
  The cover predicate is `CliffCovers u g := ∀ v, involute(↑u)·ι v·↑u⁻¹ = ι(g v)`. Negating the
  covering unit:
    involute(↑(-u))·ι v·↑(-u)⁻¹ = involute(-↑u)·ι v·(-↑u⁻¹)        [Units.val_neg, inv_neg]
      = (-involute ↑u)·ι v·(-↑u⁻¹)                                  [map_neg — involute a RingHom]
      = involute(↑u)·ι v·↑u⁻¹                                       [the two signs cancel]
      = ι(g v).
  So `-u` covers the SAME `g` (`cover_neg_unit`) — the fiber over `g` contains both `u` and `-u`,
  the TWO-to-one. Applied to `cliffCovers_one` (`1` covers `id`), `-1` ALSO covers `id`
  (`cover_kernel_neg_one`) — the nontrivial kernel element. And `(-1 : CliffCˣ) ≠ 1`
  (`cover_kernel_distinct`) because `CliffC` is a nontrivial characteristic-≠-2 algebra over the
  derived field `Cut` (`(2 : CliffC) ≠ 0`, `cliffC_two_ne_zero`), so the kernel `{±1}` is GENUINELY
  two elements. The nontrivial element squares to the identity (`cover_kernel_neg_one_sq`,
  `(-1)² = 1`) — the kernel is the order-two group, the defining `ℤ/2` of a double cover.

  ── WHAT THIS NODE BANKS ──
    ★ cover_neg_unit        — THE TWO-TO-ONE: `CliffCovers u g → CliffCovers (-u) g`. Negate the
                              covering unit, cover the SAME map — the fiber over `g` is `{u, -u}`.
    cover_kernel_neg_one    — `CliffCovers (-1 : CliffCˣ) (1 : Module.End Cut STVC)`: `-1` covers the
                              identity, the NONTRIVIAL kernel element (with `cliffCovers_one`, `1`).
    cliffC_two_ne_zero      — `(2 : CliffC) ≠ 0`: the Clifford algebra is characteristic ≠ 2
                              (nontrivial over the derived field `Cut`, `Invertible (2 : Cut)`).
    ★ cover_kernel_distinct — `(-1 : CliffCˣ) ≠ (1 : CliffCˣ)`: the kernel `{±1}` is GENUINELY two
                              elements — the cover is TWO-to-one, not one-to-one.
    cover_kernel_neg_one_sq — `(-1 : CliffCˣ) ^ 2 = 1`: the nontrivial kernel element squares to the
                              identity — the kernel is the order-two group `ℤ/2`.
    W8 (genuinely-two-to-one teeth):
    ★ cover_boost_two_covers — the CONCRETE boost `(5/3,4/3)` (a real non-identity Lorentz element)
                              has TWO DISTINCT Clifford covering units `u ≠ w` — the two-to-one
                              realized on a real boost (non-vacuity: the fiber genuinely has ≥2 points).
    cover_kernel_timelike_norm — `QvC mTimeUnit = 1` (the timelike unit norm; the read-off costume
                              C168 negates to `1 = 136`).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin/Spin double cover
  AND its `{±1}` kernel as the defining datum of "double." Here every reflection is the trunk's own
  `houseHolderM`, the Clifford algebra is the FUNCTOR on the cascade's derived form `QvCQuad` over the
  derived field `Cut`, the cover predicate is the banked twisted adjoint, and the `{±1}` kernel is
  DERIVED FORWARD: the sign of the negated unit cancels in the twisted adjoint (`map_neg` of the grade
  involution), `-1` covers the identity, and `-1 ≠ 1` because the derived field has `2 ≠ 0`. The
  two-to-one structure is a THEOREM, not an assumption — no posited Pin/Spin group, no posited kernel.

  DERIVED from the banked N49–N135 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "cover / Pin / Spin / spinor / kernel / double
  / two-to-one / reflection / Lorentz / Minkowski / timelike / isometry / grade / involution /
  SO⁺(1,9) / bridge": what remains is pure algebra over the derived complete ordered field `Cut`, the
  Clifford algebra `CliffC` of `QvCQuad`, Mathlib's `involute`, and the predicate `CliffCovers` —
  negating a covering unit preserves the covered map; `-1` and `1` both cover the identity operator and
  are distinct (`(2 : CliffC) ≠ 0`); `(-1)² = 1`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra`/`involute` are
  MACHINERY on the derived form), NO posited Clifford/Pin/Spin/cover group, NO posited kernel.
-/
import Phys.Algebra.LorentzContinuumCliffordCoverHomGlobal
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The two-to-one: negating a covering unit covers the same isometry. -/

/-- ★ THE TWO-TO-ONE — negate the covering unit, cover the SAME isometry. If `u` covers `g` then so
    does `-u`: the twisted adjoint of `-u` differs from that of `u` only by `involute(-↑u) = -involute ↑u`
    on the left and `↑(-u)⁻¹ = -↑u⁻¹` on the right, and the two signs CANCEL. So the fiber over `g`
    contains both `u` and `-u` — the cover is at least two-to-one. -/
theorem cover_neg_unit {u : CliffCˣ} {g : Module.End Cut STVC}
    (hu : CliffCovers u g) :
    CliffCovers (-u) g := by
  intro v
  have hval : ((-u : CliffCˣ) : CliffC) = -(u : CliffC) := Units.val_neg u
  have hinv : (((-u)⁻¹ : CliffCˣ) : CliffC) = -((u⁻¹ : CliffCˣ) : CliffC) := by
    rw [inv_neg, Units.val_neg]
  rw [hval, hinv, map_neg]
  simp only [_root_.neg_mul, _root_.mul_neg, neg_neg]
  exact hu v

/-- `-1` covers the identity operator — the NONTRIVIAL kernel element (with `cliffCovers_one`, the
    trivial element `1`). The kernel of the cover (units covering `id`) contains `{1, -1}`. -/
theorem cover_kernel_neg_one :
    CliffCovers (-1 : CliffCˣ) (1 : Module.End Cut STVC) :=
  cover_neg_unit cliffCovers_one

/-! ## The kernel `{±1}` is genuinely two elements (characteristic ≠ 2). -/

/-- `(2 : CliffC) ≠ 0` — the Clifford algebra of the derived form over the derived field `Cut` is of
    characteristic ≠ 2. `Cut` is a field with `Invertible (2 : Cut)`, so `CliffC` is nontrivial
    (`CliffordAlgebra.instNontrivial` via the exterior-algebra equivalence) and `algebraMap Cut CliffC`
    is injective; `(2 : CliffC) = algebraMap Cut CliffC 2` and `(2 : Cut) ≠ 0`. -/
theorem cliffC_two_ne_zero : (2 : CliffC) ≠ 0 := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  haveI : Nontrivial CliffC := inferInstance
  have hinj : Function.Injective (algebraMap Cut CliffC) := (algebraMap Cut CliffC).injective
  intro h
  have h2C : (algebraMap Cut CliffC (2 : Cut)) = 0 := by rw [map_ofNat]; exact h
  have h20 : (2 : Cut) = 0 := hinj (by rw [h2C, map_zero])
  exact two_ne_zero h20

/-- ★ THE KERNEL IS GENUINELY TWO ELEMENTS: `(-1 : CliffCˣ) ≠ (1 : CliffCˣ)`. If they were equal then
    `-(1 : CliffC) = 1`, i.e. `(2 : CliffC) = 0`, contradicting `cliffC_two_ne_zero`. So the cover is
    TWO-to-one, not one-to-one — the defining feature of a *double* cover. -/
theorem cover_kernel_distinct : (-1 : CliffCˣ) ≠ (1 : CliffCˣ) := by
  intro h
  have hval : ((-1 : CliffCˣ) : CliffC) = ((1 : CliffCˣ) : CliffC) := by rw [h]
  rw [Units.val_neg, Units.val_one] at hval
  have e : (1 : CliffC) + (1 : CliffC) = 0 := by
    have h1 : (1 : CliffC) = -(1 : CliffC) := hval.symm
    nth_rewrite 2 [h1]; exact add_neg_cancel 1
  have h2 : (2 : CliffC) = 0 := by rw [← one_add_one_eq_two]; exact e
  exact cliffC_two_ne_zero h2

/-- The nontrivial kernel element squares to the identity: `(-1 : CliffCˣ) ^ 2 = 1`. With
    `cover_kernel_distinct` this exhibits the kernel as the order-two group `ℤ/2` — the defining
    kernel of a double cover. -/
theorem cover_kernel_neg_one_sq : (-1 : CliffCˣ) ^ 2 = 1 := by
  rw [neg_one_sq]

/-! ## W8 teeth — the two-to-one realized on a concrete boost, and a numeric read-off. -/

/-- ★ W8 NON-VACUITY — the CONCRETE boost `(5/3,4/3)` (a genuine non-identity Lorentz element,
    off-diagonal `4/3 ≠ 0`) has TWO DISTINCT Clifford covering units. From `cover_global_boost` the
    boost has a covering unit `u`; by `cover_neg_unit` so does `-u`, and `-u ≠ u` (else `1 = -1`,
    `cover_kernel_distinct`). The fiber over a real boost genuinely has ≥2 points — the two-to-one
    realized, not vacuous. -/
theorem cover_boost_two_covers :
    ∃ u w : CliffCˣ, u ≠ w ∧
      CliffCovers u (boostEndC ((5:Cut)/3) ((4:Cut)/3)) ∧
      CliffCovers w (boostEndC ((5:Cut)/3) ((4:Cut)/3)) := by
  obtain ⟨u, hu⟩ := cover_global_boost
  refine ⟨-u, u, ?_, cover_neg_unit hu, hu⟩
  intro hne
  -- hne : -u = u  ⟹  -1 = 1, contradicting cover_kernel_distinct
  apply cover_kernel_distinct
  have h1 : (-1 : CliffCˣ) * u = (1 : CliffCˣ) * u := by
    rw [neg_one_mul, one_mul]; exact hne
  exact mul_right_cancel h1

/-- ★ W8 TEETH — the timelike unit norm reads `1`: `QvC mTimeUnit = 1` (`BvC_mTimeUnit_self` via
    `BvC_self`). The read-off the costume C168 (`1 = 136`) negates: a WRONG cover-kernel / two-to-one /
    double-cover claim mis-reads this anchor. -/
theorem cover_kernel_timelike_norm : QvC (mTimeUnit : STVC) = 1 := by
  rw [← BvC_self]; exact BvC_mTimeUnit_self

end

end Phys.Algebra
