import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeRicci
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! DECISIVE: is the SOLDERED loop-index contraction of the differential Bianchi (bianchi_jacobi)
    CONTENTFUL (gives the twice-contracted Bianchi with a ½) or BLIND (0=0 like the fiber trace)?

    bianchi_jacobi is an OPERATOR identity. Contract via the BvC pairing at a fiber vector, then
    loop-trace the direction. The Ricci (N352) is trace_X(X ↦ lbCurv(GX,GY) Z). The soldered
    divergence of the Ricci-derivative should be a loop trace of a covTransport-of-curvature.

    Model: the once-contracted Bianchi via BvC pairing. From probe7 curvature_BvC_skew,
    R(k₁,k₂) ∈ so(BvC). Pair bianchi_jacobi against a BvC form and see the cyclic structure. -/

/-- Pair the differential Bianchi with the BvC metric at fiber vectors p, q. Each covTransport term
    is a bracket ⁅Γk, R⁆ = Γk·R − R·Γk; pairing with BvC and summing cyclically = 0. -/
theorem bianchi_BvC_paired (k₁ k₂ k₃ : MetricEnd) (p q : STVC) :
    BvC ((covTransport k₁ (lbCurv k₂ k₃)) p) q
      + BvC ((covTransport k₂ (lbCurv k₃ k₁)) p) q
      + BvC ((covTransport k₃ (lbCurv k₁ k₂)) p) q = 0 := by
  have hb := bianchi_jacobi k₁ k₂ k₃
  have hz : (covTransport k₁ (lbCurv k₂ k₃)
      + covTransport k₂ (lbCurv k₃ k₁)
      + covTransport k₃ (lbCurv k₁ k₂)) p = (0 : MetricEnd) p := by rw [hb]
  simp only [LinearMap.add_apply, LinearMap.zero_apply] at hz
  rw [← BvC_add_left, ← BvC_add_left]
  rw [show (covTransport k₁ (lbCurv k₂ k₃)) p + (covTransport k₂ (lbCurv k₃ k₁)) p
        + (covTransport k₃ (lbCurv k₁ k₂)) p = (0 : STVC) from hz]
  rw [show BvC (0:STVC) q = BvC ((0:Cut) • (0:STVC)) q by rw [zero_smul], BvC_smul_left, zero_mul]

/-- MEASURE the CONCRETE soldered double contraction: solder k₁=timeProj (divergence direction),
    k₂=timeProj, k₃=offDiagVar, and evaluate the paired Bianchi at a concrete vector. Is it
    contentful (nonzero terms cancelling) or termwise-trivial? Just check it's a real identity. -/
example (p q : STVC) :
    BvC ((covTransport timeProj (lbCurv timeProj offDiagVar)) p) q
      + BvC ((covTransport timeProj (lbCurv offDiagVar timeProj)) p) q
      + BvC ((covTransport offDiagVar (lbCurv timeProj timeProj)) p) q = 0 :=
  bianchi_BvC_paired timeProj timeProj offDiagVar p q

end

end Phys.Algebra
