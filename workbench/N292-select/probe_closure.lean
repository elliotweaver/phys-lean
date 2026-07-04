import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-- kAB·(slotB u1) = -slotA 1  (banked from prior probe). -/
theorem kAB_slotB_u1 :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (slotB u1) = - slotA 1 := by
  rw [innerMul_apply, jb_slotB1_slotB u1]
  have hr : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]
  rw [hr]; simp only [mul_zero]
  rw [show (Dg 0 0 0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 by
        apply Matrix.ext; intro i j
        fin_cases i <;> fin_cases j <;> simp [Dg, ocR, Matrix.diagonal, Matrix.zero_apply] <;> rfl]
  rw [jb_slotA_slotB u1 u1]
  have hu : (star u1 * u1 : O ℚ) = 1 := by rw [star_u1, neg_mul, complexUnit_sq, neg_neg]
  rw [hu, jb_slotB_slotC 1 1]; simp only [star_one, mul_one]
  rw [show jb (slotA u1) (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 from by simp [jb], zero_sub]

/-- THE CLOSURE via the Jacobi identity in Module.End.
    kBC = innerMul (slotB u1)(slotC 1) = ⁅Lmul (slotB u1), Lmul (slotC 1)⁆.
    ⁅kAB, kBC⁆ = ⁅kAB, ⁅Lmul(slotB u1), Lmul(slotC 1)⁆⁆
              = ⁅⁅kAB, Lmul(slotB u1)⁆, Lmul(slotC 1)⁆ + ⁅Lmul(slotB u1), ⁅kAB, Lmul(slotC 1)⁆⁆.
    Need: ⁅kAB, Lmul(slotB u1)⁆ = Lmul(-slotA 1) and ⁅kAB, Lmul(slotC 1)⁆ = 0 (as operators).
    Then ⁅kAB,kBC⁆ = ⁅Lmul(-slotA 1), Lmul(slotC 1)⁆ = innerMul(-slotA 1)(slotC 1)
                   = -innerMul(slotA 1)(slotC 1) = innerMul(slotC 1)(slotA 1) = famB. -/

-- First test: can we express innerMul via Lmul bracket for the rewrite?
example (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  rw [Ring.lie_def]; rfl

-- The mixed Leibniz operator lemma (specific C = slotC 1): ⁅kAB, Lmul(slotC 1)⁆ = 0.
-- Route: LinearMap.ext; reduce ⁅kAB,Lmul(slotC 1)⁆ X = kAB (jb (slotC 1) X) - jb (slotC 1)(kAB X).
-- Measure the goal shape (use sorry to see if it typechecks / how heavy).
set_option maxHeartbeats 1200000 in
theorem coset_mixed_C : ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotC (1:O ℚ))⁆ = 0 := by
  sorry

end Phys.Algebra.HJ
