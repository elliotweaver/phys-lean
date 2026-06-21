import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
@[reducible] def narCD {A : Type*} [NonAssocRing A] [StarRing A] : NonAssocRing (CD A) where
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
end Phys.Cascade.CD

namespace Phys.Cascade
open CD
attribute [local instance] narCD

-- Does narCD's mul on O ℚ = CD (H ℚ) DEFEQ-align with the raw CD Mul used by not_associative?
-- B = Dbl ℚ, CD (CD B) = CD (CD (Dbl ℚ)) = CD (H ℚ) = O ℚ.
example : (CD (CD (Dbl ℚ))) = O ℚ := rfl

-- Test: a hypothetical "O ℚ associative via narCD" feeds not_associative (raw mul).
example (h : ∀ a b c : CD (CD (Dbl ℚ)), (a * b) * c = a * (b * c)) : False :=
  not_associative h

#check @not_associative
end Phys.Cascade
