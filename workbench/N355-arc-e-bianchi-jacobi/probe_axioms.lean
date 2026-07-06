import Phys.Algebra.SpacetimeEinsteinTensor
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

theorem lbCurv_eq_bracket (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = ⁅lbConn k₁, lbConn k₂⁆ :=
  (LieRing.of_associative_ring_bracket (lbConn k₁) (lbConn k₂)).symm

def covTransport (k C : MetricEnd) : MetricEnd := ⁅lbConn k, C⁆

theorem bianchi_jacobi (k₁ k₂ k₃ : MetricEnd) :
    covTransport k₁ (lbCurv k₂ k₃)
      + covTransport k₂ (lbCurv k₃ k₁)
      + covTransport k₃ (lbCurv k₁ k₂) = 0 := by
  unfold covTransport
  rw [lbCurv_eq_bracket, lbCurv_eq_bracket, lbCurv_eq_bracket]
  exact lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)

end
#print axioms lbCurv_eq_bracket
#print axioms bianchi_jacobi
end Phys.Algebra
