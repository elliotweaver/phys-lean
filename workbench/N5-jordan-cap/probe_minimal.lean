/- PROBE (run 51, W9.2): the MINIMAL core sub-defect — X has ONLY off-diagonal `a` at
   (0,1)/(1,0), Y has ONLY `p` at (0,1)/(1,0). This is a 2-GENERATOR problem {a,p};
   by Artin the subalgebra they generate is associative, so this should be the CHEAPEST
   possible core obligation. MEASURE the coordinate ring cost on this minimal piece.
   If THIS rings cheaply, multilinearity (banked additivity) assembles the full core from
   such pieces. If even THIS blows up, the coordinate route is dead at the atom and the
   structural octonion route is forced. Bounded; hard kill outside. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeMinimal
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- X with a single off-diagonal octonion `a`. -/
def Xa (a : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0,       a,   0;
      star a,  0,   0;
      0,       0,   0]

/-- Y with a single off-diagonal octonion `p`. -/
def Yp (p : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0,       p,   0;
      star p,  0,   0;
      0,       0,   0]

set_option maxHeartbeats 2000000 in
theorem minimal_full (a p : CD (CD B)) : jdef (Xa a) (Yp p) = 0 := by
  unfold jdef jb Xa Yp
  ext i j
  fin_cases i <;> fin_cases j <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg,
    neg_zero, neg_neg]

end ProbeMinimal
