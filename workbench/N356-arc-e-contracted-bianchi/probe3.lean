import Phys.Algebra.SpacetimeBianchi
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleCut
noncomputable section

theorem probe_ricci_identity (a b C : MetricEnd) :
    covTransport a (covTransport b C) - covTransport b (covTransport a C)
      = ⁅lbCurv a b, C⁆ := by
  rw [lbCurv_eq_bracket]
  exact (lie_lie (lbConn a) (lbConn b) C).symm

end
end Phys.Algebra
