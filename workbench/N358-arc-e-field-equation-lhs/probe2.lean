/- N358 MEASURE probe2 — the conserved-structured LHS family + one-cause bundle.
   (B) THE LHS ENDOMORPHISM FAMILY. Define lhsRaiseMap a Λ G := a • einsteinRaiseMap G + Λ • id.
       Its covariant transport = a • (transport of ricciRaiseMap G):
         - the ½R·id metric part of einsteinRaiseMap is bracket-inert (N356 einstein_covTransport_eq_ricci),
         - the Λ•id cosmological part is bracket-inert (id central, N356 metric_covTransport_zero).
       So both generators' metric terms drop out of the bracket layer — the LHS's bracket-layer
       transport is carried ENTIRELY by the Ricci part (its derivative-layer content is childed).
   (C) ONE-CAUSE BUNDLE: transport, curvature, and metric-compatibility all reference lbConn. -/
import Phys.Algebra.SpacetimeCovariantDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- THE FIELD-EQUATION LHS ENDOMORPHISM: `a·G + Λ·g` raised, `a • einsteinRaiseMap G + Λ • id`
    (the metric-raise of `g` is the identity, N354). The two-parameter candidate space spanned by
    the two conserved generators G (a·) and g (Λ·). -/
def lhsRaiseMap (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  a • einsteinRaiseMap G + Λ • (LinearMap.id : MetricEnd)

/-- (B) THE LHS FAMILY IS CONSERVED-STRUCTURED at the bracket layer: the covariant transport of the
    LHS endomorphism equals `a • (transport of ricciRaiseMap G)`. BOTH metric terms drop:
    the ½R·id in the Einstein part (N356 einstein_covTransport_eq_ricci) AND the Λ·id cosmological
    part (id central, N356 metric_covTransport_zero). The bracket-layer transport of the whole LHS
    is carried entirely by the Ricci part. -/
theorem lhs_covTransport_eq_ricci (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (lhsRaiseMap a Λ G) = a • covTransport k (ricciRaiseMap G) := by
  unfold lhsRaiseMap
  -- covTransport is a bracket; distribute over + and scalar
  rw [show covTransport k (a • einsteinRaiseMap G + Λ • (LinearMap.id : MetricEnd))
        = covTransport k (a • einsteinRaiseMap G) + covTransport k (Λ • (LinearMap.id : MetricEnd))
      from by unfold covTransport; rw [lie_add]]
  rw [covTransport_smul_right, covTransport_smul_right, metric_covTransport_zero, smul_zero,
    add_zero, einstein_covTransport_eq_ricci]

/-- (C) ONE-CAUSE BUNDLE: the whole field-equation LHS descends from the SINGLE look-back transport
    `lbConn`. (i) the metric term `Λ·g` is covariantly constant (∇(Λg)=0, N357 — from metricCompat of
    lbConn); (ii) the curvature is the commutator of lbConn (N348); (iii) the divergence structure is
    the Jacobi identity of lbConn (N356 ricci_identity). Three faces, one operator. -/
theorem lhs_one_cause (Λ : Cut) (k a b C : MetricEnd) :
    ((Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0)
      ∧ (lbCurv a b = lbConn a * lbConn b - lbConn b * lbConn a)
      ∧ (covTransport a (covTransport b C) - covTransport b (covTransport a C) = ⁅lbCurv a b, C⁆) :=
  ⟨(cosmoTerm_covDeriv_zero Λ k).2, rfl, ricci_identity a b C⟩

end

end Phys.Algebra
