import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- A. general Dg Hermitian
theorem Dg_herm_gen (t0 t1 t2 : ℚ) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.conjTranspose_apply, Matrix.diagonal_apply, ocR_star]

-- B. famC on the diagonal mass-splitting sector
theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_one, one_mul]

-- D. the split→mix rotation via equivariance
theorem family_rotates_split_to_mix (t0 t1 t2 : ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 (Dg_herm_gen t0 t1 t2) hB, famC_Dg]

-- F. family fixes the dilation
theorem family_fixes_dilation {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0 :=
  dilation_fixed _ famC_mem_derH3 hB

#print axioms Dg_herm_gen
#print axioms famC_Dg
#print axioms family_rotates_split_to_mix
#print axioms family_fixes_dilation

end Phys.Algebra.HJ
