import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  N290 PROBE v4 — the ⊆ crux extraction, closer fixed (O ℚ non-commutative → no linear_combination).
  After simp reduces the (0,2) entry of `adE (ocRM Ka) M = 0`, close with the additive-group
  fact directly. Test all the extractions needed for the ⊆ argument.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

theorem mul_ocR_one (z : O ℚ) : z * ocR 1 = z := by rw [← ocR_comm]; exact ocR_one_mul z

-- ⊆ extraction (0,2): from adE (ocRM Ka) M = 0 get M 1 2 = 0.
example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h : adE (ocRM (pB * pC - pC * pB)) M = 0) : M 1 2 = 0 := by
  have hKa : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]
  rw [hKa] at h
  have h02 := congrArg (fun N => N 0 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    add_zero, zero_add, sub_zero, zero_sub] at h02
  -- h02 : M 1 2 = 0  (or a signed variant). Inspect + close with abel/neg.
  simpa using h02

-- ⊆ extraction (0,1): Ka row0=[0,1,0], col1=[1,0,0] → (Ka M - M Ka)_{01} = M 1 1 - M 0 0.
example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h : adE (ocRM (pB * pC - pC * pB)) M = 0) : M 1 1 = M 0 0 := by
  have hKa : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]
  rw [hKa] at h
  have h01 := congrArg (fun N => N 0 1) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    add_zero, zero_add, sub_zero, zero_sub] at h01
  -- h01 : M 1 1 - M 0 0 = 0  → M 1 1 = M 0 0
  linarith [sub_eq_zero.mp h01]  -- placeholder; if wrong shape, fix

end Phys.Algebra.HJ
