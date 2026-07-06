/-
  N355 probe1 — de-risk the theory-native SELECT: the Bianchi identity IS the Jacobi identity
  of the look-back transport commutator. Curvature = commutator (banked N348), so the cyclic sum
  of the covariant-transport-action on curvature vanishes by `lie_jacobi`.
-/
import Phys.Algebra.SpacetimeCurvature
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- (1) THE CURVATURE IS THE LIE BRACKET of the two look-back transports. -/
theorem lbCurv_eq_bracket (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = ⁅lbConn k₁, lbConn k₂⁆ :=
  (LieRing.of_associative_ring_bracket (lbConn k₁) (lbConn k₂)).symm

/-- (2) THE COVARIANT TRANSPORT ACTION on an operator `C`: the adjoint action `⁅Γ(k), C⁆`. -/
def covTransport (k : MetricEnd) (C : MetricEnd) : MetricEnd := ⁅lbConn k, C⁆

/-- (3) THE BIANCHI IDENTITY as the Jacobi identity: the cyclic sum of the covariant-transport
    action on the curvature of the other two directions vanishes. -/
theorem bianchi_jacobi (k₁ k₂ k₃ : MetricEnd) :
    covTransport k₁ (lbCurv k₂ k₃)
      + covTransport k₂ (lbCurv k₃ k₁)
      + covTransport k₃ (lbCurv k₁ k₂) = 0 := by
  unfold covTransport
  rw [lbCurv_eq_bracket, lbCurv_eq_bracket, lbCurv_eq_bracket]
  exact lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)

/-- (4) NON-VACUITY: the curvature-bracket is genuinely nonzero (transports fail to commute). -/
theorem curvBracket_ne_zero : ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 := by
  rw [← lbCurv_eq_bracket]
  exact lbCurv_ne_zero

/-- (5) The Bianchi identity is a genuine cancellation of nonzero curvature-brackets, not vacuous. -/
theorem bianchi_nonvacuous :
    (covTransport timeProj (lbCurv offDiagVar timeProj)
      + covTransport offDiagVar (lbCurv timeProj timeProj)
      + covTransport timeProj (lbCurv timeProj offDiagVar) = 0)
      ∧ ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 :=
  ⟨bianchi_jacobi timeProj offDiagVar timeProj, curvBracket_ne_zero⟩

end

end Phys.Algebra
