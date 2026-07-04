import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]

theorem endLeibniz (a b c : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) :
    ⁅a, ⁅b, c⁆⁆ = ⁅⁅a, b⁆, c⁆ + ⁅b, ⁅a, c⁆⁆ := by
  rw [show (⁅⁅a, b⁆, c⁆ : Module.End ℚ _) = ⁅a, ⁅b, c⁆⁆ - ⁅b, ⁅a, c⁆⁆ from lie_lie a b c]; abel

/- KEY sub-fact: ⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆ = 0 and
   ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ = 0.
   TEST both via reducing innerMul(...)(...) to Lmul-bracket and endLeibniz again -- the
   base of the recursion is ⁅Lmul X, Lmul Y⁆ = innerMul X Y = jb-slot products.

   Actually, simplest test: does `⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆ = 0` close by
   innerMul_eq_lie + endLeibniz to slot innerMuls that vanish? Let me expand:
   ⁅Lb, ⁅La', Lc⁆⁆ = ⁅⁅Lb,La'⁆,Lc⁆ + ⁅La',⁅Lb,Lc⁆⁆  (endLeibniz, a=Lb,b=La',c=Lc)
     = ⁅innerMul(slotB 1)(slotA u1), Lmul(slotC 1)⁆ + ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆.
   Recurses again. The recursion doesn't bottom out cleanly this way. -/

-- Let me just directly test: ⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆ = 0 by ext + heavy.
-- If this needs coordinate bash it's W9. Measure with a bounded probe (maxHeartbeats).
set_option maxHeartbeats 1000000 in
theorem test_base : ⁅Lmul (slotB (1:O ℚ)), innerMul (slotA u1) (slotC 1)⁆ = 0 := by
  sorry

end Phys.Algebra.HJ
