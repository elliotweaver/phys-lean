import Phys.Algebra.SpacetimeBianchi
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleCut
noncomputable section

-- (i) covTransport k id = 0
example (k : MetricEnd) : covTransport k (LinearMap.id : MetricEnd) = 0 := by
  rw [covTransport_apply, ← Module.End.one_eq_id, mul_one, one_mul, sub_self]

-- (ii) einstein transport = ricci transport
example (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
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

end
end Phys.Algebra
