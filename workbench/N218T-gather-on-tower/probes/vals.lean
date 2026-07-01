import Phys.Cascade.Sedenion

namespace Phys.GatherProbeVals
open Phys.Cascade

def wY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
theorem lhs_val : (zdX * (zdX * wY)).im.im.im.im = (-2 : ℚ) := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
  norm_num

set_option maxHeartbeats 1000000 in
theorem rhs_val : ((zdX * zdX) * wY).im.im.im.im = (0 : ℚ) := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
  norm_num

end Phys.GatherProbeVals
