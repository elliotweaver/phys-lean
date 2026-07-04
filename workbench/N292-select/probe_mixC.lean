import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-- MIXED LEIBNIZ (specific C = slotC 1): ⁅kAB, Lmul(slotC 1)⁆ = 0.
    Applied to X: ⁅kAB, Lmul(slotC 1)⁆ X = kAB (jb (slotC 1) X) - jb (slotC 1) (kAB X).
    kAB = innerMul (slotA u1)(slotB 1). Both sides are LinearMaps; prove by ext + reductions.
    We measure whether the goal closes via a general approach. -/
set_option maxHeartbeats 1600000 in
theorem coset_mixed_C :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotC (1:O ℚ))⁆ = 0 := by
  rw [Ring.lie_def]
  ext X : 1
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Lmul_apply, innerMul_apply,
    LinearMap.zero_apply]
  sorry

end Phys.Algebra.HJ
