import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- Probe trace symmetry reQ(a*b) = reQ(b*a) on O ℚ, and the bilin connection.
-- reQ x := x.re.re.re. Born bilin lands deep-real.

def reQ (x : O ℚ) : ℚ := x.re.re.re

-- Is reQ(a*b) = reQ(b*a)?  (the trace form is symmetric)  -- cost probe
theorem reQ_mul_comm (a b : O ℚ) : reQ (a * b) = reQ (b * a) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im]
  ring

end Phys.Algebra
