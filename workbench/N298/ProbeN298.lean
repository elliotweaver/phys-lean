import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- reQ-trace of a 3x3 octonion matrix (the deep-real coordinate of the linear trace).
noncomputable def rtr (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (jTr M)

-- expand reQ(jTr M) as sum of reQ of diagonal entries.
theorem rtr_expand (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr M = reQ (M 0 0) + reQ (M 1 1) + reQ (M 2 2) := by
  unfold rtr jTr
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply]
  rw [reQ_add, reQ_add]

-- CYCLICITY of the reQ-trace under a single product: reQ tr(A*B) = reQ tr(B*A).
theorem rtr_mul_comm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (A * B) = rtr (B * A) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, reQ_add]
  rw [reQ_mul_comm (A 0 0) (B 0 0), reQ_mul_comm (A 0 1) (B 1 0), reQ_mul_comm (A 0 2) (B 2 0),
      reQ_mul_comm (A 1 0) (B 0 1), reQ_mul_comm (A 1 1) (B 1 1), reQ_mul_comm (A 1 2) (B 2 1),
      reQ_mul_comm (A 2 0) (B 0 2), reQ_mul_comm (A 2 1) (B 1 2), reQ_mul_comm (A 2 2) (B 2 2)]
  ring

end Phys.Algebra.HJ
