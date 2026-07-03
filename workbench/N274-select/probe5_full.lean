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
  apply Finset.sum_congr rfl; intro k _; exact qsmul_mul_left r (A i k) (B k j)

theorem mat_mul_smul (r : ℚ) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    A * (r • B) = r • (A * B) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.smul_apply, Matrix.mul_apply, Finset.smul_sum]
  apply Finset.sum_congr rfl; intro k _; exact qsmul_mul_right r (A i k) (B k j)

noncomputable def Lmul (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := jb A X
  map_add' X Y := by unfold jb; rw [mul_add, add_mul]; abel
  map_smul' r X := by unfold jb; simp only [RingHom.id_apply, smul_add]; rw [mat_mul_smul, mat_smul_mul]

noncomputable def innerMul (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A

theorem innerMul_apply (A B X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerMul A B X = jb A (jb B X) - jb B (jb A X) := rfl

theorem ocRmulL (d : ℚ) (x : O ℚ) : ocR d * x = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_left, one_mul]
theorem ocRmulR (d : ℚ) (x : O ℚ) : x * ocR d = d • x := by
  rw [show ocR d = d • (1 : O ℚ) from by ext <;> simp [ocR], qsmul_mul_right, mul_one]

-- TEST: full-matrix ext with per-entry full simp (reduces the Nat ifs), measure cost.
set_option maxHeartbeats 1200000 in
theorem innerMul_slot_diag (a b : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotA a) (slotB b) (Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b)) := by
  apply Matrix.ext; intro i j
  rw [innerMul_apply]
  fin_cases i <;> fin_cases j <;>
    simp only [jb, slotA, slotB, slotC, Dg, Xz, Matrix.sub_apply, Matrix.add_apply,
      Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const, Matrix.diagonal_apply,
      Fin.isValue, show ((1:ℕ)=2) = False by simp, show ((2:ℕ)=1) = False by simp,
      show ((0:ℕ)=2) = False by simp, show ((2:ℕ)=0) = False by simp,
      show ((0:ℕ)=1) = False by simp, show ((1:ℕ)=0) = False by simp,
      if_false, if_true, mul_zero, zero_mul, add_zero, zero_add, sub_zero] <;>
    (try rfl) <;>
    (rw [ocRmulR, ocRmulL, ocRmulR, ocRmulL, mul_add, add_mul, qsmul_mul_right, qsmul_mul_right,
       qsmul_mul_left, qsmul_mul_left, sub_smul]; abel)

end Phys.Algebra.HJ
