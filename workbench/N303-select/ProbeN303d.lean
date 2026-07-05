import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

namespace Phys.Algebra.HJ.ProbeN303d

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

-- reverse leg: what does kAB(slotC 1) reduce to? measure the goal after the standard rewrites.
set_option maxHeartbeats 1000000 in
theorem kAB_slotC_one_probe :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (slotC 1) = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  rw [innerMul_apply]
  -- jb (slotB 1)(slotC 1) = slotA (1 * star 1) = slotA 1
  rw [jb_slotB_slotC]
  -- jb (slotA u1)(slotC 1) = jb (slotC 1)(slotA u1) = slotB (u1 * 1)
  rw [jb_comm (slotA u1) (slotC 1), jb_slotC_slotA]
  -- now: jb (slotA u1)(slotA (1 * star 1)) - jb (slotB 1)(slotB (u1 * 1))
  extract_goal
  sorry

end Phys.Algebra.HJ.ProbeN303d
