import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem htr (x c : O ℚ) :
    Matrix.trace (jb (slotC x) (slotC c)) = (x * star c) + (star x * c) := by
  simp only [jb, slotC, Xz, Matrix.trace, Matrix.diag, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.head_fin_const]

theorem trace_coupling_reQ (x c : O ℚ) :
    reQ (Matrix.trace (jb (slotC x) (slotC c))) = 2 * reQ (x * star c) := by
  rw [htr, reQ_add, reQ_mul_comm (star x) c]
  rw [show c * star x = star (x * star c) by rw [star_mul, star_star]]
  rw [reQ_star]
  ring

end Phys.Algebra.HJ
