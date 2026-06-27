import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- find which coordinate of e₂·ιe₂ is nonzero. Use eval via norm_num after simp.
theorem p5c1 : ((CD.e2 : O Cut) * (je2:O Cut)).re.re.re = 0 := by simp [CD.e2, CD.iota]
theorem p5c2 : ((CD.e2 : O Cut) * (je2:O Cut)).re.re.im = 0 := by simp [CD.e2, CD.iota]
theorem p5c3 : ((CD.e2 : O Cut) * (je2:O Cut)).re.im.re = 0 := by simp [CD.e2, CD.iota]
theorem p5c4 : ((CD.e2 : O Cut) * (je2:O Cut)).re.im.im = 0 := by simp [CD.e2, CD.iota]
theorem p5c5 : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.re = 0 := by simp [CD.e2, CD.iota]
theorem p5c6 : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = 0 := by simp [CD.e2, CD.iota]
theorem p5c7 : ((CD.e2 : O Cut) * (je2:O Cut)).im.im.re = 0 := by simp [CD.e2, CD.iota]
theorem p5c8 : ((CD.e2 : O Cut) * (je2:O Cut)).im.im.im = 0 := by simp [CD.e2, CD.iota]

end

end Phys.Algebra
