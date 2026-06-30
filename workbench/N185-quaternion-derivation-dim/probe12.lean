import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Test final assembly skeleton with axioms in place.
-- finrank (range oneEmb) = 1 since oneEmb injective from ℚ (finrank 1).
example (oneEmb : ℚ →ₗ[ℚ] H ℚ) (hinj : Function.Injective oneEmb) :
    Module.finrank ℚ (LinearMap.range oneEmb) = 1 := by
  rw [LinearMap.finrank_range_of_inj hinj, Module.finrank_self]

-- then finrank (ker adL) = finrank (range oneEmb) via ker_adL_eq congr
example (adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ)) (oneEmb : ℚ →ₗ[ℚ] H ℚ)
    (hker : LinearMap.ker adL = LinearMap.range oneEmb)
    (hinj : Function.Injective oneEmb) :
    Module.finrank ℚ (LinearMap.ker adL) = 1 := by
  rw [hker, LinearMap.finrank_range_of_inj hinj, Module.finrank_self]

-- final: range = 3
example (adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ))
    (hrn : Module.finrank ℚ (LinearMap.range adL) + Module.finrank ℚ (LinearMap.ker adL)
      = Module.finrank ℚ (H ℚ))
    (hker1 : Module.finrank ℚ (LinearMap.ker adL) = 1)
    (hH4 : Module.finrank ℚ (H ℚ) = 4) :
    Module.finrank ℚ (LinearMap.range adL) = 3 := by
  omega

end Phys.Algebra
