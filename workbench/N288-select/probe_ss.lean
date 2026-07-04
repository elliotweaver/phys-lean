import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- same-slot: jb (slotB 1)(slotB b) — slotB carries entries at (0,2),(2,0). Product:
-- slotB 1 = E02(1)+E20(1); slotB b = E02(b)+E20(star b).
-- (slotB 1)*(slotB b): (0,2)*(2,0)->(0,0): 1*star b ; (2,0)*(0,2)->(2,2): 1*b
-- (slotB b)*(slotB 1): (0,2)*(2,0)->(0,0): b*1 ; (2,0)*(0,2)->(2,2): star b*1
-- sum diag (0,0): star b + b = 2 reQ b ; (2,2): b + star b = 2 reQ b. So Dg(2reQ b,0,2reQ b).
-- Let me just check via a Dg equality with a reQ lemma. First: does reQ b • 1 = ... need star b + b.
-- test the entry (0,0):
example (b : O ℚ) : (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = star b + b := by
  simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three]

end Phys.Algebra.HJ
