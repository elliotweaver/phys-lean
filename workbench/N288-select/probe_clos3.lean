import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 8000000
set_option synthInstance.maxHeartbeats 1000000

-- entrywise closure: check ⁅FC,FA⁆ X = FB X at each of 9 matrix entries, for arbitrary X.
-- Each side is a sum of matrix products of specific slot matrices with X. Expand via Matrix.mul_apply.
theorem so3_closure_FCFA :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
      = innerMul (slotB (1:O ℚ)) (slotA 1) := by
  apply LinearMap.ext; intro X
  apply Matrix.ext; intro i j
  simp only [Ring.lie_def, LinearMap.sub_apply, Module.End.mul_apply, innerMul_apply, jb,
    Matrix.add_apply, Matrix.sub_apply, Matrix.mul_apply, slotA, slotB, slotC, Xz,
    Fin.sum_univ_three]
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons, Matrix.of_apply, Matrix.cons_val', Matrix.empty_val',
      Matrix.cons_val_fin_one, Matrix.head_fin_const, star_zero, star_one, mul_zero, zero_mul,
      mul_one, one_mul, add_zero, zero_add, sub_zero, zero_sub] <;>
    abel

end Phys.Algebra.HJ
