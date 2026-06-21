import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

-- narCD over [NonAssocRing A][StarRing A] so it can CHAIN (O ℚ then S ℚ).
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

@[reducible] def srCD {A : Type*} [NonAssocRing A] [StarRing A] :
    letI := narCD (A := A); StarRing (CD A) :=
  letI := narCD (A := A)
  { star := Star.star
    star_involutive := by intro z; ext <;> simp
    star_mul := by intro z w; ext <;> simp [star_add, star_star]
    star_add := by intro z w; ext <;> simp [add_comm] }

end Phys.Cascade.CD

namespace Phys.Cascade
open CD

section Generic
variable {B : Type*} [CommRing B] [StarRing B]
-- chain the instances: NonAssocRing (CD B) is automatic (Ring); install O-level and S-level
attribute [local instance] narCD srCD

-- O-level: NonAssocRing (CD (CD B)), S-level: NonAssocRing (CD (CD (CD B)))
example : NonAssocRing (CD (CD B)) := narCD
example : NonAssocRing (CD (CD (CD B))) := narCD

-- adjoint3 (ext+ring, bottoms to CommRing B) must still compile with instances present:
set_option maxHeartbeats 8000000 in
theorem adjoint3 (u v w : CD (CD (CD B))) :
    bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  ext <;> simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add] <;> ring

-- A Sub-using lemma now works (S-level has AddGroup):
example (a b : CD (CD (CD B))) (h : a - b = 0) : a = b := sub_eq_zero.mp h

#print axioms adjoint3
end Generic
end Phys.Cascade
