import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie)
-- finrank of ↥N vs ↥↑N (N.toSubmodule)
example : Module.finrank ℚ ↥N = Module.finrank ℚ ↥N.toSubmodule := rfl
-- positive finrank from N ≠ ⊥
example (h : N ≠ ⊥) : 0 < Module.finrank ℚ ↥N.toSubmodule := by
  have hne : N.toSubmodule ≠ ⊥ := fun hh => h (by rwa [LieSubmodule.toSubmodule_eq_bot] at hh)
  have := (Submodule.one_le_finrank_iff (S := N.toSubmodule)).mpr hne
  omega
-- < 7 from N ≠ ⊤
example (h : N ≠ ⊤) : Module.finrank ℚ ↥N.toSubmodule < 7 := by
  have hne : N.toSubmodule ≠ ⊤ := fun hh => h (by rwa [LieSubmodule.toSubmodule_eq_top] at hh)
  have hlt := Submodule.finrank_lt (s := N.toSubmodule) hne
  rwa [finrank_ImLie] at hlt
end
end Phys.Algebra
