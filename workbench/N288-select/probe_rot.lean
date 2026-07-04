import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

set_option maxHeartbeats 4000000
set_option synthInstance.maxHeartbeats 800000

-- ATTEMPT 1: rotation action by direct coordinate expansion.
theorem FC_slotA (a : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotA a) = - slotB a := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [innerMul_apply, jb, slotA, slotB, slotC, Xz, Matrix.mul_apply,
      Matrix.add_apply, Matrix.neg_apply, Fin.sum_univ_three]

end Phys.Algebra.HJ
