import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem jb_comm' (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; rw [add_comm]

-- slotB weight
theorem jb_slotB_Dg (b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotB b) (Dg d0 d1 d2) = slotB ((d0 + d2) • b) := by
  rw [jb_comm']; unfold slotB; rw [jb_Dg_Xzabc]; simp only [smul_zero]

theorem jb_slotA_Dg (a : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (Dg d0 d1 d2) = slotA ((d0 + d1) • a) := by
  rw [jb_comm']; unfold slotA; rw [jb_Dg_Xzabc]; simp only [smul_zero]

theorem slotC_sub (x y : O ℚ) : slotC (x - y) = slotC x - slotC y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz, Matrix.sub_apply, star_sub]

-- slotA/slotB scalar pull-through
theorem slotA_smul (c : ℚ) (a : O ℚ) : slotA (c • a) = c • slotA a := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, Matrix.smul_apply, star_smul, smul_zero]

theorem slotB_smul (c : ℚ) (b : O ℚ) : slotB (c • b) = c • slotB b := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz, Matrix.smul_apply, star_smul, smul_zero]

-- N272 coupling with scalar on the second slot
example (a b : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotA a) (slotB b) (Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b)) := by
  rw [innerMul_apply]
  rw [jb_slotB_Dg, jb_slotA_Dg]
  -- now: jb (slotA a) (slotB ((d0+d2)•b)) - jb (slotB b) (slotA ((d0+d1)•a))
  rw [jb_slotA_slotB]
  rw [jb_comm', jb_slotA_slotB]
  -- slotC (star a * (d0+d2)•b) - slotC (star ((d0+d1)•a) * b)
  rw [← slotC_sub]
  congr 1
  rw [qsmul_mul_right, star_smul]
  show _ = (d2 - d1) • (star a * b)
  rw [qsmul_mul_left, sub_smul]
  abel

end Phys.Algebra.HJ
