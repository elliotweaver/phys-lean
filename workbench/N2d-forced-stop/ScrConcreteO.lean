import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

-- TEST A: concrete forward law at the last associative rung — Nrm multiplicative on O ℚ.
-- O ℚ = CD (H ℚ), base H ℚ associative non-commutative. Bottoms out at commutative ℚ,
-- so `ext <;> simp <;> ring` should close it (heavy but complete). Time this.
set_option maxHeartbeats 4000000 in
theorem Nrm_mul_O (x y : O ℚ) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  ext
  all_goals
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
      CD.zero_re, CD.zero_im, CD.one_re, CD.one_im]
    ring

end Scratch
