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

theorem ocR_neg (r : ℚ) : ocR (-r) = - ocR r := by
  ext <;> simp [ocR]

theorem ocR_sub (r s : ℚ) : ocR (r - s) = ocR r - ocR s := by
  rw [sub_eq_add_neg r s, ← ocR_add r (-s), ocR_neg, ← sub_eq_add_neg]

theorem ocRM_mul (P Q : Matrix (Fin 3) (Fin 3) ℚ) : ocRM P * ocRM Q = ocRM (P * Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, ocR_mul, ocR_add]

theorem ocRM_sub (P Q : Matrix (Fin 3) (Fin 3) ℚ) : ocRM P - ocRM Q = ocRM (P - Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.sub_apply, ocRM_apply, ocR_sub]

end Phys.Algebra.HJ
