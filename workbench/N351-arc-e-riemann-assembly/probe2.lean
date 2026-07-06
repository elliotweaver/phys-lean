import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- Q1: does ContinuousNeg STVC resolve?
example : ContinuousNeg STVC := inferInstance

-- opderiv_neg via ContinuousNeg
theorem opderiv_neg_probe {K : Cut → MetricEnd} {b : MetricEnd}
    (hK : HasOpDerivAt0 K b) : HasOpDerivAt0 (fun t => - K t) (-b) := by
  rw [hasOpDerivAt0_iff] at hK ⊢
  intro v
  refine Tendsto.congr' ?_ ((hK v).neg)
  filter_upwards with s
  simp only [LinearMap.neg_apply]
  rw [← smul_neg]; congr 1; abel

-- opderiv_sub via add + neg
theorem opderiv_sub_probe {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  have h := opderiv_add hH (opderiv_neg_probe hK)
  simpa [sub_eq_add_neg] using h

-- Q2: trace of the dΓ part -- is it necessarily zero like the commutator part?
-- trace(lbConn k) = trace(½ η k) = ½ trace(η k). Not obviously zero.
-- Check: is there a k with trace(η k) ≠ 0 ? Use timeProj: η∘timeProj.
-- The dΓ trace is generically NONZERO (unlike commutator) -> Ricci contraction is subtle.
-- Just confirm lbConn is well-typed and traceable.
example (k : MetricEnd) : Cut := LinearMap.trace Cut STVC (lbConn k)

end
end Phys.Algebra
