import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.TowerGatherForcedChargeDirection
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def Cmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0], ![0, 0, -1, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0], ![0, 0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, -1, 0]]

theorem chargeOp_eq_qI : chargeOp = qI Cmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (crossOpO u1 (x : O ℚ)) = qZ Cmat (x : O ℚ)
  ext <;>
    simp [crossOpO, octCross, qZ, Cmat, u1, c1, c2, c3, c4, c5, c6, c7,
      gForm, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

end Phys.Algebra
