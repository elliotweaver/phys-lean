import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- Dg subtraction lemma (central diagonal is additive)
theorem Dg_sub (a b c d e f : ℚ) : Dg a b c - Dg d e f = Dg (a-d) (b-e) (c-f) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.sub_apply, Matrix.diagonal_apply, ocR_sub, ocR_zero]

-- C. famC on the off-diagonal generation-mixing sector: back to a traceless diagonal
theorem famC_slotC (c : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC c) = Dg 0 (2 * reQ c) (-(2 * reQ c)) := by
  rw [innerMul_apply,
      jb_slotB_slotC, one_mul, jb_slotA1_slotA,
      jb_comm (slotA (1:O ℚ)) (slotC c), jb_slotC_slotA, one_mul, jb_slotB1_slotB,
      Dg_sub, reQ_star]
  congr 1 <;> ring

#print axioms Dg_sub
#print axioms famC_slotC

end Phys.Algebra.HJ
