import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- PROBE 1: does `O ℚ` carry an AddCommGroup (from narCD)? and what about Module ℚ?
section Probe
-- narCD gives NonAssocRing (CD (CD B)); for B = Dbl ℚ that's O ℚ.
-- Check the AddCommGroup is available:
example : AddCommGroup (O ℚ) := inferInstance

-- Does Module ℚ (O ℚ) synthesize? (N16 measured: NO)
-- example : Module ℚ (O ℚ) := inferInstance  -- expected to fail

end Probe

end Phys.Algebra
