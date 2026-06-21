import Phys.Cascade.ForcedStop
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Cascade

def c13X : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩
def c13Y : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩⟩

end Phys.Cascade

-- Prove the LHS projection equals 4 (matching prereg)
set_option maxHeartbeats 2000000 in
theorem c13_lhs : (CD.bilin (Phys.Cascade.c13X * zdX) (Phys.Cascade.c13Y * zdX)).re.re.re = (4:ℚ) := by
  simp only [CD.bilin]
  simp [Phys.Cascade.c13X, Phys.Cascade.c13Y, zdX, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- Prove the RHS projection equals 0
set_option maxHeartbeats 2000000 in
theorem c13_rhs : (CD.bilin Phys.Cascade.c13X Phys.Cascade.c13Y * CD.Nrm zdX).re.re.re = (0:ℚ) := by
  simp only [CD.bilin, CD.Nrm]
  simp [Phys.Cascade.c13X, Phys.Cascade.c13Y, zdX, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- The bogus costume: claims LHS = RHS, i.e. forces 4 = 0
theorem backward_P1_needs_mult_BOGUS :
    (CD.bilin (Phys.Cascade.c13X * zdX) (Phys.Cascade.c13Y * zdX)).re.re.re
      = (CD.bilin Phys.Cascade.c13X Phys.Cascade.c13Y * CD.Nrm zdX).re.re.re := by
  rw [c13_lhs, c13_rhs]
