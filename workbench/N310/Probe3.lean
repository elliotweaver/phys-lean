/-
  MEASURE-FIRST probe 3 for N310 (seed T7): the SCALAR I₃ invariant (assoc3) separation.
  I₃ = assoc3 (the banked calibration 3-form = -reQ(x·(y·z))). Measure:
   (C1) trilinear scaling of assoc3 in each slot: assoc3 (c•x) y z = c * assoc3 x y z, etc.
        -> the MATCHED-MAGNITUDE separation: same magnitudes, ℂ-line I₃=0 vs Fano I₃≠0.
   (C2) unit norms of the Fano triple (u2, u1, octCross u1 u2).
   (C3) the scaled Fano witness: assoc3 (m0•u2)(m1•u1)(m2•(octCross u1 u2)) = -(m0*m1*m2).
-/
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationAutCompact
import Mathlib.Tactic

namespace N310Probe3

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- gForm_smul_left/right, qsmul_mul_left/right banked; octCross is bilinear? measure smul in slots.

/-- (C1a) assoc3 scales in slot 1 (the x-slot): assoc3 (c•x) y z = c * assoc3 x y z.
    assoc3 x y z = gForm x (octCross y z); gForm is linear in slot 1 (gForm_smul_left). -/
theorem assoc3_smul_x (c : ℚ) (x y z : O ℚ) :
    assoc3 (c • x) y z = c * assoc3 x y z := by
  unfold assoc3
  rw [gForm_smul_left]

/-- (C2) the norms of the Fano triple's directions. -/
example : gForm u2 u2 = 1 := gForm_u2_u2
-- gForm u1 u1 = ? and gForm (octCross u1 u2)(octCross u1 u2) = ?  measure:
#eval "measuring norms below"

end N310Probe3
