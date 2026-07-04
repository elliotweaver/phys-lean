import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Try to close the adE-ocRM mixed Leibniz with nuclearity (ocRM associates).
-- Need: ocRM P associates: (ocRM P * A) * B = ocRM P * (A * B) etc. (banked ocRM_assoc_L/R).
set_option maxHeartbeats 1600000 in
theorem adE_ocRM_mixed (P : Matrix (Fin 3) (Fin 3) ℚ) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ⁅adE (ocRM P), Lmul C⁆ = Lmul (adE (ocRM P) C) := by
  ext X : 1
  simp only [Module.End.lie_apply, Lmul_apply, adE_apply, jb]
  -- goal in terms of ocRM P (call M), C, X: M*(C*X+X*C) - (C*X+X*C)*M - (C*(M*X-X*M) + (M*X-X*M)*C)
  --   = (M*C - C*M)*X + X*(M*C - C*M)
  -- Use ocRM associativity/nuclearity to rearrange. Try noncomm_ring first (may not know nuclearity).
  rw [ocRM_assoc_L, ocRM_assoc_R]
  noncomm_ring

end Phys.Algebra.HJ
