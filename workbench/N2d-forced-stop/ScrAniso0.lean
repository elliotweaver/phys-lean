import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

-- Probe: what does (Nrm z).re.re.re look like for z : S ℚ ?
-- S ℚ = CD (O ℚ), O ℚ = CD (H ℚ), H ℚ = CD (Dbl ℚ), Dbl ℚ has re,im : ℚ.
-- Try: is the scalar projection a sum of squares that nlinarith can crack?

set_option maxHeartbeats 2000000 in
example (z : S ℚ) (h : (Nrm z).re.re.re = 0) : z = 0 := by
  -- peel the structure: z = ⟨z.re, z.im⟩ etc. Try ext + simp to expose coords.
  ext
  all_goals (
    simp only [Nrm, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'] at h
    sorry)

end Phys.Cascade
