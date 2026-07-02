import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Colour preserves Vsub (as an O ℚ submodule).
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

-- The induced operator on Vsub: colour D restricted to Vsub.
def colourVFun (D : colourCentralizer) : Module.End ℚ Vsub :=
  (D.1 : Module.End ℚ (O ℚ)).restrict (colour_mapsTo_Vsub (D:derivationLieQ) D.2)

@[simp] theorem colourVFun_coe (D : colourCentralizer) (v : Vsub) :
    ((colourVFun D v : Vsub) : O ℚ) = (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ) := rfl

-- The full LieHom.
def colourRepV : colourCentralizer →ₗ⁅ℚ⁆ Module.End ℚ Vsub where
  toFun := colourVFun
  map_add' D E := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((D:derivationLieQ) + (E:derivationLieQ) : Module.End ℚ (O ℚ)) (v:O ℚ)
       = (D.1:Module.End ℚ (O ℚ)) (v:O ℚ) + (E.1:Module.End ℚ (O ℚ)) (v:O ℚ)
    rfl
  map_smul' c D := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((c • (D:derivationLieQ) : derivationLieQ) : Module.End ℚ (O ℚ)) (v:O ℚ)
       = c • (D.1:Module.End ℚ (O ℚ)) (v:O ℚ)
    rfl
  map_lie' {D E} := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((⁅(D:derivationLieQ), (E:derivationLieQ)⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) (v:O ℚ)
       = ((colourVFun D * colourVFun E - colourVFun E * colourVFun D) v : Vsub)
    have hbr : ((⁅(D:derivationLieQ),(E:derivationLieQ)⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
        = (D.1:Module.End ℚ (O ℚ)) * (E.1:Module.End ℚ (O ℚ))
          - (E.1:Module.End ℚ (O ℚ)) * (D.1:Module.End ℚ (O ℚ)) := rfl
    rw [hbr]
    show ((D.1:Module.End ℚ (O ℚ)) * (E.1:Module.End ℚ (O ℚ))) (v:O ℚ)
         - ((E.1:Module.End ℚ (O ℚ)) * (D.1:Module.End ℚ (O ℚ))) (v:O ℚ)
       = (((colourVFun D * colourVFun E) v : Vsub) : O ℚ)
         - (((colourVFun E * colourVFun D) v : Vsub) : O ℚ)
    rw [Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply,
        colourVFun_coe, colourVFun_coe, colourVFun_coe, colourVFun_coe]

#check @colourRepV

end
end Phys.Algebra
