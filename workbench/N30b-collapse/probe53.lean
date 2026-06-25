import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- PROBE A: sup decomposition of D ∈ ⊤ = I ⊔ Iᶜ into a∈I, b∈Iᶜ at submodule level
example (I : LieIdeal ℚ derivationLieQ) (D : derivationLieQ) :
    ∃ (a b : derivationLieQ), a ∈ I ∧ b ∈ (Iᶜ : LieIdeal ℚ derivationLieQ) ∧ D = a + b := by
  have hsup : I ⊔ (Iᶜ : LieIdeal ℚ derivationLieQ) = ⊤ := sup_compl_eq_top
  have hmem : D ∈ (⊤ : LieIdeal ℚ derivationLieQ) := trivial
  rw [← hsup] at hmem
  rw [← LieSubmodule.mem_toSubmodule, LieSubmodule.sup_toSubmodule, Submodule.mem_sup] at hmem
  obtain ⟨a, ha, b, hb, hab⟩ := hmem
  exact ⟨a, b, ha, hb, hab.symm⟩

end
end Phys.Algebra
