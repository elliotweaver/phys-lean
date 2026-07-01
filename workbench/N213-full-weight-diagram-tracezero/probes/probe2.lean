import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Phys.Algebra.OctonionJordanFrameWeight
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

theorem jb_Du0_Xzabc (a b c : O ℚ) :
    jb (Du0 (B := Dbl ℚ)) (Xz a b c) = Xz a b 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem jb_Du1_Xzabc (a b c : O ℚ) :
    jb (Du1 (B := Dbl ℚ)) (Xz a b c) = Xz a 0 c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem jb_Du2_Xzabc (a b c : O ℚ) :
    jb (Du2 (B := Dbl ℚ)) (Xz a b c) = Xz 0 b c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

theorem Xz_smul (r : ℚ) (a b c : O ℚ) :
    r • Xz a b c = Xz (r • a) (r • b) (r • c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.smul_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

theorem Xz_add (a b c p q r : O ℚ) :
    Xz a b c + Xz p q r = Xz (a + p) (b + q) (c + r) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.add_apply, star_add, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

-- ★★★ THE FULL WEIGHT DIAGRAM.
theorem jb_Dg_Xzabc (t0 t1 t2 : ℚ) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((t0 + t1) • a) ((t0 + t2) • b) ((t1 + t2) • c) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xzabc, jb_Du1_Xzabc, jb_Du2_Xzabc,
      Xz_smul, Xz_smul, Xz_smul, Xz_add, Xz_add]
  simp only [smul_zero, add_zero, zero_add, add_smul]

/-! ### The genuine NEW relational content: the weight-sum constraint + the trace-zero collapse. -/

-- ★★ THE WEIGHT-SUM CONSTRAINT: the three off-diagonal weights are NOT independent —
-- they sum to exactly TWICE the trace t0+t1+t2. The rank-2 root system closes.
theorem weight_sum_eq_two_trace (t0 t1 t2 : ℚ) :
    (t0 + t1) + (t0 + t2) + (t1 + t2) = 2 * (t0 + t1 + t2) := by ring

-- ★★ THE TRACE-ZERO COLLAPSE: on the hyperplane t0+t1+t2=0 the three slot weights become
-- exactly (-t2),(-t1),(-t0) — each slot weight equals MINUS the complementary Cartan
-- coordinate. The trace-zero (rank-2) Cartan IS the 2-parameter forced charge space,
-- with NO posit: the weight functional is fully determined by the two free parameters.
theorem jb_Dg_Xzabc_traceZero (t0 t1 t2 : ℚ) (h : t0 + t1 + t2 = 0) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((-t2) • a) ((-t1) • b) ((-t0) • c) := by
  rw [jb_Dg_Xzabc]
  have e0 : t0 + t1 = -t2 := by linarith
  have e1 : t0 + t2 = -t1 := by linarith
  have e2 : t1 + t2 = -t0 := by linarith
  rw [e0, e1, e2]

-- ★★ On the trace-zero hyperplane the three weights sum to ZERO (the closed root system).
theorem weight_sum_traceZero (t0 t1 t2 : ℚ) (h : t0 + t1 + t2 = 0) :
    (t0 + t1) + (t0 + t2) + (t1 + t2) = 0 := by
  rw [weight_sum_eq_two_trace, h]; ring

#print axioms jb_Dg_Xzabc
#print axioms weight_sum_eq_two_trace
#print axioms jb_Dg_Xzabc_traceZero
#print axioms weight_sum_traceZero

end Phys.Algebra.HJ
