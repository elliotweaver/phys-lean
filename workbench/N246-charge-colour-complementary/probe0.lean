import Phys.Algebra.TowerGatherForcedColourChargeCommute
import Phys.Algebra.TowerGatherObstructionComplementSo7

namespace N246Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- charge is a fundamental-7 element: crossEmb sgl = chargeOp
theorem chargeOp_mem_range_crossEmb : chargeOp ∈ LinearMap.range crossEmb := by
  refine ⟨sgl, ?_⟩
  rw [crossEmb_apply]
  rfl

-- moat: charge is NOT an adjoint/colour generator (via inter_eq_bot)
theorem chargeOp_not_mem_range_imRep : chargeOp ∉ LinearMap.range imRepL := by
  intro hmem
  have hin : chargeOp ∈ (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) := ⟨hmem, chargeOp_mem_range_crossEmb⟩
  rw [inter_eq_bot] at hin
  exact chargeOp_ne_zero (Submodule.mem_bot ℚ |>.mp hin)

def chargeLine : Submodule ℚ (Module.End ℚ ImO) := Submodule.span ℚ {chargeOp}

theorem chargeLine_le_range_crossEmb : chargeLine ≤ LinearMap.range crossEmb := by
  rw [chargeLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact chargeOp_mem_range_crossEmb

theorem finrank_chargeLine : Module.finrank ℚ chargeLine = 1 :=
  finrank_span_singleton chargeOp_ne_zero

theorem chargeLine_inf_range_imRep_eq_bot :
    chargeLine ⊓ LinearMap.range imRepL = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro x hx
  obtain ⟨hxc, hxi⟩ := hx
  have hxcross : x ∈ LinearMap.range crossEmb := chargeLine_le_range_crossEmb hxc
  have : x ∈ (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) := ⟨hxi, hxcross⟩
  rwa [inter_eq_bot] at this

def colourImg : Submodule ℚ (Module.End ℚ ImO) :=
  (colourCentralizer.toSubmodule).map imRepL

theorem colourImg_le_range_imRep : colourImg ≤ LinearMap.range imRepL :=
  LinearMap.map_le_range

theorem finrank_colourImg : Module.finrank ℚ colourImg = 8 := by
  rw [colourImg, (Submodule.equivMapOfInjective imRepL imRep_injective
    colourCentralizer.toSubmodule).finrank_eq.symm]
  exact finrank_colourCentralizer_eq_eight

theorem chargeLine_inf_colourImg_eq_bot : chargeLine ⊓ colourImg = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro x hx
  obtain ⟨hxc, hxcol⟩ := hx
  have : x ∈ chargeLine ⊓ LinearMap.range imRepL := ⟨hxc, colourImg_le_range_imRep hxcol⟩
  rw [chargeLine_inf_range_imRep_eq_bot] at this
  exact this

theorem finrank_chargeLine_sup_colourImg :
    Module.finrank ℚ ↥(chargeLine ⊔ colourImg) = 9 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq chargeLine colourImg
  rw [chargeLine_inf_colourImg_eq_bot, finrank_bot, add_zero, finrank_chargeLine,
      finrank_colourImg] at key
  omega

end

end N246Probe
