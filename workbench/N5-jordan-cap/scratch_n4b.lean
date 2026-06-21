import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD

section Defs
variable {S : Type*} [NonAssocRing S] {n : ℕ}
def jbr (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A
def jdef (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jbr (jbr A B) (jbr A A) - jbr A (jbr B (jbr A A))
end Defs

noncomputable def a1 : O ℚ := CD.iota (ιJ ℚ)
noncomputable def a2 : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def a4 : O ℚ := (CD.e2 : O ℚ)

noncomputable def Xw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, a1, a2, 0;
     star a1, 0, 0, 0;
     star a2, 0, 0, 0;
     0, 0, 0, 0]
noncomputable def Yw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, 0, 0, 0;
     0, 0, 0, a4;
     0, 0, 0, 0;
     0, star a4, 0, 0]

set_option maxHeartbeats 2000000 in
example : jdef Xw Yw 0 3 = 0 := by   -- deliberately WRONG to see the reduced LHS
  unfold jdef jbr Xw Yw a1 a2 a4
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_four,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val,
    Matrix.empty_val', Matrix.cons_val_three, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const]
  ext <;> simp [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im, CD.iota, CD.e2, ιJ, Dbl.J,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im]
