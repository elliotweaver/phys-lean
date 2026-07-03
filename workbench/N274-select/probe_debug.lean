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

-- zero-smul under qMod, stated in the qMod-native form
theorem qsmul_zero' (r : ℚ) : (r • (0 : O ℚ)) = 0 := by rw [qsmul_def, mul_zero]

theorem tA (d0 d1 d2 : ℚ) (b : O ℚ) :
    jb (Dg d0 d1 d2) (slotB b) = slotB ((d0 + d2) • b) := by
  unfold slotB
  rw [jb_Dg_Xzabc, qsmul_zero', qsmul_zero']

theorem tB (d0 d1 d2 : ℚ) (a : O ℚ) :
    jb (Dg d0 d1 d2) (slotA a) = slotA ((d0 + d1) • a) := by
  unfold slotA
  rw [jb_Dg_Xzabc, qsmul_zero', qsmul_zero']

end Phys.Algebra.HJ
