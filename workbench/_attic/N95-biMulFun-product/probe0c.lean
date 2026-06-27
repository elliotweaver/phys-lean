import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- try several ways to compute w * -w
example (w : O Cut) (hsq : w * w = -1) : w * (-w) = 1 := by
  rw [mul_neg w w, hsq, neg_neg]
example (w : O Cut) (hsq : w * w = -1) : w * (-w) = 1 := by
  rw [show w * (-w) = -(w*w) from by ring, hsq, neg_neg]
end
end Phys.Algebra
