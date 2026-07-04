import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  N290 PROBE v3 — the ⊆ crux, direct (0/±1 entries, NO scalar-action lemma).
  From `famA M = 0` and `famB M = 0` extract enough entry relations to force
  M = ocR(M 0 0) • id.  Test the individual extractions close cleanly.
  Ka = pB*pC - pC*pB has 0/±1 entries; use Matrix.mul_apply + ocR_one_mul + ocR_comm.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

-- right-unit multiplication: z * ocR 1 = z
theorem mul_ocR_one (z : O ℚ) : z * ocR 1 = z := by rw [← ocR_comm]; exact ocR_one_mul z

-- Ka as a concrete constant matrix (= pB*pC - pC*pB collapsed). Compute it.
example : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]

-- The ⊆ extraction at (0,2): from adE (ocRM Ka) M = 0, entry (0,2), get M 1 2 = 0.
-- Ka row 0 = [0,1,0]; Ka col 2 = [0,0,0]. So (Ka·M - M·Ka)_{02} = M 1 2 - 0 = M 1 2.
example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h : adE (ocRM (pB * pC - pC * pB)) M = 0) : M 1 2 = 0 := by
  have hKa : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]
  rw [hKa] at h
  have h02 := congrArg (fun N => N 0 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one,
    zero_mul, mul_zero, ocR_one_mul, mul_ocR_one, add_zero, zero_add, sub_zero, zero_sub] at h02
  -- h02 should now be : M 1 2 = 0  (or - (something) etc). Inspect.
  linear_combination h02

end Phys.Algebra.HJ
