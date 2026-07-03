import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.TowerWorldMapIndivisible
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- Prove the whole matrix jb(slotC x)(slotC c) equals the diagonal Dg with the right entries,
-- via the SAME robust idiom the coupling laws used.
theorem jb_slotC_slotC (x c : O ℚ) :
    jb (slotC x) (slotC c) = !![ x * star c + star x * c … no] := by
  sorry

end Phys.Algebra.HJ
