import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- isolate: w * (-(1) * w) = 1 given w*w = -1
example (w : O Cut) (hsq : w * w = -1) : w * (-(1:O Cut) * w) = 1 := by
  rw [neg_one_mul, mul_neg, hsq, neg_neg]

-- what does biMulFun w w (0,0,-1) actually unfold to?
example (w : O Cut) (hsq : w * w = -1) :
    biMulFun w w ((0 : Cut), (0 : Cut), -(1 : O Cut)) = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  sorry

-- Function.End mul application form
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  rfl

end
end Phys.Algebra
