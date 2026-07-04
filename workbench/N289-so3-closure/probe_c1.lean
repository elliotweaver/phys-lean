import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1600000

noncomputable def sA1c : Matrix (Fin 3) (Fin 3) (O ℚ) := !![0,1,0; 1,0,0; 0,0,0]
noncomputable def sB1c : Matrix (Fin 3) (Fin 3) (O ℚ) := !![0,0,1; 0,0,0; 1,0,0]
noncomputable def Mc : Matrix (Fin 3) (Fin 3) (O ℚ) := !![0,0,0; 0,0,1; 0,-1,0]

-- MEASURE: single entry (2,1) of the collapse, over CONSTANT 0/1 matrices (no octonion table).
example (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (innerMul sA1c sB1c X) 2 1 = (Mc * X - X * Mc) 2 1 := by
  simp only [innerMul_apply, jb, sA1c, sB1c, Mc, Matrix.sub_apply, Matrix.add_apply,
    Matrix.mul_apply, Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.of_apply, Matrix.cons_val',
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
    zero_mul, mul_zero, one_mul, mul_one, add_zero, zero_add, neg_mul, mul_neg]
  abel

end Phys.Algebra.HJ
