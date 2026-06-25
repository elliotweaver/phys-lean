import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie) (D : derivationLieQ) (n : ↥ImLie)
-- How does the action on ↥ImLie relate to the ambient action?
example : ((⁅D, n⁆ : ↥ImLie) : O ℚ) = (D : Module.End ℚ (O ℚ)) (n : O ℚ) := by
  rfl
-- ImLie carrier = ImO
example : ImLie.toSubmodule = ImO := rfl
-- finrank of ↥ImLie
example : Module.finrank ℚ ↥ImLie = 7 := finrank_ImLie
-- N nonzero ⟹ N.toSubmodule nonzero
#check @LieSubmodule.toSubmodule_injective
-- injective subtype finrank
#check @LinearMap.finrank_map_le
#check @Submodule.finrank_map_subtype
#check @LinearMap.finrank_range_of_inj
example : Function.Injective (ImLie.toSubmodule.subtype) := Submodule.subtype_injective _
end
end Phys.Algebra
