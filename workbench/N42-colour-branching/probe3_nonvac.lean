import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationLowerBound
import Mathlib.Algebra.Lie.Subalgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42Probe

-- D0E u1 = 0 (so D0E ∈ stab).
example : D0E u1 = 0 := by
  ext <;> simp [D0E, u1, c2, c3, c4, c5]

-- D0E ≠ 0 (nonzero element of stab) : D0E u4 has nonzero c3 coordinate.
example : c3 (D0E u4) = 1 := by
  simp [D0E, u4, c2, c3, c4, c5]

example : D0E u4 ≠ 0 := by
  intro h
  have hc : c3 (D0E u4) = c3 (0 : O ℚ) := by rw [h]
  simp [D0E, u4, c2, c3, c4, c5] at hc

end N42Probe
end Phys.Algebra
