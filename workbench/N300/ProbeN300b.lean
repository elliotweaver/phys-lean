import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Dsig : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![1, 1, -1]

-- entrywise conjugation handle (closed cleanly earlier)
theorem dsig_conj_entry (X : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (Dsig * X * Dsig) i j = (![1,1,-1] i) * X i j * (![1,1,-1] j) := by
  unfold Dsig; rw [Matrix.mul_diagonal, Matrix.diagonal_mul]

-- the operator identity at the O ℚ ENTRY level (no octonion coordinate expansion).
-- Goal per entry (i,j): (D * jb C (DXD) * D)_ij = (jb (DCD) X)_ij.
example (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Dsig * ((Lmul C) (Dsig * X * Dsig)) * Dsig = (Lmul (Dsig * C * Dsig)) X := by
  simp only [Lmul_apply]
  unfold jb
  funext i j
  -- LHS: D*(C*(DXD) + (DXD)*C)*D ; RHS: (DCD)*X + X*(DCD)
  rw [Matrix.mul_apply, Matrix.mul_apply]  -- outer D*(...)*D via diagonal? use dsig_conj_entry instead
  sorry

end Phys.Algebra.HJ
