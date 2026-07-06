import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- from probe2 (re-stated so probe3 is standalone)
theorem lbCurv_gen_comp1 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).1 = (4⁻¹ : Cut) * Z.2.1 := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero, smul_eq_mul]

theorem lbCurv_gen_comp2 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

theorem ricci_solder_form (Y Z : STVC) :
    ricci solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 := by
  rw [ricci_solder, lbCurv_gen_comp1, lbCurv_gen_comp2]; ring

/-! ## THE METRIC TRACE (Ricci scalar) machinery. -/

-- The metric-raising property: T raises the Ricci form's index via BvC.
def IsRicciRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = ricci G Y Z

-- The x-coordinate functional ℓ(Z) = Z.2.1
def xFun : STVC →ₗ[Cut] Cut :=
  (LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))

theorem xFun_apply (Z : STVC) : xFun Z = Z.2.1 := rfl

-- The concrete metric-raised Ricci endomorphism for the soldering: T Z = (0, −¼ Z.2.1, 0)
def solderRicciRaise : MetricEnd := xFun.smulRight (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC)

theorem solderRicciRaise_apply (Z : STVC) :
    solderRicciRaise Z = ((0:Cut), (-(4⁻¹):Cut) * Z.2.1, (0 : O Cut)) := by
  show Z.2.1 • (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC) = _
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show Z.2.1 • (0:Cut) = 0; rw [smul_zero]
  · show Z.2.1 • (-(4⁻¹):Cut) = (-(4⁻¹):Cut) * Z.2.1; rw [smul_eq_mul]; ring
  · show Z.2.1 • (0:O Cut) = 0; rw [smul_zero]

-- (A) IsRicciRaise for the concrete soldering
theorem solder_isRicciRaise : IsRicciRaise solderWit solderRicciRaise := by
  intro Y Z
  rw [ricci_solder_form, solderRicciRaise_apply]
  show Y.1 * 0 - Y.2.1 * ((-(4⁻¹):Cut) * Z.2.1) - gFormC Y.2.2 0 = 4⁻¹ * Y.2.1 * Z.2.1
  rw [gFormC_zero_right']; ring

-- (B) THE RICCI SCALAR = trace of the metric-raised endomorphism = −¼
theorem ricciScalar_solder : LinearMap.trace Cut STVC solderRicciRaise = -(4⁻¹ : Cut) := by
  unfold solderRicciRaise
  rw [LinearMap.trace_smulRight]
  rw [xFun_apply]

-- (C) THE HEART: metric trace nonzero (contentful), fiber trace zero (blind)
theorem ricci_scalar_metric_contentful :
    LinearMap.trace Cut STVC (lbCurv timeProj offDiagVar) = 0
      ∧ LinearMap.trace Cut STVC solderRicciRaise ≠ 0 := by
  refine ⟨fiberTrace_lbCurv_zero timeProj offDiagVar, ?_⟩
  rw [ricciScalar_solder]; norm_num

end

end Phys.Algebra
