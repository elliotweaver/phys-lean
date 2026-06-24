import Phys.Algebra.Operator
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeN6

section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- (a) Is AddMonoid.End (CD (CD B)) a Ring?  (N3 used it as a ring already)
example : Ring (AddMonoid.End (CD (CD B))) := inferInstance

-- (b) Does Mathlib give a LieRing on the associative ring AddMonoid.End ?
example : LieRing (AddMonoid.End (CD (CD B))) := inferInstance

-- (c) Does Mathlib give LieAlgebra ℤ on it? (probe — may fail)
-- example : LieAlgebra ℤ (AddMonoid.End (CD (CD B))) := inferInstance

-- The Leibniz-derivation predicate over the banked CD product.
def IsDeriv (D : CD (CD B) →+ CD (CD B)) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

-- THE HEADLINE: commutator closure. f,g additive endos satisfying Leibniz ⟹ f∘g - g∘f does.
-- Work with the ring multiplication in AddMonoid.End (= composition).
example (f g : AddMonoid.End (CD (CD B)))
    (hf : IsDeriv f) (hg : IsDeriv g) :
    IsDeriv (f * g - g * f) := by
  intro x y
  -- multiplication in End is composition: (f*g) z = f (g z)
  have hmul : ∀ (a b : AddMonoid.End (CD (CD B))) (z), (a * b) z = a (b z) := fun a b z => rfl
  have hsub : ∀ (a b : AddMonoid.End (CD (CD B))) (z), (a - b) z = a z - b z := by
    intro a b z; rfl
  simp only [hsub, hmul]
  -- now expand using Leibniz for f and g
  rw [hg x y, hf (g x) y, hf x (g y)]   -- f(g(xy)) = f(gx·y + x·gy) = ...
  sorry

end Carrier
end ProbeN6
