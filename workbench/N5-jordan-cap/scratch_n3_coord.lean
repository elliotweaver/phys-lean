import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD

def jbr {S : Type*} [NonAssocRing S] {n : ℕ}
    (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A
def jdef {S : Type*} [NonAssocRing S] {n : ℕ}
    (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jbr (jbr A B) (jbr A A) - jbr A (jbr B (jbr A A))

def oc (a b c d e f g h : ℚ) : O ℚ := ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩
def ocR (r : ℚ) : O ℚ := ⟨⟨⟨r,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩

set_option maxHeartbeats 8000000 in
example
  (d0 d1 d2 : ℚ)
  (x1 x2 x3 x4 x5 x6 x7 x8 : ℚ) (x9 x10 x11 x12 x13 x14 x15 x16 : ℚ)
  (x17 x18 x19 x20 x21 x22 x23 x24 : ℚ)
  (e0 e1 e2 : ℚ)
  (y1 y2 y3 y4 y5 y6 y7 y8 : ℚ) (y9 y10 y11 y12 y13 y14 y15 y16 : ℚ)
  (y17 y18 y19 y20 y21 y22 y23 y24 : ℚ) :
  (jdef
    (!![ ocR d0, oc x1 x2 x3 x4 x5 x6 x7 x8, oc x9 x10 x11 x12 x13 x14 x15 x16;
         star (oc x1 x2 x3 x4 x5 x6 x7 x8), ocR d1, oc x17 x18 x19 x20 x21 x22 x23 x24;
         star (oc x9 x10 x11 x12 x13 x14 x15 x16), star (oc x17 x18 x19 x20 x21 x22 x23 x24), ocR d2] : Matrix (Fin 3) (Fin 3) (O ℚ))
    (!![ ocR e0, oc y1 y2 y3 y4 y5 y6 y7 y8, oc y9 y10 y11 y12 y13 y14 y15 y16;
         star (oc y1 y2 y3 y4 y5 y6 y7 y8), ocR e1, oc y17 y18 y19 y20 y21 y22 y23 y24;
         star (oc y9 y10 y11 y12 y13 y14 y15 y16), star (oc y17 y18 y19 y20 y21 y22 y23 y24), ocR e2] : Matrix (Fin 3) (Fin 3) (O ℚ))
    0 1).re.re.re = 0 := by
  unfold jdef jbr oc ocR
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im]
  ring
