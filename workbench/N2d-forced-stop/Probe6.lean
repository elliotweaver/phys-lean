import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {A : Type*}
variable {B : Type*} [Ring B] [StarRing B]

example (x y z : CD B) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul] <;> ring

example (x y z : CD B) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul] <;> ring

example (x y : CD B) : star (x + y) = star x + star y := by
  ext <;> simp [add_comm]

example (x : CD B) : star (star x) = x := by
  ext <;> simp

example (x y : CD B) : star (x * y) = star y * star x := by
  ext <;> simp [mul_re, mul_im, star_add] <;> ring

-- Now the key: define Nrm and the polarized bilinear form on CD B and prove diagonal.
-- Nrm z = (z * star z).re  (already banked as CD.Nrm); the bilinear form:
def bilin (x y : CD B) : B := (x * star y + y * star x).re

-- diagonal: bilin x x = Nrm x + Nrm x
example (x : CD B) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]

end CD
end Phys.Cascade
