import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicci
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! FULL COMPREHENSIVE PROBE = production draft for P5b. Verify each piece compiles. -/

-- (1) soldered divergence (non-blind), linearity
def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

theorem divCov_sub (Φ Ψ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    divCov (Φ - Ψ) ν = divCov Φ ν - divCov Ψ ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (Φ - Ψ)
      = (LinearMap.applyₗ (R := Cut) ν).comp Φ - (LinearMap.applyₗ (R := Cut) ν).comp Ψ from by
    rw [LinearMap.comp_sub]]
  rw [map_sub]

-- (2) the gradient covector: fiber trace of a covariant-derivative field (probe5: ∂_νR = trace(∇_νRic))
def gradCovector (Φ : STVC →ₗ[Cut] MetricEnd) : STVC →ₗ[Cut] Cut :=
  (LinearMap.trace Cut STVC).comp Φ

theorem gradCovector_apply (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    gradCovector Φ ν = LinearMap.trace Cut STVC (Φ ν) := rfl

-- (3) metric-term derivative field ∇(½R·g) = ½(dR)⊗g, divCov = ½ dRcov (coefficient ½)
def metricDerivField (dRcov : STVC →ₗ[Cut] Cut) : STVC →ₗ[Cut] MetricEnd :=
  LinearMap.smulRight ((2⁻¹ : Cut) • dRcov) (LinearMap.id : MetricEnd)

theorem metricDivCov (dRcov : STVC →ₗ[Cut] Cut) (ν : STVC) :
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

-- (4) THE ½-ENGINE: twice-contracted Bianchi ½ from "1 gradient, 2 coincident divergence terms"
theorem half_from_two_of_three (gradTerm divTerm : Cut)
    (hcyclic : gradTerm - divTerm - divTerm = 0) :
    divTerm = (2⁻¹ : Cut) * gradTerm := by
  have h : gradTerm = 2 * divTerm := by linarith [hcyclic]
  rw [h]; ring

-- (5) the literal vanishing composed: einstein = Ric − metric, both ½∂R ⟹ divCov = 0
theorem einstein_divCov_zero (RicF metricF : STVC →ₗ[Cut] MetricEnd) (ν : STVC)
    (htcb : divCov RicF ν = divCov metricF ν) :
    divCov (RicF - metricF) ν = 0 := by
  rw [divCov_sub, htcb, sub_self]

#check @divCov
#check @half_from_two_of_three

end

end Phys.Algebra
