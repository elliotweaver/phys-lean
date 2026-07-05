import Mathlib.Tactic
import Mathlib.Algebra.Lie.OfAssociative

-- (A) trace of f*g - g*f = 0  (the crux)
example (M : Type) [AddCommGroup M] [Module ℚ M] (f g : Module.End ℚ M) :
    LinearMap.trace ℚ M (f * g - g * f) = 0 := by
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]
