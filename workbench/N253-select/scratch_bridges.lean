import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherForcedChargeDirection
import Mathlib.Tactic

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace ScratchN253

/-- chargeOp integer matrix (qI convention). -/
def Cmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, -1, 0]]

/-- imRep DI integer matrix (qI convention). -/
def Imat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -2, 0, 0, 0, 0],
     ![0, 2, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -2],
     ![0, 0, 0, 0, 0, 2, 0]]

-- BRIDGE 1: chargeOp = qI Cmat
example : chargeOp = qI Cmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (crossOpO u1 (x : O ℚ)) = qZ Cmat (x : O ℚ)
  ext <;>
    simp [crossOpO, octCross, qZ, Cmat, u1, c1, c2, c3, c4, c5, c6, c7,
      gForm, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

-- BRIDGE 2: imRep DI = qI Imat
example : imRep DI = qI Imat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hI : H ℚ)) (x : O ℚ) = qZ Imat (x : O ℚ)
  ext <;>
    simp [innerDeriv, qZ, Imat, hI, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

end ScratchN253
