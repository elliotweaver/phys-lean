/-
  PROBE 1 (X6): the top-band screening increment is a CLEAN RATIONAL — the cutPi cancels.
  Crux: M/v = 1/ewClosureRatio = cutExp(28·cutPi/3), so cutLog(M/v) = 28·cutPi/3.
  Then betaCensus · cutLog(M/v) = (16/(9·cutPi)) · (28·cutPi/3) = 448/27 — cutPi CANCELS.
  This is the exact top-band screening contribution as a pure rational of Cut. Cheap to check.
-/
import Phys.Algebra.FineStructureRunningExact
import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- The exact top-band ratio M/v = 1/(v/M) = cutExp(28·cutPi/3).
-- cutLog of it:
example : cutLog (cutExp (28 * cutPi / 3)) = 28 * cutPi / 3 := cutLog_cutExp _

-- The clean rational: betaCensus · (28·cutPi/3) = 448/27.
example : betaCensus * (28 * cutPi / 3) = 448 / 27 := by
  rw [betaCensus_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

-- So the top-band screening term is an EXACT rational, cutPi-free.
end

end Phys.Algebra
