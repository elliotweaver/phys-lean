import Phys.Algebra.SpacetimeWeakFieldMetric

namespace Phys.Algebra.N347Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

open Phys.Algebra

-- Can we form the ½-scaled composition in MetricEnd?
def lbConn (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (sigOpC * k)
def lbConnAdj (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (k * sigOpC)

-- probe: ½ + ½ = 1 in Cut
example : (2⁻¹ + 2⁻¹ : Cut) = 1 := by norm_num

-- probe: the metric-compatibility operator identity Γ*η + ηΓ = k  (uses η²=1)
example (k : MetricEnd) :
    lbConnAdj k * sigOpC + sigOpC * lbConn k = k := by
  unfold lbConn lbConnAdj
  rw [smul_mul_assoc, mul_smul_comm, mul_assoc, eta_mul_self, mul_one,
      ← mul_assoc, eta_mul_self, one_mul, ← add_smul]
  norm_num

end

end Phys.Algebra.N347Probe
