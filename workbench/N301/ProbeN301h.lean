import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- famC_Dg + Dg_herm_gen + family_rotates_split_to_mix reproduced minimally for the W8 test
theorem Dg_herm_gen (t0 t1 t2 : ℚ) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.conjTranspose_apply, ocR_star]

theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_one, one_mul]

theorem family_rotates_split_to_mix (t0 t1 t2 : ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 (Dg_herm_gen t0 t1 t2) hB, famC_Dg]

-- W8: the split→mix rotation is genuinely nonzero. At Dg 0 0 1, coeff (t2-t1)=1, applied to B=1:
-- Lmul (slotC (1•1)) 1 = jb (slotC 1) 1 = slotC 1 + slotC 1, entry (1,2) = 1+1 = 2 ≠ 0.
theorem family_rotates_split_to_mix_ne :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg 0 0 1)⁆ 1 ≠ 0 := by
  rw [family_rotates_split_to_mix 0 0 1 Matrix.conjTranspose_one, Lmul_one]
  intro h
  have hentry : ((slotC ((1 - 0 : ℚ) • (1:O ℚ))) + (slotC ((1 - 0 : ℚ) • (1:O ℚ)))) 1 2
      = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 := by rw [h]
  rw [Matrix.add_apply, slotC_entry] at hentry
  simp only [Matrix.zero_apply, sub_zero, one_smul] at hentry
  have : reQ ((1:O ℚ) + 1) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

#print axioms family_rotates_split_to_mix_ne

end Phys.Algebra.HJ
