import Phys.Algebra.LorentzContinuumOctBlockSO8DetParity

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- C1: manual unfold with the End coercion explicit
example {a k : Module.End Cut STVC} (ha : IsQvIsomC a) (hk : IsQvIsomC k) :
    IsQvIsomC ((a * k : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  show QvC ((a * k) p) = QvC p
  rw [Module.End.mul_apply, ha (k p), hk p]

end
end Phys.Algebra
