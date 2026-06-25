import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.LinearAlgebra.Dimension.Free
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
example (W : Submodule ℚ (O ℚ)) :
    Module.Free ℚ (gBil.restrict W).skewAdjointSubmodule :=
  Module.Free.of_divisionRing ℚ (gBil.restrict W).skewAdjointSubmodule
example (W : Submodule ℚ (O ℚ)) :
    Module.Finite ℚ (gBil.restrict W).skewAdjointSubmodule := by infer_instance
end
end Phys.Algebra
