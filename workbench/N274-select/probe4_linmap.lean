import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem mat_smul_mul (r : ℚ) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (r • A) * B = r • (A * B) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.smul_apply, Matrix.mul_apply, Finset.smul_sum]
  apply Finset.sum_congr rfl; intro k _
  exact qsmul_mul_left r (A i k) (B k j)

theorem mat_mul_smul (r : ℚ) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    A * (r • B) = r • (A * B) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.smul_apply, Matrix.mul_apply, Finset.smul_sum]
  apply Finset.sum_congr rfl; intro k _
  exact qsmul_mul_right r (A i k) (B k j)

noncomputable def Lmul (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := jb A X
  map_add' X Y := by unfold jb; rw [mul_add, add_mul]; abel
  map_smul' r X := by
    unfold jb
    simp only [RingHom.id_apply, smul_add]
    rw [mat_mul_smul, mat_smul_mul]

theorem Lmul_apply (A X : Matrix (Fin 3) (Fin 3) (O ℚ)) : Lmul A X = jb A X := rfl

noncomputable def innerMul (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A

theorem innerMul_apply (A B X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerMul A B X = jb A (jb B X) - jb B (jb A X) := rfl

theorem innerMul_antisymm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerMul A B = - innerMul B A := by
  unfold innerMul; abel

end Phys.Algebra.HJ
