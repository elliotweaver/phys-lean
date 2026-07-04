import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.PieceBscale
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 800000

noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j))
@[simp] theorem ocRM_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    ocRM P i j = ocR (P i j) := rfl

-- slot patterns as ℚ-matrices
def pA : Matrix (Fin 3) (Fin 3) ℚ := !![0,1,0; 1,0,0; 0,0,0]
def pB : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,1; 0,0,0; 1,0,0]
def pC : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,0; 0,0,1; 0,1,0]

-- MEASURE: slotA 1 = ocRM pA  (star 1 = 1; ocR 1 = 1, ocR 0 = 0)
theorem slotA_one_ocRM : slotA (1:O ℚ) = ocRM pA := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, Xz, ocRM, pA, ocR_one, ocR_zero]

theorem slotB_one_ocRM : slotB (1:O ℚ) = ocRM pB := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotB, Xz, ocRM, pB, ocR_one, ocR_zero]

theorem slotC_one_ocRM : slotC (1:O ℚ) = ocRM pC := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotC, Xz, ocRM, pC, ocR_one, ocR_zero]

end Phys.Algebra.HJ
