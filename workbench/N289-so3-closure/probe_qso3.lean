import Mathlib.Tactic

namespace ProbeQ
open Matrix

def pA : Matrix (Fin 3) (Fin 3) ℚ := !![0,1,0; 1,0,0; 0,0,0]
def pB : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,1; 0,0,0; 1,0,0]
def pC : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,0; 0,0,1; 0,1,0]

theorem q_so3_CA :
    (pA*pB - pB*pA) * (pB*pC - pC*pB) - (pB*pC - pC*pB) * (pA*pB - pB*pA)
      = pC*pA - pA*pC := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [pA, pB, pC, Matrix.mul_apply, Matrix.sub_apply, Fin.sum_univ_three]

end ProbeQ
