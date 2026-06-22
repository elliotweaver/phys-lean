/- PROBE (run 52): single-pair full matrix via Matrix.ext (octonion level, no CD projection). -/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.CompCentral
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbePairExt
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def Xa (a : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, a, 0; star a, 0, 0; 0, 0, 0]
def Yp (p : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, p, 0; star p, 0, 0; 0, 0, 0]

set_option maxHeartbeats 1000000 in
theorem pairExt (a p : CD (CD B)) : jdef (Xa a) (Yp p) = 0 := by
  apply Matrix.ext
  intro i j
  unfold jdef jb Xa Yp
  fin_cases i <;> fin_cases j <;>
  simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val,
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero]
  trace_state

end ProbePairExt
