import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Dsig : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![1, 1, -1]

theorem dsig_entry (i j : Fin 3) : Dsig i j = if i = j then (![1,1,-1] i) else 0 := by
  unfold Dsig; rw [Matrix.diagonal_apply]

-- the crux operator identity, concrete Dsig, at the O ℚ entry level.
theorem dsig_op (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Dsig * ((Lmul C) (Dsig * X * Dsig)) * Dsig = (Lmul (Dsig * C * Dsig)) X := by
  simp only [Lmul_apply]
  unfold jb
  funext i j
  simp only [Matrix.add_apply, Matrix.mul_apply, dsig_entry, Fin.sum_univ_three]
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.mul_apply, dsig_entry, Fin.sum_univ_three, Matrix.of_apply,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons, if_true, if_false] <;>
    simp only [one_mul, mul_one, neg_one_mul, mul_neg_one, neg_mul, mul_neg, neg_neg,
      zero_mul, mul_zero, add_zero, zero_add] <;>
    abel

end Phys.Algebra.HJ
