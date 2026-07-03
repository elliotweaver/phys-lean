import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable def Lmul (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := jb A X
  map_add' X Y := by unfold jb; rw [mul_add, add_mul]; abel
  map_smul' r X := by
    unfold jb
    simp only [RingHom.id_apply, smul_add]
    rw [mat_mul_smul, mat_smul_mul]
where
  mat_smul_mul (r : ℚ) (P Q : Matrix (Fin 3) (Fin 3) (O ℚ)) : (r • P) * Q = r • (P * Q) := by
    apply Matrix.ext; intro i j
    simp only [Matrix.smul_apply, Matrix.mul_apply, Finset.smul_sum]
    exact Finset.sum_congr rfl (fun k _ => qsmul_mul_left r (P i k) (Q k j))
  mat_mul_smul (r : ℚ) (P Q : Matrix (Fin 3) (Fin 3) (O ℚ)) : P * (r • Q) = r • (P * Q) := by
    apply Matrix.ext; intro i j
    simp only [Matrix.smul_apply, Matrix.mul_apply, Finset.smul_sum]
    exact Finset.sum_congr rfl (fun k _ => qsmul_mul_right r (P i k) (Q k j))

end Phys.Algebra.HJ
