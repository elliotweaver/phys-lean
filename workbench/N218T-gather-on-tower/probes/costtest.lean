import Phys.Algebra.TowerGatherCoherence
namespace Counterexamples
open Phys.Algebra Phys.Cascade
def wY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩
set_option maxHeartbeats 1000000 in
theorem tst : (zdX * (zdX * wY)).im.im.im.im = (-2 : ℚ) := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im]
  norm_num
end Counterexamples
