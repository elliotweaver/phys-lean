import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

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

-- ===== PIECE: colourVFun commutes with chargeOpV (ℂ-linearity, the core) =====
-- At O ℚ level: (D:End) commutes with (crossOpO u1) because colour_commute_chargeOp gives
-- Commute (imRep D) chargeOp; but chargeOpV = (crossOpO u1)|Vsub, colourVFun = D|Vsub.
-- We want colourVFun D * chargeOpV = chargeOpV * colourVFun D on Vsub.
-- Both sides coe to: (D) (crossOpO u1 v) vs (crossOpO u1) (D v). At O ℚ level need D∘(crossOpO u1)=(crossOpO u1)∘D on Vsub.
-- colour_commute_chargeOp D hD : Commute (imRep D) chargeOp — that's on ImO. Restricted to Vsub it says
-- imRep D (chargeOp y) = chargeOp (imRep D y). Coe to O ℚ: (D)(crossOpO u1 (y:O ℚ)) = crossOpO u1 (D (y:O ℚ)).

theorem colourVFun_commute_chargeOpV (D : colourCentralizer) :
    colourVFun D * chargeOpV = chargeOpV * colourVFun D := by
  apply LinearMap.ext; intro v; apply Subtype.ext
  rw [Module.End.mul_apply, Module.End.mul_apply]
  -- goal: ↑(colourVFun D (chargeOpV v)) = ↑(chargeOpV (colourVFun D v))
  show ((colourVFun D (chargeOpV v) : Vsub) : O ℚ) = ((chargeOpV (colourVFun D v) : Vsub) : O ℚ)
  rw [colourVFun_coe, chargeOpV_coe, chargeOpV_coe, colourVFun_coe]
  -- goal: (D)(crossOpO u1 (v:O ℚ)) = crossOpO u1 ((D)(v:O ℚ))
  -- Use commuting at ImO level. v:Vsub, (v:O ℚ) ∈ Vsub ⊆ ImO.
  have hvIm : (v : O ℚ) ∈ ImO := Vsub_le_ImO v.2
  have hc : Commute (imRep (D:derivationLieQ)) chargeOp := colour_commute_chargeOp _ D.2
  have hcv : imRep (D:derivationLieQ) (chargeOp ⟨(v:O ℚ), hvIm⟩)
           = chargeOp (imRep (D:derivationLieQ) ⟨(v:O ℚ), hvIm⟩) := by
    have := hc.eq
    calc imRep (D:derivationLieQ) (chargeOp ⟨(v:O ℚ), hvIm⟩)
        = (imRep (D:derivationLieQ) * chargeOp) ⟨(v:O ℚ), hvIm⟩ := rfl
      _ = (chargeOp * imRep (D:derivationLieQ)) ⟨(v:O ℚ), hvIm⟩ := by rw [this]
      _ = chargeOp (imRep (D:derivationLieQ) ⟨(v:O ℚ), hvIm⟩) := rfl
  have hcoe := congrArg (fun (z:ImO) => (z:O ℚ)) hcv
  simp only [imRep_coe, crossOp_coe] at hcoe
  -- hcoe should be: (D)(octCross u1 (v:O ℚ)) = octCross u1 ((D)(v:O ℚ))
  simpa [crossOpO_apply] using hcoe

#check @colourVFun_commute_chargeOpV

end
end Phys.Algebra
