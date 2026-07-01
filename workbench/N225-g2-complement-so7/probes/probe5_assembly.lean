import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationIrreducibleFull
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

abbrev imRepL : derivationLieQ →ₗ[ℚ] Module.End ℚ ImO := (imRep : derivationLieQ →ₗ⁅ℚ⁆ _).toLinearMap

-- ---- symm/nondeg of bornBil (probe4) ----
theorem bornBil_isSymm : (bornBil).IsSymm :=
  ⟨fun x y => by simp only [bornBil_apply]; exact gForm_symm (x : O ℚ) (y : O ℚ)⟩
theorem bornBil_nondegenerate : (bornBil).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm (x : O ℚ) (x : O ℚ) = 0 := by simpa [bornBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm (y : O ℚ) (y : O ℚ) = 0 := by simpa [bornBil_apply] using hy y
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

-- ---- interIdeal + trivial intersection (probe1/2/3) ----
def interIdeal : LieIdeal ℚ derivationLieQ where
  toSubmodule := Submodule.comap imRepL (LinearMap.range crossEmb)
  lie_mem := by
    intro D D' hD'
    have hD'' : imRep D' ∈ LinearMap.range crossEmb := hD'
    show imRep ⁅D, D'⁆ ∈ LinearMap.range crossEmb
    rw [LieHom.map_lie]; exact crossEmb_range_g2_invariant D hD''

theorem imRep_map_interIdeal :
    (interIdeal.toSubmodule).map imRepL
      = LinearMap.range imRepL ⊓ LinearMap.range crossEmb := by
  ext X; constructor
  · rintro ⟨D, hD, rfl⟩; exact ⟨⟨D, rfl⟩, hD⟩
  · rintro ⟨⟨D, rfl⟩, hmem⟩; exact ⟨D, hmem, rfl⟩

theorem finrank_inter_eq :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)))
      = Module.finrank ℚ interIdeal.toSubmodule := by
  rw [← imRep_map_interIdeal]
  exact (Submodule.equivMapOfInjective imRepL imRep_injective _).finrank_eq.symm

theorem finrank_inter_le_7 :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO))) ≤ 7 := by
  calc Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
          Submodule ℚ (Module.End ℚ ImO)))
      ≤ Module.finrank ℚ (LinearMap.range crossEmb) := Submodule.finrank_mono inf_le_right
    _ = 7 := finrank_crossEmb_range

theorem inter_eq_bot :
    (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) = ⊥ := by
  rcases (derivationLieQ_isSimpleOrder).eq_bot_or_eq_top interIdeal with hbot | htop
  · have h0 : Module.finrank ℚ interIdeal.toSubmodule = 0 := by
      rw [show interIdeal.toSubmodule = (⊥ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_bot] at hbot; exact hbot]; simp
    have := finrank_inter_eq; rw [h0] at this
    exact Submodule.finrank_eq_zero.mp this
  · exfalso
    have h14 : Module.finrank ℚ interIdeal.toSubmodule = 14 := by
      rw [show interIdeal.toSubmodule = (⊤ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_top] at htop; exact htop]
      rw [finrank_top]; exact finrank_derivationQ_eq_14
    have hle := finrank_inter_le_7
    rw [finrank_inter_eq, h14] at hle; omega

-- ---- range finranks ----
theorem finrank_imRep_range : Module.finrank ℚ (LinearMap.range imRepL) = 14 := by
  rw [LinearMap.finrank_range_of_inj imRep_injective, finrank_derivationQ_eq_14]

-- ---- both ranges ≤ so(7) ----
theorem imRep_range_le_so7 :
    LinearMap.range imRepL ≤ (bornBil).skewAdjointSubmodule := by
  rintro X ⟨D, rfl⟩; exact imRep_mem_so7 D

theorem crossEmb_range_le_so7' :
    LinearMap.range crossEmb ≤ (bornBil).skewAdjointSubmodule := by
  rintro X ⟨a, rfl⟩; exact crossOp_mem_so7 (a : O ℚ) a.2

-- ---- ASSEMBLY: sup has finrank 21, and equals so(7); finrank so(7) = 21 ----
theorem finrank_sup_eq_21 :
    Module.finrank ℚ ((LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO))) = 21 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq
    (LinearMap.range imRepL) (LinearMap.range crossEmb)
  rw [inter_eq_bot, finrank_bot, add_zero, finrank_imRep_range, finrank_crossEmb_range] at key
  omega

theorem sup_eq_so7 :
    (LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) = (bornBil).skewAdjointSubmodule := by
  have hle : (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) ≤
      (bornBil).skewAdjointSubmodule := sup_le imRep_range_le_so7 crossEmb_range_le_so7'
  have hfr : Module.finrank ℚ (bornBil).skewAdjointSubmodule
      ≤ Module.finrank ℚ (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) := by
    rw [finrank_sup_eq_21]
    have h := finrank_skewAdjoint_le_choose bornBil bornBil_isSymm bornBil_nondegenerate
    rw [show Module.finrank ℚ ImO = 7 from finrank_ImO] at h
    simpa using h
  exact Submodule.eq_of_le_of_finrank_le hle hfr

theorem finrank_so7_eq_21 :
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 21 := by
  rw [← sup_eq_so7, finrank_sup_eq_21]

#check @inter_eq_bot
#check @sup_eq_so7
#check @finrank_so7_eq_21

end
end Phys.Algebra
