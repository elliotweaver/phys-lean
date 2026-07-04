import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- innerMul as Lmul bracket
theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerMul A B = ⁅Lmul A, Lmul B⁆ := by rw [Ring.lie_def]; rfl

/-- THE DIRECT CLOSURE: ⁅kAB, kBC⁆ = famB via the Lie-Jacobi expansion into innerMul of slot
    products, using kAB·(slotB u1) = -slotA 1 and kAB·(slotC 1) = 0 encoded as operator facts.
    Approach: rewrite kBC = ⁅Lmul(slotB u1), Lmul(slotC 1)⁆, use lie_lie (Jacobi/Leibniz):
      ⁅kAB, ⁅P, Q⁆⁆ = ⁅⁅kAB,P⁆, Q⁆ + ⁅P, ⁅kAB,Q⁆⁆.  -/
example : ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
    = ⁅⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotB u1)⁆, Lmul (slotC (1:O ℚ))⁆
      + ⁅Lmul (slotB u1), ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotC (1:O ℚ))⁆⁆ := by
  rw [innerMul_eq_lie (slotB u1) (slotC 1), lie_lie]

end Phys.Algebra.HJ
