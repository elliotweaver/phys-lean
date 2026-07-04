import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 400000

-- ENTRY BRICK 1: central scalar associates left. Should be instant.
theorem ocR_assoc_L (p : ℚ) (y z : O ℚ) : ocR p * (y * z) = (ocR p * y) * z := by
  rw [ocRmulL, ocRmulL, qsmul_mul_left]

-- ENTRY BRICK 2: central scalar associates in middle (y * (ocR p * z) = (y * ocR p) * z).
-- ocR p central: y * ocR p = ocR p * y? Need commutation of central scalar. Test:
theorem ocR_comm (p : ℚ) (y : O ℚ) : y * ocR p = ocR p * y := by
  rw [ocRmulL, show ocR p = p • (1:O ℚ) from by ext <;> simp [ocR], qsmul_mul_right, mul_one]

theorem ocR_assoc_M (p : ℚ) (y z : O ℚ) : y * (ocR p * z) = (y * ocR p) * z := by
  rw [ocR_comm, ocRmulL, ocR_comm, qsmul_mul_right, qsmul_mul_left]

theorem ocR_assoc_R (p : ℚ) (y z : O ℚ) : (y * z) * ocR p = y * (z * ocR p) := by
  rw [ocR_comm, ocRmulL, ocR_comm, qsmul_mul_left, qsmul_mul_right]

end Phys.Algebra.HJ
