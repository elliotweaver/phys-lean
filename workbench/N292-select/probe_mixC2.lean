import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-- MIXED LEIBNIZ (operator): ⁅kAB, Lmul(slotC 1)⁆ = 0. Try direct: this is a derivation defect.
    For kAB = innerMul(slotA u1)(slotB 1) and ANY X:
      ⁅kAB, Lmul(slotC 1)⁆ X = kAB (jb (slotC 1) X) - jb (slotC 1)(kAB X).
    Since we can't use a general derivation law, prove via the innerMul_eq_lie + lie algebra.
    kAB = ⁅La, Lb⁆ with a=slotA u1, b=slotB 1.
    ⁅⁅La,Lb⁆, Lc⁆ = ⁅La, ⁅Lb,Lc⁆⁆ - ⁅Lb, ⁅La,Lc⁆⁆   (lie_lie, with c=slotC 1)
                  = ⁅La, innerMul(slotB 1)(slotC 1)⁆ - ⁅Lb, innerMul(slotA u1)(slotC 1)⁆.
    Both terms measured 0. Need: ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ = 0 and
    ⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆ = 0.  These are the base lemmas. -/
set_option maxHeartbeats 2000000 in
theorem mixed_C : ⁅innerMul (slotA u1) (slotB (1:O ℚ)), Lmul (slotC (1:O ℚ))⁆ = 0 := by
  rw [show innerMul (slotA u1) (slotB (1:O ℚ)) = ⁅Lmul (slotA u1), Lmul (slotB 1)⁆ from by
        ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]]
  rw [lie_lie]
  -- goal: ⁅Lmul(slotA u1), ⁅Lmul(slotB 1), Lmul(slotC 1)⁆⁆ - ⁅Lmul(slotB 1), ⁅Lmul(slotA u1), Lmul(slotC 1)⁆⁆ = 0
  sorry

end Phys.Algebra.HJ
