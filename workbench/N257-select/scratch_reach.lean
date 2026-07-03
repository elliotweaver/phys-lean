import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

-- CHECK 1: are all the names reachable from N256's import?
#check @crossOp
#check @crossEmb
#check @imBasis
#check @qI
#check @traceForm7
#check @tr7
#check @mul7
#check @traceForm7_qI
#check @chargeOp
#check @hyperOp
#check @Cmat
#check @gForm
#check @kappaO
#check (imBasis : Fin 7 → O ℚ)

-- CHECK 2: the generic bridge for i = 0 (= banked chargeOp = qI Cmat, sanity)
-- crossOp (imBasis 0) = crossOp u1 = chargeOp; imBasis 0 = u1.
example : crossOp (imBasis 0) = qI Cmat := by
  have : imBasis 0 = u1 := rfl
  rw [this]
  show crossOp u1 = qI Cmat
  exact chargeOp_eq_qI

end
end Phys.Algebra
