import Phys.Algebra.LorentzContinuumSpin9Reach
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  simp only [Function.End.mul_def, Function.comp_apply]
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  exact rfl
end
end Phys.Algebra
