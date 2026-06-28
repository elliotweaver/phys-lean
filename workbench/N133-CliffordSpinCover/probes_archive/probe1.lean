import Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

open scoped BigOperators

example : CharZero Cut := by infer_instance

/-- The BvC bilinear form as a genuine `LinearMap.BilinForm Cut STVC`. -/
noncomputable def BvCBilin : LinearMap.BilinForm Cut STVC where
  toFun := fun a => BvCRight a
  map_add' := by
    intro a a'
    refine LinearMap.ext (fun p => ?_)
    simp only [LinearMap.add_apply]
    show BvC (a + a') p = BvC a p + BvC a' p
    exact BvC_add_left a a' p
  map_smul' := by
    intro c a
    refine LinearMap.ext (fun p => ?_)
    simp only [RingHom.id_apply, LinearMap.smul_apply, smul_eq_mul]
    show BvC (c • a) p = c * BvC a p
    exact BvC_smul_left c a p

example (a p : STVC) : BvCBilin a p = BvC a p := rfl

/-- QvC realized as the quadratic form of BvCBilin. -/
noncomputable def QvCQuad : QuadraticMap Cut STVC Cut := BvCBilin.toQuadraticMap

example (p : STVC) : QvCQuad p = QvC p := by
  show BvCBilin p p = QvC p
  show BvC p p = QvC p
  exact BvC_self p

/-! MEASURE: does CliffordAlgebra instantiate? -/
noncomputable example := CliffordAlgebra QvCQuad

example (p : STVC) :
    CliffordAlgebra.ι QvCQuad p * CliffordAlgebra.ι QvCQuad p
      = algebraMap Cut (CliffordAlgebra QvCQuad) (QvC p) := by
  have := CliffordAlgebra.ι_sq_scalar QvCQuad p
  rw [this]
  congr 1
  show QvCQuad p = QvC p
  show BvC p p = QvC p
  exact BvC_self p

/-! MEASURE: polar of QvCQuad recovers 2·BvC (the polarization), and the
    quadratic IsOrtho ↔ BvC orthogonality (the input the reflection-lift needs). -/
example (x y : STVC) : QuadraticMap.polar QvCQuad x y = BvC x y + BvC y x := by
  show QuadraticMap.polar BvCBilin.toQuadraticMap x y = _
  rw [LinearMap.BilinMap.polar_toQuadraticMap]
  rfl

end Phys.Algebra
