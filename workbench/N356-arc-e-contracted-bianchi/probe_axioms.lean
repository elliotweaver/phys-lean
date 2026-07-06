import Phys.Algebra.SpacetimeBianchi
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleCut
noncomputable section

theorem divFiberTrace_blind (k C : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k C) = 0 :=
  LinearMap.trace_lie _ _

theorem ricci_identity (a b C : MetricEnd) :
    covTransport a (covTransport b C) - covTransport b (covTransport a C)
      = ⁅lbCurv a b, C⁆ := by
  rw [lbCurv_eq_bracket]
  exact (lie_lie (lbConn a) (lbConn b) C).symm

theorem einstein_covTransport_eq_ricci (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) := by
  unfold einsteinRaiseMap
  rw [show covTransport k (ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd))
        = covTransport k (ricciRaiseMap G)
          - covTransport k ((2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) from by
      unfold covTransport; rw [lie_sub],
    covTransport_smul_right,
    show covTransport k (LinearMap.id : MetricEnd) = 0 from by
      rw [covTransport_apply, ← Module.End.one_eq_id, mul_one, one_mul, sub_self],
    smul_zero, sub_zero]

theorem ricciId_rhs_ne_zero :
    ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0 := by
  rw [show ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆
        = lbCurv timeProj offDiagVar * lbConn timeProj
          - lbConn timeProj * lbCurv timeProj offDiagVar from
      LieRing.of_associative_ring_bracket _ _]
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0:Cut),(1:Cut),(0:O Cut))).1) hcon
  simp only [LinearMap.zero_apply, Prod.fst_zero, LinearMap.sub_apply, Module.End.mul_apply,
    lbCurv_eq, lbConn, LinearMap.smul_apply, sigOpC_apply, timeProj_apply, offDiagVar_apply,
    Prod.smul_fst, Prod.fst_sub, neg_zero, Prod.smul_snd, sub_zero, zero_sub, mul_zero] at h
  norm_num at h

end
#print axioms divFiberTrace_blind
#print axioms ricci_identity
#print axioms einstein_covTransport_eq_ricci
#print axioms ricciId_rhs_ne_zero
end Phys.Algebra
