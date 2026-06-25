import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
#check @Submodule.finrank_pos                  -- nontrivial ↔ 0 < finrank ?
#check @Submodule.finrank_lt                    -- proper ⟹ finrank < finrank whole ?
#check @Submodule.finrank_pos_iff
#check @Submodule.equivMapOfInjective
#check @LieSubmodule.toSubmodule_eq_bot
#check @LieSubmodule.toSubmodule_eq_top
-- finrank ↥ImLie's whole space (the subtype) is 7
example : Module.finrank ℚ (⊤ : Submodule ℚ ↥ImLie) = 7 := by
  rw [finrank_top]; exact finrank_ImLie
end
end Phys.Algebra
