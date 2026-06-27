import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
example (w : O Cut) (hsq : w * w = -1) : w * -w = 1 := by
  rw [mul_neg, hsq, neg_neg]
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  simp only [Function.End.mul_def, Function.comp_apply]
end
end Phys.Algebra
