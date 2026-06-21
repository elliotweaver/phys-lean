import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

-- The Nrm is valued in the base H ℚ = CD (Dbl ℚ). So the equation lives at H ℚ:
-- one CD.ext (to Dbl ℚ) then one Dbl.ext (to ℚ). Then ring at ℚ.
set_option maxHeartbeats 8000000 in
theorem Nrm_mul_O (x y : O ℚ) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  apply CD.ext <;> apply Dbl.ext <;>
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
      star_add, star_neg, star_mul, star_star] <;>
    ring

end Scratch
