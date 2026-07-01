import Phys.Algebra.OctonionJordanWeightDiagram
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- The linear trace functional on 3×3 matrices over `O ℚ`. -/
noncomputable def jTr (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace A

/-- The trace of the diagonal Cartan = ocR of the coordinate sum. -/
theorem jTr_Dg (t0 t1 t2 : ℚ) : jTr (Dg t0 t1 t2) = ocR (t0 + t1 + t2) := by
  unfold jTr Dg
  rw [Matrix.trace_diagonal]
  simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  rw [ocR_add, ocR_add]

/-- The trace kills the off-diagonal core. -/
theorem jTr_Xz (a b c : O ℚ) : jTr (Xz a b c) = 0 := by
  unfold jTr Xz
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply, Matrix.of_apply, Matrix.cons_val',
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
    add_zero]

/-- The symmetric bilinear trace form: `T(A,B) = trace (A·B + B·A)`. -/
noncomputable def jTraceForm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace (jb A B)

/-- The trace form is symmetric. -/
theorem jTraceForm_symm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jTraceForm A B = jTraceForm B A := by
  unfold jTraceForm jb
  rw [add_comm]

end Phys.Algebra.HJ

#print axioms Phys.Algebra.HJ.jTr_Dg
#print axioms Phys.Algebra.HJ.jTr_Xz
#print axioms Phys.Algebra.HJ.jTraceForm_symm
