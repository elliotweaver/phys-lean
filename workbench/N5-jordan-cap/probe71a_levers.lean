/- PROBE 71a: just the pull-out levers, cheap. -/
import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Tactic

namespace Probe71a
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ
attribute [local instance] CD.narCD CD.srCD

theorem pull_L (r : ℚ) (x y : O ℚ) : (ocR r * x) * y = ocR r * (x * y) :=
  (ocR_assocL r x y).symm

theorem pull_RR (r : ℚ) (x y : O ℚ) : (x * y) * ocR r = ocR r * (x * y) :=
  (ocR_comm r (x * y)).symm

theorem pull_M (r : ℚ) (x y : O ℚ) : (x * ocR r) * y = ocR r * (x * y) := by
  rw [← ocR_comm r x]; exact (ocR_assocL r x y).symm

theorem pull_R2 (r : ℚ) (x y : O ℚ) : x * (y * ocR r) = ocR r * (x * y) := by
  rw [ocR_assocR r x y]; exact (ocR_comm r (x * y)).symm

theorem pull_R1 (r : ℚ) (x y : O ℚ) : x * (ocR r * y) = ocR r * (x * y) := by
  rw [ocR_comm r y]; exact pull_R2 r x y

end Probe71a
