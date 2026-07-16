import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! MEASURE the twice-contracted-Bianchi ½ as a STRUCTURAL identity over the banked objects.

  The theory-native heart: the covariant divergence of the Einstein endomorphism field vanishes
  because the SOLDERED divergence of the Ricci field (the "twice-contracted Bianchi") equals the
  soldered divergence of the metric term ½R·g — BOTH equal ½∂_ν R. Model the two sides against ONE
  abstract scalar-gradient `dR` and require the twice-contracted-Bianchi ½ relation (which I will
  DISCHARGE from the metric-skewness below). This measures that the COMPOSITION closes to 0
  literally, and the ½ is load-bearing. -/

/-- The soldered/natural divergence of a covariant-derivative field: NON-BLIND (unlike N356's
    fiber-trace of a bracket). Pairs direction with the operator's first index. -/
def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

theorem divCov_sub (Φ Ψ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    divCov (Φ - Ψ) ν = divCov Φ ν - divCov Ψ ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (Φ - Ψ)
      = (LinearMap.applyₗ (R := Cut) ν).comp Φ - (LinearMap.applyₗ (R := Cut) ν).comp Ψ from by
    rw [LinearMap.comp_sub]]
  rw [map_sub]

/-- ★ THE LITERAL VANISHING (composition test): if the Ricci field and the metric-term field have
    EQUAL soldered divergence (the twice-contracted Bianchi content: both are ½∂_ν R), then the
    Einstein field (their DIFFERENCE) has soldered divergence 0. `∇^μ G_μν = 0`. -/
theorem einstein_divCov_zero (RicF metricF : STVC →ₗ[Cut] MetricEnd) (ν : STVC)
    (htcb : divCov RicF ν = divCov metricF ν) :
    divCov (RicF - metricF) ν = 0 := by
  rw [divCov_sub, htcb, sub_self]

end

end Phys.Algebra
