import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 400000

-- explicit constant matrices with 0/1 entries (star 1 = 1 so slotA 1 IS this)
noncomputable def sA1c : Matrix (Fin 3) (Fin 3) (O ℚ) := !![0,1,0; 1,0,0; 0,0,0]

-- MEASURE 1: is slotA 1 = sA1c cheap?
theorem slotA_one_eq : slotA (1:O ℚ) = sA1c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, sA1c, Xz]

end Phys.Algebra.HJ
