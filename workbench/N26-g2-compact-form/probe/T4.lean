import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.Semisimple.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def ImLie : LieSubmodule ℚ derivationLieQ (O ℚ) where
  toSubmodule := ImO
  lie_mem := by
    intro D x hx
    exact derivLieQ_mapsTo D x hx

-- T4 exploration: the joint kernel of the rep on O ℚ.
-- A submodule N ⊆ O ℚ is invariant; if dim N = 1 the perfect algebra acts trivially.
-- KEY question: does Mathlib know "perfect ⟹ trivial action on 1-dim module"?
-- Let me check what's available about LieModule on a rank-1 space.

-- Actually let me check: the action of D on O ℚ. ⁅D, x⁆ = D x (tautological).
example (D : derivationLieQ) (x : O ℚ) : ⁅D, x⁆ = (D : Module.End ℚ (O ℚ)) x := rfl

-- A trace: for the FULL module O ℚ, is the rep trace-free? (needed for hasTrivialRadical route)
-- trace of D on O ℚ. From N18, derivations are trace-free.
#check @LieModule.traceForm

-- The thing I want for irreducibility: complete reducibility / Weyl.
-- Check: does Mathlib have it for char 0 semisimple?
open LieModule in
example : True := trivial

end

end Phys.Algebra
