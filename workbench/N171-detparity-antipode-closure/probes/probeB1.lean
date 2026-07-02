import Phys.Algebra.LorentzContinuumTimeFixingResidualSO9

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- B1: det of the octonion-block embedding = det of the block
example (R : O Cut →ₗ[Cut] O Cut) :
    LinearMap.det (octBlockEndC R) = LinearMap.det R := by
  have hpm : octBlockEndC R
      = LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
          (LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut) R) := by
    apply LinearMap.ext; intro p
    rw [octBlockEndC_apply]
    rfl
  rw [hpm, LinearMap.det_prodMap, LinearMap.det_id, one_mul,
      LinearMap.det_prodMap, LinearMap.det_id, one_mul]

-- B3: det of the boost = 1
example {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    LinearMap.det (boostEndC a b) = 1 := by
  sorry

end

end Phys.Algebra
