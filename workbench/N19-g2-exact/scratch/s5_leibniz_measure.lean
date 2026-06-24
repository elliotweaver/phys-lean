import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.ScratchLB2
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def c2 (z : O ℚ) : ℚ := z.re.im.re
def c3 (z : O ℚ) : ℚ := z.re.im.im
def c6 (z : O ℚ) : ℚ := z.im.im.re
def c7 (z : O ℚ) : ℚ := z.im.im.im

def d13fun (z : O ℚ) : O ℚ :=
  ⟨⟨⟨0,0⟩, ⟨-c3 z, c2 z⟩⟩, ⟨⟨0,0⟩, ⟨-c7 z, c6 z⟩⟩⟩

-- THE W9-CRITICAL MEASUREMENT: the Leibniz law coordinate check on the full octonion product.
set_option maxHeartbeats 200000 in
example (x y : O ℚ) : d13fun (x * y) = d13fun x * y + x * d13fun y := by
  ext <;> simp [d13fun, c2, c3, c6, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

end Phys.Algebra.ScratchLB2
