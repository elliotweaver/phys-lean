import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- The Jordan bracket of slotC x and slotC c, computed as a full matrix, then trace.
-- Approach: use the banked coupling structure differently -- slotC x * slotC c is a product;
-- reduce entrywise via Matrix.ext already works for the coupling laws. For the trace, compute
-- the (1,1) and (2,2) diagonal entries of jb via Matrix.ext-exposed entries.
theorem diag11 (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = x * star c := by
  simp only [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]
  fin_cases · <;> skip
  simp [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const]

end Phys.Algebra.HJ
