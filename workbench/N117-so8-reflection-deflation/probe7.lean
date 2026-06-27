import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- route A: maybe there is a smulCompat with hstar field for O Cut
example (s : Cut) (z : O Cut) : star (s • z) = s • star z := by
  exact smulCompat_oCut.hstar s z

end
end Phys.Algebra
