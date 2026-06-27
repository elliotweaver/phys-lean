import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.LorentzContinuumRotationSubgroup
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- probe: which coordinate of j := iota(e2:H) is nonzero?  try re.im.re
example : (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 1 := by
  simp [CD.iota, CD.e2]

example : (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 99 := by
  simp [CD.iota, CD.e2]

end

end Phys.Algebra
