import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- does `module` tactic exist + close a module identity over Cut on O Cut?
example (k : Cut) (e w : O Cut) :
    (2 - 2 * k) • w - (2 * (k - 1)) • (e - w) = (2 - 2 * k) • e := by
  module

end
end Phys.Algebra
