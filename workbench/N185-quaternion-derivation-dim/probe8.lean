import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem centre_reim (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : q.re.im = 0 := by
  have hre := congrArg CD.re h
  have him := congrArg CD.im h
  simp only [hJ, CD.e2, CD.mul_re, CD.mul_im, hq, zero_mul, mul_zero, zero_add, add_zero, neg_zero] at hre him
  -- look at hre and him via extraction
  have hrr := congrArg Dbl.re hre
  have hri := congrArg Dbl.im hre
  have hir := congrArg Dbl.re him
  have hii := congrArg Dbl.im him
  simp only [Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.one_re, Dbl.one_im,
    Dbl.neg_re, Dbl.neg_im, mul_one, mul_zero, zero_mul, add_zero, zero_add, mul_neg, neg_neg] at hrr hri hir hii
  sorry

end Phys.Algebra
