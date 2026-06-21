import Phys.Algebra.GeneratedModule
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
set_option linter.unusedSimpArgs false

-- Does e0*e1 = e1*e0 (false)? See the residual false core coordinate-wise.
example : (ebasis 0 : O ℚ) * ebasis 1 = ebasis 1 * ebasis 0 := by
  ext <;>
    simp only [ebasis, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
      mul_zero, mul_one, zero_mul, one_mul, add_zero, zero_add, neg_zero, neg_neg]
