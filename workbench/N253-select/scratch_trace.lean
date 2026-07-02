import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherForcedChargeDirection
import Mathlib.Tactic

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace ScratchN253T

def Cmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0], ![0, 0, -1, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0], ![0, 0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, -1, 0]]
def Imat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0], ![0, 0, -2, 0, 0, 0, 0], ![0, 2, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, -2],
     ![0, 0, 0, 0, 0, 2, 0]]

example (M N : M7) : LinearMap.trace ℚ ImO (qI M * qI N) = (tr7 (mul7 M N) : ℚ) := by
  rw [qI_comp M N, trace_qI]

example : (tr7 (mul7 Cmat Cmat) : ℚ) = -6 := by norm_num [tr7, mul7, Cmat, Matrix.cons_val]
example : (tr7 (mul7 Imat Imat) : ℚ) = -16 := by norm_num [tr7, mul7, Imat, Matrix.cons_val]
example : (tr7 (mul7 Cmat Imat) : ℚ) = 0 := by norm_num [tr7, mul7, Cmat, Imat, Matrix.cons_val]

end ScratchN253T
