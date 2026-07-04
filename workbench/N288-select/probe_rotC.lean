import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

-- reuse the de-risked same-slot lemma
theorem jb_slotB1_slotB (b : O ℚ) :
    jb (slotB (1:O ℚ)) (slotB b) = Dg (2 * reQ b) 0 (2 * reQ b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
  first
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 0 0 = star b + b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         add_comm, trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = _
     rw [show (jb (slotB (1:O ℚ)) (slotB b)) 2 2 = b + star b by
           simp [jb, slotB, Xz, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three],
         trace_id b]
     simp [Dg, ocR, Matrix.diagonal]; ext <;> simp [cd_qsmul_re, cd_qsmul_im])
  | (simp [jb, slotB, Xz, Dg, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
        Matrix.diagonal, ocR_zero])

-- jb_Dg_slotA banked: jb (Dg d0 d1 d2)(slotA a) = slotA (ocR(d0+d1)*a). Check it exists & type:
example (d0 d1 d2 : ℚ) (a : O ℚ) :
    jb (Dg d0 d1 d2) (slotA a) = slotA (ocR (d0 + d1) * a) := jb_Dg_slotA d0 d1 d2 a

-- ROTATION ACTION famC (slotB b) = slotA b.
-- famC (slotB b) = jb(slotA 1)(jb(slotB 1)(slotB b)) - jb(slotB 1)(jb(slotA 1)(slotB b))
--   T1 = jb(slotA 1)(Dg(2reQ b,0,2reQ b)) = jb(Dg..)(slotA 1) = slotA(ocR(2reQ b+0)*1) = slotA(ocR(2reQ b))
--   T2 = jb(slotB 1)(jb(slotA 1)(slotB b)); jb(slotA 1)(slotB b)=slotC(star 1 * b)=slotC b;
--        jb(slotB 1)(slotC b)=slotA(1 * star b)=slotA(star b)... wait that gives slotA(star b) not matching.
-- Let me just compute and print via example to see the actual reduction:
theorem famC_slotB (b : O ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotB b) = slotA b := by
  rw [innerMul_apply, jb_slotB1_slotB]
  -- T1 = jb (slotA 1) (Dg (2reQ b) 0 (2reQ b))
  rw [jb_comm (slotA (1:O ℚ)) (Dg (2*reQ b) 0 (2*reQ b)), jb_Dg_slotA]
  -- T2: jb (slotA 1)(slotB b) = slotC (star 1 * b)
  rw [jb_slotA_slotB, star_one, one_mul]
  -- jb (slotB 1)(slotC b) = slotB ? no: jb (slotB 1)(slotC b) = slotA(1 * star b)? check banked
  rw [jb_slotB_slotC, one_mul]
  -- now: slotA (ocR (2reQ b + 0) * 1) - slotA (star b) = slotA b
  rw [← slotA_sub]
  congr 1
  rw [add_zero, mul_one]
  -- ocR (2 reQ b) - star b = b, since ocR(2 reQ b) = (2 reQ b) • 1 = star b + b
  have hb : ocR (2 * reQ b) = star b + b := by
    rw [show ocR (2 * reQ b) = (2 * reQ b) • (1:O ℚ) from by
          rw [← ocRmulL (2 * reQ b) 1, mul_one]]
    rw [add_comm]; exact (trace_id b).symm
  rw [hb]; abel

end Phys.Algebra.HJ
