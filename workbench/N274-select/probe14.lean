import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Does zero_mul fire on O ℚ via simp only?
example (b : O ℚ) : (0 : O ℚ) * (b * 0) = 0 := by simp only [zero_mul, mul_zero]
example (b : O ℚ) : (0 : O ℚ) * (b * 0) = 0 := by simp

-- Is the arena matrix Hermitian in the star-transpose sense? check slotC star structure
theorem ocRmulL (d : ℚ) (x : O ℚ) : ocR d * x = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_left, one_mul]
theorem ocRmulR (d : ℚ) (x : O ℚ) : x * ocR d = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_right, mul_one]

-- The (2,1) entry closer test (switch to simp-normalize + abel)
set_option maxHeartbeats 800000 in
example (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (star b * ocR d0 + ocR d2 * star b) * a - star b * (a * ocR d1 + ocR d0 * a)
      = (d2 - d1) • (star b * a) := by
  simp only [ocRmulL, ocRmulR, mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, sub_smul]
  abel

-- The (1,2) entry closer test
set_option maxHeartbeats 800000 in
example (a b : O ℚ) (d0 d1 d2 : ℚ) :
    star a * (b * ocR d2 + ocR d0 * b) - (star a * ocR d0 + ocR d1 * star a) * b
      = (d2 - d1) • (star a * b) := by
  simp only [ocRmulL, ocRmulR, mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, sub_smul]
  abel

end Phys.Algebra.HJ
