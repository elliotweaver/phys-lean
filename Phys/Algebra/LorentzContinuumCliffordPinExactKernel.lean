/-
  Phys.Algebra.LorentzContinuumCliffordPinExactKernel — N147: THE SPINOR NORM ±1 + THE
  SCALAR-ELEMENT HALF OF INJECTIVITY-MOD-CENTER of the unit-normalized Pin double cover.
  Over the derived ℝ `Cut`, the terminal algebra `O Cut`, the spacetime `STVC`, the indefinite
  Minkowski form `BvC`, the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORWARD JOINT (W4.5 SUFFICIENCY: advance, do not re-pin) + the W3 DECOMPOSITION
  of the EXACT KERNEL `MonoidHom.mker coverMapPinUnit = {1, -1}`.

  N146 banked the `⊇` direction (the scalar bloat collapses on the unit-normalized domain
  `PinUnitSub`; `-1` and `1` lie in `MonoidHom.mker coverMapPinUnit`). The OPEN `⊆` direction is
  the INJECTIVITY-MOD-CENTER: every UNIT-Pin element `u` covering the identity is `±1`. This is
  the FIRST front in the gauge arc that may genuinely resist (every prior node N133–N146 was
  LIGHT), and the MEASURE-FIRST analysis (workbench/N147-.../PREREG.md) factors it cleanly:

  ── MEASURE-FIRST (W1/W9). ──
  The `⊆` direction `coverMapPinUnit u = 1 → u = ±1` splits into two independent pieces:
    (A) covers-id ⟹ `(↑u : CliffC)` is a SCALAR `algebraMap λ`. The covering relation
        `involute(↑u)·ι v·↑u⁻¹ = ι v` (`∀ v`) rearranges to `involute(↑u)·ι v = ι v·↑u`. Each
        `PinUnitSub` element is a product of the odd generators `ι a`, hence ℤ/2-homogeneous; an
        even such `u` then COMMUTES with the whole `ι`-image (`involute` fixes it), an odd one
        ANTI-commutes — i.e. `u` lies in the SUPERCENTER of `CliffC`. For a nondegenerate form
        the supercenter is the scalars. ★ MEASURED: **Mathlib has NO `center` / `centralizer` /
        `IsCentral` for `CliffordAlgebra`** (grep of `Mathlib/LinearAlgebra/CliffordAlgebra/*`:
        zero hits). The supercenter=scalars theorem is a genuine BUILD — the honest W1
        DISSOLUTION ticket this arc has been heading toward. → CHILD (N148).
    (B) a SCALAR element of `PinUnitSub` is `±1`. This DISSOLVES through the trunk via the
        spinor norm `N(u) = reverse(↑u)·↑u`: on the unit generators `reverse(ι a)·ι a = (ι a)² =
        algebraMap (QvC a) = algebraMap (±1)`, and `N` is multiplicative on `PinUnitSub` because
        each `N(x)` is a CENTRAL scalar (`reverse.map_mul` + `Algebra.commutes`). So `N(u) =
        algebraMap (±1)` for EVERY `u ∈ PinUnitSub` (genuinely NEW — N146 only had generator
        squares). For a scalar `↑u = algebraMap μ`, `N(u) = algebraMap (μ²)`, so `μ² = ±1`; over
        the derived ORDERED field `Cut`, `μ² ≥ 0` forces `μ² = 1`, whence `μ = ±1`. → BANK HERE.

  This node BANKS (B) — the structural half — and the REDUCTION lemma making explicit that the
  ONLY missing link to the full exact kernel is the centralizer fact (A). The exact kernel
  `mker coverMapPinUnit = {1,-1}` then assembles from (A) [N148] + (B) [here] forwardly.

  ── WHAT THIS NODE BANKS ──
    pinUnitNorm               — THE SPINOR NORM `N(u) = reverse(↑u)·↑u`.
    ★★ pinUnitNorm_eq_pm      — THE SPINOR NORM IS ±1 on `PinUnitSub`: for every unit-Pin element,
                                `N(u) = algebraMap λ` with `λ = 1 ∨ λ = -1` (closure induction;
                                generators by `reverse_ι` + `cliffSq` + unit norm; multiplicativity
                                because `N(x)` is a central scalar). The genuinely-new datum beyond
                                N146's generator squares — the norm of the WHOLE word collapses.
    pinUnitNorm_timelike      — W8 read-off: `N(cliffUnitOf mTimeUnit) = 1` (`QvC mTimeUnit = 1`).
    ★ scalar_pinUnit_eq_pm    — THE SCALAR-ELEMENT HALF (coefficient form): `u ∈ PinUnitSub` and
                                `↑u = algebraMap μ` ⟹ `μ = 1 ∨ μ = -1` (μ² = ±1, and μ² ≥ 0 over
                                the ordered field `Cut` forces μ² = 1).
    ★ scalar_pinUnit_unit_eq_pm — THE SCALAR-ELEMENT HALF (unit form): `u ∈ PinUnitSub` and
                                `↑u = algebraMap μ` ⟹ `u = 1 ∨ u = -1` as `CliffCˣ`.
    ★★ coverMapPinUnit_injmodcenter_of_scalar — THE REDUCTION: IF every kernel element of
                                `coverMapPinUnit` is a scalar (the centralizer fact, child N148),
                                THEN every kernel element is `±1` — the exact kernel `⊆` direction
                                CONDITIONAL on the one missing link, with the bankable half discharged.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin double cover's
  `{±1}` kernel as the DEFINING datum. Here the `⊆` injectivity-mod-center is DERIVED: the spinor
  norm is the cascade's own `reverse` of the cascade's own reflection units, its ±1-valuedness is
  forced by the unit normalization (the answer N146's obstruction gave), and the scalar half
  closes because `Cut` is the DERIVED ORDERED field (`μ² ≥ 0`). The only un-banked link — the
  centralizer fact — is scoped to a dedicated W1 dissolution node, not asserted. No posited
  Pin/Spin group, no posited cover, no posited kernel, no posited centralizer, no Mathlib ℝ/ℂ as
  content, no bridge.

  DERIVED from the banked N49–N146 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`.
  Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Pin / Spin / cover / spinor / norm /
  Lorentz / Minkowski / reflection / kernel / centralizer / injectivity / SO⁺(1,9) / bridge":
  what remains is pure algebra over the derived complete ordered field `Cut`, `STVC = Cut × Cut ×
  O Cut`, the Clifford algebra `CliffC` of `QvCQuad`, its `ι`, `reverse`, and the submonoid
  `PinUnitSub` — the element `reverse(↑u)·↑u` equals `algebraMap λ` with `λ = ±1` for every `u` in
  the submonoid generated by the units `cliffUnitOf a` of `QvC a = ±1` vectors; if `↑u =
  algebraMap μ` then `μ = ±1` (over the ordered field); and conditional on every `mker` element of
  the restricted `MonoidHom` being a scalar, every such element is `±1`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` / `ι` /
  `reverse` / `algebraMap` / `MonoidHom` / `Submonoid` are MACHINERY on the derived form), NO
  posited Clifford/Pin/Spin/cover/kernel/centralizer structure.
-/
import Phys.Algebra.LorentzContinuumCliffordPinKernel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The spinor norm on the unit-normalized Pin group. -/

/-- THE SPINOR NORM `N(u) = reverse(↑u)·↑u`. The reverse anti-automorphism (`CliffordAlgebra.reverse`)
    of the unit times itself — the multiplicative invariant whose ±1-valuedness on the unit-normalized
    Pin domain is the new content of this node. -/
def pinUnitNorm (u : CliffCˣ) : CliffC :=
  CliffordAlgebra.reverse (u : CliffC) * (u : CliffC)

/-- ★★ THE SPINOR NORM IS ±1 ON THE UNIT-NORMALIZED PIN GROUP: for every `u ∈ PinUnitSub`,
    `pinUnitNorm u = algebraMap Cut CliffC λ` with `λ = 1 ∨ λ = -1`. Closure induction over the
    unit reflection-unit generating set `pinUnitGenSet`:
    • generators: `reverse(ι a)·ι a = (ι a)² = algebraMap (QvC a)` (`reverse_ι`, `cliffSq`), and
      `QvC a = ±1` by the unit-normalization;
    • identity: `reverse(1)·1 = 1 = algebraMap 1`;
    • products: `N(x·y) = reverse(↑y)·N(x)·↑y = algebraMap λ_x · N(y) = algebraMap (λ_x·λ_y)`
      because `N(x) = algebraMap λ_x` is a CENTRAL scalar (`reverse.map_mul` + `Algebra.commutes`),
      and `(±1)·(±1) = ±1`.
    Generalizes N146's `cliffUnitOf_unit_sq` (the generator squares) to the WHOLE word — the genuine
    new datum that makes the scalar-element half of injectivity-mod-center close. -/
theorem pinUnitNorm_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) :
    ∃ lam : Cut, pinUnitNorm u = algebraMap Cut CliffC lam ∧ (lam = 1 ∨ lam = -1) := by
  induction hu using Submonoid.closure_induction with
  | mem x hx =>
      obtain ⟨a, ha, hpm, rfl⟩ := hx
      refine ⟨QvC a, ?_, hpm⟩
      unfold pinUnitNorm
      rw [cliffUnitOf_val, CliffordAlgebra.reverse_ι, cliffSq]
  | one =>
      refine ⟨1, ?_, Or.inl rfl⟩
      unfold pinUnitNorm
      rw [Units.val_one, CliffordAlgebra.reverse.map_one, mul_one, map_one]
  | mul x y _ _ ihx ihy =>
      obtain ⟨lx, hlx, hpx⟩ := ihx
      obtain ⟨ly, hly, hpy⟩ := ihy
      refine ⟨lx * ly, ?_, ?_⟩
      · unfold pinUnitNorm at hlx hly ⊢
        rw [Units.val_mul, CliffordAlgebra.reverse.map_mul]
        calc CliffordAlgebra.reverse (y : CliffC) * CliffordAlgebra.reverse (x : CliffC)
                * ((x : CliffC) * (y : CliffC))
            = CliffordAlgebra.reverse (y : CliffC)
                * (CliffordAlgebra.reverse (x : CliffC) * (x : CliffC)) * (y : CliffC) := by
              noncomm_ring
          _ = CliffordAlgebra.reverse (y : CliffC) * algebraMap Cut CliffC lx * (y : CliffC) := by
              rw [hlx]
          _ = algebraMap Cut CliffC lx
                * (CliffordAlgebra.reverse (y : CliffC) * (y : CliffC)) := by
              rw [← Algebra.commutes lx (CliffordAlgebra.reverse (y : CliffC)), mul_assoc]
          _ = algebraMap Cut CliffC lx * algebraMap Cut CliffC ly := by rw [hly]
          _ = algebraMap Cut CliffC (lx * ly) := by rw [map_mul]
      · rcases hpx with h | h <;> rcases hpy with h' | h' <;> subst h <;> subst h' <;> simp

/-- W8 NON-VACUITY read-off — the spinor norm of the timelike reflection unit is `1`:
    `pinUnitNorm (cliffUnitOf mTimeUnit) = (ι mTimeUnit)² = algebraMap (QvC mTimeUnit) =
    algebraMap 1 = 1`. The concrete anchor the costume C179 negates to `1 = 147`. -/
theorem pinUnitNorm_timelike :
    pinUnitNorm (cliffUnitOf mTimeUnit
      (by rw [BvC_mTimeUnit_self]; exact one_ne_zero)) = (1 : CliffC) := by
  unfold pinUnitNorm
  rw [cliffUnitOf_val, CliffordAlgebra.reverse_ι, cliffSq, QvC_mTimeUnit, map_one]

/-! ## The scalar-element half of injectivity-mod-center. -/

/-- ★ THE SCALAR-ELEMENT HALF (coefficient form): a SCALAR element of `PinUnitSub` has coefficient
    `±1`. If `↑u = algebraMap μ` with `u ∈ PinUnitSub`, then `pinUnitNorm u = reverse(algebraMap μ)·
    algebraMap μ = algebraMap (μ·μ)` (`reverse.commutes`), and `pinUnitNorm u = algebraMap λ` with
    `λ = ±1` (`pinUnitNorm_eq_pm`), so `μ² = λ = ±1` (char-0 injectivity of `algebraMap`). Over the
    derived ORDERED field `Cut`, `μ² ≥ 0` (`mul_self_nonneg`) rules out `μ² = -1`, so `μ² = 1`,
    whence `μ = ±1` (`mul_self_eq_one_iff`). The ordered-field structure of the DERIVED `Cut` is
    exactly what closes the scalar half. -/
theorem scalar_pinUnit_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) {mu : Cut}
    (hscal : (u : CliffC) = algebraMap Cut CliffC mu) :
    mu = 1 ∨ mu = -1 := by
  obtain ⟨lam, hN, hpm⟩ := pinUnitNorm_eq_pm hu
  have hNscal : pinUnitNorm u = algebraMap Cut CliffC (mu * mu) := by
    unfold pinUnitNorm
    rw [hscal, CliffordAlgebra.reverse.commutes, ← map_mul]
  rw [hNscal] at hN
  have hinj : Function.Injective (algebraMap Cut CliffC) := (algebraMap Cut CliffC).injective
  have hmm : mu * mu = lam := hinj hN
  have hmm1 : mu * mu = 1 := by
    rcases hpm with h | h
    · rw [hmm, h]
    · exfalso
      have hnn : (0 : Cut) ≤ mu * mu := mul_self_nonneg mu
      rw [hmm, h] at hnn
      have : (0 : Cut) ≤ (-1 : Cut) := hnn
      norm_num at this
  exact mul_self_eq_one_iff.mp hmm1

/-- ★ THE SCALAR-ELEMENT HALF (unit form): a SCALAR element of `PinUnitSub` is `1` or `-1` as a
    `CliffCˣ`. From `scalar_pinUnit_eq_pm` the coefficient is `±1`, and `algebraMap (±1) = ±1`. -/
theorem scalar_pinUnit_unit_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) {mu : Cut}
    (hscal : (u : CliffC) = algebraMap Cut CliffC mu) :
    u = 1 ∨ u = -1 := by
  rcases scalar_pinUnit_eq_pm hu hscal with h | h
  · left; apply Units.ext
    rw [hscal, h, map_one, Units.val_one]
  · right; apply Units.ext
    rw [hscal, h, map_neg, map_one, Units.val_neg, Units.val_one]

/-! ## The reduction — injectivity-mod-center conditional on the centralizer fact (child N148). -/

/-- ★★ THE REDUCTION — the `⊆` injectivity-mod-center direction CONDITIONAL on the centralizer
    fact. The hypothesis `hcent` is exactly the un-banked link MEASURED to require the Clifford
    supercenter=scalars theorem (Mathlib-absent — the W1 dissolution child N148): every kernel
    element of `coverMapPinUnit` is a scalar. GIVEN it, the bankable half (`scalar_pinUnit_unit_eq_pm`)
    closes the rest — every kernel element is `±1`. This makes explicit that the ONLY missing link
    to the full exact kernel `mker coverMapPinUnit = {1,-1}` is the centralizer fact; the
    structural half is discharged here. -/
theorem coverMapPinUnit_injmodcenter_of_scalar
    (hcent : ∀ u : PinUnitSub, u ∈ MonoidHom.mker coverMapPinUnit →
      ∃ mu : Cut, ((u : CliffCˣ) : CliffC) = algebraMap Cut CliffC mu) :
    ∀ u : PinUnitSub, u ∈ MonoidHom.mker coverMapPinUnit →
      (u : CliffCˣ) = 1 ∨ (u : CliffCˣ) = -1 := by
  intro u hu
  obtain ⟨mu, hscal⟩ := hcent u hu
  exact scalar_pinUnit_unit_eq_pm u.prop hscal

end

end Phys.Algebra
