import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie) (D : derivationLieQ)
#check @LieSubmodule.lie_mem
-- what type does N.toSubmodule elements have?
example (y : ↥ImLie) (hy : y ∈ N.toSubmodule) : ⁅D, y⁆ ∈ N := N.lie_mem hy
-- the action coercion to O ℚ
example (y : ↥ImLie) : ((⁅D, y⁆ : ↥ImLie) : O ℚ) = (D : Module.End ℚ (O ℚ)) (y : O ℚ) := rfl
end
end Phys.Algebra
