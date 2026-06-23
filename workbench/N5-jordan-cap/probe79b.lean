/- PROBE 79B: the Hadamard-scaling form + ONE pc2 entry via the scaling discipline.
   (jb Dg M) i j = ocR(d_i + d_j) * M_ij  (central scalar Hadamard scaling).
   Then test: does the (0,1) entry of polarCross2 close by expanding via this form +
   ocR_comm/assoc + ring-over-scalars? MEASURE only — ends in sorry/trace. KILL 80s. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe79B
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "ocrext" : tactic =>
  `(tactic| ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add,
      zero_mul, mul_zero, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;> ring)

theorem ocR_add (r s : ℚ) : ocR r + ocR s = ocR (r + s) := by
  simp only [ocR]; ext <;> simp [Dbl.add_re, Dbl.add_im]

-- THE HADAMARD-SCALING FORM: jb Dg M scales each entry by the central scalar ocR(d_i+d_j).
theorem jbDg_scale (d0 d1 d2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (jb (Dg d0 d1 d2) M) i j = ocR (![d0,d1,d2] i + ![d0,d1,d2] j) * M i j := by
  unfold jb Dg
  rw [Matrix.add_apply, Matrix.diagonal_mul, Matrix.mul_diagonal, ocR_comm (M i j),
      ← ocR_add, add_mul]

-- Sanity: does this evaluate the diagonal correctly? (0,0): ocR(2 d0) * M00
example (d0 d1 d2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (jb (Dg d0 d1 d2) M) 0 0 = ocR (d0 + d0) * M 0 0 := by
  rw [jbDg_scale]; norm_num

end Probe79B
