import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- inspect what * means on Function.End
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  show (biMulFun w w ∘ biMulFun u u) p = _
  rfl
end
end Phys.Algebra
