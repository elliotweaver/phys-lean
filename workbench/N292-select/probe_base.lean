import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]

/-- The base bracket ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆.
    innerMul(slotB 1)(slotC 1) = ⁅Lmul(slotB 1), Lmul(slotC 1)⁆.
    ⁅Lmul(slotA u1), ⁅Lmul(slotB 1), Lmul(slotC 1)⁆⁆
      = ⁅⁅Lmul(slotA u1), Lmul(slotB 1)⁆, Lmul(slotC 1)⁆ + ⁅Lmul(slotB 1), ⁅Lmul(slotA u1), Lmul(slotC 1)⁆⁆
      = ⁅innerMul(slotA u1)(slotB 1), Lmul(slotC 1)⁆ + ⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆.
    Now innerMul(slotA u1)(slotB 1) = ??? and innerMul(slotA u1)(slotC 1) = ???
    Let me reduce these to slots via Lmul of jb-products... too deep.
    INSTEAD: measure innerMul(slotB 1)(slotC 1) as an OPERATOR = Lmul of something? NO, it's a
    commutator. But its ACTION: innerMul(slotB 1)(slotC 1) = famA (banked N288). And
    ⁅Lmul(slotA u1), famA⁆ — is there a banked handle? famA is gauge-central but NOT Lmul-related.
    Let me just test if `⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ = 0` closes by ext + heavy simp. -/
set_option maxHeartbeats 3200000 in
theorem base_bracket : ⁅Lmul (slotA u1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆ = 0 := by
  sorry

end Phys.Algebra.HJ
