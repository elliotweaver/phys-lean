import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
-- Is there a Mathlib lemma: faithful irreducible ⟹ simple? search by signature
open LieModule LieAlgebra in
example : True := trivial
-- A LieIdeal I ⊆ derivationLieQ acts on O ℚ; ⁅I, ImLie⁆ is a LieSubmodule.
-- The relevant structure: derivationLieQ acts faithfully and irreducibly on ImLie.
-- For a nonzero ideal I, since ImLie nontrivial, need ⁅I, ImLie⁆ ≠ ⊥ then = ⊤.
#check @LieModule.IsIrreducible
-- LieIdeal as LieSubmodule of the adjoint
#check @LieIdeal
#check @LieAlgebra.center
-- Is derivationLieQ's action: any lemma linking ideal to submodule action?
example (I : LieIdeal ℚ derivationLieQ) : LieSubmodule ℚ derivationLieQ derivationLieQ := I
-- the key: a faithful module M; an ideal I with ⁅I,M⁆ = ⊥ ⟹ I ⊆ ker action = ⊥
#check @LieModule.IsFaithful
end
end Phys.Algebra
