import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- nonzero coordinate of e₂·ιe₂ should be .im.im.re = -1.
theorem p5_imimre : ((CD.e2 : O Cut) * (je2:O Cut)).im.im.re = -1 := by simp [CD.e2, CD.iota]
-- real (scalar) part is 0 — lands OFF the real axis.
theorem p5_rerere : ((CD.e2 : O Cut) * (je2:O Cut)).re.re.re = 0 := by simp [CD.e2, CD.iota]

end

end Phys.Algebra
