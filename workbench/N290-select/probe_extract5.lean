import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

theorem mul_ocR_one (z : O ℚ) : z * ocR 1 = z := by rw [← ocR_comm]; exact ocR_one_mul z

-- confirm the (0,1) closer: h01 : 1 * M 1 1 - M 0 0 * 1 = 0  ⊢  M 1 1 = M 0 0
example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h : adE (ocRM (pB * pC - pC * pB)) M = 0) : M 1 1 = M 0 0 := by
  have hKa : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]
  rw [hKa] at h
  have h01 := congrArg (fun N => N 0 1) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, zero_mul, mul_zero, ocR_one_mul,
    add_zero, zero_add] at h01
  rw [one_mul, mul_ocR_one] at h01
  exact sub_eq_zero.mp h01

end Phys.Algebra.HJ
