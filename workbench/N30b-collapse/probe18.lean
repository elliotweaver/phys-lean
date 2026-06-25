import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- From I ⊔ J = ⊤, every D : derivationLieQ = a + b with a ∈ I, b ∈ J.
example (I J : LieIdeal ℚ derivationLieQ) (hsup : I ⊔ J = ⊤) (D : derivationLieQ) :
    ∃ a ∈ I, ∃ b ∈ J, D = a + b := by
  have hD : D ∈ (⊤ : LieIdeal ℚ derivationLieQ) := LieSubmodule.mem_top D
  rw [← hsup, LieSubmodule.mem_sup] at hD
  obtain ⟨a, ha, b, hb, hab⟩ := hD
  exact ⟨a, ha, b, hb, hab.symm⟩

-- imRep is additive: imRep (a+b) = imRep a + imRep b ; and imRep D acting equals D on the ImO coord
example (a b : derivationLieQ) : imRep (a + b) = imRep a + imRep b := by rw [map_add]

end
end Phys.Algebra
