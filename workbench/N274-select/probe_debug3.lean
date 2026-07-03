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

-- Q: in slotB ((d0+d2)•b), which instance? Force qMod and see if jb_Dg_Xzabc's • is the same.
-- test: state RHS with explicit qMod smul via qsmul_def normalization
theorem dtest (d0 d1 d2 : ℚ) (b : O ℚ) :
    jb (Dg d0 d1 d2) (slotB b) = slotB ((d0 + d2) • b) := by
  unfold slotB
  rw [jb_Dg_Xzabc]
  simp only [qsmul_def, mul_zero]

-- does simp [qsmul_def] on both sides succeed if RHS also qMod? test rfl after full normalize
theorem dtest2 (d0 d1 d2 : ℚ) (b : O ℚ) :
    jb (Dg d0 d1 d2) (slotB b) = slotB ((d0 + d2) • b) := by
  unfold slotB
  rw [jb_Dg_Xzabc]
  show Xz ((d0+d1)•(0:O ℚ)) ((d0+d2)•b) ((d1+d2)•(0:O ℚ)) = Xz 0 ((d0+d2)•b) 0
  rw [show ((d0+d1)•(0:O ℚ)) = 0 by simp, show ((d1+d2)•(0:O ℚ)) = 0 by simp]

end Phys.Algebra.HJ
