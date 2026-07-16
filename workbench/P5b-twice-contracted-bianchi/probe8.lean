import Phys.Algebra.SpacetimeDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- BvC(lbConn k p, q) = ½ EvC(k p, q). The η↔BvC bridge (probe2). -/
theorem bvc_lbConn (k : MetricEnd) (p q : STVC) :
    BvC ((lbConn k) p) q = (2⁻¹ : Cut) * EvC (k p) q := by
  unfold lbConn
  rw [LinearMap.smul_apply, BvC_smul_left]
  rw [BvC_eq_EvC_sigOpC]
  rw [Module.End.mul_apply, sigOpC_isEvCAdjoint_self (k p) (sigOpC q)]
  rw [← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

/-- The EvC-adjoint reversal for a self-adjoint triple: EvC(k₁·(η·(k₂·p)), q) = EvC(p, k₂·(η·(k₁·q))).
    (k₁ η k₂)* = k₂ η k₁, from three self-adjoint moves. -/
theorem evc_triple_reverse {k₁ k₂ : MetricEnd}
    (hk₁ : IsEvCAdjoint k₁ k₁) (hk₂ : IsEvCAdjoint k₂ k₂) (p q : STVC) :
    EvC (k₁ (sigOpC (k₂ p))) q = EvC p (k₂ (sigOpC (k₁ q))) := by
  rw [hk₁ (sigOpC (k₂ p)) q, sigOpC_isEvCAdjoint_self (k₂ p) (k₁ q), hk₂ p (sigOpC (k₁ q))]

/-- ★ THE RIEMANN SECOND-PAIR ANTISYMMETRY: for symmetric metric variations, the curvature is
    BvC-SKEW (R(k₁,k₂) ∈ so(BvC)) — the second-pair antisymmetry R_{abcd} = -R_{abdc}. This is
    metric compatibility (∇g=0) made manifest at the curvature level. -/
theorem curvature_BvC_skew {k₁ k₂ : MetricEnd}
    (hk₁ : IsEvCAdjoint k₁ k₁) (hk₂ : IsEvCAdjoint k₂ k₂) (p q : STVC) :
    BvC ((lbCurv k₁ k₂) p) q + BvC p ((lbCurv k₁ k₂) q) = 0 := by
  rw [lbCurv]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [BvC_sub_left, BvC_sub_right]
  rw [bvc_lbConn k₁ (lbConn k₂ p) q, bvc_lbConn k₂ (lbConn k₁ p) q]
  rw [BvC_symm p (lbConn k₁ (lbConn k₂ q)), BvC_symm p (lbConn k₂ (lbConn k₁ q))]
  rw [bvc_lbConn k₁ (lbConn k₂ q) p, bvc_lbConn k₂ (lbConn k₁ q) p]
  -- Γᵢ w = lbConn kᵢ w = ½ • sigOpC(kᵢ w). Unfold and use triple reverse.
  unfold lbConn
  simp only [LinearMap.smul_apply, Module.End.mul_apply, map_smul]
  rw [EvC_smul_left, EvC_smul_left, EvC_smul_left, EvC_smul_left]
  rw [evc_triple_reverse hk₁ hk₂ p q, evc_triple_reverse hk₂ hk₁ p q]
  rw [EvC_symm p (k₂ (sigOpC (k₁ q))), EvC_symm p (k₁ (sigOpC (k₂ q)))]
  ring

end

end Phys.Algebra
