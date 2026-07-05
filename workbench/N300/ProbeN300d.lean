import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def csign (s : Fin 3 → ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.of (fun i j => (s i * s j) • X i j)

-- test scalar pull for a single product term (the crux, no octonion coords)
example (a b : ℚ) (x y : O ℚ) : (a • x) * (b • y) = (a * b) • (x * y) := by
  rw [smul_mul_assoc, mul_smul_comm, smul_smul]

-- Jordan automorphism: csign (jb C X) = jb (csign C) (csign X), using s_k²=1
example (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (jb C X) = jb (csign s C) (csign s X) := by
  unfold csign jb
  ext i j
  simp only [Matrix.of_apply, Matrix.add_apply, Matrix.mul_apply, Finset.smul_sum]
  rw [Finset.smul_sum, Finset.smul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k _
  simp only [Matrix.of_apply, smul_add]
  rw [smul_mul_assoc, mul_smul_comm, smul_smul, smul_mul_assoc, mul_smul_comm, smul_smul]
  congr 1 <;>
  · rw [show s i * s k * (s k * s j) = s i * s j * (s k * s k) by ring, hs k, mul_one]

end Phys.Algebra.HJ
