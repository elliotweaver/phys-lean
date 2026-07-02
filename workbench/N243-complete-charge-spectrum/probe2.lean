import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- THE THREE ROOTS of X³+X = X·(X²+1) as elements of the derived Dbl ℚ: each satisfies x³+x = 0.

-- 0 root (the singlet's charge, the X factor).
theorem Dbl_zero_cube_root : (0 : Dbl ℚ) ^ 3 + 0 = 0 := by ring

-- +J root (reuse J² = −1).
theorem Dbl_J_cube_root : (Dbl.J : Dbl ℚ) ^ 3 + Dbl.J = 0 := by
  have h : (Dbl.J : Dbl ℚ) ^ 2 = -1 := by rw [sq, Dbl.J_mul_J]
  have : (Dbl.J : Dbl ℚ) ^ 3 = Dbl.J ^ 2 * Dbl.J := by ring
  rw [this, h]; ring

-- −J root.
theorem Dbl_negJ_cube_root : (-Dbl.J : Dbl ℚ) ^ 3 + (-Dbl.J) = 0 := by
  have h : (Dbl.J : Dbl ℚ) ^ 2 = -1 := by rw [sq, Dbl.J_mul_J]
  have : (-Dbl.J : Dbl ℚ) ^ 3 = -(Dbl.J ^ 2 * Dbl.J) := by ring
  rw [this, h]; ring

-- DISTINCTNESS of the three roots.
theorem Dbl_zero_ne_J : (0 : Dbl ℚ) ≠ Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.zero_im, Dbl.J] at this
  norm_num at this

theorem Dbl_zero_ne_negJ : (0 : Dbl ℚ) ≠ -Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.zero_im, Dbl.neg_im, Dbl.J] at this
  norm_num at this

-- Reuse banked N242: Dbl_J_ne_negJ.
example : (Dbl.J : Dbl ℚ) ≠ -Dbl.J := Dbl_J_ne_negJ

end

end Phys.Algebra
