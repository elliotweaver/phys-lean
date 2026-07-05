import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

namespace Phys.Algebra.HJ.ProbeN303e

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

-- reduced goal was: jb (slotA u1)(slotA (1 * star 1)) - jb (slotB 1)(slotB (u1 * 1)) = 0
-- 1 * star 1 = 1 ; u1 * 1 = u1
-- jb (slotA u1)(slotA 1) = jb (slotA 1)(slotA u1) = Dg (2 reQ u1)(2 reQ u1) 0 = 0
-- jb (slotB 1)(slotB u1) = Dg (2 reQ u1) 0 (2 reQ u1) = 0
theorem kAB_slotC_one :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (slotC 1) = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  rw [innerMul_apply, jb_slotB_slotC, jb_comm (slotA u1) (slotC 1), jb_slotC_slotA,
      star_one, mul_one, one_mul,
      jb_comm (slotA u1) (slotA 1), jb_slotA1_slotA, jb_slotB1_slotB]
  have hu1 : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]
  rw [hu1]
  simp [Dg, ocR_zero]

-- famC(slotC 1) = Dg 0 (2·reQ 1)(-(2·reQ 1)) = Dg 0 2 (-2)  [famC_slotC banked]
theorem famC_slotC_one :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC 1) = Dg 0 2 (-2) := by
  rw [famC_slotC]; norm_num [reQ]

-- THE COMPLEX-STRUCTURE DIRECTION: ⁅famC, kAB⁆ (slotC 1) = (-4)•slotC u1
-- = famC(kAB(slotC 1)) - kAB(famC(slotC 1)) = famC 0 - kAB(Dg 0 2 (-2))
-- kAB(Dg 0 2 (-2)) = slotC((t2-t1)•(-u1)) = slotC((-2-2)•(-u1)) = slotC((-4)•(-u1)) = slotC(4•u1)
theorem kAB_diag_to_imag_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (-u1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_u1, mul_one]

theorem famMixJ_slotC_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
      = slotC ((-4 : ℚ) • (u1 : O ℚ)) := by
  rw [Ring.lie_def, LinearMap.sub_apply, LinearMap.comp_apply, LinearMap.comp_apply,
      kAB_slotC_one, famC_slotC_one, map_zero, zero_sub, kAB_diag_to_imag_mix]
  rw [show ((-2:ℚ) - 2) = (-4:ℚ) by ring]
  -- goal: -(slotC ((-4)•(-u1))) = slotC ((-4)•u1)
  rw [smul_neg, slotC_neg]
  congr 1

end Phys.Algebra.HJ.ProbeN303e
