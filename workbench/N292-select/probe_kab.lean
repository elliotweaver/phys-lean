import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-- kAB·(slotB u1) = -slotA 1. -/
theorem kAB_slotB_u1 :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotB u1) = - slotA 1 := by
  rw [innerMul_apply, jb_slotB1_slotB u1]
  have hr : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]
  rw [hr]
  simp only [mul_zero]
  rw [show (Dg 0 0 0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 by
        apply Matrix.ext; intro i j
        fin_cases i <;> fin_cases j <;>
          simp [Dg, ocR, Matrix.diagonal, Matrix.zero_apply] <;> rfl]
  rw [jb_slotA_slotB u1 u1]
  have hu : (star u1 * u1 : O ℚ) = 1 := by rw [star_u1, neg_mul, complexUnit_sq, neg_neg]
  rw [hu, jb_slotB_slotC 1 1]
  simp only [star_one, mul_one]
  rw [show jb (slotA u1) (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 from by simp [jb]]
  rw [zero_sub]

end Phys.Algebra.HJ
