import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def chargeOpR : Module.End ℚ (LinearMap.range chargeOp) :=
  chargeOp.restrict (fun x _ => LinearMap.mem_range_self chargeOp x)

def colourRepFun (D : colourCentralizer) : Module.End ℚ (LinearMap.range chargeOp) :=
  (imRep (D : derivationLieQ)).restrict
    (fun x hx => colour_mapsTo_range_chargeOp (D : derivationLieQ) D.2 hx)

@[simp] theorem colourRepFun_coe (D : colourCentralizer) (v : LinearMap.range chargeOp) :
    ((colourRepFun D v : LinearMap.range chargeOp) : ImO) = imRep (D : derivationLieQ) (v : ImO) :=
  rfl

def colourRepV : colourCentralizer →ₗ⁅ℚ⁆ Module.End ℚ (LinearMap.range chargeOp) where
  toFun := colourRepFun
  map_add' D E := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show imRep ((D : derivationLieQ) + (E : derivationLieQ)) (v : ImO)
       = imRep (D : derivationLieQ) (v:ImO) + imRep (E : derivationLieQ) (v:ImO)
    rw [map_add]; rfl
  map_smul' c D := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show imRep (c • (D : derivationLieQ)) (v : ImO) = c • imRep (D : derivationLieQ) (v:ImO)
    rw [map_smul]; rfl
  map_lie' {D E} := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    -- LHS: imRep ⁅D,E⁆ (v:ImO);  RHS: coe of (colourRepFun D * colourRepFun E - ...) v
    have hL : ((colourRepFun ⁅D, E⁆ v : LinearMap.range chargeOp) : ImO)
            = imRep (⁅(D:derivationLieQ), (E:derivationLieQ)⁆) (v:ImO) := rfl
    rw [hL]
    -- imRep is a LieHom: imRep ⁅D,E⁆ = imRep D * imRep E - imRep E * imRep D
    have hlie : imRep (⁅(D:derivationLieQ), (E:derivationLieQ)⁆)
        = imRep (D:derivationLieQ) * imRep (E:derivationLieQ)
          - imRep (E:derivationLieQ) * imRep (D:derivationLieQ) := by
      rw [LieHom.map_lie]; rfl
    rw [hlie]
    show (imRep (D:derivationLieQ) * imRep (E:derivationLieQ)
          - imRep (E:derivationLieQ) * imRep (D:derivationLieQ)) (v:ImO)
       = ((colourRepFun D * colourRepFun E - colourRepFun E * colourRepFun D) v
          : LinearMap.range chargeOp)
    simp only [LinearMap.sub_apply, LinearMap.mul_apply, AddSubgroupClass.coe_sub,
      colourRepFun_coe]

#check @colourRepV

end
end Phys.Algebra
