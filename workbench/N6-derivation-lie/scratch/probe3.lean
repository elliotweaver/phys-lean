import Phys.Algebra.Operator
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeN6

section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

example : LieRing (Module.End ℤ (CD (CD B))) := inferInstance
example : LieAlgebra ℤ (Module.End ℤ (CD (CD B))) := inferInstance

def IsDeriv (D : Module.End ℤ (CD (CD B))) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

theorem isDeriv_bracket (f g : Module.End ℤ (CD (CD B)))
    (hf : IsDeriv f) (hg : IsDeriv g) : IsDeriv ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub, add_mul, mul_add]
  abel

end Carrier
end ProbeN6
