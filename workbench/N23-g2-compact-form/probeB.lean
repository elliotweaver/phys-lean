import Phys.Algebra.DerivationStructureConstants
import Mathlib.Algebra.Lie.Killing
import Mathlib.Algebra.Lie.Semisimple.Basic
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- PROBE: do the instances Mathlib's killingForm/IsKilling need exist for derivationLieQ?
-- derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))
-- needs: CommRing ℚ ✓, LieRing ✓, LieAlgebra ℚ ✓, Module.Finite ℚ ?, Module.Free ℚ ?

-- Module.Finite from the banked basis:
noncomputable example : Module.Finite ℚ derivationLieQ :=
  Module.Finite.of_basis derivBasis

noncomputable example : Module.Free ℚ derivationLieQ :=
  Module.Free.of_basis derivBasis

-- Does killingForm even elaborate on derivationLieQ?
noncomputable example : LinearMap.BilinForm ℚ derivationLieQ :=
  LieAlgebra.killingForm ℚ derivationLieQ

-- The chain we WANT: IsKilling ℚ derivationLieQ → IsSemisimple ℚ derivationLieQ
example [LieAlgebra.IsKilling ℚ derivationLieQ] : LieAlgebra.IsSemisimple ℚ derivationLieQ := by
  haveI : Module.Finite ℚ derivationLieQ := Module.Finite.of_basis derivBasis
  infer_instance

end Phys.Algebra
