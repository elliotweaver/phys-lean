import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem d11 (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = x * star c + c * star x := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem d22 (x c : O ℚ) : (jb (slotC x) (slotC c)) 2 2 = star x * c + star c * x := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem d00 (x c : O ℚ) : (jb (slotC x) (slotC c)) 0 0 = 0 := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

theorem trace_coupling_reQ (x c : O ℚ) :
    reQ (Matrix.trace (jb (slotC x) (slotC c))) = 4 * reQ (x * star c) := by
  have htr : Matrix.trace (jb (slotC x) (slotC c))
      = (x * star c + c * star x) + (star x * c + star c * x) := by
    simp only [Matrix.trace, Fin.sum_univ_three, Matrix.diag_apply, d00, d11, d22]
    abel
  rw [htr, reQ_add, reQ_add, reQ_add]
  rw [reQ_mul_comm c (star x), reQ_mul_comm (star x) c, reQ_mul_comm (star c) x]
  rw [show star x * c = star x * c from rfl]
  -- reQ(c star x)? we have terms: reQ(x star c) + reQ(star x c) + reQ(star x c) + reQ(x star c)? measure
  sorry

end Phys.Algebra.HJ
