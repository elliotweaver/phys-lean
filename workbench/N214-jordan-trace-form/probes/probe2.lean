import Phys.Algebra.OctonionJordanWeightDiagram
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable def jTr (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace A
noncomputable def jTraceForm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace (jb A B)

-- THE CARTAN METRIC: T(Dg s, Dg t) = ocR (2·(s0 t0 + s1 t1 + s2 t2)) -- the forced Euclidean form.
theorem jTF_Dg_Dg (s0 s1 s2 t0 t1 t2 : ℚ) :
    jTraceForm (Dg s0 s1 s2) (Dg t0 t1 t2)
      = ocR (2 * (s0 * t0 + s1 * t1 + s2 * t2)) := by
  unfold jTraceForm jb Dg
  rw [Matrix.diagonal_mul_diagonal, Matrix.diagonal_mul_diagonal, Matrix.trace_add,
    Matrix.trace_diagonal, Matrix.trace_diagonal]
  simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  simp only [ocR_mul]
  rw [ocR_add, ocR_add, ocR_add, ocR_add, ocR_add]
  congr 1
  ring

end Phys.Algebra.HJ

#print axioms Phys.Algebra.HJ.jTF_Dg_Dg
