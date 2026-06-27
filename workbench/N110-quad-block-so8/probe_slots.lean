import Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

abbrev ii5q : O Cut := (ii4 : O Cut) * (je2 : O Cut)

-- Probe all 8 deep slots of ii5q. O Cut = CD (H Cut), H Cut = CD (CD Cut)? structure: .re/.im each level.
-- Print each candidate slot; the one that is ±1 (not 0) is the witness slot.
example : (ii5q : O Cut).re.re.re = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).re.re.im = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).re.im.re = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).re.im.im = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).im.re.re = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).im.re.im = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).im.im.re = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
example : (ii5q : O Cut).im.im.im = (0:Cut) := by simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

end
end Phys.Algebra
