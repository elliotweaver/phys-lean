/- PROBE 78e: does the ℚ-smul route exist for O ℚ? Test ocR r * x = r • x. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe78E
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

-- Does O ℚ have a Module ℚ instance? Test that r • x typechecks.
example (r : ℚ) (x : O ℚ) : O ℚ := r • x

-- Does ocR r * x = r • x ?
example (r : ℚ) (x : O ℚ) : ocR r * x = r • x := by
  sorry

end Probe78E
