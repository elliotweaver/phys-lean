import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

theorem Dg_herm_gen (t0 t1 t2 : ℚ) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Dg, Matrix.conjTranspose_apply, ocR_star]

theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_one, one_mul]

theorem family_rotates_split_to_mix (t0 t1 t2 : ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 (Dg_herm_gen t0 t1 t2) hB, famC_Dg]

-- costume anchor: the (1,2) deep-real coordinate = 2
theorem costume_anchor :
    (((⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg 0 0 1)⁆ 1) 1 2).re.re.re) = 2 := by
  rw [family_rotates_split_to_mix 0 0 1 Matrix.conjTranspose_one, Lmul_one]
  rw [Matrix.add_apply, slotC_entry]
  simp only [sub_zero, one_smul]
  show ((1:O ℚ) + 1).re.re.re = 2
  simp only [CD.add_re, CD.one_re, Dbl.add_re, Dbl.one_re]
  norm_num

#print axioms costume_anchor

end Phys.Algebra.HJ
