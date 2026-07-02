import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- levers from probe_ker/probe_vsub (assumed banked in production)
theorem colour_mapsTo_Vsub (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (D : Module.End ℚ (O ℚ)) ↑Vsub ↑Vsub := by
  intro v hv
  simp only [SetLike.mem_coe] at hv ⊢
  rw [← range_chargeOp_map_eq_Vsub, Submodule.mem_map] at hv
  obtain ⟨w, hw, hwv⟩ := hv
  have hkey : imRep D w ∈ LinearMap.range chargeOp :=
    colour_mapsTo_range_chargeOp D hD (by simpa using hw)
  rw [← range_chargeOp_map_eq_Vsub, Submodule.mem_map]
  refine ⟨imRep D w, hkey, ?_⟩
  show ((imRep D w : ImO) : O ℚ) = (D : Module.End ℚ (O ℚ)) v
  rw [imRep_coe]; congr 1

def colourVFun (D : colourCentralizer) : Module.End ℚ Vsub :=
  (D.1 : Module.End ℚ (O ℚ)).restrict (colour_mapsTo_Vsub (D:derivationLieQ) D.2)

@[simp] theorem colourVFun_coe (D : colourCentralizer) (v : Vsub) :
    ((colourVFun D v : Vsub) : O ℚ) = (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ) := rfl

theorem ker_inf_range_chargeOp : LinearMap.ker chargeOp ⊓ LinearMap.range chargeOp = ⊥ := by
  rw [Submodule.eq_bot_iff]; intro y hy
  rw [Submodule.mem_inf] at hy; obtain ⟨hker, hrange⟩ := hy
  rw [chargeOp_ker, Submodule.mem_span_singleton] at hker
  obtain ⟨a, rfl⟩ := hker
  have hcoe : ((a • sgl : ImO) : O ℚ) ∈ Vsub := by
    rw [← range_chargeOp_map_eq_Vsub]; exact ⟨a • sgl, hrange, rfl⟩
  have hsing : ((a • sgl : ImO) : O ℚ) ∈ singlet := by
    show (a • (sgl:O ℚ)) ∈ singlet
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self u1)
  have hbot : ((a • sgl : ImO) : O ℚ) ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]; exact ⟨hsing, hcoe⟩
  rw [Submodule.mem_bot] at hbot
  apply Subtype.ext; simpa using hbot

theorem ker_sup_range_chargeOp : LinearMap.ker chargeOp ⊔ LinearMap.range chargeOp = ⊤ := by
  apply Submodule.eq_top_of_finrank_eq
  have h := Submodule.finrank_sup_add_finrank_inf_eq (LinearMap.ker chargeOp) (LinearMap.range chargeOp)
  rw [ker_inf_range_chargeOp, finrank_bot, finrank_ker_chargeOp, finrank_range_chargeOp] at h
  rw [finrank_ImO]; omega

-- ===== NONTRIVIALITY: colourVFun ⟨DI, DI_mem_colour⟩ ≠ 0 =====
theorem colourVFun_DI_ne_zero : colourVFun ⟨DI, DI_mem_colour⟩ ≠ 0 := by
  intro hzero
  -- Step 1: imRep DI vanishes on range chargeOp.
  -- For y ∈ range chargeOp, (y:O ℚ) ∈ Vsub, so imRep DI y corresponds to colourVFun on that Vsub elt = 0.
  have hrange0 : ∀ y ∈ LinearMap.range chargeOp, imRep DI y = 0 := by
    intro y hy
    have hyV : (y : O ℚ) ∈ Vsub := by
      rw [← range_chargeOp_map_eq_Vsub]; exact ⟨y, hy, rfl⟩
    -- colourVFun ⟨DI,_⟩ ⟨(y:O ℚ), hyV⟩ = 0 (from hzero)
    have h0 : colourVFun ⟨DI, DI_mem_colour⟩ ⟨(y:O ℚ), hyV⟩ = 0 := by rw [hzero]; rfl
    have hc := congrArg (fun (z:Vsub) => (z:O ℚ)) h0
    simp only [colourVFun_coe] at hc
    -- hc : (DI:End) (y:O ℚ) = (0:Vsub) coe = 0
    apply Subtype.ext
    rw [imRep_coe]
    show (DI : Module.End ℚ (O ℚ)) (y:O ℚ) = ((0:ImO):O ℚ)
    simpa using hc
  -- Step 2: imRep DI kills sgl.
  have hsgl0 : imRep DI sgl = 0 := colour_kills_sgl DI DI_mem_colour
  -- Step 3: imRep DI = 0 on ker ⊔ range = ⊤, hence everywhere.
  have hall : imRep DI = 0 := by
    rw [← LinearMap.ker_eq_top, eq_top_iff, ← ker_sup_range_chargeOp]
    apply sup_le
    · -- ker chargeOp = span sgl ≤ ker (imRep DI)
      rw [chargeOp_ker, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe,
          LinearMap.mem_ker]
      exact hsgl0
    · -- range chargeOp ≤ ker (imRep DI)
      intro r hr
      rw [LinearMap.mem_ker]
      exact hrange0 r hr
  -- Step 4: DI = 0, contradiction.
  have hDI0 : (DI : derivationLieQ) = 0 := imRep_injective (by rw [hall]; rfl)
  exact DI_ne_zero hDI0

#check @colourVFun_DI_ne_zero

end
end Phys.Algebra
