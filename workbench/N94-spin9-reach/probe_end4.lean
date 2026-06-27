import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- check: what does the * resolve to?
example (u : O Cut) : True := by
  have h : (biMulFun u u : Function.End STVC) * (biMulFun u u : Function.End STVC) = (1 : Function.End STVC) → True := fun _ => trivial
  trivial
-- direct: use the monoid pow/comp
example (u : O Cut) (hi : ∀ p, biMulFun u u (biMulFun u u p) = p) :
    (biMulFun u u : Function.End STVC) * (biMulFun u u : Function.End STVC) = (1 : Function.End STVC) := by
  ext p
  exact hi p
end
end Phys.Algebra
