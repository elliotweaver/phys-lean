import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 800000

/-- A matrix whose entries are the central embedded scalars `ocR (P i j)`. -/
noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  fun i j => ocR (P i j)

-- BRICK L: a central matrix left-associates. Measure cost.
theorem ocRM_mul_assoc_L (P : Matrix (Fin 3) (Fin 3) ℚ)
    (Q R : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ocRM P * (Q * R) = (ocRM P * Q) * R := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM, Fin.sum_univ_three, Matrix.mul_apply,
    ocRmulL, Finset.sum_mul, Finset.mul_sum, qsmul_mul_left]
  ring_nf
  simp only [ocRmulL, qsmul_mul_left]
  abel

end Phys.Algebra.HJ
