import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- evaluate the three entries explicitly, then compare.
theorem ev1 (M A p r : ℚ) : genVec M A p r 1 = M - A*(p+r)/2 := by simp [genVec]
theorem ev2 (M A p r : ℚ) : genVec M A p r 2 = M - A*(p-r)/2 := by simp [genVec]
theorem distinct12 (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 1 ≠ genVec M A (1/7) (-12/7) 2 := by
  rw [ev1, ev2]; intro hc; apply hA; linarith
end Phys.Algebra.HJ
