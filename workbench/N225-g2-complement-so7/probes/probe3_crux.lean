import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

abbrev imRepL : derivationLieQ →ₗ[ℚ] Module.End ℚ ImO := (imRep : derivationLieQ →ₗ⁅ℚ⁆ _).toLinearMap

def interIdeal : LieIdeal ℚ derivationLieQ where
  toSubmodule := Submodule.comap imRepL (LinearMap.range crossEmb)
  lie_mem := by
    intro D D' hD'
    have hD'' : imRep D' ∈ LinearMap.range crossEmb := hD'
    show imRep ⁅D, D'⁆ ∈ LinearMap.range crossEmb
    rw [LieHom.map_lie]
    exact crossEmb_range_g2_invariant D hD''

theorem imRep_map_interIdeal :
    (interIdeal.toSubmodule).map imRepL
      = LinearMap.range imRepL ⊓ LinearMap.range crossEmb := by
  ext X
  constructor
  · rintro ⟨D, hD, rfl⟩
    exact ⟨⟨D, rfl⟩, hD⟩
  · rintro ⟨⟨D, rfl⟩, hmem⟩
    exact ⟨D, hmem, rfl⟩

theorem finrank_inter_eq :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)))
      = Module.finrank ℚ interIdeal.toSubmodule := by
  rw [← imRep_map_interIdeal]
  exact (Submodule.equivMapOfInjective imRepL imRep_injective _).finrank_eq.symm

/-- finrank of the intersection is ≤ 7 (it sits inside range crossEmb, dim 7). -/
theorem finrank_inter_le_7 :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO))) ≤ 7 := by
  calc Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
          Submodule ℚ (Module.End ℚ ImO)))
      ≤ Module.finrank ℚ (LinearMap.range crossEmb) := Submodule.finrank_mono inf_le_right
    _ = 7 := finrank_crossEmb_range

/-- THE CRUX: the intersection is trivial. isSimpleOrder ⟹ interIdeal ∈ {⊥,⊤};
    if ⊤ then finrank interIdeal = finrank derivationLieQ = 14, but the intersection ≤ 7. -/
theorem inter_eq_bot :
    (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) = ⊥ := by
  rcases (derivationLieQ_isSimpleOrder).eq_bot_or_eq_top interIdeal with hbot | htop
  · -- interIdeal = ⊥ ⟹ intersection has finrank 0 ⟹ ⊥
    have h0 : Module.finrank ℚ interIdeal.toSubmodule = 0 := by
      rw [show interIdeal.toSubmodule = (⊥ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_bot] at hbot; exact hbot]
      simp
    have := finrank_inter_eq
    rw [h0] at this
    -- intersection has finrank 0 and is a submodule of a finite-dim space ⟹ ⊥
    exact Submodule.finrank_eq_zero.mp this
  · -- interIdeal = ⊤ ⟹ finrank interIdeal = 14 > 7 ≥ finrank intersection, contradiction
    exfalso
    have h14 : Module.finrank ℚ interIdeal.toSubmodule = 14 := by
      rw [show interIdeal.toSubmodule = (⊤ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_top] at htop; exact htop]
      rw [Submodule.finrank_top]
      exact finrank_derivationQ_eq_14
    have hle := finrank_inter_le_7
    rw [finrank_inter_eq, h14] at hle
    omega

end
end Phys.Algebra
