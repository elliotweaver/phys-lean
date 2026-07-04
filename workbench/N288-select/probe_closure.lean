import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 4000000

-- The so(3) closure as an endomorphism identity. Measured: structural over any *-ring.
-- Try the direct LinearMap.ext + innerMul expansion + abel (no coordinate blowup on X? test).
theorem so3_closure :
    ⁅innerMul (slotB (1:O ℚ)) (slotC 1), innerMul (slotC (1:O ℚ)) (slotA 1)⁆
      = innerMul (slotA (1:O ℚ)) (slotB 1) := by
  apply LinearMap.ext; intro X
  rw [show (⁅innerMul (slotB (1:O ℚ)) (slotC 1), innerMul (slotC (1:O ℚ)) (slotA 1)⁆ :
      Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotB 1) (slotC 1) * innerMul (slotC 1) (slotA 1)
          - innerMul (slotC 1) (slotA 1) * innerMul (slotB 1) (slotC 1) from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, innerMul_apply]
  simp only [jb]
  abel

end Phys.Algebra.HJ
