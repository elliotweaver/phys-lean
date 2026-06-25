import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- LEVER: commuting actions. ⁅a,b⁆=0 ⟹ imRep a, imRep b commute.
theorem imRep_commute_of_lie_zero (a b : derivationLieQ) (h : (⁅a, b⁆ : derivationLieQ) = 0) :
    imRep a * imRep b = imRep b * imRep a := by
  have hl := LieHom.map_lie imRep a b
  rw [h, map_zero, Ring.lie_def] at hl
  exact (sub_eq_zero.mp hl.symm)

-- LEVER: an atom is perfect (simple ⟹ ⁅⊤,⊤⁆=⊤). Check Mathlib name.
example (I : LieIdeal ℚ derivationLieQ) (hI : IsAtom I) :
    LieAlgebra.IsSimple ℚ I := LieAlgebra.IsSemisimple.isSimple_of_isAtom I hI

-- Does IsSimple give perfect (derivedSeries / ⁅⊤,⊤⁆=⊤)?
example (L' : Type*) [LieRing L'] [LieAlgebra ℚ L'] [LieAlgebra.IsSimple ℚ L'] :
    (⁅(⊤ : LieIdeal ℚ L'), (⊤ : LieIdeal ℚ L')⁆ : LieIdeal ℚ L') = ⊤ := by
  exact?

end
end Phys.Algebra
