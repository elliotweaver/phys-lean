import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Mathlib.Tactic

open Phys.Algebra

namespace ScratchN253T

def Cmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0], ![0, 0, -1, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0], ![0, 0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, -1, 0]]
def Imat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0], ![0, 0, -2, 0, 0, 0, 0], ![0, 2, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0, -2],
     ![0, 0, 0, 0, 0, 2, 0]]

example : tr7 (mul7 Cmat Cmat) = -6 := by decide
example : tr7 (mul7 Imat Imat) = -16 := by decide
example : tr7 (mul7 Cmat Imat) = 0 := by decide

end ScratchN253T
