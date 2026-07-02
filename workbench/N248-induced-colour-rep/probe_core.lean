import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinNonNormalize

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- The charged complement as the carrier.
-- range chargeOp is invariant under chargeOp itself (trivially) and under colour (banked).

-- (A) chargeOp maps range chargeOp into itself (trivial: image of anything is in range).
example : Set.MapsTo chargeOp ↑(LinearMap.range chargeOp) ↑(LinearMap.range chargeOp) := by
  intro x _; exact LinearMap.mem_range_self chargeOp x

-- chargeOpR : the charge complex structure restricted to the charged complement.
def chargeOpR : Module.End ℚ (LinearMap.range chargeOp) :=
  chargeOp.restrict (fun x _ => LinearMap.mem_range_self chargeOp x)

-- coe lemma
theorem chargeOpR_coe (v : LinearMap.range chargeOp) :
    ((chargeOpR v : LinearMap.range chargeOp) : ImO) = chargeOp (v : ImO) := rfl

-- (B) colour maps range into range → the induced restricted operator on the carrier.
def colourRepFun (D : colourCentralizer) : Module.End ℚ (LinearMap.range chargeOp) :=
  (imRep (D : derivationLieQ)).restrict
    (fun x hx => colour_mapsTo_range_chargeOp (D : derivationLieQ) D.2 hx)

theorem colourRepFun_coe (D : colourCentralizer) (v : LinearMap.range chargeOp) :
    ((colourRepFun D v : LinearMap.range chargeOp) : ImO) = imRep (D : derivationLieQ) (v : ImO) :=
  rfl

#check @chargeOpR
#check @colourRepFun

end
end Phys.Algebra
