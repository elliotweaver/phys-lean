import Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

open scoped BigOperators

noncomputable def BvCBilin : LinearMap.BilinForm Cut STVC where
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

@[simp] theorem BvCBilin_apply (a p : STVC) : BvCBilin a p = BvC a p := rfl

noncomputable def QvCQuad : QuadraticMap Cut STVC Cut := BvCBilin.toQuadraticMap

@[simp] theorem QvCQuad_apply (p : STVC) : QvCQuad p = QvC p := by
  show BvCBilin p p = QvC p
  show BvC p p = QvC p
  exact BvC_self p

theorem QvCQuad_polar (x y : STVC) : QuadraticMap.polar QvCQuad x y = 2 * BvC x y := by
  show QuadraticMap.polar BvCBilin.toQuadraticMap x y = _
  rw [LinearMap.BilinMap.polar_toQuadraticMap]
  show BvC x y + BvC y x = 2 * BvC x y
  rw [BvC_symm y x]; ring

abbrev CliffC := CliffordAlgebra QvCQuad

theorem cliffSq (p : STVC) :
    CliffordAlgebra.ι QvCQuad p * CliffordAlgebra.ι QvCQuad p
      = algebraMap Cut CliffC (QvC p) := by
  rw [CliffordAlgebra.ι_sq_scalar QvCQuad p, QvCQuad_apply]

theorem cliffAnticomm (a b : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b
      + CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a
      = algebraMap Cut CliffC (2 * BvC a b) := by
  rw [CliffordAlgebra.ι_mul_ι_add_swap a b, QvCQuad_polar]

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

/-- ★ THE PIN GENERATOR IS A UNIT: for anisotropic `a`, `ι a` is invertible with inverse
    `(QvC a)⁻¹ • ι a`. -/
theorem cliff_unit_isUnit {a : STVC} (ha : BvC a a ≠ 0) :
    IsUnit (CliffordAlgebra.ι QvCQuad a) := by
  have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
  refine ⟨⟨CliffordAlgebra.ι QvCQuad a, (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a, ?_, ?_⟩, rfl⟩
  · rw [mul_smul_comm, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]
  · rw [smul_mul_assoc, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]

/-- ★★ THE HEADLINE: every indefinite Householder reflection lifts to Clifford conjugation by the
    unit `ι a`: `ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`. -/
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

/-! ## W8 teeth — the timelike generator is a Clifford involution; concrete cover read-off. -/

/-- ★ W8 — the timelike unit's Clifford generator squares to the scalar `1` (an involution): the
    concrete Pin element of `ι mTimeUnit`, `QvC mTimeUnit = 1`. -/
theorem cover_timelike_unit_clifford_sq :
    CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC) * CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC)
      = 1 := by
  rw [cliffSq mTimeUnit]
  have : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
  rw [this, map_one]

/-- ★ W8 TEETH — the Clifford form of the timelike generator reads `1`. The Clifford algebra `CliffC`
    is built on `QvCQuad`; its value at `mTimeUnit` is the scalar the generator squares to. -/
theorem cover_form_timelike_unit : QvCQuad (mTimeUnit : STVC) = 1 := by
  rw [QvCQuad_apply, ← BvC_self]; exact BvC_mTimeUnit_self

end Phys.Algebra
