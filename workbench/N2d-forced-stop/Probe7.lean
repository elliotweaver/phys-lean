import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {B : Type*} [Ring B] [StarRing B]

def bilin (x y : CD B) : B := (x * star y + y * star x).re

theorem bilin_diag (x : CD B) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]

theorem bilin_symm (x y : CD B) : bilin x y = bilin y x := by
  simp [bilin, add_comm]

theorem bilin_add_left (x x' y : CD B) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, mul_im, add_mul, mul_add, star_re, star_im,
    add_im, neg_mul, mul_neg]
  ring

theorem bilin_add_right (x y y' : CD B) :
    bilin x (y + y') = bilin x y + bilin x y' := by
  simp only [bilin, add_re, mul_re, mul_im, add_mul, mul_add, star_re, star_im,
    star_add, add_im, neg_mul, mul_neg, neg_add]
  ring

end CD
end Phys.Cascade
