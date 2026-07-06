import Phys.Algebra.SpacetimeBianchi
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleCut
noncomputable section

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
end Phys.Algebra
