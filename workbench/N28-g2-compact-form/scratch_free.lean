import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

example (W : Submodule ℚ (O ℚ)) :
    Module.Free ℚ (gBil.restrict W).skewAdjointSubmodule := by
  exact Module.Free.of_divisionRing ℚ _

example (A B : Type) [AddCommGroup A] [Module ℚ A] [AddCommGroup B] [Module ℚ B]
    [Module.Finite ℚ A] [Module.Finite ℚ B] :
    Module.finrank ℚ (A × B) = Module.finrank ℚ A + Module.finrank ℚ B := by
  haveI : Module.Free ℚ A := Module.Free.of_divisionRing ℚ A
  haveI : Module.Free ℚ B := Module.Free.of_divisionRing ℚ B
  exact Module.finrank_prod
end
end Phys.Algebra
