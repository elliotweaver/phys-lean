import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- same-slot product lemmas via trace_id.  jb(slotB 1)(slotB b) = Dg(2reQ b, 0, 2reQ b).
-- Entry route: (0,0) = star b + b = 2 reQ b • 1 = ocR(2 reQ b); (2,2) likewise; others 0.
theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [jb, slotB, Xz, Dg, Matrix.add_apply, Matrix.mul_apply, Matrix.diagonal,
      Matrix.of_apply, Fin.sum_univ_three, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
      star_one, one_mul, mul_one, mul_zero, zero_mul, add_zero, zero_add, star_zero]
  all_goals (first | rfl | skip)
  -- remaining: (0,0) star b + b = ocR (2 reQ b); (2,2) b + star b = ocR (2 reQ b)
  · rw [add_comm]; rw [show star b + b = (2 * reQ b) • (1:O ℚ) from trace_id b]
    simp [ocR]; rfl
  · rw [show b + star b = (2 * reQ b) • (1:O ℚ) from by rw [add_comm]; exact trace_id b]
    simp [ocR]; rfl

end Phys.Algebra.HJ
