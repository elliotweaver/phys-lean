import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

-- RISK TEST 1a: is the scalar (Nrm v).re.re.re literally the sum of 16 squares?
set_option maxHeartbeats 4000000 in
example (v : S ℚ) :
    (Nrm v).re.re.re =
      v.re.re.re.re^2 + v.re.re.re.im^2 + v.re.re.im.re^2 + v.re.re.im.im^2
      + v.re.im.re.re^2 + v.re.im.re.im^2 + v.re.im.im.re^2 + v.re.im.im.im^2
      + v.im.re.re.re^2 + v.im.re.re.im^2 + v.im.re.im.re^2 + v.im.re.im.im^2
      + v.im.im.re.re^2 + v.im.im.re.im^2 + v.im.im.im.re^2 + v.im.im.im.im^2 := by
  simp only [Nrm, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im]
  ring

end Phys.Cascade
