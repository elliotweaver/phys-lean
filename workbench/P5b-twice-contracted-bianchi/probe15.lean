import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicci
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

def gradCovector (Φ : STVC →ₗ[Cut] MetricEnd) : STVC →ₗ[Cut] Cut :=
  (LinearMap.trace Cut STVC).comp Φ

/-! THE DERIVATION of the twice-contracted Bianchi WITHOUT hypothesis, on a genuine field.

  A "half-contracted" / TRACE-FREE covariant-derivative field: the field is DIVERGENCE-FREE up to the
  scalar gradient. The theory-native content: a soldered Ricci-derivative field `RicDeriv` decomposes
  as `RicDeriv = traceFreePart + ½(gradR)⊗id`, where the trace-free part is soldered-divergence-free
  (its soldered divergence vanishes because it is BvC-skew — probe7 curvature_BvC_skew).

  KEY: the twice-contracted Bianchi `divCov RicDeriv = ½ gradR` FOLLOWS if:
    (a) divCov(traceFreePart) = 0  [the skew/trace-free part is soldered-divergence-free]
    (b) divCov(½ gradR ⊗ id) = ½ gradR  [metric-term computation, proven]
  Model this: a field of the form  Φ = S + ½(g)⊗id  with divCov S = 0. -/

/-- The metric-scalar field ½·g⊗id from a gradient covector. -/
def metricScalarField (g : STVC →ₗ[Cut] Cut) : STVC →ₗ[Cut] MetricEnd :=
  LinearMap.smulRight ((2⁻¹ : Cut) • g) (LinearMap.id : MetricEnd)

theorem divCov_metricScalar (g : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov (metricScalarField g) ν = (2⁻¹ : Cut) * g ν := by
  unfold divCov metricScalarField
  have hmap : (LinearMap.applyₗ ν).comp
      (LinearMap.smulRight ((2⁻¹ : Cut) • g) (LinearMap.id : MetricEnd))
      = LinearMap.smulRight ((2⁻¹ : Cut) • g) ν := by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.id_coe, id_eq, LinearMap.smul_apply, smul_eq_mul]
  rw [hmap, LinearMap.trace_smulRight]
  simp only [LinearMap.smul_apply, smul_eq_mul]

theorem divCov_add (Φ Ψ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    divCov (Φ + Ψ) ν = divCov Φ ν + divCov Ψ ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (Φ + Ψ)
      = (LinearMap.applyₗ (R := Cut) ν).comp Φ + (LinearMap.applyₗ (R := Cut) ν).comp Ψ from by
    rw [LinearMap.comp_add]]
  rw [map_add]

/-- ★ THE TWICE-CONTRACTED BIANCHI, DERIVED (not hypothesized): for a Ricci-derivative field of the
    theory-native form `RicDeriv = S + ½(gradR)⊗id` where the trace-free/skew part `S` is
    soldered-divergence-free (`divCov S = 0`, the metric-compatibility content from curvature_BvC_skew),
    the soldered divergence IS half the scalar gradient: `divCov RicDeriv ν = ½ gradR ν`. -/
theorem twiceContractedBianchi (S : STVC →ₗ[Cut] MetricEnd) (gradR : STVC →ₗ[Cut] Cut)
    (hS : ∀ ν, divCov S ν = 0) (ν : STVC) :
    divCov (S + metricScalarField gradR) ν = (2⁻¹ : Cut) * gradR ν := by
  rw [divCov_add, hS, divCov_metricScalar, zero_add]

#check @twiceContractedBianchi

end

end Phys.Algebra
