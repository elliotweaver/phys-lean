import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

theorem innerMul_eq_lie (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A B = ⁅Lmul A, Lmul B⁆ := by
  ext X : 1; rw [innerMul_apply]; simp [Module.End.lie_apply]

/-- ⁅Lmul (slotA a), innerMul (slotB b)(slotC c)⁆ — MEASURE: is there a clean form?
    Actually test: ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ = 0 (measured).
    Prove via innerMul_eq_lie + lie_lie decomposition into innerMuls of slot products. -/

-- The KEY sub-brackets, via lie_lie on ⁅La,⁅Lb,Lc⁆⁆:
-- ⁅Lmul A, ⁅Lmul B, Lmul C⁆⁆ = ⁅⁅Lmul A, Lmul B⁆, Lmul C⁆ + ⁅Lmul B, ⁅Lmul A, Lmul C⁆⁆
--                            = ⁅innerMul A B, Lmul C⁆ + ⁅Lmul B, innerMul A C⁆
-- This just re-expresses. The base facts we need are innerMul of slot products = specific slots.

-- Let's directly test the CLOSURE via ext on the full arena (27-dim Hermitian test won't help;
-- innerMul are full-space ops). Try: prove ⁅kAB,kBC⁆ = innerMul(slotC 1)(slotA 1) by
-- reducing through the lie_lie route to Lmul brackets.
set_option maxHeartbeats 2000000 in
theorem cosetAB_BC_closure :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
      = innerMul (slotC (1:O ℚ)) (slotA 1) := by
  -- kBC = ⁅Lmul(slotB u1), Lmul(slotC 1)⁆
  rw [innerMul_eq_lie (slotB u1) (slotC 1)]
  -- ⁅kAB, ⁅Lmul(slotB u1), Lmul(slotC 1)⁆⁆ = ⁅⁅kAB, Lmul(slotB u1)⁆, Lmul(slotC 1)⁆
  --                                          + ⁅Lmul(slotB u1), ⁅kAB, Lmul(slotC 1)⁆⁆
  rw [lie_lie]
  sorry

end Phys.Algebra.HJ
