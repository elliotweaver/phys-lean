import Phys.Algebra.SpacetimeOperatorDerivative
import Phys.Algebra.SpacetimeCurvatureScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- === (1) transport linear laws ===
theorem lbConn_sub (a b : MetricEnd) : lbConn (a - b) = lbConn a - lbConn b := by
  unfold lbConn; rw [mul_sub, smul_sub]

theorem lbConn_neg (a : MetricEnd) : lbConn (-a) = - lbConn a := by
  have h : (-a : MetricEnd) = (0 : MetricEnd) - a := by abel
  rw [h, lbConn_sub, lbConn_flat, zero_sub]

-- === (2) operator-derivative neg/sub (via add+neg; no ContinuousSub STVC) ===
theorem opderiv_neg {K : Cut → MetricEnd} {b : MetricEnd}
    (hK : HasOpDerivAt0 K b) : HasOpDerivAt0 (fun t => - K t) (-b) := by
  rw [hasOpDerivAt0_iff] at hK ⊢
  intro v
  refine Tendsto.congr' ?_ ((hK v).neg)
  filter_upwards with s
  simp only [LinearMap.neg_apply]
  rw [← smul_neg]; congr 1; abel

theorem opderiv_sub {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  have h := opderiv_add hH (opderiv_neg hK)
  simpa [sub_eq_add_neg] using h

-- === (3) the derivative-level (dΓ) 2-form component ===
def dConn (a₁₂ a₂₁ : MetricEnd) : MetricEnd := lbConn a₁₂ - lbConn a₂₁

theorem dConn_eq (a₁₂ a₂₁ : MetricEnd) : dConn a₁₂ a₂₁ = lbConn (a₁₂ - a₂₁) := by
  unfold dConn; rw [lbConn_sub]

theorem dConn_antisymm (a₁₂ a₂₁ : MetricEnd) : dConn a₁₂ a₂₁ = - dConn a₂₁ a₁₂ := by
  unfold dConn; abel

theorem dConn_integrable_zero (a : MetricEnd) : dConn a a = 0 := by unfold dConn; abel

theorem dConn_grounded {f g : Cut → MetricEnd} {a₁₂ a₂₁ : MetricEnd}
    (hf : HasOpDerivAt0 f a₁₂) (hg : HasOpDerivAt0 g a₂₁) :
    HasOpDerivAt0 (fun t => lbConn (f t) - lbConn (g t)) (dConn a₁₂ a₂₁) :=
  opderiv_sub (lbConn_opderiv hf) (lbConn_opderiv hg)

theorem dConn_ne_zero : dConn offDiagVar 0 ≠ 0 := by
  unfold dConn; rw [lbConn_flat, sub_zero]; exact lbConn_offDiagVar_ne_zero

-- === (4) the full linearized curvature 2-form F = dΓ + Γ∧Γ ===
def linRiemann (a₁₂ a₂₁ k₁ k₂ : MetricEnd) : MetricEnd := dConn a₁₂ a₂₁ + lbCurv k₁ k₂

theorem linRiemann_eq (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann a₁₂ a₂₁ k₁ k₂ = lbConn (a₁₂ - a₂₁) + lbCurv k₁ k₂ := by
  unfold linRiemann; rw [dConn_eq]

theorem linRiemann_antisymm (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann a₁₂ a₂₁ k₁ k₂ = - linRiemann a₂₁ a₁₂ k₂ k₁ := by
  unfold linRiemann
  rw [dConn_antisymm a₁₂ a₂₁, lbCurv_antisymm k₁ k₂, neg_add]

theorem linRiemann_integrable (a k₁ k₂ : MetricEnd) :
    linRiemann a a k₁ k₂ = lbCurv k₁ k₂ := by
  unfold linRiemann; rw [dConn_integrable_zero, zero_add]

theorem linRiemann_flat : linRiemann 0 0 0 0 = 0 := by
  rw [linRiemann_integrable, lbCurv_flat_left]

theorem linRiemann_ne_zero :
    linRiemann timeProj timeProj timeProj offDiagVar ≠ 0 := by
  rw [linRiemann_integrable]; exact lbCurv_ne_zero

-- === (5) fiber-trace decomposition (trace sees only dΓ; blind to the commutator) ===
theorem linRiemann_fiberTrace_eq_dConn (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    LinearMap.trace Cut STVC (linRiemann a₁₂ a₂₁ k₁ k₂)
      = LinearMap.trace Cut STVC (dConn a₁₂ a₂₁) := by
  unfold linRiemann
  rw [map_add, fiberTrace_lbCurv_zero, add_zero]

theorem linRiemann_fiberTrace_integrable_zero (a k₁ k₂ : MetricEnd) :
    LinearMap.trace Cut STVC (linRiemann a a k₁ k₂) = 0 := by
  rw [linRiemann_fiberTrace_eq_dConn, dConn_integrable_zero, map_zero]

-- === (6) THE HEART: the two-layer structure ===
theorem curvature_twoLayer :
    (∀ a : MetricEnd, dConn a a = 0)
      ∧ (∀ a k₁ k₂ : MetricEnd, linRiemann a a k₁ k₂ = lbCurv k₁ k₂)
      ∧ linRiemann timeProj timeProj timeProj offDiagVar ≠ 0 :=
  ⟨dConn_integrable_zero, linRiemann_integrable, linRiemann_ne_zero⟩

end
end Phys.Algebra
