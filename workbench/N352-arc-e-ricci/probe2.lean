import Phys.Algebra.SpacetimeRiemannAssembly
import Mathlib.LinearAlgebra.Trace

/-
  PROBE 2 (N352 SELECT) — NON-VACUITY of the genuine tensorial Ricci via a concrete soldering map.
  The RICCI is faithful where the fiber trace (N349/N351) is blind.

  G X = X.1 • timeProj + X.2.1 • offDiagVar  (the field gradient: each tangent direction solders
  to "its" metric variation). Rank-2 ⟹ ricMap is RANK-1 ⟹ trace via trace_smulRight (cheap).
-/

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

-- The concrete rank-2 soldering witness.
def solderWit : STVC →ₗ[Cut] MetricEnd :=
  (LinearMap.fst Cut Cut (Cut × O Cut)).smulRight timeProj
    + ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))).smulRight offDiagVar

theorem solderWit_apply (X : STVC) :
    solderWit X = X.1 • timeProj + X.2.1 • offDiagVar := by
  simp only [solderWit, LinearMap.add_apply, LinearMap.smulRight_apply, LinearMap.fst_apply,
    LinearMap.comp_apply, LinearMap.snd_apply]

-- MEASURE: try to reduce ricMap solderWit Y Z to a rank-1 map and get a nonzero trace.
-- First, is ricci solderWit (0,1,0) (0,1,0) nonzero? Compute directly.
example : True := by
  -- probe: expand ricMap solderWit at the sample and see the goal shape.
  trivial

-- Direct rank-1 identity attempt: for the sample Y=Z=(0,1,0),
-- ricMap solderWit Y Z = ρ.smulRight w  where w = lbCurv timeProj offDiagVar Z (since G Y = timeProj·0 + 1·offDiagVar... wait Y.1=0,Y.2.1=1 so G Y = offDiagVar).
-- Let me just check what G(0,1,0) is:
theorem GY_sample : solderWit ((0:Cut),(1:Cut),(0:O Cut)) = offDiagVar := by
  rw [solderWit_apply]
  simp only [zero_smul, one_smul, zero_add]

#check @LinearMap.trace_smulRight

end

end Phys.Algebra
