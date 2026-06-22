/- PROBE (run 51, W9.2): the 2-GENERATOR edge-pair defect jdef(edge a, edge p) = 0.
   Both edges at (0,1): X = a@(0,1), star a@(1,0); Y = p@(0,1), star p@(1,0). Only generators
   {a, p, star a, star p} appear. By Artin (2 elements of an alternative algebra generate an
   ASSOCIATIVE subalgebra) this lives in an associative subalgebra -> Jordan defect = 0.
   multilin.py: nonzero free-word entries (0,0),(1,1), 8 monomials each. SMALL.
   MEASURE the per-entry coordinate cost (fin_cases split). If 2-gen pieces close cheaply,
   they are building blocks for a multilinear assembly. Bounded; hard kill outside. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeEdgePair
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def Ea (a : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, a, 0; star a, 0, 0; 0, 0, 0]

set_option maxHeartbeats 2000000 in
theorem edgepair (a p : CD (CD B)) : jdef (Ea a) (Ea p) = 0 := by
  unfold jdef jb Ea
  ext i j
  fin_cases i <;> fin_cases j <;>
  · simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
      Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
      Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg,
      neg_zero, neg_neg]
    first
    | rfl
    | (ext <;>
       simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
         star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg] <;>
       ring)

end ProbeEdgePair
