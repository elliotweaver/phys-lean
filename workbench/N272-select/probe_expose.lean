import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- expose each diagonal entry's true value
example (x c : O ℚ) : (jb (slotC x) (slotC c)) 0 0 = 42 := by
  simp only [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]
  simp [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const]
  sorry

example (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = 42 := by
  simp only [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]
  simp [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const]
  sorry

end Phys.Algebra.HJ
