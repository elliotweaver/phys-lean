import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

/-!  N303 de-risk probe — the fold-root complexification of the mixing sector.
     Confirm every lemma ELABORATES foundations-only in a bounded module. -/

namespace Phys.Algebra.HJ.ProbeN303

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

/-! ### (1) THE IMAGINARY MIXING LEG — kAB carries the diagonal split to slotC(•u1). -/
-- famC (N301): innerMul (slotA 1)(slotB 1)(Dg t) = slotC ((t2-t1)•1)
-- kAB (this): innerMul (slotA u1)(slotB 1)(Dg t) = slotC ((t2-t1)•(star u1 * 1)) = slotC((t2-t1)•(-u1))
theorem kAB_diag_to_imag_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (-u1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_u1, mul_one]

/-! ### (2) THE BREAKING COSET ROTATES SPLIT → IMAGINARY MIXING (via N296 equivariance). -/
theorem breaking_rotates_split_to_imag_mix (t0 t1 t2 : ℚ)
    {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅innerMul (slotA (u1:O ℚ)) (slotB 1), Lmul (Dg t0 t1 t2)⁆ B
      = Lmul (slotC ((t2 - t1) • (-u1 : O ℚ))) B := by
  rw [spectrum_sector_equivariance _ coupling_mem_derH3 (Dg_herm_gen t0 t1 t2) hB,
      kAB_diag_to_imag_mix]

/-! ### (3) kAB IS ISOSPECTRAL — the family-breaking generator preserves the full spectrum. -/
theorem kAB_kills_linear {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (innerMul (slotA (u1:O ℚ)) (slotB 1) A) = 0 := by
  have h := derH3_kills_jTr coupling_mem_derH3 hA
  unfold rtr; rw [h]; simp [reQ]

theorem kAB_kills_quadratic {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0 :=
  derH3_kills_quadratic_spectral coupling_mem_derH3 hA

theorem kAB_kills_cubic {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb (jb A A) (innerMul (slotA (u1:O ℚ)) (slotB 1) A)) = 0 :=
  derH3_kills_cubic_spectral coupling_mem_derH3 hA

/-! ### (6) W8 non-vacuity — a genuine nonzero imaginary mixing motion. -/
theorem kAB_imag_mix_nonvacuous :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg 0 0 1) = slotC (-u1) := by
  rw [kAB_diag_to_imag_mix]; congr 1; rw [sub_zero, one_smul]

end Phys.Algebra.HJ.ProbeN303
