import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Compute all 8 coordinates of e₂·ιe₂ (the product unit). O Cut = CD(H Cut), H Cut = CD(Dbl Cut).
-- Display each leaf coordinate.
example : True := by
  trivial

-- probe each coordinate
theorem c1 : ((CD.e2 : O Cut) * (je2:O Cut)).re.re.re = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im]
theorem c2 : ((CD.e2 : O Cut) * (je2:O Cut)).re.re.im = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c3 : ((CD.e2 : O Cut) * (je2:O Cut)).re.im.re = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c4 : ((CD.e2 : O Cut) * (je2:O Cut)).re.im.im = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c5 : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.re = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c6 : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c7 : ((CD.e2 : O Cut) * (je2:O Cut)).im.im.re = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
theorem c8 : ((CD.e2 : O Cut) * (je2:O Cut)).im.im.im = 0 := by simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]

end

end Phys.Algebra
