import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.OctonionJordanGenerationCoupling
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- Is the smul in a jb_Dg_Xzabc-derived statement the SAME as a freshly-written •?
-- test 1: does rfl close Xz with the two •?
theorem dtest (d0 d1 d2 : ℚ) (b : O ℚ) :
    jb (Dg d0 d1 d2) (slotB b) = slotB ((d0 + d2) • b) := by
  unfold slotB
  rw [jb_Dg_Xzabc]
  rw [qsmul_def, mul_zero, qsmul_def, mul_zero]  -- kill the two •0 via qMod form on LHS
  -- goal now: Xz 0 (ocR(d0+d2)*b) 0 = Xz 0 ((d0+d2)•b) 0
  rfl

end Phys.Algebra.HJ
