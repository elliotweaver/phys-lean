import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 8000000

-- Try the so(3) closure DIRECTLY as End identity via LinearMap.ext + innerMul expansion,
-- but instead of abel, expand jb into matrix mul and use noncomm_ring / ring_nf on the
-- matrix algebra (matrices over O ℚ form a NonAssocRing). The slot matrices are specific.
theorem so3_closure_FCFA :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
      = innerMul (slotB (1:O ℚ)) (slotA 1) := by
  apply LinearMap.ext; intro X
  simp only [Ring.lie_def, LinearMap.sub_apply, Module.End.mul_apply, innerMul_apply, jb]
  -- Now everything is in the matrix ring (Matrix (Fin 3)(Fin 3)(O ℚ), a NonAssocRing).
  -- The identity is a slot-position identity; try noncomm_ring after substituting the slot values.
  simp only [slotA, slotB, slotC, Xz]
  noncomm_ring

end Phys.Algebra.HJ
