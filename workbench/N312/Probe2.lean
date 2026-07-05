import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- the 2×2 Born adjacency block of a rank-1 outer product ![a0,a1]⊗![a0,a1]
def bornBlock (a0 a1 : ℚ) : Matrix (Fin 2) (Fin 2) ℚ := !![a0*a0, a0*a1; a0*a1, a1*a1]

-- amplitude direction is eigenvector, eigenvalue a0²+a1², via mulVec
example (a0 a1 : ℚ) :
    (bornBlock a0 a1).mulVec ![a0, a1] = (a0^2 + a1^2) • ![a0, a1] := by
  funext i
  fin_cases i <;>
    simp [bornBlock, Matrix.mulVec, dotProduct, Fin.sum_univ_two] <;> ring

-- null direction eigenvalue 0
example (a0 a1 : ℚ) :
    (bornBlock a0 a1).mulVec ![a1, -a0] = (0 : ℚ) • ![a1, -a0] := by
  funext i
  fin_cases i <;>
    simp [bornBlock, Matrix.mulVec, dotProduct, Fin.sum_univ_two] <;> ring

-- det = 0 (rank-1)
example (a0 a1 : ℚ) : (bornBlock a0 a1).det = 0 := by
  simp [bornBlock, Matrix.det_fin_two]; ring

end Phys.Algebra.HJ
