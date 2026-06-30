import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- From commuting with hI: q.im.re = 0 and q.im.im = 0.
example (q : H ℚ) (h : q * hI = hI * q) : q.im.re = 0 ∧ q.im.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J] at him
  -- him should relate q.im * (something). Let's see what shape.
  -- Extract Dbl coordinates.
  have h1 := congrArg Dbl.re him
  have h2 := congrArg Dbl.im him
  simp only [Dbl.mul_re, Dbl.mul_im, Dbl.J, Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im] at h1 h2
  constructor <;> [skip; skip] <;> nlinarith [h1, h2]

end Phys.Algebra
