import Phys.Algebra.DerivationIrreducibleFull

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- LEVER 1: Nontrivial (LieIdeal ℚ derivationLieQ) : ⊥ ≠ ⊤.
-- derivationLieQ is not abelian (banked), so ⊥ ≠ ⊤ as ideals.
example : Nontrivial (LieIdeal ℚ derivationLieQ) := by
  rw [LieSubmodule.nontrivial_iff, ← not_subsingleton_iff_nontrivial]
  intro hsub
  -- subsingleton derivationLieQ ⟹ abelian, contradicting derivationLieQ_not_lieAbelian
  exact derivationLieQ_not_lieAbelian (by infer_instance)

end
end Phys.Algebra
