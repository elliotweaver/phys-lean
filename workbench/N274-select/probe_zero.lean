import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

example (b : O ℚ) : (0 : O ℚ) * (b * 0) = 0 := by simp only [mul_zero, zero_mul]
example (b : O ℚ) : (0 : O ℚ) * (b * 0) = 0 := by simp only [mul_zero]
example (b : O ℚ) : (0 : O ℚ) * (b * 0) = 0 := by rw [mul_zero, mul_zero]
example (b : O ℚ) : (b : O ℚ) * 0 = 0 := by exact mul_zero b
example (b : O ℚ) : (0 : O ℚ) * b = 0 := by exact zero_mul b
end Phys.Algebra.HJ
