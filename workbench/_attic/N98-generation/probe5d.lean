import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- show the raw value with no simp lemmas about e2/iota, just unfold the mul.
example : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = 1 := by
  unfold je2
  simp only [CD.mul_re, CD.mul_im, CD.e2, CD.iota, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im]
  sorry

-- alternative: check if the value is just literally seen. Use `show` after unfolding.
set_option pp.all false in
example : ((CD.e2 : O Cut) * (je2:O Cut)).im.re.im = 0 := by
  simp only [je2, CD.e2, CD.iota, CD.mul_im, CD.mul_re, CD.star_re, CD.star_im]
  sorry

end

end Phys.Algebra
