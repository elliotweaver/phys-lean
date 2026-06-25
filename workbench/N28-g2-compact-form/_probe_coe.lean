import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie)
example : Module.finrank ℚ ↥N = Module.finrank ℚ ↥N.toSubmodule := rfl
-- does this defeq go through `show`?
example (h : N ≠ ⊥) : 0 < Module.finrank ℚ ↥N := by
  show 0 < Module.finrank ℚ ↥N.toSubmodule
  have hne : N.toSubmodule ≠ ⊥ := fun hh => h (by rwa [LieSubmodule.toSubmodule_eq_bot] at hh)
  have := (Submodule.one_le_finrank_iff (S := N.toSubmodule)).mpr hne
  omega
end
end Phys.Algebra
