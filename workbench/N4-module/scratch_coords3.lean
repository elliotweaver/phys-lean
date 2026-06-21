import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 4000000
-- do the other 3 coordinates of bilin x y vanish identically on O ℚ?
theorem bilin_re_im (x y : O ℚ) : (bilin x y).re.im = 0 := by
  simp only [bilin, CD.add_re, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
theorem bilin_im_re (x y : O ℚ) : (bilin x y).im.re = 0 := by
  simp only [bilin, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
theorem bilin_im_im (x y : O ℚ) : (bilin x y).im.im = 0 := by
  simp only [bilin, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
