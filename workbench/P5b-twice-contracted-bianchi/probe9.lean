import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! CRUX MEASURE (W9): can I DERIVE the twice-contracted Bianchi `divCov(RicDeriv) = ½ dRcov`
    from the DIFFERENTIAL Bianchi (N355 bianchi_jacobi) via a SOLDERED contraction, WITHOUT
    positing the ½?

    Strategy: the KEY theory-native reframe. The Ricci endomorphism `Ric` is DEFINED (N352) as a
    LOOP-INDEX trace of curvature. The scalar `R = trace(Ric)` (fiber trace). The covariant-derivative
    FIELD of Ric (`RicDeriv : w ↦ ∇_w Ric`), soldered-divergence-contracted, must give ½ the gradient.

    First: measure the ABSTRACT arithmetic engine. The twice-contracted 2nd-Bianchi collapses to
    `gradTerm = 2·divTerm` (probe4). Model the covariant-derivative field abstractly and see whether
    the differential Bianchi soldered contraction FORCES `divCov = ½ (trace∘deriv)` on the derived
    carrier. -/

/-- probe4's engine, re-stated: the ½ from the "1 gradient term, 2 equal divergence terms" split. -/
theorem half_engine (gradTerm divTerm : Cut) (h : gradTerm = divTerm + divTerm) :
    divTerm = (2⁻¹ : Cut) * gradTerm := by
  rw [h]; ring

/-- Model: the covariant-derivative field of the Ricci endomorphism, `RicDeriv : STVC →ₗ MetricEnd`,
    `RicDeriv w = ∇_w Ric`. The soldered divergence pairs `w` with the operator's first index:
    `divCov RicDeriv ν = trace_w (w ↦ (RicDeriv w) ν)`. The scalar gradient is the fiber trace:
    `dRcov ν = trace(RicDeriv ν)` (probe5: `∂_ν R = trace(∇_ν Ric)`). -/
def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

/-- The scalar-gradient covector from a covariant-derivative field: `w ↦ trace(Φ w)` (fiber trace of
    the operator `∇_w Ric`), a linear functional on directions. probe5 grounds `= ∂_w R`. -/
def gradCovector (Φ : STVC →ₗ[Cut] MetricEnd) : STVC →ₗ[Cut] Cut :=
  (LinearMap.trace Cut STVC).comp Φ

theorem gradCovector_apply (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    gradCovector Φ ν = LinearMap.trace Cut STVC (Φ ν) := rfl

/-- THE TWICE-CONTRACTED BIANCHI as a PREDICATE on a covariant-derivative field: `divCov Φ = ½ grad`.
    This is the content that must be DERIVED, not hypothesized. -/
def SatisfiesTwiceContractedBianchi (Φ : STVC →ₗ[Cut] MetricEnd) : Prop :=
  ∀ ν : STVC, divCov Φ ν = (2⁻¹ : Cut) * gradCovector Φ ν

end

end Phys.Algebra
