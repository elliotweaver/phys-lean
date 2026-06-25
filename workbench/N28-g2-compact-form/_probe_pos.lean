import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
#check @Submodule.finrank_lt_finrank_of_lt
#check @Submodule.one_le_finrank_iff
#check @finrank_pos_iff
-- the equivMapOfInjective gives equal finrank
example (p : Submodule ℚ ↥ImLie) :
    Module.finrank ℚ ↥(Submodule.map (ImLie.toSubmodule.subtype) p) = Module.finrank ℚ ↥p :=
  (Submodule.equivMapOfInjective _ (Submodule.subtype_injective _) p).finrank_eq.symm
-- nonzero ⟹ positive
example (p : Submodule ℚ ↥ImLie) (h : p ≠ ⊥) : 0 < Module.finrank ℚ ↥p := by
  exact?
end
end Phys.Algebra
