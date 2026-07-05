import Phys.Algebra.OctonionJordanHermTraceCoefficient

/-! N301 de-risk probe B — no abbrev (full innerMul expr, matching banked famC). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- A. general Dg Hermitian
theorem Dg_herm_gen (t0 t1 t2 : ℚ) : (Dg t0 t1 t2)ᴴ = Dg t0 t1 t2 := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.conjTranspose_apply, Matrix.diagonal_apply, ocR_star, star_zero]

-- B. famC on the diagonal mass-splitting sector
theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  have := innerMul_slot_diag (1:O ℚ) (1:O ℚ) t0 t1 t2
  simpa [star_one, one_mul] using this

-- D. the split→mix rotation via equivariance
theorem family_rotates_split_to_mix (t0 t1 t2 : ℚ) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (1:O ℚ))) B := by
  rw [spectrum_sector_equivariance _ famC_mem_derH3 (Dg_herm_gen t0 t1 t2) hB, famC_Dg]

-- F. family fixes the dilation
theorem family_fixes_dilation {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0 := by
  exact dilation_fixed _ famC_mem_derH3 hB

-- G. linear spectral invariant preserved
theorem family_kills_linear_spectral {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (innerMul (slotA (1:O ℚ)) (slotB 1) A) = 0 := by
  have h := derH3_kills_jTr famC_mem_derH3 hA
  unfold rtr
  rw [h]; simp [reQ]

#print axioms Dg_herm_gen
#print axioms famC_Dg
#print axioms family_rotates_split_to_mix
#print axioms family_fixes_dilation
#print axioms family_kills_linear_spectral

end Phys.Algebra.HJ
