import Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
abbrev ii5q : O Cut := (ii4 : O Cut) * (je2 : O Cut)
-- is the nonzero slot value +1 ?
theorem ii5_slot_pos : (ii5q : O Cut).re.im.im = (1:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
end
end Phys.Algebra
