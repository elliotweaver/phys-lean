import Phys.Algebra.SpacetimeFieldEquationLHS
import Phys.Foundation.ContinuumExpDeriv

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- reuse from probe1
theorem scalarOp_opderiv (f : Cut → Cut) (df : Cut) (A : MetricEnd)
    (hf : CutHasDerivAt f df 0) :
    HasOpDerivAt0 (fun τ => f τ • A) (df • A) := by
  rw [hasOpDerivAt0_iff]
  intro v
  have hcongr : (fun s : Cut => s⁻¹ • ((f s • A) v - (f 0 • A) v))
      = (fun s : Cut => (s⁻¹ * (f s - f 0)) • (A v)) := by
    funext s
    simp only [LinearMap.smul_apply]
    rw [mul_smul, ← sub_smul]
  rw [hcongr]
  have hf0 : Tendsto (fun s : Cut => s⁻¹ * (f s - f 0)) (𝓝[≠] (0 : Cut)) (𝓝 df) := by
    have := hf; unfold CutHasDerivAt at this; simpa using this
  have hgoal : ((df • A) v) = df • (A v) := by rw [LinearMap.smul_apply]
  rw [hgoal]
  exact hf0.smul_const (A v)

-- affine scalar derivative: R(τ)=R₀+τ•dR has CutHasDerivAt (fun τ => R₀ + τ*dR) dR 0
theorem affine_scalar_deriv (R₀ dR : Cut) :
    CutHasDerivAt (fun τ => R₀ + τ * dR) dR 0 := by
  unfold CutHasDerivAt
  refine Tendsto.congr' (f₁ := fun _ : Cut => dR) ?_ tendsto_const_nhds
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hh0 : h ≠ 0 := hh
  -- h⁻¹ * ((R₀ + (0+h)*dR) - (R₀ + 0*dR)) = h⁻¹ * (h*dR) = dR
  simp only [zero_add, zero_mul, add_zero]
  rw [show R₀ + h * dR - R₀ = h * dR by ring, ← mul_assoc, inv_mul_cancel₀ hh0, one_mul]

-- T2: the id endomorphism is covariantly constant, both faces.
-- bracket face: metric_covTransport_zero (covTransport k id = 0) — banked N356.
-- derivative face: a constant field has 0 derivative.
-- So the "full covariant derivative" of the constant id-field is 0.
theorem id_covDeriv_zero (k : MetricEnd) :
    HasOpDerivAt0 (fun _ : Cut => (LinearMap.id : MetricEnd)) 0
      ∧ covTransport k (LinearMap.id : MetricEnd) = 0 :=
  ⟨const_opderiv _, metric_covTransport_zero k⟩

-- T3: the trace-reversal metric-term family τ ↦ (c·R(τ))•id with R affine.
-- Its derivative face: HasOpDerivAt0 (fun τ => (c * (R₀ + τ*dR)) • id) ((c*dR) • id).
-- Note f τ = c*(R₀ + τ*dR) = c*R₀ + τ*(c*dR), so f' = c*dR.
theorem metricTerm_opderiv (c R₀ dR : Cut) :
    HasOpDerivAt0 (fun τ => (c * (R₀ + τ * dR)) • (LinearMap.id : MetricEnd))
      ((c * dR) • (LinearMap.id : MetricEnd)) := by
  have hf : CutHasDerivAt (fun τ => c * (R₀ + τ * dR)) (c * dR) 0 := by
    have hbase := affine_scalar_deriv (c * R₀) (c * dR)
    -- fun τ => c*R₀ + τ*(c*dR) vs fun τ => c*(R₀+τ*dR): equal by ring
    have hcongr : (fun τ : Cut => c * R₀ + τ * (c * dR)) = (fun τ : Cut => c * (R₀ + τ * dR)) := by
      funext τ; ring
    rw [hcongr] at hbase; exact hbase
  exact scalarOp_opderiv _ _ _ hf

end

end Phys.Algebra
