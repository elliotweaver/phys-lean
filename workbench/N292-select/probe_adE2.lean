import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/- The mixed Leibniz for adE(ocRM P): ⁅adE (ocRM P), Lmul C⁆ = Lmul (adE (ocRM P) C).
   adE(ocRM P) X = M*X - X*M  (M = ocRM P, nuclear).
   ⁅adE M, Lmul C⁆ X = adE M (jb C X) - jb C (adE M X)
     = M*(C*X+X*C) - (C*X+X*C)*M - (C*(M*X-X*M) + (M*X-X*M)*C)
   Lmul(adE M C) X = jb (M*C - C*M) X = (M*C-C*M)*X + X*(M*C-C*M).
   With M nuclear (ocRM_assoc), these are equal. Mirror the `collapse` proof style. -/
set_option maxHeartbeats 1600000 in
theorem adE_ocRM_mixed (P : Matrix (Fin 3) (Fin 3) ℚ) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ⁅adE (ocRM P), Lmul C⁆ = Lmul (adE (ocRM P) C) := by
  apply LinearMap.ext; intro X
  rw [show (⁅adE (ocRM P), Lmul C⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = adE (ocRM P) * Lmul C - Lmul C * adE (ocRM P) from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, adE_apply, Lmul_apply, jb]
  simp only [mul_add, add_mul, mul_sub, sub_mul]
  rw [ocRM_assoc_L P C X, ocRM_assoc_L P X C, ocRM_assoc_R P C X, ocRM_assoc_R P X C]
  abel

end Phys.Algebra.HJ
