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

-- Test A: trace_lie directly on a bracket
example (f g : Module.End ℚ hermSub) : LinearMap.trace ℚ hermSub ⁅f, g⁆ = 0 := by
  exact LinearMap.trace_lie f g

-- Test B: map_sub with LinearMap.map_sub' or via AddMonoidHom
example (f g : Module.End ℚ hermSub) :
    LinearMap.trace ℚ hermSub (f * g) - LinearMap.trace ℚ hermSub (g * f) = 0 := by
  rw [LinearMap.trace_mul_comm, sub_self]

-- Test C: combine — first split via map_sub as a separate have
example (f g : Module.End ℚ hermSub) :
    LinearMap.trace ℚ hermSub (f * g - g * f) = 0 := by
  have h := LinearMap.map_sub (LinearMap.trace ℚ hermSub) (f * g) (g * f)
  rw [h, LinearMap.trace_mul_comm, sub_self]

end Phys.Algebra.HJ
