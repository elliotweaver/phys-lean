import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

def bornBlock (a0 a1 : ℚ) : Matrix (Fin 2) (Fin 2) ℚ := !![a0*a0, a0*a1; a0*a1, a1*a1]

noncomputable def massSub01 (M A p r : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![massMat M A p r 0 0, massMat M A p r 0 1; massMat M A p r 1 0, massMat M A p r 1 1]

example (M A p r : ℚ) : massSub01 M A p r = bornBlock (genVec M A p r 0) (genVec M A p r 1) := by
  have e00 : massMat M A p r 0 0 = genVec M A p r 0 * genVec M A p r 0 := by
    rw [massMat_diag_0]; simp only [massVec]; ring
  have e01 : massMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 := massMat_offdiag_01 M A p r
  have e10 : massMat M A p r 1 0 = genVec M A p r 0 * genVec M A p r 1 := by
    rw [← massMat_symm_01]; exact massMat_offdiag_01 M A p r
  have e11 : massMat M A p r 1 1 = genVec M A p r 1 * genVec M A p r 1 := by
    rw [massMat_diag_1]; simp only [massVec]; ring
  rw [massSub01, bornBlock, e00, e01, e10, e11]

def mixV (u0 u1 d0 d1 : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![u0*d0 + u1*d1, -(u1*d0 - u0*d1); u1*d0 - u0*d1, u0*d0 + u1*d1]
example (u0 u1 d0 d1 : ℚ) :
    (mixV u0 u1 d0 d1)ᵀ * (mixV u0 u1 d0 d1)
      = ((u0^2 + u1^2) * (d0^2 + d1^2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  funext i j
  fin_cases i <;> fin_cases j <;>
    simp [mixV, Matrix.mul_apply, Fin.sum_univ_two, Matrix.transpose, Matrix.one_apply,
      Matrix.smul_apply] <;> ring

end Phys.Algebra.HJ
