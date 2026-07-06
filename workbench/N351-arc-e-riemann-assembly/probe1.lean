import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- lbConn_sub helper
theorem lbConn_sub_probe (a b : MetricEnd) : lbConn (a - b) = lbConn a - lbConn b := by
  unfold lbConn; rw [mul_sub, smul_sub]

-- opderiv_sub (difference of derivatives)
theorem opderiv_sub_probe {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  rw [hasOpDerivAt0_iff] at hH hK ⊢
  intro v
  refine Tendsto.congr' ?_ ((hH v).sub (hK v))
  filter_upwards with s
  simp only [LinearMap.sub_apply]
  rw [← smul_sub]; congr 1; abel

-- dConn : the dΓ 2-form component = antisymmetrized transport of the second variations
def dConn_probe (a₁₂ a₂₁ : MetricEnd) : MetricEnd := lbConn a₁₂ - lbConn a₂₁

theorem dConn_eq_probe (a₁₂ a₂₁ : MetricEnd) :
    dConn_probe a₁₂ a₂₁ = lbConn (a₁₂ - a₂₁) := by
  unfold dConn_probe; rw [lbConn_sub_probe]

theorem dConn_antisymm_probe (a₁₂ a₂₁ : MetricEnd) :
    dConn_probe a₁₂ a₂₁ = - dConn_probe a₂₁ a₁₂ := by
  unfold dConn_probe; abel

theorem dConn_grad_zero_probe (a : MetricEnd) : dConn_probe a a = 0 := by
  unfold dConn_probe; abel

-- The full linearized curvature 2-form: F = dΓ + Γ∧Γ
def linRiemann_probe (a₁₂ a₂₁ k₁ k₂ : MetricEnd) : MetricEnd :=
  dConn_probe a₁₂ a₂₁ + lbCurv k₁ k₂

theorem linRiemann_eq_probe (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann_probe a₁₂ a₂₁ k₁ k₂ = lbConn (a₁₂ - a₂₁) + lbCurv k₁ k₂ := by
  unfold linRiemann_probe; rw [dConn_eq_probe]

-- Gradient variation: dΓ vanishes, curvature is purely the commutator
theorem linRiemann_gradient_probe (a k₁ k₂ : MetricEnd) :
    linRiemann_probe a a k₁ k₂ = lbCurv k₁ k₂ := by
  unfold linRiemann_probe; rw [dConn_grad_zero_probe, zero_add]

-- Antisymmetry of the full 2-form under joint swap
theorem linRiemann_antisymm_probe (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann_probe a₁₂ a₂₁ k₁ k₂ = - linRiemann_probe a₂₁ a₁₂ k₂ k₁ := by
  unfold linRiemann_probe
  rw [dConn_antisymm_probe a₁₂ a₂₁, lbCurv_antisymm k₁ k₂, neg_add]

-- GROUNDING: the dΓ component IS a genuine difference of connection-family derivatives
theorem dConn_grounded_probe {f g : Cut → MetricEnd} {a₁₂ a₂₁ : MetricEnd}
    (hf : HasOpDerivAt0 f a₁₂) (hg : HasOpDerivAt0 g a₂₁) :
    HasOpDerivAt0 (fun t => lbConn (f t) - lbConn (g t)) (dConn_probe a₁₂ a₂₁) := by
  rw [dConn_eq_probe]
  have := opderiv_sub_probe (lbConn_opderiv hf) (lbConn_opderiv hg)
  rw [lbConn_sub_probe]
  exact this

-- NON-VACUITY (W8): dΓ nonzero for a curl (non-gradient) variation
theorem dConn_ne_zero_probe : dConn_probe offDiagVar 0 ≠ 0 := by
  unfold dConn_probe; rw [lbConn_flat, sub_zero]; exact lbConn_offDiagVar_ne_zero

-- NON-VACUITY (W8): the full 2-form nonzero (gradient case → commutator)
theorem linRiemann_ne_zero_probe :
    linRiemann_probe timeProj timeProj timeProj offDiagVar ≠ 0 := by
  rw [linRiemann_gradient_probe]; exact lbCurv_ne_zero

end
end Phys.Algebra
