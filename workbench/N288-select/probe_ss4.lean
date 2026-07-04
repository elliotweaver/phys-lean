import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  have hd : ∀ x : O ℚ, star x + x = (2 * reQ x) • (1:O ℚ) := by
    intro x; rw [add_comm]; exact trace_id x
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [jb, slotB, Xz, Dg, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
      Matrix.diagonal, Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.cons_val',
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, if_true, if_false,
      star_one, one_mul, mul_one, mul_zero, zero_mul, add_zero, zero_add, star_zero, ocR]
  · rw [hd b]; ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  · rw [show b + star b = (2 * reQ b) • (1:O ℚ) from trace_id b]; ext <;> simp [cd_qsmul_re, cd_qsmul_im]

end Phys.Algebra.HJ
