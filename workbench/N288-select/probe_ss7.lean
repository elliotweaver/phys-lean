import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = star b + b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = b + star b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotB, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

end Phys.Algebra.HJ
