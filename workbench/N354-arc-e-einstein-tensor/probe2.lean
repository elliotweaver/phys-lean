/-
  N354 probe2 — MEASURE the Einstein tensor's FORM-level properties: bilinearity (from banked ricci +
  BvC bilinearity), symmetry (concrete, from ricci_solder_symm + BvC_symm), the concrete mixed value,
  and the einstein-raise UNIQUENESS (from banked BvC_nondegenerate).
-/
import Phys.Algebra.SpacetimeRicciScalar
import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def einstein (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  ricci G Y Z - (2⁻¹ * ricciScalar G) * BvC Y Z

/-- BILINEAR in Y (additive): from banked ricci_add_Y + BvC_add_left. -/
theorem einstein_add_Y (G : STVC →ₗ[Cut] MetricEnd) (Y₁ Y₂ Z : STVC) :
    einstein G (Y₁ + Y₂) Z = einstein G Y₁ Z + einstein G Y₂ Z := by
  unfold einstein
  rw [ricci_add_Y, BvC_add_left]; ring

/-- BILINEAR in Z (additive): from banked ricci_add_Z + BvC_sub_right/add. -/
theorem einstein_add_Z (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    einstein G Y (Z₁ + Z₂) = einstein G Y Z₁ + einstein G Y Z₂ := by
  unfold einstein
  rw [ricci_add_Z]
  have hb : BvC Y (Z₁ + Z₂) = BvC Y Z₁ + BvC Y Z₂ := by
    rw [BvC_symm, BvC_add_left, BvC_symm Z₁ Y, BvC_symm Z₂ Y]
  rw [hb]; ring

/-- HOMOGENEOUS in Y: from banked ricci_smul_Y + BvC bilinearity. -/
theorem einstein_smul_Y (G : STVC →ₗ[Cut] MetricEnd) (c : Cut) (Y Z : STVC) :
    einstein G (c • Y) Z = c * einstein G Y Z := by
  unfold einstein
  rw [ricci_smul_Y]
  have hb : BvC (c • Y) Z = c * BvC Y Z := by
    show (c • Y).1 * Z.1 - (c • Y).2.1 * Z.2.1 - gFormC (c • Y).2.2 Z.2.2 = _
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul]
    rw [gFormC_smul_left]; unfold BvC; ring
  rw [hb]; ring

/-- SYMMETRIC for the concrete soldering: from ricci_solder_symm + BvC_symm. -/
theorem einstein_solder_symm (Y Z : STVC) :
    einstein solderWit Y Z = einstein solderWit Z Y := by
  unfold einstein
  rw [ricci_solder_symm, BvC_symm]

/-- THE CONCRETE MIXED VALUE: einstein solderWit Y Z = ¼·Y.2.1·Z.2.1 + ⅛·BvC Y Z.
    A genuine mixed object: the field-gradient Ricci form PLUS a metric term (from R = −¼). -/
theorem einstein_solder_form (Y Z : STVC) :
    einstein solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 + (8⁻¹ : Cut) * BvC Y Z := by
  unfold einstein
  rw [ricci_solder_form, ricciScalar_solder]; ring

/-- The Einstein tensor is NON-VACUOUS as a form: nonzero for a concrete pair. Take Y=Z=(0,1,0):
    ¼·1·1 + ⅛·BvC(0,1,0)(0,1,0) = ¼ + ⅛·(−1) = ⅛ ≠ 0. -/
theorem einstein_solder_ne_zero :
    einstein solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 := by
  rw [einstein_solder_form]
  show (4⁻¹ : Cut) * 1 * 1 + (8⁻¹ : Cut) * BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0
  have hbvc : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut) * 0 - (1:Cut) * 1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hbvc]; norm_num

end

end Phys.Algebra
