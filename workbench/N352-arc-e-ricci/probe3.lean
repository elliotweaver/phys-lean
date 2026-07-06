import Phys.Algebra.SpacetimeRiemannAssembly
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

def lbCurvLeft (kY : MetricEnd) : MetricEnd →ₗ[Cut] MetricEnd where
  toFun k := lbCurv k kY
  map_add' k₁ k₂ := lbCurv_add_left k₁ k₂ kY
  map_smul' c k := by simp only [RingHom.id_apply]; exact lbCurv_smul_left c k kY

def evalAt (Z : STVC) : MetricEnd →ₗ[Cut] STVC := LinearMap.applyₗ Z

def ricMap (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : STVC →ₗ[Cut] STVC :=
  (evalAt Z).comp ((lbCurvLeft (G Y)).comp G)

theorem ricMap_apply (G : STVC →ₗ[Cut] MetricEnd) (Y Z X : STVC) :
    ricMap G Y Z X = lbCurv (G X) (G Y) Z := rfl

def ricci (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  LinearMap.trace Cut STVC (ricMap G Y Z)

def solderWit : STVC →ₗ[Cut] MetricEnd :=
  (LinearMap.fst Cut Cut (Cut × O Cut)).smulRight timeProj
    + ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))).smulRight offDiagVar

theorem solderWit_apply (X : STVC) :
    solderWit X = X.1 • timeProj + X.2.1 • offDiagVar := by
  simp only [solderWit, LinearMap.add_apply, LinearMap.smulRight_apply, LinearMap.fst_apply,
    LinearMap.comp_apply, LinearMap.snd_apply]

theorem lbCurv_solder (X Y : STVC) :
    lbCurv (solderWit X) (solderWit Y)
      = (X.1 * Y.2.1 - X.2.1 * Y.1) • lbCurv timeProj offDiagVar := by
  rw [solderWit_apply, solderWit_apply]
  simp only [lbCurv_add_left, lbCurv_add_right, lbCurv_smul_left, lbCurv_smul_right, lbCurv_self,
    smul_zero, add_zero, zero_add]
  rw [lbCurv_antisymm offDiagVar timeProj]
  module

-- Now the ricMap as a rank-1 map, and its trace.
theorem ricMap_solder (Y Z : STVC) :
    ricMap solderWit Y Z
      = ((Y.2.1 • (LinearMap.fst Cut Cut (Cut × O Cut))
            - Y.1 • ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut)))
          ).smulRight (lbCurv timeProj offDiagVar Z)) := by
  refine LinearMap.ext fun X => ?_
  rw [ricMap_apply, lbCurv_solder]
  simp only [LinearMap.smulRight_apply, LinearMap.sub_apply, LinearMap.smul_apply,
    LinearMap.fst_apply, LinearMap.comp_apply, LinearMap.snd_apply, smul_eq_mul]
  congr 1
  ring

-- THE MEASUREMENT: the trace (Ricci) of the rank-1 map, via trace_smulRight.
theorem ricci_solder (Y Z : STVC) :
    ricci solderWit Y Z
      = Y.2.1 * (lbCurv timeProj offDiagVar Z).1
          - Y.1 * (lbCurv timeProj offDiagVar Z).2.1 := by
  unfold ricci
  rw [ricMap_solder, LinearMap.trace_smulRight]
  simp only [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.fst_apply, LinearMap.comp_apply,
    LinearMap.snd_apply, smul_eq_mul]

-- Concrete NONZERO Ricci: Y = (0,1,0) (so G Y = offDiagVar), Z = (0,1,0).
-- Compute the curvature vector's components at the sample first.
theorem lbCurv_sample_comp1 :
    (lbCurv timeProj offDiagVar ((0:Cut),(1:Cut),(0:O Cut))).1 = (4⁻¹ : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero]
  norm_num

theorem lbCurv_sample_comp2 :
    (lbCurv timeProj offDiagVar ((0:Cut),(1:Cut),(0:O Cut))).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

example : ricci solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 := by
  rw [ricci_solder, lbCurv_sample_comp1, lbCurv_sample_comp2]
  norm_num

end
end Phys.Algebra
