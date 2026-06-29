import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Mathlib.LinearAlgebra.Matrix.SchurComplement

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- factor: `f a := (2·(gFormC a a)⁻¹) • gFormCRight a : O Cut →ₗ[Cut] Cut`. -/
def hhF (a : O Cut) : O Cut →ₗ[Cut] Cut := (2 * (gFormC a a)⁻¹) • gFormCRight a

/-- `g a := toSpanSingleton a : Cut →ₗ[Cut] O Cut`. -/
def hhG (a : O Cut) : Cut →ₗ[Cut] O Cut := LinearMap.toSpanSingleton Cut (O Cut) a

-- STRUCTURAL REWRITE: houseHolder a = id - (g a).comp (f a)
example (a : O Cut) :
    houseHolder a = LinearMap.id - (hhG a).comp (hhF a) := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply]
  simp only [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.comp_apply, hhG, hhF,
    LinearMap.smul_apply, LinearMap.toSpanSingleton_apply, smul_eq_mul]
  show v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a = v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a
  rfl

-- THE 1-DIM SIDE: (f a).comp (g a) = (2) • id  on Cut, when gFormC a a ≠ 0
example (a : O Cut) (ha : gFormC a a ≠ 0) :
    (hhF a).comp (hhG a) = (2 : Cut) • LinearMap.id := by
  apply LinearMap.ext; intro t
  simp only [LinearMap.comp_apply, hhG, hhF, LinearMap.smul_apply, LinearMap.id_apply,
    LinearMap.toSpanSingleton_apply, map_smul, smul_eq_mul]
  show t * (2 * (gFormC a a)⁻¹ * gFormC a a) = 2 * t
  field_simp

end
