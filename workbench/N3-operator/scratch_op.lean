import Phys.Cascade.ForcedStop
import Mathlib.Tactic
import Mathlib.Algebra.Group.Hom.End

open Phys.Cascade
open Phys.Cascade.CD

namespace Phys.Cascade.Scratch

variable {B : Type*} [CommRing B] [StarRing B]

set_option maxHeartbeats 4000000 in
theorem scaling_law (x y : CD (CD B)) :
    x * (star x * y) = iota (Nrm x) * y := by
  rw [Nrm_def]
  ext <;>
    simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

attribute [local instance] CD.narCD CD.srCD

theorem iota_add' (p q : CD B) : (iota (p + q) : CD (CD B)) = iota p + iota q := by
  ext <;> simp [iota]

theorem add_mul_na (x y z : CD (CD B)) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add, star_add] <;> abel

theorem sq_pt (a : CD (CD B)) (ha : star a = -a) (y : CD (CD B)) :
    a * (a * y) = -(iota (Nrm a) * y) := by
  have h := scaling_law a y
  rw [ha, neg_mul, mul_neg, neg_eq_iff_eq_neg] at h
  exact h

theorem clifford_pt (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b)
    (y : CD (CD B)) :
    a * (b * y) + b * (a * y) = -(iota (bilin a b) * y) := by
  have hab : star (a + b) = -(a + b) := by rw [star_add, ha, hb]; abel
  have hsum := sq_pt (a + b) hab y
  have hsa := sq_pt a ha y
  have hsb := sq_pt b hb y
  have hexp : (a + b) * ((a + b) * y)
      = a * (a * y) + (a * (b * y) + b * (a * y)) + b * (b * y) := by
    simp only [add_mul_na, CD.mul_add_na]; abel
  rw [hexp, hsa, hsb, CD.Nrm_add_na] at hsum
  have hiotaexp : iota (Nrm a + Nrm b + bilin a b) * y
      = iota (Nrm a) * y + iota (Nrm b) * y + iota (bilin a b) * y := by
    rw [iota_add', iota_add', add_mul_na, add_mul_na]
  rw [hiotaexp] at hsum
  have hcancel :
      (a * (b * y) + b * (a * y)) - (-(iota (bilin a b) * y))
        = (-(iota (Nrm a) * y) + (a * (b * y) + b * (a * y)) + -(iota (Nrm b) * y))
          - (-(iota (Nrm a) * y + iota (Nrm b) * y + iota (bilin a b) * y)) := by abel
  rw [hsum, sub_self] at hcancel
  exact sub_eq_zero.mp hcancel

/-! ## THE OPERATOR (CLIFFORD) FORM in the associative ring `AddMonoid.End`. -/

def Lop (a : CD (CD B)) : AddMonoid.End (CD (CD B)) :=
  AddMonoidHom.mk' (fun y => a * y) (CD.mul_add_na a)

@[simp] theorem Lop_apply (a y : CD (CD B)) : Lop a y = a * y := rfl

theorem L_sq_op (a : CD (CD B)) (ha : star a = -a) :
    Lop a * Lop a = - Lop (iota (Nrm a)) := by
  apply AddMonoidHom.ext; intro y
  show a * (a * y) = -(iota (Nrm a) * y)
  exact sq_pt a ha y

theorem clifford_op (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b) :
    Lop a * Lop b + Lop b * Lop a = - Lop (iota (bilin a b)) := by
  apply AddMonoidHom.ext; intro y
  show a * (b * y) + b * (a * y) = -(iota (bilin a b) * y)
  exact clifford_pt a b ha hb y

end Phys.Cascade.Scratch

#print axioms Phys.Cascade.Scratch.scaling_law
#print axioms Phys.Cascade.Scratch.L_sq_op
#print axioms Phys.Cascade.Scratch.clifford_op
