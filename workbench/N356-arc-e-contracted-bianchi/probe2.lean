/-
  N356 probe2 (v2) — MEASURE the divergence structure at the conservation level.
  probe1 established: the FIBER trace of covTransport is IDENTICALLY 0 (trace_lie) — BLIND.
-/
import Phys.Algebra.SpacetimeBianchi

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- M1: fiber trace of covariant transport = 0. The naive index-contraction "divergence" is BLIND. -/
theorem probe_fiberDiv_blind (k C : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k C) = 0 :=
  LinearMap.trace_lie _ _

/-- M2b: the metric endomorphism (raise of g = identity, N354) is bracket-covariantly-constant:
    covTransport k id = 0.  ⁅f, 1⁆ = 0. -/
theorem probe_metric_covconstant (k : MetricEnd) :
    covTransport k (LinearMap.id : MetricEnd) = 0 := by
  unfold covTransport
  rw [← Module.End.one_eq_id, LieRing.of_associative_ring_bracket, mul_one, one_mul, sub_self]

/-- M2: covariant transport of the EINSTEIN endomorphism = that of the RICCI endomorphism.
    The ½R·id trace-reversal metric term is bracket-inert. So at the algebraic (bracket) layer the
    divergence of G is carried entirely by the Ricci part; the metric term enters only through its
    DERIVATIVE (∇_ν R, the childed derivative layer). -/
theorem probe_einstein_transport_eq_ricci (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) := by
  unfold covTransport einsteinRaiseMap
  rw [lie_sub, lie_smul, ← Module.End.one_eq_id,
      show ⁅lbConn k, (1 : MetricEnd)⁆ = 0 by
        rw [LieRing.of_associative_ring_bracket, mul_one, one_mul, sub_self],
      smul_zero, sub_zero]

/-- M3: the SOLDERED divergence — contract covariant transport over the SOLDERED transport index
    (analogue of the Ricci contraction over the soldered loop index, N352). -/
def divMap (Gsol : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : STVC →ₗ[Cut] MetricEnd where
  toFun X := covTransport (Gsol X) T
  map_add' X₁ X₂ := by simp only [map_add, covTransport_add_left]
  map_smul' c X := by simp only [map_smul, covTransport_smul_left, RingHom.id_apply]

/-- M3-measure: even the SOLDERED-index fiber trace of the divergence still vanishes (each summand
    is a bracket). So the "divergence-as-a-scalar-fiber-trace" is blind on every index. -/
theorem probe_soldered_fiberDiv_blind (Gsol : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) (X : STVC) :
    LinearMap.trace Cut STVC (divMap Gsol T X) = 0 :=
  LinearMap.trace_lie _ _

end

end Phys.Algebra
