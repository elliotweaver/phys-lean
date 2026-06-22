/- DIAGNOSTIC (run 51): show the remaining goal on the minimal core (0,1) entry after
   matrix simp, to see what closer it actually needs. Bounded. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeMinDiag
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def Xa (a : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, a, 0; star a, 0, 0; 0, 0, 0]
def Yp (p : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, p, 0; star p, 0, 0; 0, 0, 0]

set_option maxHeartbeats 1000000 in
theorem mindiag (a p : CD (CD B)) : (jdef (Xa a) (Yp p)) 0 1 = 0 := by
  unfold jdef jb Xa Yp
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg]
  trace_state
  sorry

end ProbeMinDiag
