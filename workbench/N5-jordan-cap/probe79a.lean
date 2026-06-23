/- PROBE 79A: clean bankable building blocks for the scalar-merge route.
   ocR is a central+nuclear scalar: it should MULTIPLY and ADD like ℚ, and the entry of
   `jb Dg M` should be a single central-scalar weighting of `M`'s entry. All proved with the
   banked ocrext coordinate route (cheap, ~6s each), NO looping canonicalizer. KILL 75s. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe79A
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "ocrext" : tactic =>
  `(tactic| ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add,
      zero_mul, mul_zero, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;> ring)

-- (1) ocR is multiplicative: ocR r * ocR s = ocR (r*s)
theorem ocR_mul (r s : ℚ) : ocR r * ocR s = ocR (r * s) := by ocrext

-- (2) ocR is additive: ocR r + ocR s = ocR (r + s)
theorem ocR_add (r s : ℚ) : ocR r + ocR s = ocR (r + s) := by
  simp only [ocR]; ext <;> simp [Dbl.add_re, Dbl.add_im]

-- (3) THE ENTRY-PULL LEMMA: (jb Dg M) i j = ocR(d_i) * M_ij + M_ij * ocR(d_j).
--     The diagonal weighting of the bracket, ocR opaque, just diagonal_mul/mul_diagonal.
theorem jbDg_entry (d0 d1 d2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (jb (Dg d0 d1 d2) M) i j
      = ocR (![d0,d1,d2] i) * M i j + M i j * ocR (![d0,d1,d2] j) := by
  unfold jb Dg
  rw [Matrix.add_apply, Matrix.diagonal_mul, Matrix.mul_diagonal]

end Probe79A
