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

theorem jTr_Dg (t0 t1 t2 : ℚ) : jTr (Dg t0 t1 t2) = ocR (t0 + t1 + t2) := by
  unfold jTr Dg
  rw [Matrix.trace_diagonal]
  simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  rw [ocR_add, ocR_add]

-- The identity matrix IS the diagonal Cartan Dg 1 1 1 = E0+E1+E2 (frame_sum).
theorem Dg_one : Dg 1 1 1 = (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  apply Matrix.ext; intro i j
  unfold Dg
  rw [Matrix.diagonal_apply, Matrix.one_apply]
  by_cases h : i = j
  · subst h; fin_cases i <;>
      simp [ocR_one, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
        Matrix.cons_val_two, Matrix.tail_cons]
  · simp [h]

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

-- ★★ THE HEADLINE: the trace-form pairing against the FORCED identity direction `1`
--    equals ocR of TWICE the coordinate sum = ocR 2 · (the trace functional).
theorem jTF_one_Dg (t0 t1 t2 : ℚ) :
    jTraceForm 1 (Dg t0 t1 t2) = ocR (2 * (t0 + t1 + t2)) := by
  rw [← Dg_one, jTF_Dg_Dg]; congr 1; ring

theorem ocR_reQ (r : ℚ) : (ocR r).re.re.re = r := rfl

-- ★★★ THE CHARGE HYPERPLANE = the trace-form-orthogonal complement of the identity.
--     T(1, Dg t) = 0  ↔  t0+t1+t2 = 0  (N213's trace-zero charge plane).
theorem jTF_one_Dg_zero_iff (t0 t1 t2 : ℚ) :
    jTraceForm 1 (Dg t0 t1 t2) = 0 ↔ t0 + t1 + t2 = 0 := by
  rw [jTF_one_Dg]
  constructor
  · intro h
    have hz : (2 * (t0 + t1 + t2)) = 0 := by
      have := congrArg (fun x : O ℚ => x.re.re.re) h
      simpa [ocR_reQ] using this
    linarith
  · intro h; rw [h]; norm_num [ocR_zero]

end Phys.Algebra.HJ

#print axioms Phys.Algebra.HJ.Dg_one
#print axioms Phys.Algebra.HJ.jTF_one_Dg
#print axioms Phys.Algebra.HJ.jTF_one_Dg_zero_iff
