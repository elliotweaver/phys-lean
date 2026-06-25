import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- nontriviality of the LieSubmodule lattice on ↥ImLie
example : Nontrivial (LieSubmodule ℚ derivationLieQ ↥ImLie) := by infer_instance

-- the map of a LieSubmodule N's carrier into O ℚ
example (N : LieSubmodule ℚ derivationLieQ ↥ImLie) :
    Submodule.map (ImLie.toSubmodule.subtype) N.toSubmodule ≤ ImO := by
  have : Submodule.map (ImLie.toSubmodule.subtype) N.toSubmodule ≤ ImLie.toSubmodule :=
    Submodule.map_subtype_le _ _
  exact this

-- invariance
example (N : LieSubmodule ℚ derivationLieQ ↥ImLie)
    (D : derivationLieQ) (x : O ℚ)
    (hx : x ∈ Submodule.map (ImLie.toSubmodule.subtype) N.toSubmodule) :
    (D : Module.End ℚ (O ℚ)) x ∈ Submodule.map (ImLie.toSubmodule.subtype) N.toSubmodule := by
  rw [Submodule.mem_map] at hx ⊢
  obtain ⟨y, hyN, rfl⟩ := hx
  refine ⟨⁅D, y⁆, N.lie_mem hyN, ?_⟩
  rfl

-- dim equality
example (N : LieSubmodule ℚ derivationLieQ ↥ImLie) :
    Module.finrank ℚ ↥(Submodule.map (ImLie.toSubmodule.subtype) N.toSubmodule)
      = Module.finrank ℚ ↥N.toSubmodule :=
  (Submodule.equivMapOfInjective _ (Submodule.subtype_injective _) N.toSubmodule).finrank_eq.symm

end
end Phys.Algebra
