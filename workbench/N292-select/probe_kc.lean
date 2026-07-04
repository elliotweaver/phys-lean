import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]

private theorem reQ_u1 : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]

private theorem Dg000_zero : (Dg 0 0 0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Dg, ocR, Matrix.diagonal, Matrix.zero_apply] <;> rfl

/-- kAB·(slotC 1) = 0.
    innerMul(slotA u1)(slotB 1)(slotC 1) = jb(slotA u1)(jb(slotB 1)(slotC 1)) - jb(slotB 1)(jb(slotA u1)(slotC 1)).
    jb(slotB 1)(slotC 1) = slotA 1; jb(slotA u1)(slotA 1) = jb(slotA 1)(slotA u1) = Dg(0,0,0) = 0.
    jb(slotA u1)(slotC 1) = jb(slotC 1)(slotA u1) = slotB u1; jb(slotB 1)(slotB u1) = Dg 0 0 0 = 0. -/
theorem kAB_slotC_one :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotC 1) = 0 := by
  rw [innerMul_apply]
  rw [jb_slotB_slotC 1 1]; simp only [star_one, mul_one]
  -- jb(slotA u1)(slotA 1)
  rw [jb_comm (slotA u1) (slotA 1), jb_slotA1_slotA u1, reQ_u1]
  simp only [mul_zero]; rw [Dg000_zero]
  -- jb(slotA u1)(slotC 1) = jb(slotC 1)(slotA u1) = slotB (u1 * 1)
  rw [jb_comm (slotA u1) (slotC 1), jb_slotC_slotA u1 1]
  simp only [mul_one]
  -- jb(slotB 1)(slotB u1)
  rw [jb_slotB1_slotB u1, reQ_u1]
  simp only [mul_zero]; rw [Dg000_zero, sub_zero]

end Phys.Algebra.HJ
