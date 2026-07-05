import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-!  N300 PROBE A — de-risk the CONJUGATION algebra (concrete D = diag(1,1,-1)).
Need the ARENA operator identity: conjD (Lmul C (conjD X)) = Lmul (DCD) X, conjD X = D*X*D,
which (D²=1) gives conjD.conj (Lmul C) = Lmul(DCD) on hermSub ⟹ trace_H conj-invariant. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Dsig : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![1, 1, -1]

-- (1) involution D*D = 1
example : Dsig * Dsig = 1 := by
  unfold Dsig; rw [Matrix.diagonal_mul_diagonal, ← Matrix.diagonal_one]
  congr 1; funext i; fin_cases i <;> simp

-- (2) entrywise conjugation via diagonal_mul / mul_diagonal
example (X : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (Dsig * X * Dsig) i j = (![1,1,-1] i) * X i j * (![1,1,-1] j) := by
  unfold Dsig
  rw [Matrix.mul_diagonal, Matrix.diagonal_mul]

-- (3) THE ARENA OPERATOR IDENTITY (the crux). conjD X := D*X*D.
example (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Dsig * ((Lmul C) (Dsig * X * Dsig)) * Dsig = (Lmul (Dsig * C * Dsig)) X := by
  simp only [Lmul_apply]
  unfold jb
  ext i j
  simp only [Matrix.add_apply, Matrix.mul_apply, Matrix.diagonal, Dsig,
    Matrix.of_apply, Finset.sum_fin_eq_sum_range]
  sorry

end Phys.Algebra.HJ
