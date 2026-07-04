import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

theorem slotC_one_herm : (slotC (1 : O ℚ))ᴴ = slotC 1 := Xz_herm 0 0 1

-- reprove jb_slotC1_slotC for the probe
theorem jb_slotC1_slotC (c : O ℚ) :
    jb (slotC (1:O ℚ)) (slotC c) = Dg 0 (2 * reQ c) (2 * reQ c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotC (1:O ℚ)) (slotC c)) 1 1 = _
     rw [show (jb (slotC (1:O ℚ)) (slotC c)) 1 1 = star c + c by
           simp [jb, slotC, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id c]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotC (1:O ℚ)) (slotC c)) 2 2 = _
     rw [show (jb (slotC (1:O ℚ)) (slotC c)) 2 2 = c + star c by
           simp [jb, slotC, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id c]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotC, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

-- famA = innerMul (slotB 1)(slotC 1). famA (slotC c) = jb(slotB 1)(jb(slotC 1)(slotC c)) - jb(slotC 1)(jb(slotB 1)(slotC c))
-- T1 = jb(slotB 1)(Dg 0 (2reQ c)(2reQ c)) = jb(Dg..)(slotB 1) = slotB(ocR(0+2reQ c)*1)
-- T2 = jb(slotC 1)(jb(slotB 1)(slotC c)); jb(slotB 1)(slotC c) = slotA(1 * star c) = slotA(star c)
--      jb(slotC 1)(slotA(star c)) = jb(slotC(star c... no, slotC 1 with slotA) = slotB(star c * 1)=slotB(star c)? check jb_slotC_slotA
theorem famA_slotC (c : O ℚ) :
    innerMul (slotB (1:O ℚ)) (slotC 1) (slotC c) = slotB c := by
  rw [innerMul_apply, jb_slotC1_slotC,
    jb_comm (slotB (1:O ℚ)) (Dg 0 (2*reQ c) (2*reQ c)), jb_Dg_slotB]
  -- T2: jb(slotB 1)(slotC c) = slotA (1 * star c) = slotA (star c)
  rw [jb_slotB_slotC, one_mul]
  -- jb(slotC 1)(slotA (star c)) = slotB (star c * 1) via jb_slotC_slotA
  rw [jb_slotC_slotA, mul_one, ← slotB_sub]
  congr 1
  rw [zero_add, mul_one]
  have hc : ocR (2 * reQ c) = c + star c := by
    rw [show ocR (2 * reQ c) = (2 * reQ c) • (1:O ℚ) from by rw [← ocRmulL (2 * reQ c) 1, mul_one]]
    exact (trace_id c).symm
  rw [hc]; abel

end Phys.Algebra.HJ
