import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {B : Type*} [Ring B] [StarRing B]

def bilin (x y : CD B) : B := (x * star y + y * star x).re

-- expand Nrm fully in components. Note star_im gives (star z).im = -z.im, and
-- (x+y).im = x.im+y.im so star((x+y).im)... we work with Nrm directly = (z*star z).re.
-- (z*star z).re = z.re*star z.re + -(star (star z).im * z.im) ... let me just compute.
theorem Nrm_add (x y : CD B) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, mul_neg, neg_mul, neg_neg]
  abel

end CD
end Phys.Cascade
