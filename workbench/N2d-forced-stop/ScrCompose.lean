import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

variable {A : Type*} [Ring A] [StarRing A]

@[reducible] def narCD : NonAssocRing (CD A) where
  add := (· + ·)
  add_assoc a b c := by ext <;> simp <;> abel
  zero := 0
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> abel
  neg := (- ·)
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec
  mul := (· * ·)
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  one := 1
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp

@[reducible] def srCD : letI := narCD (A := A); StarRing (CD A) :=
  letI := narCD (A := A)
  { star := Star.star
    star_involutive := by intro z; ext <;> simp
    star_mul := by intro z w; ext <;> simp [star_add, star_star]
    star_add := by intro z w; ext <;> simp [add_comm] }

noncomputable example : NonAssocRing (O ℚ) := narCD
noncomputable example : letI := narCD (A := H ℚ); StarRing (O ℚ) := srCD

noncomputable example
    (Scal : ∀ x y : CD (O ℚ),
      letI := narCD (A := H ℚ); x * (star x * y) = iota (Nrm x) * y) :
    ∀ a b c : O ℚ, (a * b) * c = a * (b * c) := by
  letI : NonAssocRing (O ℚ) := narCD
  letI : StarRing (O ℚ) := srCD
  exact assoc_of_scaling Scal

end Phys.Cascade
