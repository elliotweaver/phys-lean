import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.OctonionJordanGenerationCoupling
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
-- DEFAULT instance = cdSmulQ (NO qMod here)
attribute [local instance] CD.narCD CD.srCD

-- helpers under cdSmulQ (the default)
theorem star_qsmul (r : ℚ) (a : O ℚ) : star (r • a) = r • star a := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

theorem weight_diff_smul (v : O ℚ) (d0 d1 d2 : ℚ) :
    (d0 + d2) • v - (d0 + d1) • v = (d2 - d1) • v := by
  have h : ∀ (z w : O ℚ), z - w = z + (-1 : ℚ) • w := by
    intro z w
    rw [sub_eq_add_neg]; congr 1; ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  rw [h]; ext <;> simp [cd_qsmul_re, cd_qsmul_im, add_re, add_im] <;> ring

theorem ocRmulL (d : ℚ) (x : O ℚ) : ocR d * x = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_left, one_mul]

-- jb_Dg_slot in a LOCALIZED qMod section, ocR-form conclusion (instance-agnostic)
section QModLocal
attribute [local instance] qMod

theorem jb_Dg_slotB (d0 d1 d2 : ℚ) (b : O ℚ) :
    jb (Dg d0 d1 d2) (slotB b) = slotB (ocR (d0 + d2) * b) := by
  unfold slotB; rw [jb_Dg_Xzabc]; simp only [qsmul_def, mul_zero]

theorem jb_Dg_slotA (d0 d1 d2 : ℚ) (a : O ℚ) :
    jb (Dg d0 d1 d2) (slotA a) = slotA (ocR (d0 + d1) * a) := by
  unfold slotA; rw [jb_Dg_Xzabc]; simp only [qsmul_def, mul_zero]

end QModLocal

theorem jb_comm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; rw [add_comm]

theorem slotC_sub (x y : O ℚ) : slotC (x - y) = slotC x - slotC y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotC, Xz, Matrix.sub_apply, star_sub]

-- innerMul_apply analog inline
theorem headline_test (a b : O ℚ) (d0 d1 d2 : ℚ) :
    (jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2)))
      = slotC ((d2 - d1) • (star a * b)) := by
  rw [jb_comm (slotB b) (Dg d0 d1 d2), jb_Dg_slotB,
      jb_comm (slotA a) (Dg d0 d1 d2), jb_Dg_slotA,
      jb_slotA_slotB, jb_comm (slotB b) (slotA (ocR (d0 + d1) * a)), jb_slotA_slotB,
      ← slotC_sub]
  congr 1
  rw [ocRmulL, ocRmulL, qsmul_mul_right, star_qsmul, qsmul_mul_left, weight_diff_smul]

end Phys.Algebra.HJ
