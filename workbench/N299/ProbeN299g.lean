import Mathlib.Tactic
import Mathlib.Algebra.Lie.OfAssociative
example (M : Type) [AddCommGroup M] [Module ℚ M] (f g : Module.End ℚ M) (x : M) :
    ⁅f, g⁆ x = f (g x) - g (f x) := by
  rw [Ring.lie_def]; simp [LinearMap.sub_apply, Module.End.mul_apply]

-- and the map_sub for trace
example (M : Type) [AddCommGroup M] [Module ℚ M] (f g : Module.End ℚ M) :
    LinearMap.trace ℚ M (f * g - g * f) = 0 := by
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]
