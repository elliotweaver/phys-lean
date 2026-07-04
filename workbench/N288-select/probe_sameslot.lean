import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 4000000

-- BRICK: same-slot product jb (slotA 1)(slotA a) = Dg (2 reQ a) (2 reQ a) 0.
-- Coordinate route (slotA 1 carries the UNIT, so entries collapse to star a + a = 2 reQ a).
theorem jb_slotA1_slotA (a : O ℚ) :
    jb (slotA (1:O ℚ)) (slotA a) = Dg (2 * reQ a) (2 * reQ a) 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, Dg, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
      reQ_add_star_eq] <;> ring_nf <;> sorry

end Phys.Algebra.HJ
