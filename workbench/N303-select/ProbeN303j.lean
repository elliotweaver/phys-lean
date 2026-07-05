import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

namespace Phys.Algebra.HJ.ProbeN303j

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

theorem slotC_zero : slotC (0 : O ℚ) = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [slotC, Xz]

theorem slotC_neg (x : O ℚ) : slotC (-x) = - slotC x := by
  have := slotC_sub 0 x; rw [slotC_zero, zero_sub, zero_sub] at this; exact this

theorem kAB_slotC_one :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (slotC 1) = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  rw [innerMul_apply, jb_slotB_slotC, jb_comm (slotA u1) (slotC 1), jb_slotC_slotA,
      star_one, mul_one, mul_one,
      jb_comm (slotA u1) (slotA 1), jb_slotA1_slotA, jb_slotB1_slotB]
  have hu1 : reQ (u1 : O ℚ) = 0 := by simp [reQ, u1]
  rw [hu1, mul_zero, Dg_sub, sub_zero, sub_zero, sub_zero]
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;> simp [Dg, ocR_zero]

theorem famC_slotC_one :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotC 1) = Dg 0 2 (-2) := by
  rw [famC_slotC]; norm_num [reQ]

theorem kAB_diag_to_imag_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (-u1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_u1, mul_one]

theorem famMixJ_slotC_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
      = slotC ((-4 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [kAB_slotC_one, famC_slotC_one, map_zero, zero_sub, kAB_diag_to_imag_mix,
      show ((-2:ℚ) - 2) = (-4:ℚ) by ring, smul_neg, slotC_neg]
  exact neg_neg _

end Phys.Algebra.HJ.ProbeN303j
