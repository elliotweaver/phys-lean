import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! Attempt: express a soldered/loop-index contraction of the banked differential Bianchi
    (bianchi_jacobi, N355) and see what NON-BLIND scalar it yields.

    N356: the FIBER trace of covTransport is blind. But the LOOP-index (soldered) contraction is
    non-blind. bianchi_jacobi is an OPERATOR identity summing to 0. Contract each operator via a
    soldered loop-trace and a fiber evaluation to a scalar. The sum stays 0. Question: does the
    resulting scalar identity carry Ricci-divergence content (the ½)? -/

-- The soldered curvature over G: R(X,Y) := lbCurv (G X) (G Y) : MetricEnd.
-- Ricci: trace_X (X ↦ R(X,Y) Z). The twice-contracted Bianchi contracts the DERIVATIVE index.
-- covTransport realizes the covariant derivative D_k in the commutator framework.
-- Try: contract the soldered bianchi_jacobi with the loop-trace to see the structure.

/-- The loop-source trace of a soldered covariant-transport-of-curvature term: contract the
    loop-source direction (via a soldering G) against the transported curvature's fiber, at Z.
    `divRicTerm G kDir Y Z := trace_X (X ↦ (covTransport (G X) (lbCurv (G kDir') (G Y))) Z)` ...
    This is getting complicated. Test the SIMPLEST scalar contraction of bianchi_jacobi:
    apply to a vector p, pair with q via BvC, and see if summands relate. -/

-- Simplest: bianchi_jacobi applied at a vector, BvC-paired, is a scalar cyclic identity = 0.
example (k₁ k₂ k₃ : MetricEnd) (p q : STVC) :
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
  show BvC (0 : STVC) q = 0
  rw [show BvC (0:STVC) q = BvC ((0:Cut) • (0:STVC)) q by rw [zero_smul], BvC_smul_left, zero_mul]

end

end Phys.Algebra
