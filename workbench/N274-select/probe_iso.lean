import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- ISOLATE 1: the zero-cleanup for slot lemmas
theorem jb_comm' (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; rw [add_comm]

theorem jb_slotB_Dg (b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotB b) (Dg d0 d1 d2) = slotB ((d0 + d2) • b) := by
  rw [jb_comm']; unfold slotB; rw [jb_Dg_Xzabc, smul_zero, smul_zero]

-- ISOLATE 2: the final scalar identity, several closers
example (v : O ℚ) (d0 d1 d2 : ℚ) :
    (d0 + d2) • v - (d0 + d1) • v = (d2 - d1) • v := by
  rw [← sub_smul]; congr 1; ring

-- ISOLATE 3: star of ℚ-smul on O ℚ
example (c : ℚ) (a : O ℚ) : star (c • a) = c • star a := by
  rw [star_smul, star_trivial]

end Phys.Algebra.HJ
