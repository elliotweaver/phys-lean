import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## (1) BORN SELF-OVERLAP STRUCTURE. -/
example (M A p r : ℚ) : massMat M A p r 0 0 = genVec M A p r 0 * genVec M A p r 0 := by
  simp only [massMat_diag_0, massVec]; ring
example (M A p r : ℚ) : massMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 :=
  massMat_offdiag_01 M A p r

/-! ## (2) RANK-1 EIGENSTRUCTURE (via simp [massMat] entry evaluation). -/
-- 2×2 block det = 0 (rank-1)
example (M A p r : ℚ) :
    massMat M A p r 0 0 * massMat M A p r 1 1 - massMat M A p r 0 1 * massMat M A p r 1 0 = 0 := by
  rw [massMat_diag_0, massMat_diag_1, massMat_offdiag_01, ← massMat_symm_01, massMat_offdiag_01]
  simp only [massVec]; ring
-- amplitude direction (a₀,a₁) eigenvector, eigenvalue m₀+m₁ (first comp)
example (M A p r : ℚ) :
    massMat M A p r 0 0 * genVec M A p r 0 + massMat M A p r 0 1 * genVec M A p r 1
      = (massVec M A p r 0 + massVec M A p r 1) * genVec M A p r 0 := by
  rw [massMat_diag_0, massMat_offdiag_01]; simp only [massVec]; ring
-- second comp (use massMat 1 0)
example (M A p r : ℚ) :
    massMat M A p r 1 0 * genVec M A p r 0 + massMat M A p r 1 1 * genVec M A p r 1
      = (massVec M A p r 0 + massVec M A p r 1) * genVec M A p r 1 := by
  rw [← massMat_symm_01, massMat_offdiag_01, massMat_diag_1]; simp only [massVec]; ring
-- null direction (a₁,−a₀) eigenvalue 0
example (M A p r : ℚ) :
    massMat M A p r 0 0 * genVec M A p r 1 + massMat M A p r 0 1 * (- genVec M A p r 0) = 0 := by
  rw [massMat_diag_0, massMat_offdiag_01]; simp only [massVec]; ring

/-! ## (3) TWO-SECTOR FRAME OVERLAP. -/
-- Brahmagupta–Fibonacci orthogonality
example (u0 u1 d0 d1 : ℚ) :
    (u0*d0 + u1*d1)^2 + (u1*d0 - u0*d1)^2 = (u0^2 + u1^2) * (d0^2 + d1^2) := by ring
-- normalized: mixing² + aligned² = 1
example (u0 u1 d0 d1 : ℚ) (hu : u0^2 + u1^2 ≠ 0) (hd : d0^2 + d1^2 ≠ 0) :
    (u1*d0 - u0*d1)^2 / ((u0^2 + u1^2) * (d0^2 + d1^2))
      + (u0*d0 + u1*d1)^2 / ((u0^2 + u1^2) * (d0^2 + d1^2)) = 1 := by
  field_simp; ring

/-! ## (5) NON-VACUITY. -/
example : (genVec 1 3 1 0 1 * genVec 1 3 0 1 0 - genVec 1 3 1 0 0 * genVec 1 3 0 1 1) ≠ 0 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  norm_num

end Phys.Algebra.HJ
