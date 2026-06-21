import Phys.Algebra.Operator
import Mathlib.Tactic
import Mathlib.Algebra.Ring.Subring.Basic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

theorem op_noncomm :
    Lop (CD.e2 : O ℚ) * Lop (CD.iota (CD.e2 : H ℚ))
      ≠ Lop (CD.iota (CD.e2 : H ℚ)) * Lop (CD.e2 : O ℚ) := by
  intro h
  have h1 := congrArg (fun f : AddMonoid.End (O ℚ) => f 1) h
  have hL : (CD.e2 : O ℚ) * ((CD.iota (CD.e2 : H ℚ)) * 1)
      = (CD.iota (CD.e2 : H ℚ)) * ((CD.e2 : O ℚ) * 1) := h1
  rw [mul_one, mul_one] at hL
  have hc := congrArg (fun z : O ℚ => z.im.im.re) hL
  simp only [CD.e2, CD.iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im, CD.one_re, CD.one_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
    mul_zero, mul_one, zero_mul, one_mul, add_zero, zero_add, neg_zero, neg_neg] at hc
  norm_num at hc
