import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

example (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : True := by
  have hre := congrArg CD.re h
  have him := congrArg CD.im h
  simp only [hJ, CD.e2, CD.mul_re, CD.mul_im, hq, zero_mul, mul_zero, zero_add, add_zero, neg_zero] at hre him
  have hir := congrArg Dbl.im him
  have hrr := congrArg Dbl.re hre
  simp only [Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.one_re, Dbl.one_im,
    Dbl.neg_re, Dbl.neg_im, mul_one, mul_neg, neg_neg] at hir hrr
  trace_state
  trivial

end Phys.Algebra
