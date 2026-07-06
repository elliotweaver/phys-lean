/-
  PROBE 4 (N357) — CONSOLIDATED FINAL SHAPES + axioms check.

  THE THEORY-NATIVE NODE: the FULL covariant derivative ∇_k = D_k + ⁅Γ_k,·⁆ unites the fold's TWO
  faces (N350 C6 directional derivative + N356 look-back transport commutator). FULL metric-
  compatibility ∇g=0 is the two banked layers CANCELLING: the derivative layer D(g)=k (N350) is
  exactly undone by the connection action Γᵀη+ηΓ=k (N347, from η²=1). Hence the metric g and its
  scalar multiples Λ·g are covariantly constant — the theory-native "+Λ g" of Lovelock, Λ the
  coefficient of the ONE covariantly-constant symmetric 2-tensor. Lovelock EXHAUSTIVENESS stays CITED.
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

/-- THE FULL COVARIANT DERIVATIVE of an operator field along the parameter (connection ← variation k):
    the SUM of the fold's TWO faces — the directional (C6) derivative `dH` (N350) and the look-back
    transport commutator `covTransport k (H 0) = ⁅Γk, H 0⁆` (N356). -/
def HasCovDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) (r : MetricEnd) : Prop :=
  ∃ dH : MetricEnd, HasOpDerivAt0 H dH ∧ r = dH + covTransport k (H 0)

/-- ∇ of a CONSTANT field is its covariant transport (derivative half vanishes) — ties N356. -/
theorem covDeriv_const (C k : MetricEnd) :
    HasCovDerivAt0 (fun _ => C) k (covTransport k C) := by
  refine ⟨0, const_opderiv _, ?_⟩; simp

/-- ∇ is UNIQUE (from N350 opderiv_unique on the derivative half). -/
theorem covDeriv_unique {H : Cut → MetricEnd} {k r₁ r₂ : MetricEnd}
    (h₁ : HasCovDerivAt0 H k r₁) (h₂ : HasCovDerivAt0 H k r₂) : r₁ = r₂ := by
  obtain ⟨d₁, hd₁, hr₁⟩ := h₁; obtain ⟨d₂, hd₂, hr₂⟩ := h₂
  rw [hr₁, hr₂, opderiv_unique hd₁ hd₂]

/-- ★★★ FULL METRIC-COMPATIBILITY ∇g = 0 — the two banked layers CANCEL. For the weak-field metric
    `g(t) = η + t•k` (variation k): (i) the DERIVATIVE layer is `D(g) = k` (N350 affine_opderiv);
    (ii) the CONNECTION action `Γᵀη + ηΓ = k` (N347 metricCompat, from η²=1). So the covariant
    derivative of the metric `∇g = D(g) − (Γᵀη + ηΓ) = k − k = 0`: the derivative of the metric is
    EXACTLY cancelled by the connection. Completes N356's bracket-only metric_covTransport_zero AND
    resolves N347's explicitly-childed derivative piece. -/
theorem metricField_covDeriv_zero (k : MetricEnd) :
    HasOpDerivAt0 (fun t => sigOpC + t • k) k
      ∧ k - (lbConnAdj k * sigOpC + sigOpC * lbConn k) = 0 := by
  refine ⟨affine_opderiv sigOpC k, ?_⟩
  rw [metricCompat]; abel

/-- ★★ THE COSMOLOGICAL TERM Λ·g IS COVARIANTLY CONSTANT: `∇(Λg) = 0` for ANY Λ. The derivative
    layer `D(Λg) = Λk` is cancelled by the scaled connection action. Λ is the coefficient of the ONE
    covariantly-constant symmetric 2-tensor — the theory-native "+Λ g" of Lovelock. The VALUE of Λ
    (the cosmological constant, a scale) is route-not-yet-found; the EXISTENCE of the term as
    divergence-free is fold-forced; Lovelock EXHAUSTIVENESS stays CITED. -/
theorem cosmoTerm_covDeriv_zero (Λ : Cut) (k : MetricEnd) :
    HasOpDerivAt0 (fun t => (Λ • sigOpC) + t • (Λ • k)) (Λ • k)
      ∧ (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 := by
  refine ⟨affine_opderiv (Λ • sigOpC) (Λ • k), ?_⟩
  rw [metricCompat]; abel

/-- ★ NON-VACUITY (W8): the FULL covariant derivative of a genuinely varying field is NONZERO. For
    the affine transport field with k=0 (bracket vanishes) the derivative layer alone gives
    Γ(offDiagVar) ≠ 0. -/
theorem covDeriv_nonvacuous :
    HasCovDerivAt0 (fun t => lbConn timeProj + t • lbConn offDiagVar) 0 (lbConn offDiagVar)
      ∧ lbConn offDiagVar ≠ 0 := by
  refine ⟨⟨lbConn offDiagVar, affine_opderiv _ _, ?_⟩, lbConn_offDiagVar_ne_zero⟩
  rw [show covTransport 0 (lbConn timeProj + (0:Cut) • lbConn offDiagVar) = 0 by
        unfold covTransport; rw [lbConn_flat]; simp]
  simp

/-- ★ NON-VACUITY (W8): the connection action is genuinely LOAD-BEARING for ∇g=0 — dropping the
    Christoffel ½ (naive transport η·k, giving 2k) makes the cancellation FAIL: k − 2k = −k ≠ 0 for
    the concrete timeProj. Mirrors N347 wrongConn_not_compatible at the ∇g level. -/
theorem metricCompat_half_load_bearing :
    (timeProj : MetricEnd) - ((timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj)) ≠ 0 := by
  rw [mul_assoc, eta_mul_self, mul_one, ← mul_assoc, eta_mul_self, one_mul]
  intro hcon
  have hz : (timeProj : MetricEnd) = 0 := by
    have h2 : timeProj - (timeProj + timeProj) = 0 := hcon
    linear_combination (norm := abel) -h2
  exact timeProj_ne_zero hz

end

end Phys.Algebra
