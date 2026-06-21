import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

-- Q1: is Nrm v (for v : S ℚ, lands in O ℚ) a PURE scalar, i.e. all 7 non-(re.re.re)
-- components zero? Test: Nrm v = iota (iota (iota ((Nrm v).re.re.re))) ?
set_option maxHeartbeats 4000000 in
example (v : S ℚ) : Nrm v = iota (iota (iota ((Nrm v).re.re.re))) := by
  ext <;>
    simp only [Nrm, iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im] <;>
    ring

end Phys.Cascade
