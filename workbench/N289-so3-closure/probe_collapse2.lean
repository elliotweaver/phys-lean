import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.PieceBscale
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j))
@[simp] theorem ocRM_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    ocRM P i j = ocR (P i j) := rfl

theorem ocRM_assoc_L (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ocRM P * (Y * Z) = (ocRM P * Y) * Z := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocL]; abel
theorem ocRM_assoc_R (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (Y * Z) * ocRM P = Y * (Z * ocRM P) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocR]; abel

noncomputable def adE (K : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := K * X - X * K
  map_add' X Y := by rw [mul_add, add_mul]; abel
  map_smul' r X := by simp only [RingHom.id_apply, mat_mul_smul, mat_smul_mul, smul_sub]
@[simp] theorem adE_apply (K X : Matrix (Fin 3) (Fin 3) (O ℚ)) : adE K X = K * X - X * K := rfl

-- THE LINCHPIN COLLAPSE: innerMul of two central matrices = adE of their matrix commutator.
theorem collapse (P Q : Matrix (Fin 3) (Fin 3) ℚ) :
    innerMul (ocRM P) (ocRM Q) = adE (ocRM P * ocRM Q - ocRM Q * ocRM P) := by
  apply LinearMap.ext; intro X
  rw [innerMul_apply, adE_apply]
  simp only [jb, mul_add, add_mul, sub_mul, mul_sub]
  -- LHS 8 terms; RHS 4 terms. Reassociate to canonical atoms, then abel.
  rw [ocRM_assoc_L P (ocRM Q) X,            -- A*(B*X) → (A*B)*X
      ocRM_assoc_L P X (ocRM Q),            -- A*(X*B) → (A*X)*B  [cancels term7]
      ocRM_assoc_R P X (ocRM Q),            -- (X*B)*A → X*(B*A)
      ocRM_assoc_L Q (ocRM P) X,            -- B*(A*X) → (B*A)*X
      ← ocRM_assoc_R P (ocRM Q) X,          -- B*(X*A) → (B*X)*A  [cancels term3]
      ocRM_assoc_R Q X (ocRM P)]            -- (X*A)*B → X*(A*B)
  abel

end Phys.Algebra.HJ
