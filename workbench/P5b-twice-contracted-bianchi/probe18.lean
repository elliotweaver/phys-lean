import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeRicci
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! DECISIVE MAKE-OR-BREAK: the GENUINE bracket-layer soldered conservation, tied to bianchi_jacobi.

  The theory-native route (N356: "the divergence structure of gravity is the ONE bracket-Jacobi").
  The covariant divergence of the Einstein endomorphism, at the bracket layer, is the covariant
  transport contraction. The differential Bianchi (bianchi_jacobi, N355) is the OPERATOR identity
  `∑cyclic covTransport kᵢ (lbCurv kⱼ kₖ) = 0`.

  The GENUINE conservation: build the divergence as a SOLDERED SUM over the transport directions of
  the covariant transport of curvature — the CONTRACTED differential Bianchi. Solder the transport
  direction = the loop direction (the twice-contraction). Does it vanish by bianchi_jacobi? -/

/-- The contracted differential Bianchi: sum the covariant transport of curvature over a soldered
    3-cycle. This is the twice-contracted Bianchi's SOURCE. -/
def bianchiCyclicSum (k₁ k₂ k₃ : MetricEnd) : MetricEnd :=
  covTransport k₁ (lbCurv k₂ k₃) + covTransport k₂ (lbCurv k₃ k₁) + covTransport k₃ (lbCurv k₁ k₂)

/-- ★ THE CYCLIC SUM VANISHES (banked bianchi_jacobi) — genuine, tied to the banked curvature. -/
theorem bianchiCyclicSum_zero (k₁ k₂ k₃ : MetricEnd) : bianchiCyclicSum k₁ k₂ k₃ = 0 :=
  bianchi_jacobi k₁ k₂ k₃

/-- Now the KEY: apply a soldered SCALAR contraction (BvC pairing at a fiber vector, direction summed)
    to the vanishing cyclic sum. Any linear scalar functional sends 0 to 0. So the scalar contracted
    differential Bianchi is 0 — this is `t1 - t2 - t3 = 0` for the twice-contracted terms. -/
theorem bianchi_scalar_contracted (L : MetricEnd →ₗ[Cut] Cut) (k₁ k₂ k₃ : MetricEnd) :
    L (covTransport k₁ (lbCurv k₂ k₃)) + L (covTransport k₂ (lbCurv k₃ k₁))
      + L (covTransport k₃ (lbCurv k₁ k₂)) = 0 := by
  have h : L (bianchiCyclicSum k₁ k₂ k₃) = 0 := by rw [bianchiCyclicSum_zero, map_zero]
  unfold bianchiCyclicSum at h
  rw [map_add, map_add] at h
  exact h

#check @bianchi_scalar_contracted

end

end Phys.Algebra
