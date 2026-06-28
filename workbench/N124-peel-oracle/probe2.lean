import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def houseHolder (a : O Cut) : O Cut →ₗ[Cut] O Cut :=
  LinearMap.id - (2 * (gFormC a a)⁻¹) • (LinearMap.smulRight (gFormCRight a) a)

theorem houseHolder_apply (a v : O Cut) :
    houseHolder a v = v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a := by
  unfold houseHolder
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show v - (2 * (gFormC a a)⁻¹) • (gFormCRight a v • a) = _
  rw [smul_smul]; rfl

/-- Bilinear expansion of the two-term form. -/
theorem gFormC_houseterm (x y a : O Cut) (s t : Cut) :
    gFormC (x - s • a) (y - t • a)
      = gFormC x y - t * gFormC x a - s * gFormC a y + s * t * gFormC a a := by
  simp only [sub_eq_add_neg, gFormC_add_left, gFormC_add_right, gFormC_neg_left,
    octRefl_gFormC_neg_right, gFormC_smul_left, gFormC_smul_right]
  ring

/-- P2 — `houseHolder a` preserves the Born form. -/
theorem houseHolder_isom {a : O Cut} (ha : gFormC a a ≠ 0) :
    IsGFormCIsom (houseHolder a) := by
  intro u v
  rw [houseHolder_apply, houseHolder_apply, gFormC_houseterm, gFormC_symm u a]
  field_simp
  ring

/-- P3 — `houseHolder a` is an involution. -/
theorem houseHolder_involutive {a : O Cut} (ha : gFormC a a ≠ 0) :
    houseHolder a * houseHolder a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolder_apply, houseHolder_apply]
  have hinner : gFormC a (v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a)
      = gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a := by
    rw [sub_eq_add_neg, gFormC_add_right, octRefl_gFormC_neg_right, gFormC_smul_right]; ring
  rw [hinner]
  have hcoef : (2 * (gFormC a a)⁻¹ * gFormC a v)
      + (2 * (gFormC a a)⁻¹ * (gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]
  rfl

end

end Phys.Algebra
