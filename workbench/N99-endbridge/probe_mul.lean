import Phys.Algebra.LorentzContinuumIsomCompact

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- option A: LinearMap.coe_comp route
example (a b : Module.End Cut STVC) :
    (⇑(a * b) : Function.End STVC) = (⇑a : Function.End STVC) * (⇑b : Function.End STVC) := by
  rw [show (a * b) = a.comp b from rfl, LinearMap.coe_comp]
  rfl

-- option B: ext + comp_apply + Function.End mul reduces
example (a b : Module.End Cut STVC) :
    (⇑(a * b) : Function.End STVC) = (⇑a : Function.End STVC) * (⇑b : Function.End STVC) := by
  funext p
  show (a * b) p = a (b p)
  rw [Module.End.mul_apply]

end
end Phys.Algebra
