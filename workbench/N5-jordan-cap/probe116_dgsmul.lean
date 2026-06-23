import Phys.Algebra.HermitianJordan.PieceBdeg1
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.JordanTower
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- Variant C: unfold to diagonals + diagonal_apply, then full simp (reduces ifs, vectors, arith).
theorem Dg_eq_smul_C (d0 d1 d2 : ℚ) :
    Dg d0 d1 d2 = d0 • Du0 (B := Dbl ℚ) + d1 • Du1 (B := Dbl ℚ) + d2 • Du2 (B := Dbl ℚ) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.add_apply, Matrix.smul_apply, qsmul_def, Dg, Du0, Du1, Du2,
    Matrix.diagonal_apply]
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      mul_zero, mul_one, add_zero, zero_add, ocR_zero]

end Phys.Algebra.HJ
