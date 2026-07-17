import Phys.Algebra.Alternative
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

example : Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0 := by
  have hc : octCross u1 u2 = u1 * u2 := by
    unfold octCross; rw [gForm_u1_u2, zero_smul, add_zero]
  rw [hc]
  unfold Phys.Algebra.assoc
  ext <;>
    simp only [sub_eq_add_neg, u1, u2, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
      CD.one_re, CD.zero_re, CD.zero_im, star_zero, star_one,
      mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg] <;> ring

end Phys.Algebra.HJ
