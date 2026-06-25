import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- Bridge: an imRep-invariant ℚ-subspace P of ↥ImO ⟹ its image W in O ℚ is
-- derivationLieQ-invariant, W ≤ ImO, dim W = dim P.
example (P : Submodule ℚ ImO) (hP : ∀ (D : derivationLieQ) (x : ImO), x ∈ P → imRep D x ∈ P) :
    True := by
  set W : Submodule ℚ (O ℚ) := P.map ImO.subtype with hWdef
  have hWle : W ≤ ImO := by
    rw [hWdef]; rintro _ ⟨z, _, rfl⟩; exact z.2
  have hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W := by
    intro D x hx
    rw [hWdef, Submodule.mem_map] at hx ⊢
    obtain ⟨z, hzP, rfl⟩ := hx
    refine ⟨imRep D z, hP D z hzP, ?_⟩
    rw [imRep_coe]; rfl
  have hdim : Module.finrank ℚ W = Module.finrank ℚ P := by
    rw [hWdef]
    exact (Submodule.equivMapOfInjective ImO.subtype (Subtype.val_injective) P).finrank_eq.symm
  trivial

end
end Phys.Algebra
