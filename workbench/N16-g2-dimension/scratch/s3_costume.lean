import Phys.Algebra.DerivationDim

namespace Counterexamples
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- BOGUS: claim the nonzero derivation witnessDeriv does NOT kill the unit
-- (sends 1 ↦ 1). Since every derivation kills the unit (deriv_one), witnessDeriv 1 = 0,
-- so this forces 0 = 1, false. Must FAIL.
theorem deriv_preserves_unit_BOGUS : witnessDeriv (1 : O ℚ) = 1 := by
  rw [witnessDeriv_one]

end Counterexamples
