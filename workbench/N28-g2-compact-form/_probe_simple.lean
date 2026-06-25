import Phys.Algebra.DerivationIrreducible
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
-- the banked skeleton
#check @isSimple_of_isSimpleOrder
-- what is IsSimple
#print LieAlgebra.IsSimple
-- is there a Mathlib lemma: semisimple + something ⟹ ...?
#check @LieAlgebra.IsSimple.mk
-- Mathlib path from irreducible adjoint rep to simple?
open LieModule in
#check @LieAlgebra.IsSimple
end
end Phys.Algebra
