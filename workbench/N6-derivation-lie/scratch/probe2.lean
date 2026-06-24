import Phys.Algebra.Operator
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeN6

section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- M is an AddCommGroup (narCD), hence a Module ℤ; Module.End ℤ M is a ℤ-algebra.
example : Module ℤ (CD (CD B)) := inferInstance
example : Ring (Module.End ℤ (CD (CD B))) := inferInstance
example : LieRing (Module.End ℤ (CD (CD B))) := inferInstance
example : LieAlgebra ℤ (Module.End ℤ (CD (CD B))) := inferInstance

-- bracket in a LieRing-from-associative is the commutator
example (f g : Module.End ℤ (CD (CD B))) : ⁅f, g⁆ = f * g - g * f := rfl

-- The Leibniz-derivation predicate over the banked CD product.
def IsDeriv (D : Module.End ℤ (CD (CD B))) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

-- application lemmas
example (a b : Module.End ℤ (CD (CD B))) (z) : (a * b) z = a (b z) := rfl
example (a b : Module.End ℤ (CD (CD B))) (z) : (a - b) z = a z - b z := by
  simp [Module.End.sub_apply]

-- THE HEADLINE: bracket (commutator) closure — uses ONLY Leibniz + biadditivity + distributivity.
theorem isDeriv_bracket (f g : Module.End ℤ (CD (CD B)))
    (hf : IsDeriv f) (hg : IsDeriv g) : IsDeriv ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  have e1 : (f * g - g * f) (x * y) = f (g (x*y)) - g (f (x*y)) := by
    simp [Module.End.sub_apply, Module.End.mul_apply]
  have ex : (f * g - g * f) x = f (g x) - g (f x) := by
    simp [Module.End.sub_apply, Module.End.mul_apply]
  have ey : (f * g - g * f) y = f (g y) - g (f y) := by
    simp [Module.End.sub_apply, Module.End.mul_apply]
  rw [e1, ex, ey]
  -- expand inner derivations
  rw [hg x y, hf (g x) y, hf x (g y), hf x y, hg (f x) y, hg x (f y)]
  -- now everything is additive in End and bilinear in the CD product; push the maps through sums
  simp only [map_add, map_sub]
  -- left distributivity / right distributivity of the CD product
  rw [CD.mul_add_na, CD.add_mul_na, CD.mul_add_na, CD.add_mul_na]
  abel

end Carrier
end ProbeN6
