import Phys.Algebra.DerivationSimple
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- MEASURE 1: IsSimpleOrder ↔ IsAtom ⊤; getting the negation to produce structure.
example : IsSimpleOrder (LieIdeal ℚ derivationLieQ) ↔ IsAtom (⊤ : LieIdeal ℚ derivationLieQ) :=
  isSimpleOrder_iff_isAtom_top

-- the banked semisimple instance gives BooleanAlgebra + atomistic
example : LieAlgebra.IsSemisimple ℚ derivationLieQ := derivationLieQ_semisimple

-- sSup of all atoms = ⊤  (Mathlib IsSemisimple.sSup_atoms_eq_top)
example : sSup {I : LieIdeal ℚ derivationLieQ | IsAtom I} = ⊤ :=
  LieAlgebra.IsSemisimple.sSup_atoms_eq_top

-- atom independence
example {I : LieIdeal ℚ derivationLieQ} (hI : IsAtom I) :
    Disjoint I (sSup ({I' : LieIdeal ℚ derivationLieQ | IsAtom I'} \ {I})) :=
  LieAlgebra.IsSemisimple.sSupIndep_isAtom hI

-- an atom is simple
example {I : LieIdeal ℚ derivationLieQ} (hI : IsAtom I) : LieAlgebra.IsSimple ℚ I :=
  LieAlgebra.IsSemisimple.isSimple_of_isAtom I hI

-- ⊤ is NOT an atom when ¬IsSimpleOrder; from atomistic, ≥2 atoms; need a proper atom I ≠ ⊤.
-- Try: if ¬ IsSimpleOrder then ∃ atom I with I ≠ ⊤.
example (h : ¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    ∃ I : LieIdeal ℚ derivationLieQ, IsAtom I ∧ I ≠ ⊤ := by
  by_contra hc
  push_neg at hc
  -- every atom = ⊤; with sSup atoms = ⊤ and ⊤ nontrivial, ⊤ is the only atom ⟹ simple order
  apply h
  rw [isSimpleOrder_iff_isAtom_top]
  -- ⊤ is an atom: need it. Since sSup atoms = ⊤ and the set of atoms is nonempty...
  sorry

end
end Phys.Algebra
