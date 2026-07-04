import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- DIRECT closure by ext: measure if the jb-slot lemmas close it (or if it's a coordinate bash).
set_option maxHeartbeats 2000000 in
theorem cosetAB_BC_closure :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
      = innerMul (slotC (1:O ℚ)) (slotA 1) := by
  ext X : 1
  simp only [Module.End.lie_apply, innerMul_apply]
  -- Big nested jb goal in X. Try to close with the jb-slot lemmas as simp set.
  simp only [jb_slotA_slotB, jb_slotB_slotC, jb_slotC_slotA]
  sorry

end Phys.Algebra.HJ
