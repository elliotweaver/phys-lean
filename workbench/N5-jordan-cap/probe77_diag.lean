/- DIAGNOSTIC (run 77): find simp set that FULLY reduces Dg entries inside an expression. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe77Diag
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

-- Does diagonal_apply with ite-reduction work as simp?
example (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 1 = 0 := by
  unfold Dg
  simp only [Matrix.diagonal, Matrix.of_apply]
  -- goal: (if 0 = 1 then ... else 0) = 0
  norm_num

-- Combined: off-diag -> 0, diag -> ocR
example (d0 d1 d2 : ℚ) (x : O ℚ) :
    (Dg d0 d1 d2) 0 1 * x + (Dg d0 d1 d2) 0 0 * x = ocR d0 * x := by
  unfold Dg
  simp only [Matrix.diagonal, Matrix.of_apply]
  norm_num

end Probe77Diag
