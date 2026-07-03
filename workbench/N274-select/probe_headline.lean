import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem jb_comm' (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; rw [add_comm]

theorem jb_slotB_Dg (b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotB b) (Dg d0 d1 d2) = slotB ((d0 + d2) • b) := by
  rw [jb_comm']; unfold slotB; rw [jb_Dg_Xzabc]
  congr 1 <;> exact (smul_zero _).symm ▸ rfl

theorem jb_slotA_Dg (a : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (Dg d0 d1 d2) = slotA ((d0 + d1) • a) := by
  rw [jb_comm']; unfold slotA; rw [jb_Dg_Xzabc]
  congr 1 <;> exact (smul_zero _).symm ▸ rfl

theorem slotC_sub (x y : O ℚ) : slotC (x - y) = slotC x - slotC y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz, Matrix.sub_apply, star_sub]

-- test just the octonion coefficient identity in isolation
example (a b : O ℚ) (d0 d1 d2 : ℚ) :
    star a * ((d0 + d2) • b) - star ((d0 + d1) • a) * b = (d2 - d1) • (star a * b) := by
  rw [qsmul_mul_right, star_smul, qsmul_mul_left]
  simp only [star_trivial]
  rw [← sub_smul]
  congr 1
  ring

-- full headline
theorem headline (a b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (jb (slotB b) (Dg d0 d1 d2)) - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))
      = slotC ((d2 - d1) • (star a * b)) := by
  rw [jb_slotB_Dg, jb_slotA_Dg, jb_slotA_slotB, jb_comm', jb_slotA_slotB, ← slotC_sub]
  congr 1
  rw [qsmul_mul_right, star_smul, qsmul_mul_left]
  simp only [star_trivial]
  rw [← sub_smul]
  congr 1
  ring

end Phys.Algebra.HJ
