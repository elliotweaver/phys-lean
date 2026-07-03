import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- STEP 1: nail the trace entry computation with the banked frame-weight idiom.
theorem htr (x c : O ℚ) :
    Matrix.trace (jb (slotC x) (slotC c)) = (x * star c) + (star x * c) := by
  simp only [jb, slotC, Xz, Matrix.trace, Matrix.diag, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.head_fin_const]
  ring_nf
  sorry

end Phys.Algebra.HJ
