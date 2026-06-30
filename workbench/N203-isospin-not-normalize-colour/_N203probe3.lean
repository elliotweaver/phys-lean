import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- struct_ij at the pointwise level: ⁅innerDeriv hI, innerDeriv hJ⁆ z = (2:ℤ)•innerDeriv hK z
-- The End ℤ bracket on innerDeriv equals comp difference.
example (z : O ℚ) :
    (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℤ) • (innerDeriv hK) z := by
  have h := struct_ij
  have := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) h
  simpa [Ring.lie_def, sub_eq_iff_eq_add] using this

end Phys.Algebra
