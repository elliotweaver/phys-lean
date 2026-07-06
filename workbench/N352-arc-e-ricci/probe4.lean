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

-- MEASURE (A): is ricMap ADDITIVE / SMUL in Z (Z-linearity of ricci)? evalAt is linear in Z.
-- ricMap G Y (Z₁+Z₂) vs ricMap G Y Z₁ + ricMap G Y Z₂
example (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    ricMap G Y (Z₁ + Z₂) = ricMap G Y Z₁ + ricMap G Y Z₂ := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, LinearMap.add_apply, map_add]

-- MEASURE (B): ricci additive in Z (trace is linear).
example (G : STVC →ₗ[Cut] MetricEnd) (Y Z₁ Z₂ : STVC) :
    ricci G Y (Z₁ + Z₂) = ricci G Y Z₁ + ricci G Y Z₂ := by
  unfold ricci
  rw [show ricMap G Y (Z₁ + Z₂) = ricMap G Y Z₁ + ricMap G Y Z₂ from by
    refine LinearMap.ext fun X => ?_
    simp only [ricMap_apply, LinearMap.add_apply, map_add], map_add]

-- MEASURE (C): ricci additive in Y (lbCurvLeft depends on G Y; lbCurv_add_right).
example (G : STVC →ₗ[Cut] MetricEnd) (Y₁ Y₂ Z : STVC) :
    ricMap G (Y₁ + Y₂) Z = ricMap G Y₁ Z + ricMap G Y₂ Z := by
  refine LinearMap.ext fun X => ?_
  simp only [ricMap_apply, LinearMap.add_apply, map_add]
  rw [lbCurv_add_right]
  simp only [LinearMap.add_apply]

-- MEASURE (D): Ricci SYMMETRY? ricci G Y Z =? ricci G Z Y. Check with solderWit sample —
-- likely NOT symmetric here (Bianchi/pair-symmetry is a separate beat → child).
def solderWit : STVC →ₗ[Cut] MetricEnd :=
  (LinearMap.fst Cut Cut (Cut × O Cut)).smulRight timeProj
    + ((LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))).smulRight offDiagVar

#check @LinearMap.applyₗ

end
end Phys.Algebra
