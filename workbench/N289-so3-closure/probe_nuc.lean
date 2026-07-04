import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.PieceBscale
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 800000

/-- A matrix whose entries are the central embedded scalars `ocR (P i j)`. -/
noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j))

@[simp] theorem ocRM_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    ocRM P i j = ocR (P i j) := rfl

-- Nuclear LEFT: (ocRM P) associates from the left.
theorem ocRM_assoc_L (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ocRM P * (Y * Z) = (ocRM P * Y) * Z := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocL]
  abel

-- Nuclear RIGHT: (ocRM P) associates from the right.
theorem ocRM_assoc_R (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (Y * Z) * ocRM P = Y * (Z * ocRM P) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocR]
  abel

end Phys.Algebra.HJ
