import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie)

-- (1) carrier ≤ ImO.   (N.map ImLie.incl).toSubmodule = N.toSubmodule.map incl.toLinearMap
example : (N.map ImLie.incl).toSubmodule = Submodule.map (ImLie.incl).toLinearMap N.toSubmodule := by
  rfl
example : (N.map ImLie.incl).toSubmodule ≤ ImO := by
  rw [show (N.map ImLie.incl).toSubmodule = Submodule.map (ImLie.incl).toLinearMap N.toSubmodule from rfl]
  refine le_trans (Submodule.map_mono le_top) ?_
  rw [Submodule.map_top]
  intro x hx
  obtain ⟨y, rfl⟩ := hx
  exact y.2

-- (2) finrank preserved (incl injective)
example : Module.finrank ℚ ↥((N.map ImLie.incl).toSubmodule) = Module.finrank ℚ ↥N := by
  rw [show (N.map ImLie.incl).toSubmodule = Submodule.map (ImLie.incl).toLinearMap N.toSubmodule from rfl]
  exact (Submodule.equivMapOfInjective _ (by exact Subtype.val_injective) N.toSubmodule).finrank_eq.symm

end
end Phys.Algebra
