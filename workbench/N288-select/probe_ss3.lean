import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- entrywise same-slot values (like banked coupling lemmas: use Matrix.mul_apply + slot simp)
theorem ss_00 (b : O ℚ) : (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = star b + b := by
  simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three]
theorem ss_22 (b : O ℚ) : (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = b + star b := by
  simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three]
theorem ss_off (b : O ℚ) (i j : Fin 3) (h : ¬ (i = 0 ∧ j = 0) ∧ ¬ (i = 2 ∧ j = 2)) :
    (jb (slotB (1:O ℚ)) (slotB b)) i j = 0 := by
  fin_cases i <;> fin_cases j <;>
    simp_all [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three]

-- Now the Dg form:
theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Dg, Matrix.diagonal_apply, Matrix.diagonal_apply_ne, Matrix.of_apply]
  · rw [ss_00]; rw [add_comm, trace_id b]; simp [ocR]
  · exact ss_off b 0 1 ⟨by simp, by simp⟩
  · exact ss_off b 0 2 ⟨by simp, by simp⟩
  · exact ss_off b 1 0 ⟨by simp, by simp⟩
  · rw [ss_off b 1 1 ⟨by simp, by simp⟩]; simp [ocR]
  · exact ss_off b 1 2 ⟨by simp, by simp⟩
  · exact ss_off b 2 0 ⟨by simp, by simp⟩
  · exact ss_off b 2 1 ⟨by simp, by simp⟩
  · rw [ss_22, trace_id b]; simp [ocR]

end Phys.Algebra.HJ
