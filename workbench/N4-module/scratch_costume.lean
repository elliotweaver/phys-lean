import Phys.Algebra.GeneratedModule
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

-- BOGUS: distinct imaginary basis units COMMUTE under Lop.
-- ebasis 0 = e₂-like coordinate, ebasis 3 = first im coordinate.
-- Strategy: assume commute, combine with Lbasis_anticomm to get 2*LᵢLⱼ=0 then LᵢLⱼ=0,
-- then apply at 1 to get a coordinate contradiction.
-- Simpler: ebasis 0 and ebasis 6 — compute products at 1 directly and show they differ
-- (like gen_noncomm). Let me first check: which basis pair maps cleanly to a coordinate diff?

-- Try the pair (0,6): Lop(e0)*Lop(e6) vs Lop(e6)*Lop(e0), apply at 1.
example : Lop (ebasis 0) * Lop (ebasis 6) = Lop (ebasis 6) * Lop (ebasis 0) := by
  sorry

-- check the products at 1 differ at some coordinate
example : ((ebasis 0 : O ℚ) * ((ebasis 6 : O ℚ) * 1)) = ((ebasis 6 : O ℚ) * ((ebasis 0 : O ℚ) * 1)) → False := by
  rw [mul_one, mul_one]
  intro h
  have hc := congrArg (fun z : O ℚ => z.im.im.im) h
  simp only [ebasis, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
    mul_zero, mul_one, zero_mul, one_mul, add_zero, zero_add, neg_zero, neg_neg] at hc
  norm_num at hc
