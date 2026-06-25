import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
-- print the definition of LieModule.IsIrreducible
#print LieModule.IsIrreducible
#check @LieModule.IsIrreducible
-- the self-module ↥ImLie
#check (inferInstance : LieRingModule derivationLieQ ↥ImLie)
-- what is IsSimpleOrder of LieSubmodule
#check @LieModule.isIrreducible_iff_isSimpleOrder
end
end Phys.Algebra
