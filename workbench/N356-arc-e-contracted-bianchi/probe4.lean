/-
  N356 probe4 — the FULL candidate production content + non-vacuity witnesses.
  Framing: the DIVERGENCE STRUCTURE of gravity is the JACOBI bracket; the naive scalar divergence
  (fiber trace) is BLIND (N349 self-blindness at conservation); the metric term is transport-inert
  so genuine ∇^μG_μν=0 lives in the childed derivative layer.
-/
import Phys.Algebra.SpacetimeBianchi

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- ★ THE FIBER-TRACE NO-GO for the divergence: trace(covTransport k C) = 0 identically.
    The naive "divergence-as-endomorphism-fiber-trace" of the covariantly-transported curvature is
    content-free — the N349 fiber-trace blindness recurring at the CONSERVATION level. -/
theorem divFiberTrace_blind (k C : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k C) = 0 :=
  LinearMap.trace_lie _ _

/-- The whole differential Bianchi, fiber-traced, is a VACUOUS 0 = 0 (each summand blind). -/
theorem bianchi_fiberTrace_vacuous (k₁ k₂ k₃ : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k₁ (lbCurv k₂ k₃))
      + LinearMap.trace Cut STVC (covTransport k₂ (lbCurv k₃ k₁))
      + LinearMap.trace Cut STVC (covTransport k₃ (lbCurv k₁ k₂)) = 0 := by
  rw [divFiberTrace_blind, divFiberTrace_blind, divFiberTrace_blind, add_zero, add_zero]

/-- ★★★ THE RICCI IDENTITY (curvature = failure of covariant transports to commute):
    D_a(D_b C) − D_b(D_a C) = ⁅R(a,b), C⁆. The operator-level prerequisite for the contracted
    Bianchi (commuting covariant derivatives). Forced by the SAME Jacobi (lie_lie) as N355's
    differential Bianchi — the divergence structure of gravity is the ONE bracket-Jacobi. -/
theorem ricci_identity (a b C : MetricEnd) :
    covTransport a (covTransport b C) - covTransport b (covTransport a C)
      = ⁅lbCurv a b, C⁆ := by
  rw [lbCurv_eq_bracket]
  exact (lie_lie (lbConn a) (lbConn b) C).symm

/-- The covariant transport of the EINSTEIN endomorphism equals that of the RICCI endomorphism:
    the ½R·id trace-reversal metric term is bracket-inert (⁅Γk, ½R·id⁆ = 0). So at the algebraic
    (bracket) layer the transport of G = the transport of Ric; the metric term's contribution to
    conservation lives ENTIRELY in its derivative (∇_ν R, the childed derivative layer). This is the
    STRUCTURAL reason the genuine ∇^μ G_μν = 0 needs the derivative layer, not the bracket layer. -/
theorem einstein_covTransport_eq_ricci (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) := by
  unfold einsteinRaiseMap
  rw [show covTransport k (ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd))
        = covTransport k (ricciRaiseMap G)
          - covTransport k ((2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) from by
      unfold covTransport; rw [lie_sub],
    covTransport_smul_right,
    show covTransport k (LinearMap.id : MetricEnd) = 0 from by
      rw [covTransport_apply, ← Module.End.one_eq_id, mul_one, one_mul, sub_self],
    smul_zero, sub_zero]

/-! ## NON-VACUITY (W8): the Ricci identity is a real identity of nonzero curvature. -/

/-- The concrete curvature bracketed with a concrete transport is NONZERO — measure. -/
theorem ricciId_rhs_ne_zero :
    ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0 := by
  sorry

end

end Phys.Algebra
