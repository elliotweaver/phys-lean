import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def interIdeal : LieIdeal ℚ derivationLieQ where
  toSubmodule := Submodule.comap (imRep : derivationLieQ →ₗ⁅ℚ⁆ _).toLinearMap
      (LinearMap.range crossEmb)
  lie_mem := by
    intro D D' hD'
    have hD'' : imRep D' ∈ LinearMap.range crossEmb := hD'
    show imRep ⁅D, D'⁆ ∈ LinearMap.range crossEmb
    rw [LieHom.map_lie]
    exact crossEmb_range_g2_invariant D hD''

theorem mem_interIdeal {D : derivationLieQ} :
    D ∈ interIdeal ↔ imRep D ∈ LinearMap.range crossEmb := Iff.rfl

/-- The image of interIdeal under imRep is exactly `range imRep ⊓ range crossEmb`. -/
theorem imRep_map_interIdeal :
    (interIdeal.toSubmodule).map (imRep : derivationLieQ →ₗ⁅ℚ⁆ _).toLinearMap
      = LinearMap.range imRep ⊓ LinearMap.range crossEmb := by
  ext X
  constructor
  · rintro ⟨D, hD, rfl⟩
    exact ⟨⟨D, rfl⟩, hD⟩
  · rintro ⟨⟨D, rfl⟩, hmem⟩
    exact ⟨D, hmem, rfl⟩

/-- finrank of the intersection = finrank interIdeal (imRep injective). -/
theorem finrank_inter_eq :
    Module.finrank ℚ ((LinearMap.range imRep ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)))
      = Module.finrank ℚ interIdeal.toSubmodule := by
  rw [← imRep_map_interIdeal]
  exact (Submodule.equivMapOfInjective _ imRep_injective _).symm.finrank_eq
    |>.symm ▸ rfl

end
end Phys.Algebra
