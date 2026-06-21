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

theorem jordan_of_ring {S : Type*} [Ring S] {n : ℕ} (A B : Matrix (Fin n) (Fin n) S) :
    jdef A B = 0 := by
  unfold jdef jbr; noncomm_ring

-- the conditional: assoc on O ℚ ⟹ jdef = 0 (all n)
theorem jordan_of_assoc {B : Type*} [CommRing B] [StarRing B] {n : ℕ}
    (hassoc : ∀ x y z : CD (CD B), x * y * z = x * (y * z))
    (A C : Matrix (Fin n) (Fin n) (CD (CD B))) : jdef A C = 0 := by
  letI : Ring (CD (CD B)) := { CD.narCD with mul_assoc := hassoc }
  exact jordan_of_ring A C

noncomputable def a1 : O ℚ := CD.iota (ιJ ℚ)
noncomputable def a2 : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def a4 : O ℚ := (CD.e2 : O ℚ)

noncomputable def Xw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, a1, a2, 0; star a1, 0, 0, 0; star a2, 0, 0, 0; 0, 0, 0, 0]
noncomputable def Yw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, 0, 0, 0; 0, 0, 0, a4; 0, 0, 0, 0; 0, star a4, 0, 0]

set_option maxHeartbeats 4000000 in
theorem jdef_coord : (jdef Xw Yw 0 3).im.re.im = 4 := by
  unfold jdef jbr Xw Yw a1 a2 a4
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_four,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val,
    Matrix.empty_val', Matrix.cons_val_three, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.head_fin_const, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    CD.iota, CD.e2, ιJ, Dbl.J, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
    Dbl.one_re, Dbl.one_im, CD.one_re, CD.one_im, star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

theorem jordan_fails_n4 : jdef Xw Yw ≠ 0 := by
  intro h
  have hz : (jdef Xw Yw 0 3).im.re.im = 4 := jdef_coord
  rw [h] at hz
  norm_num [Matrix.zero_apply] at hz

-- ONE CAUSE: the n=4 failure DERIVES non-associativity of O ℚ.
theorem cap_forces_nonassoc : ¬ (∀ x y z : O ℚ, x * y * z = x * (y * z)) := by
  intro hassoc
  exact jordan_fails_n4 (jordan_of_assoc hassoc Xw Yw)
