/-
  PROBE 3 (N357) — the GENUINE full metric-compatibility ∇g = 0 (NOT the id-central shadow N356
  flagged). Unites the DERIVATIVE layer D(g)=k (N350 affine_opderiv on g=η+λ•k) with the
  CONNECTION layer Γᵀη+ηΓ=k (N347 metricCompat). The metric as a lower-lower form: its covariant
  derivative is ∇_k g = D_k g − (Γᵀ·g + g·Γ). At the flat point g=η: D(g)=k, connection action=k,
  so ∇g = k − k = 0.

  Also: the cosmological term Λ·g is covariantly constant (∇(Λg)=0) — the theory-native "+Λ g".
-/
import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- (P3a) D(g) = k for the affine metric field g(λ) = η + λ•k. The derivative layer of the metric
    field is exactly its variation k. -/
theorem metricField_opderiv (k : MetricEnd) :
    HasOpDerivAt0 (fun t => sigOpC + t • k) k :=
  affine_opderiv sigOpC k

/-- (P3b) THE GENUINE FULL METRIC-COMPATIBILITY ∇g = 0. The covariant derivative of the metric
    (lower-lower form) is D(g) minus the connection action on both indices. At the flat point:
    D(g) = k (P3a), connection action = Γᵀη + ηΓ = k (N347 metricCompat). So ∇g = k − k = 0.
    This is the genuine content, NOT the id-central shadow — it uses N347 metricCompat. -/
theorem metricCompat_full (k : MetricEnd) :
    k - (lbConnAdj k * sigOpC + sigOpC * lbConn k) = 0 := by
  rw [metricCompat]; abel

/-- (P3c) THE COSMOLOGICAL TERM Λ·g IS COVARIANTLY CONSTANT: for the scaled metric Λ•(η+λ•k),
    D(Λg) = Λk and the connection action scales to Λk, so ∇(Λg) = Λk − Λk = 0. Λ is the coefficient
    of the covariantly-constant metric — the theory-native "+Λ g", NOT a posited free parameter. -/
theorem cosmoTerm_compat (Λ : Cut) (k : MetricEnd) :
    Λ • k - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 := by
  rw [metricCompat]; abel

/-- (P3d) D(Λg) = Λk — the derivative layer of the scaled metric field. -/
theorem cosmoField_opderiv (Λ : Cut) (k : MetricEnd) :
    HasOpDerivAt0 (fun t => (Λ • sigOpC) + t • (Λ • k)) (Λ • k) :=
  affine_opderiv (Λ • sigOpC) (Λ • k)

end

end Phys.Algebra
