import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000
-- closed coordinate form of bilin on O ℚ: is it iota(iota(2*dot)) i.e. .im components all 0?
-- test: bilin x y .re.im = 0, .im = 0 ; only .re.re.re is the dot (times 2)
theorem bilin_imzero (x y : O ℚ) : (bilin x y).im = 0 := by
  simp only [bilin, CD.add_im, CD.mul_im, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im, CD.neg_re, CD.neg_im]
  ext <;> (simp only [Dbl.zero_re, Dbl.zero_im, CD.zero_re, CD.zero_im]; ring)
