import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- THE NATURAL / SOLDERED DIVERGENCE of a covariant-derivative FIELD `Φ : STVC →ₗ MetricEnd`
    (direction `w` ↦ operator `∇_w E`): contract the derivative direction `w` with the operator's
    FIRST (output) index, evaluated at the second index `ν`. `divCov Φ ν = trace_STVC (w ↦ Φ w ν)`.
    This is `∇_μ E^μ_ν` — a NATURAL pairing (direction ↔ first index), NON-BLIND, unlike the
    fiber-trace of a bracket (N356 `divFiberTrace_blind`, trace of a bracket = 0). -/
def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

/-- The metric-term covariant-derivative field: `Φ(w) = ½(∂_w R)·id`, a scalar-gradient covector
    `dRcov` times the identity operator. Models `∇(½R·g)` = `½(dR)⊗g` (metric compatible). -/
def metricDerivField (dRcov : STVC →ₗ[Cut] Cut) : STVC →ₗ[Cut] MetricEnd :=
  LinearMap.smulRight ((2⁻¹ : Cut) • dRcov) (LinearMap.id : MetricEnd)

/-- ★ THE DIVERGENCE OF THE METRIC TERM = THE RAW GRADIENT (coefficient 1). The soldered divergence
    of the metric-term field is `½ ∂_ν R` — coefficient 1, NOT the dimension. Via `trace_smulRight`. -/
example (dRcov : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov (metricDerivField dRcov) ν = (2⁻¹ : Cut) * dRcov ν := by
  unfold divCov metricDerivField
  have hmap : (LinearMap.applyₗ ν).comp
      (LinearMap.smulRight ((2⁻¹ : Cut) • dRcov) (LinearMap.id : MetricEnd))
      = LinearMap.smulRight ((2⁻¹ : Cut) • dRcov) ν := by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.id_coe, id_eq, LinearMap.smul_apply, Pi.smul_apply, smul_eq_mul]
  rw [hmap, LinearMap.trace_smulRight]
  simp only [LinearMap.smul_apply, Pi.smul_apply, smul_eq_mul]

/-- ★ THE TRACE OF THE METRIC TERM = DIMENSION × ½R (coefficient dim). Contrast: the TRACE of
    `½R·id` is `½R·finrank` = `½R·10`, NOT the raw `½R`. The SAME metric term contributes
    differently to trace (dim) vs divergence (1). -/
example (R : Cut) :
    LinearMap.trace Cut STVC ((2⁻¹ * R) • (LinearMap.id : MetricEnd))
      = (2⁻¹ * R) * (Module.finrank Cut STVC : Cut) := by
  rw [map_smul, LinearMap.trace_id, smul_eq_mul]

end

end Phys.Algebra
