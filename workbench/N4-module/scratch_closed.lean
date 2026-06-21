import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 4000000
-- closed form: bilin x y on O ℚ, fully projected to ℚ coordinate.
-- conjecture: (bilin x y).re.re = 2*(sum of 8 coordinate products) and .im parts are 0.
theorem bilin_re_re (x y : O ℚ) : (bilin x y).re.re =
    2*(x.re.re.re*y.re.re.re + x.re.re.im*y.re.re.im + x.re.im.re*y.re.im.re + x.re.im.im*y.re.im.im
     + x.im.re.re*y.im.re.re + x.im.re.im*y.im.re.im + x.im.im.re*y.im.im.re + x.im.im.im*y.im.im.im) := by
  simp only [bilin, CD.add_re, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
