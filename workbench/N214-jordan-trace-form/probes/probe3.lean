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

theorem ocR_one : ocR (1 : ℚ) = (1 : O ℚ) := by
  have := ocR_one_mul (1 : O ℚ); rwa [mul_one] at this

-- Frame idempotents ARE diagonal Cartan elements.
theorem Du0_eq_Dg : (Du0 (B := Dbl ℚ)) = Dg 1 0 0 := by
  unfold Du0 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

theorem Du1_eq_Dg : (Du1 (B := Dbl ℚ)) = Dg 0 1 0 := by
  unfold Du1 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

theorem Du2_eq_Dg : (Du2 (B := Dbl ℚ)) = Dg 0 0 1 := by
  unfold Du2 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

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
  congr 1; ring

-- Frame orthonormality: T(E0,E0)=ocR 2, T(E0,E1)=0.
theorem jTF_Du0_Du0 : jTraceForm (Du0 (B := Dbl ℚ)) (Du0 (B := Dbl ℚ)) = ocR 2 := by
  rw [Du0_eq_Dg, jTF_Dg_Dg]; norm_num

theorem jTF_Du0_Du1 : jTraceForm (Du0 (B := Dbl ℚ)) (Du1 (B := Dbl ℚ)) = 0 := by
  rw [Du0_eq_Dg, Du1_eq_Dg, jTF_Dg_Dg]; norm_num [ocR_zero]

end Phys.Algebra.HJ

#print axioms Phys.Algebra.HJ.Du0_eq_Dg
#print axioms Phys.Algebra.HJ.jTF_Du0_Du0
#print axioms Phys.Algebra.HJ.jTF_Du0_Du1
