import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
variable (N : LieSubmodule ℚ derivationLieQ ↥ImLie)
#check @LieSubmodule.incl
#check (ImLie.incl : ↥ImLie →ₗ⁅ℚ, derivationLieQ⁆ (O ℚ))
#check (N.map ImLie.incl : LieSubmodule ℚ derivationLieQ (O ℚ))
-- carrier of N.map ImLie.incl ≤ ImO
example : (N.map ImLie.incl).toSubmodule ≤ ImO := by
  intro x hx
  sorry
-- invariance is free: a LieSubmodule M' satisfies lie_mem
example (M' : LieSubmodule ℚ derivationLieQ (O ℚ)) (D : derivationLieQ) (x : O ℚ)
    (hx : x ∈ M'.toSubmodule) : (D : Module.End ℚ (O ℚ)) x ∈ M'.toSubmodule :=
  M'.lie_mem hx
-- finrank relation: map under injective incl preserves finrank
#check @LieSubmodule.map_incl_injective
#check @LieModuleHom.ker
example : Function.Injective (ImLie.incl : ↥ImLie →ₗ⁅ℚ, derivationLieQ⁆ (O ℚ)) :=
  Subtype.val_injective
end
end Phys.Algebra
