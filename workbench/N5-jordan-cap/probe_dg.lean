import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Tactic

namespace ProbeDg
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Dg (e0 e1 e2 : ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.diagonal (fun i => ocR (![e0, e1, e2] i))

set_option maxHeartbeats 800000 in
theorem v1 (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Dg e0 e1 e2 * (X * Y) = (Dg e0 e1 e2 * X) * Y := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.diagonal_mul, Matrix.mul_apply, Matrix.mul_apply, Finset.mul_sum]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.diagonal_mul]
  exact ocR_assocL _ (X i k) (Y k j)

set_option maxHeartbeats 800000 in
theorem v2 (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (X * Dg e0 e1 e2) * Y = X * (Dg e0 e1 e2 * Y) := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.mul_apply, Matrix.mul_apply]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.mul_diagonal, Matrix.diagonal_mul]
  exact (ocR_assocM _ (X i k) (Y k j)).symm

set_option maxHeartbeats 800000 in
theorem v3 (e0 e1 e2 : ℚ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (X * Y) * Dg e0 e1 e2 = X * (Y * Dg e0 e1 e2) := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.mul_diagonal, Matrix.mul_apply, Matrix.mul_apply, Finset.sum_mul]
  refine Finset.sum_congr rfl (fun k _ => ?_)
  rw [Matrix.mul_diagonal]
  exact (ocR_assocR _ (X i k) (Y k j)).symm

end ProbeDg
