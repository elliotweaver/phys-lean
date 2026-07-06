/-
  PROBE 2 (N357) — MEASURE the full theory-native claim set BEFORE committing SELECT.

  Candidate node: THE FULL COVARIANT DERIVATIVE ∇_k = D_k + ⁅Γ_k,·⁆ (the fold's TWO faces —
  N350 C6 directional derivative + N356 look-back transport commutator), FULL metric-compatibility
  ∇g=0 (both layers, completing N356's bracket-only half), and the COVARIANTLY-CONSTANT METRIC
  forcing the cosmological term Λ·g as the second divergence-free symmetric 2-tensor (the
  theory-native "+Λ g_μν" of Lovelock — Λ the coefficient of the covariantly-constant piece, not a
  posited free parameter; Lovelock EXHAUSTIVENESS stays a CITED import).
-/
import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The full covariant derivative: directional (C6) derivative + look-back transport bracket. -/
def HasCovDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) (r : MetricEnd) : Prop :=
  ∃ dH : MetricEnd, HasOpDerivAt0 H dH ∧ r = dH + covTransport k (H 0)

/-- (M1) The covariant derivative of a CONSTANT operator field IS its covariant transport (bracket)
    — the derivative half vanishes, so ∇ of a constant field = ⁅Γk, C⁆. This ties N356 covTransport
    into the full picture: covTransport is ∇ of the covariantly-transported (constant) field. -/
theorem covDeriv_const (C k : MetricEnd) :
    HasCovDerivAt0 (fun _ => C) k (covTransport k C) := by
  refine ⟨0, const_opderiv _, ?_⟩
  simp

/-- (M2) FULL metric-compatibility ∇g = 0: BOTH layers vanish on the raised metric (= identity).
    Completes N356's bracket-only metric_covTransport_zero. -/
theorem metric_covDeriv_zero (k : MetricEnd) :
    HasCovDerivAt0 (fun _ => (LinearMap.id : MetricEnd)) k 0 := by
  refine ⟨0, const_opderiv _, ?_⟩
  rw [metric_covTransport_zero]; simp

/-- (M3) THE COSMOLOGICAL TERM IS COVARIANTLY CONSTANT: ∇(Λ·g) = 0 for ANY Λ. The metric raise is
    the central identity; scaling by Λ stays central + constant, so both layers vanish. This is the
    theory-native "+Λ g_μν" — Λ the coefficient of the covariantly-constant 2-tensor. -/
theorem cosmoTerm_covDeriv_zero (Λ : Cut) (k : MetricEnd) :
    HasCovDerivAt0 (fun _ => Λ • (LinearMap.id : MetricEnd)) k 0 := by
  refine ⟨0, const_opderiv _, ?_⟩
  rw [covTransport_smul_right, metric_covTransport_zero]; simp

/-- (M4) UNIQUENESS of the covariant derivative (from opderiv_unique on the derivative half). -/
theorem covDeriv_unique {H : Cut → MetricEnd} {k r₁ r₂ : MetricEnd}
    (h₁ : HasCovDerivAt0 H k r₁) (h₂ : HasCovDerivAt0 H k r₂) : r₁ = r₂ := by
  obtain ⟨d₁, hd₁, hr₁⟩ := h₁
  obtain ⟨d₂, hd₂, hr₂⟩ := h₂
  rw [hr₁, hr₂, opderiv_unique hd₁ hd₂]

/-- (M5) NON-VACUITY: the full covariant derivative of a genuinely varying field is NONZERO. For the
    constant-but-nonzero-bracket field `fun _ => lbConn offDiagVar`, ∇ = covTransport timeProj
    (lbConn offDiagVar) — need to check this is nonzero. Try the curvature bracket instead. -/
theorem covDeriv_nonvacuous_bracket :
    HasCovDerivAt0 (fun _ => lbCurv offDiagVar timeProj) timeProj
      (covTransport timeProj (lbCurv offDiagVar timeProj))
      ∧ covTransport timeProj (lbCurv offDiagVar timeProj) ≠ 0 :=
  ⟨covDeriv_const _ _, covTransport_curv_ne_zero⟩

/-- (M6) NON-VACUITY via the DERIVATIVE layer: the affine field `t ↦ Γ(timeProj) + t•Γ(offDiagVar)`
    has covariant derivative (at k=0, so bracket vanishes) = Γ(offDiagVar) ≠ 0 — the derivative
    layer is genuine. -/
theorem covDeriv_nonvacuous_deriv :
    HasCovDerivAt0 (fun t => lbConn timeProj + t • lbConn offDiagVar) 0 (lbConn offDiagVar)
      ∧ lbConn offDiagVar ≠ 0 := by
  refine ⟨⟨lbConn offDiagVar, affine_opderiv _ _, ?_⟩, lbConn_offDiagVar_ne_zero⟩
  -- covTransport 0 (H 0) = ⁅lbConn 0, H 0⁆ = ⁅0, _⁆ = 0
  rw [show covTransport 0 (lbConn timeProj + (0:Cut) • lbConn offDiagVar) = 0 by
        unfold covTransport; rw [lbConn_flat]; simp]
  simp

end

end Phys.Algebra
