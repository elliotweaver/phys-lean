import Phys.Algebra.DerivationIrreducibleFull

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- PROBE LEVER A: ⁅K, ImLie⁆ = ⊥ → K = ⊥ for a Lie ideal K.

-- First: what is the type of ⁅K, ImLie⁆?
example (K : LieIdeal ℚ derivationLieQ) : LieSubmodule ℚ derivationLieQ (O ℚ) := ⁅K, ImLie⁆

-- The action of x : derivationLieQ on m : O ℚ
example (x : derivationLieQ) (m : O ℚ) : ⁅x, m⁆ = (x : Module.End ℚ (O ℚ)) m := by
  rfl

-- imRep x = 0 from action vanishing on ImO
example (x : derivationLieQ) (h : ∀ m : O ℚ, m ∈ ImO → (x : Module.End ℚ (O ℚ)) m = 0) :
    imRep x = 0 := by
  apply LinearMap.ext
  intro y
  apply Subtype.ext
  rw [imRep_coe]
  exact h y.1 y.2
  -- ImO membership

end
end Phys.Algebra
