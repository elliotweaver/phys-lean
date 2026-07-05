import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def rtr (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (jTr M)

theorem rtr_expand (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr M = reQ (M 0 0) + reQ (M 1 1) + reQ (M 2 2) := by
  unfold rtr jTr
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply]
  rw [reQ_add, reQ_add]

-- ASSOCIATIVITY of the reQ-trace under a triple product:
-- reQ tr((A*B)*C) = reQ tr(A*(B*C)), from reQ_mul_assoc3 + reQ_mul_comm entrywise.
theorem rtr_mul_assoc (A B C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr ((A * B) * C) = rtr (A * (B * C)) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, add_mul, mul_add, reQ_add]
  -- Now each side is a sum of reQ((A i k * B k l) * C l i) vs reQ(A i k * (B k l * C l i)).
  rw [reQ_mul_assoc3 (A 0 0) (B 0 0) (C 0 0), reQ_mul_assoc3 (A 0 0) (B 0 1) (C 1 0),
      reQ_mul_assoc3 (A 0 0) (B 0 2) (C 2 0), reQ_mul_assoc3 (A 0 1) (B 1 0) (C 0 0),
      reQ_mul_assoc3 (A 0 1) (B 1 1) (C 1 0), reQ_mul_assoc3 (A 0 1) (B 1 2) (C 2 0),
      reQ_mul_assoc3 (A 0 2) (B 2 0) (C 0 0), reQ_mul_assoc3 (A 0 2) (B 2 1) (C 1 0),
      reQ_mul_assoc3 (A 0 2) (B 2 2) (C 2 0),
      reQ_mul_assoc3 (A 1 0) (B 0 0) (C 0 1), reQ_mul_assoc3 (A 1 0) (B 0 1) (C 1 1),
      reQ_mul_assoc3 (A 1 0) (B 0 2) (C 2 1), reQ_mul_assoc3 (A 1 1) (B 1 0) (C 0 1),
      reQ_mul_assoc3 (A 1 1) (B 1 1) (C 1 1), reQ_mul_assoc3 (A 1 1) (B 1 2) (C 2 1),
      reQ_mul_assoc3 (A 1 2) (B 2 0) (C 0 1), reQ_mul_assoc3 (A 1 2) (B 2 1) (C 1 1),
      reQ_mul_assoc3 (A 1 2) (B 2 2) (C 2 1),
      reQ_mul_assoc3 (A 2 0) (B 0 0) (C 0 2), reQ_mul_assoc3 (A 2 0) (B 0 1) (C 1 2),
      reQ_mul_assoc3 (A 2 0) (B 0 2) (C 2 2), reQ_mul_assoc3 (A 2 1) (B 1 0) (C 0 2),
      reQ_mul_assoc3 (A 2 1) (B 1 1) (C 1 2), reQ_mul_assoc3 (A 2 1) (B 1 2) (C 2 2),
      reQ_mul_assoc3 (A 2 2) (B 2 0) (C 0 2), reQ_mul_assoc3 (A 2 2) (B 2 1) (C 1 2),
      reQ_mul_assoc3 (A 2 2) (B 2 2) (C 2 2)]
  ring

end Phys.Algebra.HJ
