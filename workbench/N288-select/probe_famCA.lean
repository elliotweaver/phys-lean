import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- slotB is additive-neg: slotB (-a) = - slotB a  (from slotB_sub 0 a and slotB 0 = 0)
theorem slotB_zero : slotB (0 : O ℚ) = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [slotB, Xz]
theorem slotB_neg (a : O ℚ) : slotB (-a) = - slotB a := by
  have := slotB_sub 0 a; rw [slotB_zero, zero_sub, zero_sub] at this; exact this

theorem jb_slotA1_slotA (a : O ℚ) :
    jb (slotA (1:O ℚ)) (slotA a) = Dg (2 * reQ a) (2 * reQ a) 0 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotA (1:O ℚ)) (slotA a)) 0 0 = _
     rw [show (jb (slotA (1:O ℚ)) (slotA a)) 0 0 = star a + a by
           simp [jb, slotA, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id a]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotA (1:O ℚ)) (slotA a)) 1 1 = _
     rw [show (jb (slotA (1:O ℚ)) (slotA a)) 1 1 = a + star a by
           simp [jb, slotA, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id a]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotA, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

theorem famC_slotA (a : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotA a) = - slotB a := by
  rw [innerMul_apply, jb_comm (slotB (1:O ℚ)) (slotA a), jb_slotA_slotB, mul_one,
    jb_comm (slotA (1:O ℚ)) (slotC (star a)), jb_slotC_slotA, one_mul,
    jb_slotA1_slotA, jb_comm (slotB (1:O ℚ)) (Dg (2*reQ a) (2*reQ a) 0), jb_Dg_slotB,
    ← slotB_neg, ← slotB_sub]
  congr 1
  rw [add_zero, mul_one]
  -- star a - ocR (2 reQ a) = - a, since ocR(2 reQ a) = star a + a
  have ha : ocR (2 * reQ a) = star a + a := by
    rw [show ocR (2 * reQ a) = (2 * reQ a) • (1:O ℚ) from by rw [← ocRmulL (2 * reQ a) 1, mul_one]]
    rw [add_comm]; exact (trace_id a).symm
  rw [ha]; abel

end Phys.Algebra.HJ
