import Phys.Algebra.OctonionJordanTraceFormInvariance
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

def hermSub : Submodule ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  carrier := { M | Mᴴ = M }
  add_mem' := by intro a b ha hb; simp only [Set.mem_setOf_eq, conjTranspose_add] at *; rw [ha, hb]
  zero_mem' := by simp only [Set.mem_setOf_eq, conjTranspose_zero]
  smul_mem' := by intro c a ha; simp only [Set.mem_setOf_eq] at *; rw [conjTranspose_smul, star_trivial, ha]

-- Test 1: bare map_sub in this instance context
example (f g : Module.End ℚ hermSub) :
    LinearMap.trace ℚ hermSub (f * g - g * f) = 0 := by
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]

-- Test 2: via trace_lie + Ring.lie_def reverse
example (f g : Module.End ℚ hermSub) :
    LinearMap.trace ℚ hermSub (f * g - g * f) = 0 := by
  have : f * g - g * f = ⁅f, g⁆ := (Ring.lie_def f g).symm
  rw [this, LinearMap.trace_lie]

end Phys.Algebra.HJ
