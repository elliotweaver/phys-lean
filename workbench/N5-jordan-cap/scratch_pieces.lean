import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- PIECE 1: unscaled Jordan identity in any associative ring, via noncomm_ring.
section P1
variable {S : Type*} [Ring S]
def jbr (a b : S) : S := a * b + b * a
example (x y : S) : jbr (jbr x y) (jbr x x) = jbr x (jbr y (jbr x x)) := by
  unfold jbr; noncomm_ring
end P1

-- PIECE 2: can we compute a single octonion product entry over O ℚ and decide nonzero?
section P2
-- the witness off-diagonal octonion units (basis e1, e7, e5 of O ℚ).
-- e1 = iota (iota J)? Let's instead just test a basic octonion non-equality is decidable-ish.
-- Build e1 = ι(ι J) ; e5, e7 via combos. First check star/mul reduce by simp.
example : (CD.e2 : O ℚ) * (CD.e2 : O ℚ) = -1 := by
  ext <;> simp [CD.e2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
end P2
