import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- expose the true diag entries: prove each = the metavar-free value using PLAIN simp (worked for laws)
theorem d11 (x c : O ℚ) : (jb (slotC x) (slotC c)) 1 1 = x * star c := by
  simp [jb, slotC, Xz, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three]

end Phys.Algebra.HJ
