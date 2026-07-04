import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]

example :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
      = ⁅⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotB u1)⁆, Lmul (slotC (1:O ℚ))⁆
        + ⁅Lmul (slotB u1), ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotC (1:O ℚ))⁆⁆ := by
  conv_lhs => rw [innerMul_eq_lie (slotB u1) (slotC 1)]
  rw [leibniz_lie]

end Phys.Algebra.HJ
