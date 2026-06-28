/-
  Phys.Algebra.LorentzContinuumCliffordSpinCover — N133: THE CLIFFORD / PIN COVER OF THE
  CLOSED CONTINUUM LORENTZ GROUP `SO⁺(1,9)` AT THE GENERATOR LEVEL — the derived Minkowski
  quadratic form `QvCQuad` carries a Clifford algebra, and every banked indefinite Householder
  reflection lifts to Clifford conjugation by a Clifford UNIT `ι a`. Over the derived ℝ `Cut`,
  the terminal algebra `O Cut`, the spacetime `STVC`, the indefinite Minkowski form `BvC`.
  ===========================================================================
  CONTEXT — THE FORCED NEXT STRUCTURE (W4.5 SUFFICIENCY: advance, do not re-pin).
  N132 CLOSED the continuum Lorentz group: `bvIsomLinMonoid` (every `Cut`-linear `BvC`-isometry)
  EQUALS `Submonoid.closure houseHolderMSet` (the reflection-word group) — Cartan–Dieudonné
  PROVED, every linear `QvC`-isometry IS a finite indefinite Householder word
  (`linQvIsom_mem_reflection_closure`). The Lorentz/spacetime sector is structurally CLOSED, so the
  forward joint is the next physics-recognized structure the closed group OPENS, not another lateral
  Lorentz invariant. The forced next object is the **Clifford / Pin cover**: Cartan–Dieudonné — every
  isometry a finite product of reflections — is precisely the input the Pin/Spin double cover
  consumes; each reflection lifts to conjugation by a Clifford unit. This node banks that lift at the
  generator level, foundations-only, over the DERIVED form.

  ── WHAT THIS NODE BANKS ──
    BvCBilin                    — the indefinite Minkowski form `BvC` as a genuine
                                  `LinearMap.BilinForm Cut STVC`, built from the banked bilinearity
                                  of `BvC` (no new content).
    QvCQuad                     — the Born/Minkowski QUADRATIC form `QvCQuad := BvCBilin.toQuadraticMap`,
                                  the Mathlib `QuadraticMap` of the DERIVED bilinear form; its value
                                  equals the cascade's own `QvC` (`QvCQuad_apply`, via `BvC_self`).
    QvCQuad_polar               — the polarization `polar QvCQuad = 2·BvC` (the form's companion is the
                                  derived bilinear form, doubled — the standard char-0 relation).
    CliffC                      — `CliffordAlgebra QvCQuad`: the Clifford algebra of the derived
                                  Minkowski form. Mathlib's Clifford FUNCTOR applied to a DERIVED
                                  object (machinery on derived content — STANDARD §3), NOT a posited
                                  Clifford structure and NOT a Mathlib number system as content.
    cliffSq                     — `ι p · ι p = algebraMap (QvC p)` — the metric IS the square of the
                                  generator (the defining Clifford relation, in cascade terms).
    cliffAnticomm               — `ι a · ι b + ι b · ι a = algebraMap (2·BvC a b)` — the metric IS the
                                  symmetric anticommutator.
    cliffSandwich               — `ι a · ι v · ι a = (2·BvC a v)•ι a − (QvC a)•ι v` — the metric
                                  sandwich identity (pure Clifford-relation algebra).
    cliff_unit_isUnit           — the Pin GENERATOR is a UNIT: for `BvC a a ≠ 0`, `ι a` is invertible
                                  with inverse `(QvC a)⁻¹ • ι a` (anisotropy makes the generator a
                                  unit — the Pin-group membership condition at the generator level).
    ★★ reflection_clifford_conj — THE HEADLINE: every banked indefinite Householder reflection lifts to
                                  Clifford conjugation by the unit `ι a`:
                                  `ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`. This is the
                                  Pin cover at the generator level — the reflection, an element of the
                                  closed group `bvIsomLinMonoid` (N132), realized on the spinor module as
                                  conjugation by a Clifford unit, DERIVED from the trunk's own reflection.
    W8 (genuinely-indefinite teeth):
    cover_timelike_unit_clifford_sq — the timelike unit's Clifford generator squares to the scalar `1`
                                  (an involution): the concrete Pin element `ι mTimeUnit`, `QvC = 1`.
    cover_form_timelike_unit    — the Clifford form value `QvCQuad mTimeUnit = 1` (the read-off the
                                  costume C165 negates).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Clifford algebra of a
  FIXED Minkowski metric matrix `η = diag(1,−1,…,−1)` and the Pin/Spin cover `Pin(1,9) → SO⁺(1,9)` as
  standard structure read off that fixed form. Here the quadratic form `QvCQuad` is the cascade's own
  derived Born/Minkowski form `BvC` (whose space `STVC = Cut × Cut × O Cut` and signature `(1,9)` were
  COUNTED from the cascade, `finrank STVC = 10`, the octonion block from the terminal algebra), the
  base field is the DERIVED complete ordered field `Cut`, and the reflection that lifts to a Clifford
  unit is the trunk's own `houseHolderM` (the Cartan–Dieudonné generator PROVED to exhaust the group in
  N123–N128). Mathlib's `CliffordAlgebra` is the FUNCTOR — proof machinery — applied to that derived
  form, exactly as `Matrix`/`Module` are machinery; nothing about the number system or the form is
  posited. The cover relation is DERIVED forward, NOT asserted: no posited adjoint, no posited Pin/Spin
  group, no bridge. The UNBROKEN strand: the closed reflection-word group (N132) is exactly what makes
  the generator-level cover immediate — every group element a reflection word, every reflection a
  Clifford unit conjugation.

  DERIVED from the banked N49–N132 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Clifford / Pin / Spin / cover / spinor /
  reflection / Householder / Lorentz / Minkowski / metric / signature / timelike / isometry /
  generator / group / bridge": what remains is pure algebra over the derived complete ordered field
  `Cut`, `STVC = Cut × Cut × O Cut`, the bilinear form `BvC` and its quadratic form `QvC` — the
  Clifford algebra of `QvCQuad := BvCBilin.toQuadraticMap` satisfies `ι p · ι p = algebraMap (QvC p)`,
  `ι a · ι b + ι b · ι a = algebraMap (2·BvC a b)`, for `BvC a a ≠ 0` the element `ι a` is a unit, and
  `ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra`/`QuadraticMap`
  are MACHINERY on the derived form), NO posited Clifford/Pin/Spin structure.
-/
import Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The derived Minkowski form as a Mathlib bilinear form and quadratic form. -/

/-- THE INDEFINITE MINKOWSKI FORM `BvC` AS A GENUINE `LinearMap.BilinForm Cut STVC`. Built ENTIRELY
    from the banked bilinearity of `BvC` (`BvC_add_left`/`BvC_smul_left`) — no new content; this just
    packages the derived form so Mathlib's `QuadraticMap`/`CliffordAlgebra` machinery can be applied
    to it. -/
def BvCBilin : LinearMap.BilinForm Cut STVC where
  toFun := fun a => BvCRight a
  map_add' := by
    intro a a'
    refine LinearMap.ext (fun p => ?_)
    simp only [LinearMap.add_apply]
    exact BvC_add_left a a' p
  map_smul' := by
    intro c a
    refine LinearMap.ext (fun p => ?_)
    simp only [RingHom.id_apply, LinearMap.smul_apply, smul_eq_mul]
    exact BvC_smul_left c a p

/-- The bilinear form evaluates to the derived `BvC`. -/
@[simp] theorem BvCBilin_apply (a p : STVC) : BvCBilin a p = BvC a p := rfl

/-- THE BORN/MINKOWSKI QUADRATIC FORM as the Mathlib `QuadraticMap` of the DERIVED bilinear form. -/
def QvCQuad : QuadraticMap Cut STVC Cut := BvCBilin.toQuadraticMap

/-- The quadratic form value is the cascade's own `QvC` (`BvC_self`). -/
@[simp] theorem QvCQuad_apply (p : STVC) : QvCQuad p = QvC p := by
  show BvCBilin p p = QvC p
  show BvC p p = QvC p
  exact BvC_self p

/-- THE POLARIZATION: `polar QvCQuad = 2·BvC` — the companion of the quadratic form is the derived
    bilinear form, doubled (the standard char-0 relation, here over the derived field `Cut`). -/
theorem QvCQuad_polar (x y : STVC) : QuadraticMap.polar QvCQuad x y = 2 * BvC x y := by
  show QuadraticMap.polar BvCBilin.toQuadraticMap x y = _
  rw [LinearMap.BilinMap.polar_toQuadraticMap]
  show BvC x y + BvC y x = 2 * BvC x y
  rw [BvC_symm y x]; ring

/-! ## The Clifford algebra of the derived Minkowski form. -/

/-- THE CLIFFORD ALGEBRA OF THE DERIVED MINKOWSKI FORM. Mathlib's Clifford FUNCTOR applied to the
    DERIVED quadratic form `QvCQuad` over the DERIVED field `Cut` — proof machinery on a derived
    object (STANDARD §3), NOT a posited Clifford structure, NOT a Mathlib number system as content. -/
abbrev CliffC := CliffordAlgebra QvCQuad

/-- THE DEFINING CLIFFORD RELATION (the metric IS the generator's square): for any `p`,
    `ι p · ι p = algebraMap (QvC p)`. -/
theorem cliffSq (p : STVC) :
    CliffordAlgebra.ι QvCQuad p * CliffordAlgebra.ι QvCQuad p
      = algebraMap Cut CliffC (QvC p) := by
  rw [CliffordAlgebra.ι_sq_scalar QvCQuad p, QvCQuad_apply]

/-- THE SYMMETRIC ANTICOMMUTATOR IS THE METRIC: `ι a · ι b + ι b · ι a = algebraMap (2·BvC a b)`. -/
theorem cliffAnticomm (a b : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b
      + CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a
      = algebraMap Cut CliffC (2 * BvC a b) := by
  rw [CliffordAlgebra.ι_mul_ι_add_swap a b, QvCQuad_polar]

/-- THE METRIC SANDWICH: `ι a · ι v · ι a = (2·BvC a v)•ι a − (QvC a)•ι v`. Pure Clifford-relation
    algebra (the anticommutator + the generator square) — the algebraic heart of the reflection
    lift. -/
theorem cliffSandwich (a v : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad v * CliffordAlgebra.ι QvCQuad a
      = (2 * BvC a v) • CliffordAlgebra.ι QvCQuad a - (QvC a) • CliffordAlgebra.ι QvCQuad v := by
  set ιa := CliffordAlgebra.ι QvCQuad a with hιa
  set ιv := CliffordAlgebra.ι QvCQuad v with hιv
  have hswap : ιa * ιv = algebraMap Cut CliffC (2 * BvC a v) - ιv * ιa := by
    have h := cliffAnticomm a v
    rw [← hιa, ← hιv] at h
    rw [eq_sub_iff_add_eq]; exact h
  have haa : ιa * ιa = algebraMap Cut CliffC (QvC a) := cliffSq a
  have hcomm : ιv * algebraMap Cut CliffC (QvC a)
      = algebraMap Cut CliffC (QvC a) * ιv := (Algebra.commute_algebraMap_right _ _).eq
  calc ιa * ιv * ιa
      = (algebraMap Cut CliffC (2 * BvC a v) - ιv * ιa) * ιa := by rw [hswap]
    _ = algebraMap Cut CliffC (2 * BvC a v) * ιa - ιv * (ιa * ιa) := by
          rw [sub_mul, mul_assoc]
    _ = algebraMap Cut CliffC (2 * BvC a v) * ιa - ιv * algebraMap Cut CliffC (QvC a) := by
          rw [haa]
    _ = algebraMap Cut CliffC (2 * BvC a v) * ιa - algebraMap Cut CliffC (QvC a) * ιv := by
          rw [hcomm]
    _ = (2 * BvC a v) • ιa - (QvC a) • ιv := by
          rw [Algebra.smul_def, Algebra.smul_def]

/-! ## The Pin generator is a unit, and the reflection lifts to Clifford conjugation. -/

/-- ★ THE PIN GENERATOR IS A UNIT: for ANISOTROPIC `a` (`BvC a a ≠ 0`), the Clifford generator `ι a`
    is invertible, with inverse `(QvC a)⁻¹ • ι a`. The anisotropy the indefinite signature forces on
    a reflection axis is exactly what makes its generator a unit — the Pin-group membership condition
    at the generator level. -/
theorem cliff_unit_isUnit {a : STVC} (ha : BvC a a ≠ 0) :
    IsUnit (CliffordAlgebra.ι QvCQuad a) := by
  have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
  refine ⟨⟨CliffordAlgebra.ι QvCQuad a, (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a, ?_, ?_⟩, rfl⟩
  · rw [mul_smul_comm, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]
  · rw [smul_mul_assoc, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]

/-- ★★ THE HEADLINE — THE GENERATOR-LEVEL COVER: every banked indefinite Householder reflection
    `houseHolderM a` (the Cartan–Dieudonné generator of the closed group `bvIsomLinMonoid`, N132)
    lifts to Clifford CONJUGATION by the unit `ι a`:
    `ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`. The reflection acting on `STVC` IS,
    on the Clifford (spinor) module, conjugation by the Clifford unit — the Pin cover at the
    generator level, DERIVED from the trunk's own reflection and the Clifford relation. -/
theorem reflection_clifford_conj {a : STVC} (ha : BvC a a ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad (houseHolderM a v)
      = -(QvC a)⁻¹ • (CliffordAlgebra.ι QvCQuad a
          * CliffordAlgebra.ι QvCQuad v * CliffordAlgebra.ι QvCQuad a) := by
  have hq : QvC a = BvC a a := (BvC_self a).symm
  have hqne : QvC a ≠ 0 := by rw [hq]; exact ha
  rw [cliffSandwich a v, houseHolderM_apply, map_sub, map_smul, smul_sub, smul_smul, smul_smul]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιv := CliffordAlgebra.ι QvCQuad v
  have hcoef1 : -(QvC a)⁻¹ * (2 * BvC a v) = -(2 * (BvC a a)⁻¹ * BvC a v) := by
    rw [hq]; field_simp
  have hcoef2 : -(QvC a)⁻¹ * QvC a = -1 := by
    rw [_root_.neg_mul, inv_mul_cancel₀ hqne]
  rw [hcoef1, hcoef2]
  module

/-! ## W8 teeth — the timelike generator is a Clifford involution (the genuinely-indefinite demo). -/

/-- ★ W8 — THE TIMELIKE PIN GENERATOR IS A CLIFFORD INVOLUTION: `ι mTimeUnit · ι mTimeUnit = 1`,
    because `QvC mTimeUnit = 1`. The concrete Pin element of the closed group, on the spinor module. -/
theorem cover_timelike_unit_clifford_sq :
    CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC) * CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC)
      = 1 := by
  rw [cliffSq mTimeUnit]
  have : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
  rw [this, map_one]

/-- ★ W8 TEETH — the Clifford form value at the timelike generator reads `1`. The Clifford algebra
    `CliffC` is built on `QvCQuad`, and its value at `mTimeUnit` is the scalar the generator squares
    to — the read-off the costume C165 (`1 = 133`) negates. -/
theorem cover_form_timelike_unit : QvCQuad (mTimeUnit : STVC) = 1 := by
  rw [QvCQuad_apply, ← BvC_self]; exact BvC_mTimeUnit_self

end

end Phys.Algebra
