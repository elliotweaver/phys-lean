import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem slotC_sub (c c' : O ℚ) : slotC (c - c') = slotC c - slotC c' := by
  unfold slotC Xz; apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp

-- slot-weight of Dg via jb symmetry + the banked N213 diagram, entrywise closing (N213 style)
theorem jb_slotB_Dg (b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotB b) (Dg d0 d1 d2) = slotB ((d0 + d2) • b) := by
  have hsym : jb (slotB b) (Dg d0 d1 d2) = jb (Dg d0 d1 d2) (slotB b) := by
    unfold jb; rw [add_comm]
  rw [hsym]
  show jb (Dg d0 d1 d2) (Xz 0 b 0) = slotB ((d0 + d2) • b)
  rw [jb_Dg_Xzabc]
  unfold slotB Xz
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    first | rfl | (rw [smul_zero]) | (rw [smul_zero, star_zero]) | (rw [star_smul]; rfl)

theorem jb_slotA_Dg (a : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (Dg d0 d1 d2) = slotA ((d0 + d1) • a) := by
  have hsym : jb (slotA a) (Dg d0 d1 d2) = jb (Dg d0 d1 d2) (slotA a) := by
    unfold jb; rw [add_comm]
  rw [hsym]
  show jb (Dg d0 d1 d2) (Xz a 0 0) = slotA ((d0 + d1) • a)
  rw [jb_Dg_Xzabc]
  unfold slotA Xz
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    first | rfl | (rw [smul_zero]) | (rw [smul_zero, star_zero]) | (rw [star_smul]; rfl)

theorem oct_weight_diff (a b : O ℚ) (d0 d1 d2 : ℚ) :
    star a * ((d0 + d2) • b) - star ((d0 + d1) • a) * b = (d2 - d1) • (star a * b) := by
  rw [show star ((d0 + d1) • a) = (d0 + d1) • star a from (star_smul _ _)]
  rw [qsmul_mul_right, qsmul_mul_left, ← sub_smul]
  congr 1; ring

/-- ★★★ THE INNER-MULTIPLICATION COMMUTATOR germ. Couples diagonal position-weights (N213 `d2-d1`)
    to the octonion entry-gauge coupling (N272 `star a * b`):
      [L_{slotA a}, L_{slotB b}] (Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b)). -/
theorem innerMul_diag (a b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (jb (slotB b) (Dg d0 d1 d2))
      - jb (slotB b) (jb (slotA a) (Dg d0 d1 d2))
      = slotC ((d2 - d1) • (star a * b)) := by
  rw [jb_slotB_Dg, jb_slotA_Dg, jb_slotA_slotB]
  have hsym : jb (slotB b) (slotA ((d0 + d1) • a))
      = jb (slotA ((d0 + d1) • a)) (slotB b) := by unfold jb; rw [add_comm]
  rw [hsym, jb_slotA_slotB, ← slotC_sub, oct_weight_diff]

/-- ★★ NON-VACUITY: the commutator MOVES matter that jAct (diagonal-fixing) + framePerm CANNOT. -/
theorem innerMul_germ_ne_zero :
    jb (slotA 1) (jb (slotB 1) (Dg 0 0 1)) - jb (slotB 1) (jb (slotA 1) (Dg 0 0 1)) ≠ 0 := by
  rw [innerMul_diag]
  simp only [star_one, mul_one, sub_zero, one_smul]
  intro h
  have hentry : (slotC (1 : O ℚ)) 1 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]
  rw [slotC_entry, Matrix.zero_apply] at hentry
  have : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [hentry]
  simp only [reQ] at this; norm_num at this

end Phys.Algebra.HJ
