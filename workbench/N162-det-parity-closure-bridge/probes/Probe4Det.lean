import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped Matrix

/-- factor: `f a := (2·(gFormC a a)⁻¹) • gFormCRight a : O Cut →ₗ[Cut] Cut`. -/
def hhF (a : O Cut) : O Cut →ₗ[Cut] Cut := (2 * (gFormC a a)⁻¹) • gFormCRight a
/-- `g a := toSpanSingleton a : Cut →ₗ[Cut] O Cut`. -/
def hhG (a : O Cut) : Cut →ₗ[Cut] O Cut := LinearMap.toSpanSingleton Cut (O Cut) a

theorem hh_eq (a : O Cut) :
    houseHolder a = LinearMap.id - (hhG a).comp (hhF a) := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply]
  simp only [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.comp_apply, hhG, hhF,
    LinearMap.smul_apply, LinearMap.toSpanSingleton_apply, smul_eq_mul, gFormCRight]
  rfl

theorem hh_fg (a : O Cut) (ha : gFormC a a ≠ 0) :
    (hhF a).comp (hhG a) = (2 : Cut) • LinearMap.id := by
  apply LinearMap.ext; intro t
  simp only [LinearMap.comp_apply, hhG, hhF, LinearMap.smul_apply, LinearMap.id_apply,
    LinearMap.toSpanSingleton_apply, map_smul, smul_eq_mul]
  show t * (2 * (gFormC a a)⁻¹ * gFormC a a) = 2 * t
  field_simp

/-- THE DET — `det (houseHolder a) = -1` for `gFormC a a ≠ 0`. Sylvester (Weinstein–Aronszajn)
    through the toMatrix translation: pick the chosen basis `b` of `O Cut` and the singleton basis
    `bs` of `Cut`; `toMatrix (id − g∘f) = 1 − (toMatrix g)(toMatrix f)`, flip via
    `Matrix.det_one_sub_mul_comm` to `det(1 − (toMatrix f)(toMatrix g))`, and `f∘g = 2•id` on the
    1-dim `Cut`, so the flipped matrix is `1 − 2•1 = -1` (1×1), `det = -1`. -/
theorem det_houseHolder (a : O Cut) (ha : gFormC a a ≠ 0) :
    LinearMap.det (houseHolder a) = -1 := by
  classical
  set b := Module.Free.chooseBasis Cut (O Cut) with hb
  set bs := Module.Basis.singleton Unit Cut with hbs
  rw [hh_eq a, ← LinearMap.det_toMatrix b]
  rw [map_sub, LinearMap.toMatrix_id, LinearMap.toMatrix_comp b bs b]
  rw [Matrix.det_one_sub_mul_comm (LinearMap.toMatrix bs b (hhG a))
        (LinearMap.toMatrix b bs (hhF a))]
  rw [← LinearMap.toMatrix_comp bs b bs, hh_fg a ha]
  -- now: det (1 - toMatrix bs bs (2 • id)) = -1, a 1×1 matrix over Unit
  simp only [map_smul, LinearMap.toMatrix_id]
  rw [Matrix.det_unique]
  simp only [Matrix.sub_apply, Matrix.smul_apply, Matrix.one_apply_eq, smul_eq_mul]
  norm_num

end
