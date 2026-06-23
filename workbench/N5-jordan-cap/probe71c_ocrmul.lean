/- PROBE 71c: ocR_mul (real embedding is multiplicative) collapses nested ocR,
   killing the pull-lemma loop. Test it + the (0,1) close. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe71c
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 400000 in
theorem ocR_mul (r s : ℚ) : ocR r * ocR s = ocR (r * s) := by
  ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;>
    ring

end Probe71c
