import Mathlib.Tactic
import Mathlib.Algebra.Group.Hom.End

variable {M : Type*} [AddCommGroup M]

-- how to ext two AddMonoid.End?
example (f g : AddMonoid.End M) (h : ∀ y, f y = g y) : f = g := by
  exact AddMonoidHom.ext h

-- mul is composition?
example (f g : AddMonoid.End M) (y : M) : (f * g) y = f (g y) := by
  rfl

example (f g : AddMonoid.End M) (y : M) : (f + g) y = f y + g y := by
  rfl

example (f : AddMonoid.End M) (y : M) : (-f) y = -(f y) := by
  rfl
