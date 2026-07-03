import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem diag11 (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = x * star c := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem diag22 (x c : O ℚ) : (jb (slotC x) (slotC c)) 2 2 = star x * c := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem diag00 (x c : O ℚ) : (jb (slotC x) (slotC c)) 0 0 = 0 := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem htr (x c : O ℚ) :
    Matrix.trace (jb (slotC x) (slotC c)) = (x * star c) + (star x * c) := by
  rw [Matrix.trace, Fin.sum_univ_three]
  rw [show (3:ℕ) = 3 from rfl]  -- noop anchor
  simp only [Matrix.diag_apply]
  rw [diag00, diag11, diag22]
  abel

end Phys.Algebra.HJ
