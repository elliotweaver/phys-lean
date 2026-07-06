/-
  N355 probe2 — the full production-shape content of the Bianchi = Jacobi node.
  The (second/differential) Bianchi identity is the Jacobi identity of the look-back-transport
  commutator, forced by the ASSOCIATIVITY of operator composition. Curvature = commutator (N348).
-/
import Phys.Algebra.SpacetimeEinsteinTensor
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The banked curvature IS the Lie bracket of the two look-back transports. -/

/-- ★ THE LOAD-BEARING CONNECTION: the banked curvature `lbCurv k₁ k₂ = [Γ₁,Γ₂]` (N348, the
    commutator of the two transports) is EXACTLY the Mathlib Lie bracket `⁅lbConn k₁, lbConn k₂⁆`
    of the associative endomorphism ring `MetricEnd`. This ties the banked derived curvature to the
    Lie structure whose Jacobi identity is the Bianchi identity. -/
theorem lbCurv_eq_bracket (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = ⁅lbConn k₁, lbConn k₂⁆ :=
  (LieRing.of_associative_ring_bracket (lbConn k₁) (lbConn k₂)).symm

/-! ## (2) The covariant transport action (the algebraic exterior covariant derivative). -/

/-- THE COVARIANT-TRANSPORT ACTION on an operator-valued object `C`: the adjoint action
    `covTransport k C = ⁅Γ(k), C⁆ = [lbConn k, C]`. This is the algebraic part of the exterior
    covariant derivative `D` (the `[A, ·]` term) acting on a curvature-valued object. -/
def covTransport (k C : MetricEnd) : MetricEnd := ⁅lbConn k, C⁆

theorem covTransport_apply (k C : MetricEnd) : covTransport k C = lbConn k * C - C * lbConn k :=
  LieRing.of_associative_ring_bracket (lbConn k) C

/-- The covariant transport action is ADDITIVE in the transported object `C` (bracket is additive). -/
theorem covTransport_add_right (k C₁ C₂ : MetricEnd) :
    covTransport k (C₁ + C₂) = covTransport k C₁ + covTransport k C₂ := by
  simp only [covTransport_apply]; noncomm_ring

/-- The covariant transport action is HOMOGENEOUS in the transported object `C`. -/
theorem covTransport_smul_right (c : Cut) (k C : MetricEnd) :
    covTransport k (c • C) = c • covTransport k C := by
  simp only [covTransport_apply]; rw [mul_smul_comm, smul_mul_assoc, smul_sub]

/-- The covariant transport action is ADDITIVE in the transport direction `k` (transport linear). -/
theorem covTransport_add_left (k₁ k₂ C : MetricEnd) :
    covTransport (k₁ + k₂) C = covTransport k₁ C + covTransport k₂ C := by
  simp only [covTransport_apply]; rw [lbConn_add]; noncomm_ring

/-- The covariant transport action is HOMOGENEOUS in the transport direction `k`. -/
theorem covTransport_smul_left (c : Cut) (k C : MetricEnd) :
    covTransport (c • k) C = c • covTransport k C := by
  simp only [covTransport_apply]; rw [lbConn_smul, smul_mul_assoc, mul_smul_comm, smul_sub]

/-! ## (3) THE HEART: the (second) Bianchi identity IS the Jacobi identity. -/

/-- ★★★ THE BIANCHI IDENTITY as the JACOBI IDENTITY. The cyclic sum of the covariant-transport
    action on the curvature of the other two loop directions VANISHES:
        `D_{k₁} R(k₂,k₃) + D_{k₂} R(k₃,k₁) + D_{k₃} R(k₁,k₂) = 0`.
    In standard GR the (second/differential) Bianchi identity `∇_[a R_bc]de = 0` is proved by a
    coordinate computation on the Riemann tensor. Here it DISSOLVES: curvature is the transport
    commutator (`lbCurv_eq_bracket`, banked N348), so the Bianchi identity is exactly the Jacobi
    identity `lie_jacobi` of the transport bracket — FORCED by the ASSOCIATIVITY of operator
    composition (the `leibniz_lie` that grounds `lie_jacobi` is the associativity of `MetricEnd`).
    ONE CAUSE (composition of look-backs is associative), the divergence structure of gravity. -/
theorem bianchi_jacobi (k₁ k₂ k₃ : MetricEnd) :
    covTransport k₁ (lbCurv k₂ k₃)
      + covTransport k₂ (lbCurv k₃ k₁)
      + covTransport k₃ (lbCurv k₁ k₂) = 0 := by
  unfold covTransport
  rw [lbCurv_eq_bracket, lbCurv_eq_bracket, lbCurv_eq_bracket]
  exact lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)

/-- The Bianchi identity written PURELY in the banked curvature and the raw transport bracket —
    the covariant transport of the curvature is the double bracket `[Γ(k), [Γ(a),Γ(b)]]`. -/
theorem covTransport_curv (k a b : MetricEnd) :
    covTransport k (lbCurv a b) = ⁅lbConn k, ⁅lbConn a, lbConn b⁆⁆ := by
  unfold covTransport; rw [lbCurv_eq_bracket]

/-- ★★★ THE ONE CAUSE MADE EXPLICIT: the Bianchi identity is FORCED by the associativity of
    operator composition. The `leibniz_lie` law (`⁅x,⁅y,z⁆⁆ = ⁅⁅x,y⁆,z⁆ + ⁅y,⁅x,z⁆⁆`) that grounds
    the Jacobi identity holds for `MetricEnd` precisely because operator composition is associative;
    the cyclic sum then telescopes to `0`. This bundles the load-bearing connection (curvature =
    bracket) with the Bianchi identity, exhibiting the divergence structure as the fold's own
    associativity carried by the look-back transport. -/
theorem bianchi_from_associativity (k₁ k₂ k₃ : MetricEnd) :
    (∀ a b : MetricEnd, lbCurv a b = ⁅lbConn a, lbConn b⁆)
      ∧ covTransport k₁ (lbCurv k₂ k₃)
          + covTransport k₂ (lbCurv k₃ k₁)
          + covTransport k₃ (lbCurv k₁ k₂) = 0 :=
  ⟨lbCurv_eq_bracket, bianchi_jacobi k₁ k₂ k₃⟩

/-! ## (4) NON-VACUITY (W8): the Bianchi identity is a genuine cancellation of nonzero curvatures. -/

/-- The curvature-bracket is genuinely NONZERO for the concrete pair — the transports fail to
    commute, so the Bianchi identity is not a vacuous `0 = 0` (the terms being cancelled are real). -/
theorem curvBracket_ne_zero : ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 := by
  rw [← lbCurv_eq_bracket]; exact lbCurv_ne_zero

/-- The covariant transport of the concrete curvature is itself NONZERO: transporting the nonzero
    curvature `R(offDiagVar,timeProj)` along `timeProj` gives a nonzero object, so the Bianchi
    cancellation is genuine, not termwise-trivial. Applied to `(0,1,0)` its first component is `⅛`. -/
theorem covTransport_curv_ne_zero :
    covTransport timeProj (lbCurv offDiagVar timeProj) ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0:Cut),(1:Cut),(0:O Cut))).1) hcon
  rw [covTransport_apply] at h
  simp only [LinearMap.zero_apply, Prod.fst_zero, LinearMap.sub_apply, Module.End.mul_apply,
    lbCurv_eq, lbConn, LinearMap.smul_apply, sigOpC_apply, timeProj_apply, offDiagVar_apply,
    Prod.smul_fst, Prod.fst_sub, neg_zero, Prod.smul_snd] at h
  norm_num at h

/-- ★★ NON-VACUITY (W8): the Bianchi identity holds AND the curvature it acts on is genuinely
    nonzero — the identity is a real cancellation of nonzero terms, not a vacuous `0 = 0`. -/
theorem bianchi_nonvacuous :
    (covTransport timeProj (lbCurv offDiagVar timeProj)
      + covTransport offDiagVar (lbCurv timeProj timeProj)
      + covTransport timeProj (lbCurv timeProj offDiagVar) = 0)
      ∧ ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 :=
  ⟨bianchi_jacobi timeProj offDiagVar timeProj, curvBracket_ne_zero⟩

end

end Phys.Algebra
