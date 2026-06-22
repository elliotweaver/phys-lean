/- PROBE (run 56): MEASURE the TWO-generator core (0,0) entry cost. Bounded. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.CompCentral
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeTwoGen
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def Xz (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, a, b; star a, 0, c; star b, star c, 0]

set_option maxHeartbeats 1000000 in
-- two generators a,b present (c=0); diagonal (0,0)
theorem core00_ab (a b p q : CD (CD B)) : (jdef (Xz a b 0) (Xz p q 0)) 0 0 = 0 := by
  unfold jdef jb Xz
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero]
  trace_state
  sorry

end ProbeTwoGen
