import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- the nonzero coordinate .im.re.im of e₂·ιe₂. Find its value (try ±1).
theorem p5val_pos : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = 1 := by simp [CD.e2, CD.iota]
theorem p5val_neg : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = -1 := by simp [CD.e2, CD.iota]

end

end Phys.Algebra
