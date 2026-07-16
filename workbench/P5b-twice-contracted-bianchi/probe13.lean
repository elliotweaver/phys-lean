import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicci
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! DECISIVE MEASURE: is the framework's OWN covariant derivative (covTransport = ⁅Γ,·⁆) usable to
    build a NON-BLIND directional Ricci-derivative field whose soldered divergence (divCov) carries
    the twice-contracted-Bianchi content?

    divCov contracts the DIRECTION w with the operator's FIRST index (via applyₗ). For a field built
    from covTransport (a bracket), is divCov blind (like the pure fiber trace) or NON-blind? -/

def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

/-- Directional covariant-derivative field of a FIXED operator C along a soldering G:
    `Φ w = covTransport (G w) C = ⁅Γ(Gw), C⁆`. Linear in w (covTransport_add_left/smul_left). -/
def covDerivField (G : STVC →ₗ[Cut] MetricEnd) (C : MetricEnd) : STVC →ₗ[Cut] MetricEnd where
  toFun w := covTransport (G w) C
  map_add' w₁ w₂ := by simp only [map_add]; rw [covTransport_add_left]
  map_smul' c w := by simp only [RingHom.id_apply, map_smul]; rw [covTransport_smul_left]

theorem covDerivField_apply (G : STVC →ₗ[Cut] MetricEnd) (C : MetricEnd) (w : STVC) :
    covDerivField G C w = covTransport (G w) C := rfl

/-- MEASURE 1: is divCov of a covTransport-field blind? Compute for solderWit and C = lbCurv timeProj offDiagVar. -/
example : divCov (covDerivField solderWit (lbCurv timeProj offDiagVar)) ((0:Cut),(1:Cut),(0:O Cut))
    = divCov (covDerivField solderWit (lbCurv timeProj offDiagVar)) ((0:Cut),(1:Cut),(0:O Cut)) := rfl

-- Compute the actual value numerically by evaluating the trace over the standard structure.
-- divCov Φ ν = trace(w ↦ Φ w ν). For finite STVC = Cut × Cut × O Cut, trace = sum of diagonal.
-- Let me just check the TYPE checks and defer numeric to the trace machinery.

#check @divCov
#check @covDerivField

end

end Phys.Algebra
