import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def csign (s : Fin 3 → ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.of (fun i j => (s i * s j) • X i j)

-- scalar pull for a single octonion product (uses banked qsmul lemmas)
example (a b : ℚ) (x y : O ℚ) : (a • x) * (b • y) = (a * b) • (x * y) := by
  rw [qsmul_mul_left, qsmul_mul_right, smul_smul]

-- Jordan automorphism: csign (jb C X) = jb (csign C) (csign X), using s_k²=1
theorem csign_jb (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (jb C X) = jb (csign s C) (csign s X) := by
  unfold csign jb
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, Matrix.add_apply, Matrix.mul_apply, Matrix.of_apply,
    smul_add, Finset.smul_sum]
  congr 1 <;>
  · apply Finset.sum_congr rfl; intro k _
    rw [qsmul_mul_left, qsmul_mul_right, smul_smul,
        show s i * s k * (s k * s j) = s i * s j * (s k * s k) by ring, hs k, mul_one]

-- involutive
theorem csign_invol (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (csign s X) = X := by
  unfold csign
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, smul_smul,
    show s i * s j * (s i * s j) = (s i * s i) * (s j * s j) by ring, hs i, hs j, one_mul, one_smul]

-- ℚ-linear
theorem csign_add (s) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) : csign s (X + Y) = csign s X + csign s Y := by
  unfold csign; apply Matrix.ext; intro i j; simp [smul_add]
theorem csign_smul (s) (r : ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) : csign s (r • X) = r • csign s X := by
  unfold csign; apply Matrix.ext; intro i j; simp [smul_comm]

end Phys.Algebra.HJ
