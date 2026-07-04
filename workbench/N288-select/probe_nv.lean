import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- non-vacuity: slotA (1:O ℚ) ≠ 0 via reQ of the (0,1) entry
theorem slotA_one_ne_zero : slotA (1 : O ℚ) ≠ 0 := by
  intro h
  have hentry : (slotA (1:O ℚ)) 0 1 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 := by rw [h]
  rw [slotA_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  have : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [hentry]
  simp only [reQ] at this; norm_num at this

end Phys.Algebra.HJ
