import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.Semisimple.Basic
import Mathlib.Algebra.Lie.Semisimple.Lemmas

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ===== MEASUREMENT 1: simplicity skeleton =====
#synth LieRingModule derivationLieQ (O ℚ)
#synth LieModule ℚ derivationLieQ (O ℚ)

example (h : IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    LieAlgebra.IsSimple ℚ derivationLieQ :=
  (isSimple_iff_of_not_isLieAbelian ℚ derivationLieQ derivationLieQ_not_lieAbelian).mp h

-- ===== MEASUREMENT 2: ImO as a LieSubmodule =====
noncomputable def ImLie : LieSubmodule ℚ derivationLieQ (O ℚ) where
  toSubmodule := ImO
  lie_mem := by
    intro D x hx
    show (D : Module.End ℚ (O ℚ)) x ∈ ImO
    exact derivLieQ_mapsTo D x hx

#synth LieRingModule derivationLieQ (↥ImLie)
#synth LieModule ℚ derivationLieQ (↥ImLie)
example : Prop := LieModule.IsIrreducible ℚ derivationLieQ (↥ImLie)

-- Is ImLie nontrivial? (needed for IsIrreducible — IsSimpleOrder requires nontrivial)
-- u1 ∈ ImO and u1 ≠ 0, so ImLie is nontrivial
example : (⟨u1, u1_mem_ImO⟩ : ImO) ≠ 0 := by
  intro h
  have : u1 = 0 := congrArg Subtype.val h
  -- u1 is a basis generator, nonzero
  sorry

end Phys.Algebra
