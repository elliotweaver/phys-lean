import Phys.Algebra.SpacetimeRiemannAssembly
import Mathlib.LinearAlgebra.Trace

/-
  PROBE 1 (N352 SELECT measurement) — the GENUINE TENSORIAL RICCI via the soldering/gradient map.

  Hypothesis: the 3× deferral (N348/N349/N351) mis-diagnosed the ceiling. The BLIND trace is the
  ENDOMORPHISM/fiber trace of lbCurv (trace[Γ₁,Γ₂]=0). The genuine RICCI is the trace over the
  LOOP-SOURCE index: Ric(Y,Z) = trace(X ↦ R(X,Y)Z), which needs the SOLDERING map
  G : STVC →ₗ MetricEnd (G X = ∂_X h, the field gradient N350 grounds) to expose the loop direction
  as a tangent vector. R(X,Y) = lbCurv (G X) (G Y). For a rank-2 G the ricMap becomes RANK-1
  (X ↦ ρ(X)•w), so trace_smulRight gives ρ(w) — CHEAP, no 10-dim brute force.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (A) The curvature endomorphism as a function of two tangent directions via the soldering map G.
--     R(X,Y) := lbCurv (G X) (G Y) : MetricEnd  (an endomorphism of STVC).
--     ricMap G Y Z : STVC →ₗ[Cut] STVC  is  X ↦ (lbCurv (G X) (G Y)) Z.
--     Need it LINEAR in X to take its trace.

-- Is X ↦ lbCurv (G X) (G Y) Z linear? lbCurv is bilinear (lbCurv_add_left/smul_left), G linear,
-- evaluation-at-Z linear. Build it as a composite LinearMap.

variable (G : STVC →ₗ[Cut] MetricEnd)

-- The "curvature at direction X, second slot fixed to (G Y), evaluated at Z"
-- Construct: evalZ ∘ (lbCurv · (G Y)) ∘ G
-- First: the map k ↦ lbCurv k (G Y) : MetricEnd →ₗ MetricEnd (linear via lbCurv_add_left/smul_left).

def lbCurvLeft (kY : MetricEnd) : MetricEnd →ₗ[Cut] MetricEnd where
  toFun k := lbCurv k kY
  map_add' k₁ k₂ := lbCurv_add_left k₁ k₂ kY
  map_smul' c k := by simp only [RingHom.id_apply]; exact lbCurv_smul_left c k kY

-- evaluation at Z : MetricEnd →ₗ[Cut] STVC
def evalAt (Z : STVC) : MetricEnd →ₗ[Cut] STVC := LinearMap.applyₗ Z

-- ricMap G Y Z : STVC →ₗ STVC  =  (evalAt Z) ∘ (lbCurvLeft (G Y)) ∘ G
def ricMap (Y Z : STVC) : STVC →ₗ[Cut] STVC :=
  (evalAt Z).comp ((lbCurvLeft (G Y)).comp G)

theorem ricMap_apply (Y Z X : STVC) : ricMap G Y Z X = lbCurv (G X) (G Y) Z := rfl

-- (B) The Ricci scalar-per-(Y,Z): the trace over the loop-source index.
def ricci (Y Z : STVC) : Cut := LinearMap.trace Cut STVC (ricMap G Y Z)

#check @LinearMap.trace_smulRight
#check @LinearMap.applyₗ

end

end Phys.Algebra
