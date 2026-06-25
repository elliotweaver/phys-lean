import Phys.Algebra.DerivationIrreducibleFull
namespace Counterexamples
open Phys.Algebra Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
-- the CORRECT statement DOES compile (proving the bite is structural, not spurious):
theorem ImLie_irreducible_OK : LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie :=
  ImLie_isIrreducible
end Counterexamples
