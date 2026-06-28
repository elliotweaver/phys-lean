import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE 0: star of a Cut-smul on O Cut. Does `star (c • x) = c • star x` hold by a simple rw? -/
theorem probe_star_smul (c : Cut) (x : O Cut) : star (c • x) = c • star x := by
  exact?

end
end Phys.Algebra
