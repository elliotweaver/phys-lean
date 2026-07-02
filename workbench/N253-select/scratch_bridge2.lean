import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherForcedChargeDirection
import Mathlib.Tactic

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace ScratchN253

def Imat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -2, 0, 0, 0, 0],
     ![0, 2, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -2],
     ![0, 0, 0, 0, 0, 2, 0]]

-- BRIDGE 2 attempt: unfold innerDeriv via liftEnd/adHom to component form
example : imRep DI = qI Imat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hI : H ℚ)) (x : O ℚ) = qZ Imat (x : O ℚ)
  ext <;>
    simp [innerDeriv, liftEnd_apply, adHom_apply, hI, CD.iota, Dbl.J, qZ, Imat,
      c1, c2, c3, c4, c5, c6, c7, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

end ScratchN253
